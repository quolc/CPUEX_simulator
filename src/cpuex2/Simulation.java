package cpuex2;

import java.io.*;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Simulation implements Runnable {
	public Program program;
	
	// constants
	public static final int ramsize = 1024 * 1024; // * 4bytes
	public static final int instructionLength = 36;
	
	// register
	public int pc;
	public int[] r;
	public float[] f;
	public boolean cz, cn, cv, cc;
	
	// ram
	public int[] ram;
	
	// meta
	public boolean halt;
	public boolean exit;
	public boolean error;
	public String error_desc=null;
	public long total;
	Map<OpCode, Method> proc_dic;
	
	Instruction past;
	int pastpc;
	
	public Map<String, Integer> call_count = new HashMap<String, Integer>();
	public ArrayList<String> missing_labels = new ArrayList<String>();
	public boolean[] verified;
	
	// GUIシミュレーション用
	public int mode; // 0:CUI 1:GUI
	private ArrayList<SimulationEventListener> _listeners = new ArrayList<SimulationEventListener>();
	public boolean running;
	public boolean interrupt_h = false;
	public boolean interrupt_p = false;
	public boolean fireable; // fireする必要がないときはfalseにしておくと軽く動く
	public ArrayList<Integer> updatedAddr = new ArrayList<Integer>();
	public ArrayList<Integer> breakPoints = new ArrayList<Integer>();
	public ArrayList<Integer> breakRegister = new ArrayList<Integer>();
	public ArrayList<Integer> breakMemory = new ArrayList<Integer>();
	public Integer lastModifiedRegister = null;
	public Integer lastModifiedMemory = null;
	File inputFile = null;
	FileInputStream inputStream = null;

	public synchronized void addEventListener(SimulationEventListener listener) {
		_listeners.add(listener);
	}
	public synchronized void removeEventListener(SimulationEventListener listener) {
		_listeners.remove(listener);
	}
	private synchronized void fireEvent(SimulationEventType type) {
		if (!fireable && type != SimulationEventType.PRINT) return;
		
		SimulationEvent e = new SimulationEvent(this, type, null);
		for (SimulationEventListener listener : this._listeners) {
			listener.handleSimulationEvent(e);
		}
	}
	private synchronized void fireEvent(SimulationEventType type, Object param) {
		if (!fireable && type != SimulationEventType.PRINT) return;
		
		SimulationEvent e = new SimulationEvent(this, type, param);
		for (SimulationEventListener listener : this._listeners) {
			listener.handleSimulationEvent(e);
		}
	}
	public void stopRunning() {
		this.interrupt_h = true;
	}
	public void pauseRunning() {
		this.interrupt_p = true;
	}
	public void toggleBreakPoint(int p) {
		if (this.breakPoints.contains(p)) {
			this.breakPoints.remove((Integer)p);
		} else {
			this.breakPoints.add(p);
		}
		this.fireEvent(SimulationEventType.BREAKPOINT);
	}
	public void toggleBreakRegister(String p) {
		// r0-31 : 0-31
		// f0-31 : 32-63
		// cn : 64
		// cz : 65
		// cv : 66
		// cc : 67
		Integer regnum = 0;
		if (p.charAt(0) == 'r') {
			regnum = Integer.parseInt(p.substring(1));
		} else if (p.charAt(0) == 'f') {
			regnum = Integer.parseInt(p.substring(1)) + 32;
		} else if (p.equals("Z")) {
			regnum = 64;
		} else if (p.equals("N")) {
			regnum = 65;
		} else if (p.equals("V")) {
			regnum = 66;
		} else if (p.equals("C")) {
			regnum = 67;
		} else if (p.equals("pc")) {
			regnum = 68;
		}
		if (this.breakRegister.contains(regnum)) {
			this.breakRegister.remove(regnum);
		} else {
			this.breakRegister.add(regnum);
		}
		this.fireEvent(SimulationEventType.BREAKPOINT);
	}
	public void toggleBreakMemory(int p) {
		if (this.breakMemory.contains(p)) {
			this.breakMemory.remove((Integer)p);
		} else {
			this.breakMemory.add(p);
		}
		this.fireEvent(SimulationEventType.BREAKPOINT);
	}
	public void setInputFile(File f) {
		try {
			if (this.inputStream != null)
				this.inputStream.close();
			this.inputFile = f;
			this.inputStream = new FileInputStream(f);
		} catch (Exception e){ }
	}
	public void reloadInputFile() {
		try {
			if (this.inputStream != null) {
				this.inputStream.close();
				this.inputStream = new FileInputStream(this.inputFile);
			}
		}catch(Exception e){}
	}
	public void run() {
		this.fireable = false;
		this.running = true;
		while (true) {
			// 割込みチェック
			if (this.interrupt_h) {
				this.interrupt_h = false;
				this.fireable = true;
				this.initialize();
				break;
			}
			if (this.interrupt_p) {
				this.interrupt_p = false;
				this.fireable = true;
				this.fireEvent(SimulationEventType.MEMORY);
				this.fireEvent(SimulationEventType.STEP);
				this.fireEvent(SimulationEventType.BREAK);
				break;
			}
			
			boolean lz, ln, lv, lc;
			lz = cz; ln = cn; lv = cv; lc = cc;
			
			this.step();
			
			// ブレークポイント
			if (breakPoints.contains(this.pc)) {
				this.fireable = true;
				this.fireEvent(SimulationEventType.MEMORY);
				this.fireEvent(SimulationEventType.STEP);
				this.fireEvent(SimulationEventType.BREAK);
				break;
			}
			
			// レジスタブレーク
			if (this.breakRegister.contains(lastModifiedRegister) ||
				(this.breakRegister.contains(64) && (this.cz != lz)) ||
				(this.breakRegister.contains(65) && (this.cn != ln)) ||
				(this.breakRegister.contains(66) && (this.cv != lv)) ||
				(this.breakRegister.contains(67) && (this.cc != lc)) ||
				(this.breakRegister.contains(68))) {
				this.lastModifiedRegister = null;
				this.fireable = true;
				this.fireEvent(SimulationEventType.MEMORY);
				this.fireEvent(SimulationEventType.STEP);
				this.fireEvent(SimulationEventType.BREAK);
				break;
			}
			
			// メモリブレーク
			if (this.breakMemory.contains(lastModifiedMemory)) {
				this.lastModifiedRegister = null;
				this.fireable = true;
				this.fireEvent(SimulationEventType.MEMORY);
				this.fireEvent(SimulationEventType.STEP);
				this.fireEvent(SimulationEventType.BREAK);
				break;
			}
			
			if (this.error) {
				this.fireable = true;
				this.fireEvent(SimulationEventType.MEMORY);
				this.fireEvent(SimulationEventType.STEP);
				this.fireEvent(SimulationEventType.ERROR, this.error_desc);
				break;
			}
			if (this.exit) {
				this.fireable = true;
				this.fireEvent(SimulationEventType.MEMORY);
				this.fireEvent(SimulationEventType.STEP);
				this.fireEvent(SimulationEventType.EXIT);
				break;
			}
			if (this.halt) {
				this.fireable = true;
				this.fireEvent(SimulationEventType.MEMORY);
				this.fireEvent(SimulationEventType.STEP);
				this.fireEvent(SimulationEventType.HALT);
				break;
			}
			
		}
		this.running = false;
	}
	
	// コンストラクタ
	private Simulation() {
		this.r = new int[32];
		this.f = new float[32];
		this.ram = new int[ramsize];
		this.proc_dic = new HashMap<OpCode, Method>();
		/*
		for (OpCode code : OpCode.values()) {
			try {
				Method method = Simulation.class.getDeclaredMethod("proc_" + code.toString(), Instruction.class);
				proc_dic.put(code, method);
			} catch (Exception e) {}
		}*/
	}
	
	public static Simulation createSimulation(File asmFile) {
		Simulation simulation = new Simulation();
		
		simulation.program = Program.parseAsmFile(asmFile);
		if (simulation.program == null) return null;
		
		// finding missing label
		for (Instruction instruction : simulation.program.instructions) {
			if ((instruction.opcode == OpCode.jmp || instruction.opcode == OpCode.cal) && instruction.immediate) {
				String label = instruction.oplands[0].label;
				
				if (!simulation.program.labels.containsKey(label)) {
					if (!simulation.missing_labels.contains(label))
						simulation.missing_labels.add(label);
				}
			}
		}
		
		return simulation;
	}
	
	public String[] assemble(boolean ruby) {
		ArrayList<String> code = new ArrayList<String>();
		
		int p = 0;
		for (Instruction instruction : this.program.instructions) {
			boolean[] pattern = instruction.makeBitPattern(this.program.labels);
			char[] patternStr = new char[36];
			for (int i=0; i<36; i++) patternStr[i] = pattern[i] ? '1' : '0';
			
			for (Map.Entry<String, Integer> entry : this.program.labels.entrySet()) {
				if (entry.getValue() == p) {
					if (ruby) {
						code.add("-- " + entry.getKey());
					}
				}
			}
			
			boolean isLast = instruction.equals(this.program.instructions[this.program.instructions.length-1]);
			code.add(new String(patternStr) + (isLast ? ";" : ",") + (ruby ? (" -- " + Integer.toString(p++) + " " + instruction.raw) : ""));
		}
		
		return code.toArray(new String[]{});
	}
	
	public void initialize() {
		for (int i=0; i<32; i++) {
			this.r[i] = 0;
			this.f[i] = 0;
		}
		this.cz = false;
		this.cn = false;
		this.cv = false;
		this.cc = false;
		this.pc = 0;
		for (int i=0; i<ramsize; i++) {
			this.ram[i] = 0;
		}
		
		this.halt = false;
		this.error = false;
		this.exit = false;
		this.total = 0;
		
		this.running = false;
		this.fireable = true;
		this.updatedAddr.clear();
		
		this.fireEvent(SimulationEventType.INIT);
		
		for (String label : this.program.labels.keySet()) {
			this.call_count.put(label, 0);
		}
		this.verified = new boolean[this.program.instructions.length];
		for (int i=0; i<this.program.instructions.length; i++)
			this.verified[i] = false;
		
		if (this.inputStream != null) {
			try {
				this.reloadInputFile();
			}catch (Exception e) {}
		}
	}
	
	public boolean willExecuteNextStep() {
		Instruction instruction = program.instructions[pc];

		// condition flag
		boolean condition = false;
		switch (instruction.condition) {
		case AL:
			condition = true;
			break;
		case EQ:
			if (cz) condition = true;
			break;
		case NE:
			if (!cz) condition = true;
			break;
		case MI:
			if (cn) condition = true;
			break;
		case PL:
			if (!cn) condition = true;
			break;
		case VS:
			if (cv) condition = true;
			break;
		case VC:
			if (!cv) condition = true;
			break;
		case CS:
			if (cc) condition = true;
			break;
		case CC:
			if (!cc) condition = true;
			break;
		case HI:
			if (cc && !cz) condition = true;
			break;
		case LS:
			if (!cc || cz) condition = true;
			break;
		case GE:
			if ((cn && cv) || (!cn && !cv)) condition = true;
			break;
		case LT:
			if ((cn && !cv) || (!cn && cv)) condition = true;
			break;
		case GT:
			if (!cz && (cn == cv)) condition = true;
			break;
		case LE:
			if (cz && (cn != cv)) condition = true;
			break;
		default:
			break;
		}
		
		return condition;
	}
	
	public void step() {
		if (total % 10000000 == 0) {
			long now = java.lang.System.currentTimeMillis();
			if (now-Main.start > 0)
				Utility.errPrintf("%d ms (%d instructions/sec)\n", now - Main.start, total / (now-Main.start) * 1000);
			else
				Utility.errPrintf("%d ms (inf instructions/sec)\n", now - Main.start);
			
			Utility.errPrintf("(total %d instructions executed)\n", total);
		}
		
		if (this.halt || this.exit || this.error) return;
		if (this.pc >= this.program.instructions.length) {
			this.exit = true;
			this.fireEvent(SimulationEventType.EXIT);
			return;
		}
		
		Instruction instruction = null;
		try {
			instruction = program.instructions[pc];
		} catch (Exception e) {
			Utility.errPrintf("Can not load instruction from pc %d after pc %d.\n", this.pc, this.pastpc);
			this.error = true;
			this.error_desc = String.format("Can not load instruction from pc %d after pc %d.\n", this.pc, this.pastpc);
			return;
		}
		
		this.past = instruction;
		this.pastpc = this.pc;
		
		total++;
		boolean jumped = false;
		
		// condition flag
		boolean condition = false;
		switch (instruction.condition) {
		case AL:
			condition = true;
			break;
		case EQ:
			if (cz) condition = true;
			break;
		case NE:
			if (!cz) condition = true;
			break;
		case MI:
			if (cn) condition = true;
			break;
		case PL:
			if (!cn) condition = true;
			break;
		case VS:
			if (cv) condition = true;
			break;
		case VC:
			if (!cv) condition = true;
			break;
		case CS:
			if (cc) condition = true;
			break;
		case CC:
			if (!cc) condition = true;
			break;
		case HI:
			if (cc && !cz) condition = true;
			break;
		case LS:
			if (!cc || cz) condition = true;
			break;
		case GE:
			if ((cn && cv) || (!cn && !cv)) condition = true;
			break;
		case LT:
			if ((cn && !cv) || (!cn && cv)) condition = true;
			break;
		case GT:
			if (!cz && (cn == cv)) condition = true;
			break;
		case LE:
			if (cz && (cn != cv)) condition = true;
			break;
		default:
			break;
		}
		
		if (condition) {
			try {
				// method invoke
				Boolean ret = true;
				switch (instruction.opcode) {
				case add:
					ret = this.proc_add(instruction);
					break;
				case sub:
					ret = this.proc_sub(instruction);
					break;
				case mul:
					ret = this.proc_mul(instruction);
					break;
				case inv:
					ret = this.proc_inv(instruction);
					break;
				case and:
					ret = this.proc_and(instruction);
					break;
				case oor:
					ret = this.proc_oor(instruction);
					break;
				case nor:
					ret = this.proc_nor(instruction);
					break;
				case xor:
					ret = this.proc_xor(instruction);
					break;
				case sll:
					ret = this.proc_sll(instruction);
					break;
				case srl:
					ret = this.proc_srl(instruction);
					break;
				case sra:
					ret = this.proc_sra(instruction);
					break;
				case mov:
					ret = this.proc_mov(instruction);
					break;
				case mif:
					ret = this.proc_mif(instruction);
					break;
				case mfi:
					ret = this.proc_mfi(instruction);
					break;
				case jmp:
					ret = this.proc_jmp(instruction);
					break;
				case cal:
					ret = this.proc_cal(instruction);
					break;
				case ldw:
					ret = this.proc_ldw(instruction);
					break;
				case stw:
					ret = this.proc_stw(instruction);
					break;
				case ldf:
					ret = this.proc_ldf(instruction);
					break;
				case stf:
					ret = this.proc_stf(instruction);
					break;
				case hlt:
					ret = this.proc_hlt(instruction);
					break;
				case prt:
					ret = this.proc_prt(instruction);
					break;
				case scn:
					ret = this.proc_scn(instruction);
					break;
				case nop:
					ret = true;
					break;
				case neg:
					ret = this.proc_neg(instruction);
					break;
				case sqr:
					ret = this.proc_sqr(instruction);
					break;
				default:
					Method method = (Method)proc_dic.get(instruction.opcode);
					ret = (Boolean)method.invoke(this, instruction);
				}
				
				if (!ret) {
					Utility.errPrintf("An error happened while executing %s.\n", instruction.raw);
					this.error = true;
					this.error_desc = String.format("An error happened while executing %s.\n", instruction.raw);
				}
				if (instruction.opcode == OpCode.jmp || instruction.opcode == OpCode.cal) jumped = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 同期実行時はステップごとにイベント発行
		if (this.mode == 1 && !this.running) {
			this.fireEvent(SimulationEventType.STEP);
		}
		
		// PC処理
		if (!jumped && !this.error) pc++;
		if (pc == program.instructions.length && !halt) {
			this.exit = true;
			this.fireEvent(SimulationEventType.EXIT);
		}
	}
	
	// register manipulation
	int fetch_r(Opland o) {
		if (o.index == 0)
			return 0;
		else
			return this.r[o.index];
	}
	float fetch_f(Opland o) {
		if (o.index == 0)
			return 0.0f;
		else
			return this.f[o.index];
	}
	void set_r(Opland o, int v) {
		if (o.index != 0) {
			this.r[o.index] = v;
			if (this.running)
				this.lastModifiedRegister = o.index;
		}
	}
	void set_f(Opland o, float v) {
		if (o.index != 0) {
			this.f[o.index] = v;
			if (this.running)
				this.lastModifiedRegister = o.index+32;
		}
	}
	
	// Pattern例: "RRR"
	//     R: Integer register
	//     F: Float register
	//     I: Integer immediate
	//     N: Not use
	boolean verifyOplandPattern(Instruction instruction, String pattern) {
		// TODO: 
		// オペランドパターンは正しいと仮定してしまっている。
		// 一度検証したら以降検証しなくていいようにあとで直す
		if (true)
			return true;
		
		for (int i=0; i<pattern.length(); i++) {
			switch (pattern.charAt(i)) {
			case 'R':
				if (instruction.oplands[i] == null || instruction.oplands[i].type != OplandType.R) return false;
				break;
			case 'F':
				if (instruction.oplands[i] == null || instruction.oplands[i].type != OplandType.F) return false;
				break;
			case 'I':
				if (instruction.oplands[i] == null || instruction.oplands[i].type != OplandType.I) return false;
				break;
			case 'N':
				break;
			}
		}
		return true;
	}
	
	// Instructions
	boolean proc_add(Instruction i) {
		if (i.fl) {
			float a, b, c;
			if (!verifyOplandPattern(i, "FFF")) return false;
			a = fetch_f(i.oplands[1]);
			b = fetch_f(i.oplands[2]);
			c = FPU.fadd(a, b);
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv =  (c == Float.NEGATIVE_INFINITY || c == Float.POSITIVE_INFINITY);
				cc = false;
			}
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a + b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = ((a>0 && b>0 && c<0) || (a<0 && b<0 && c>0)); // 正+正=負, 負+負=正
				long a2 = (a > 0) ? a : (1L << 32) + a;
				long b2 = (b > 0) ? b : (1L << 32) + b;
				cc = ((a2+b2) >> 32) == 1;
			}
		}
		return true;
	}
	boolean proc_sub(Instruction i) {
		if (i.fl) {
			float a, b, c;
			if (!verifyOplandPattern(i, "FFF")) return false;
			a = fetch_f(i.oplands[1]);
			b = fetch_f(i.oplands[2]);
			c = FPU.fsub(a, b);
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv =  (c == Float.NEGATIVE_INFINITY || c == Float.POSITIVE_INFINITY);
				cc = false;
			}
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a - b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = ((a>0 && b<0 && c<0) || (a<0 && b>0 && c>0)); // 正-負=負, 負-正=正
				long a2 = (a > 0) ? a : (1L << 32) + a;
				long b2 = (b > 0) ? b : (1L << 32) + b;
				cc = ((a2+b2) >> 32) == 1;
			}
		}
		return true;
	}
	boolean proc_mul(Instruction i) {
		if (i.fl) {
			float a, b, c;
			if (!verifyOplandPattern(i, "FFF")) return false;
			a = fetch_f(i.oplands[1]);
			b = fetch_f(i.oplands[2]);
			c = FPU.fmul(a, b);
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				cv =  (c == Float.NEGATIVE_INFINITY || c == Float.POSITIVE_INFINITY);
				cc = false;
			}
		} else {
//			Utility.errPrintf("You use MUL operation. It is obsolete!\n");
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a * b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = false;
			}
		}
		return true;
	}
	boolean proc_inv(Instruction i) {
		if (i.fl) {
			float a, c;
			if (!verifyOplandPattern(i, "FF")) return false;
			a = fetch_f(i.oplands[1]);
			c = FPU.finv(a);
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv =  (c == Float.NEGATIVE_INFINITY || c == Float.POSITIVE_INFINITY);
				cc = false;
			}
		} else {
			// TODO: デバッグ用。あとで消すように
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a / b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = false;
			}
			// TODO: ここまでデバッグ用
//			return false; // 整数divは実装しない
		}
		return true;
	}
	boolean proc_neg(Instruction i) {
		if (i.fl) {
			float a, c;
			if (!verifyOplandPattern(i, "FF")) return false;
			a = fetch_f(i.oplands[1]);
			c = FPU.fneg(a);
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv =  (c == Float.NEGATIVE_INFINITY || c == Float.POSITIVE_INFINITY);
				cc = false;
			}
		} else {
			return false;
		}
		return true;
	}
	boolean proc_sqr(Instruction i) {
		if (i.fl) {
			float a, c;
			if (!verifyOplandPattern(i, "FF")) return false;
			a = fetch_f(i.oplands[1]);
			c = FPU.fsqr(a);
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				
			}
		} else {
			return false;
		}
		return true;
	}
	
	boolean proc_and(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a & b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = false;
			}
		}
		return true;
	}
	boolean proc_oor(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a | b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = false;
			}
		}
		return true;
	}
	boolean proc_nor(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = ~(a | b);
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = false;
			}
		}
		return true;
	}
	boolean proc_xor(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a ^ b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = false;
			}
		}
		return true;
	}

	boolean proc_sll(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a << b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = ((a >> (32-b)) & 1) == 1; // 追い出されるビットのうち最下位のもの
			}
		}
		return true;
	}
	boolean proc_srl(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a >>> b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = ((a >> (b-1)) & 1) == 1;
			}
		}
		return true;
	}
	boolean proc_sra(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a, b, c;
			if (i.immediate) {
				if (!verifyOplandPattern(i, "RRI")) return false;
				a = fetch_r(i.oplands[1]);
				b = i.oplands[2].immediate;
			} else {
				if (!verifyOplandPattern(i, "RRR")) return false;
				a = fetch_r(i.oplands[1]);
				b = fetch_r(i.oplands[2]);
			}
			c = a >> b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv = false;
				cc = ((a >> (b-1)) & 1) == 1;
			}
		}
		return true;
	}
	
	boolean proc_mov(Instruction i) {
		if (i.fl) {
			float a;
			if (!verifyOplandPattern(i, "FF")) return false;
			a = fetch_f(i.oplands[1]);
			set_f(i.oplands[0], a);
		} else {
			int a;
			if (!verifyOplandPattern(i, "RR")) return false;
			a = fetch_r(i.oplands[1]);
			set_r(i.oplands[0], a);
		}
		return true;
	}
	boolean proc_mif(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			int a;
			if (!verifyOplandPattern(i, "FR")) return false;
			a = fetch_r(i.oplands[1]);
			set_f(i.oplands[0], Float.intBitsToFloat(a));
		}
		return true;
	}
	boolean proc_mfi(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			float a;
			if (!verifyOplandPattern(i, "RF")) return false;
			a = fetch_f(i.oplands[1]);
			set_r(i.oplands[0], Float.floatToIntBits(a));
		}
		return true;
	}

	boolean proc_jmp(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			if (i.immediate) {
				if (!verifyOplandPattern(i, "J")) return false;
				String label = i.oplands[0].label;
//				Utility.printf("\nJump to the label %s\n", label);
				Integer newpc = program.labels.get(label);
				if (newpc == null) {
					Utility.errPrintf("Invalid label %s\n", label);
					return false;
				}
				this.pc = newpc;
			} else {
				if (!verifyOplandPattern(i, "NR")) return false;
				int newpc = fetch_r(i.oplands[1]);
//				Utility.printf("\nJump to the address %d\n", newpc);
				this.pc = newpc;
			}
		}
		return true;
	}
	boolean proc_cal(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			if (i.immediate) {
				if (!verifyOplandPattern(i, "J")) return false;
				String label = i.oplands[0].label;
				
				int c = this.call_count.get(label);
				this.call_count.put(label, c+1);
				
				Integer newpc = program.labels.get(label);
				if (newpc == null) {
					Utility.errPrintf("Invalid label %s\n", label);
					return false;
				}
				
				// リンクレジスタの更新
				Opland opl = new Opland();
				opl.type = OplandType.R;
				opl.index = 31;
				set_r(opl, this.pc+1);
				
				this.pc = newpc;
			} else {
				if (!verifyOplandPattern(i, "NR")) return false;
				int newpc = fetch_r(i.oplands[1]);
				
				// リンクレジスタの更新
				Opland opl = new Opland();
				opl.type = OplandType.R;
				opl.index = 31;
				set_r(opl, this.pc+1);
				
				this.pc = newpc;
			}
		}
		return true;
	}
	
	boolean proc_ldw(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			if (!verifyOplandPattern(i, "RRI")) return false;
			int addr = fetch_r(i.oplands[1]);
			int offset = i.oplands[2].immediate;
			addr += offset;
			
			try {
				int value = ram[addr];
				set_r(i.oplands[0], value);
			} catch (Exception e) {
				Utility.errPrintf("Memory Index Out of Bound. at %d\n", i.raw);
				this.fireEvent(SimulationEventType.ERROR, "Index out of bound.");
				return false;
			}
		}
		return true;
	}
	boolean proc_stw(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			if (!verifyOplandPattern(i, "RRI")) return false;
			int addr = fetch_r(i.oplands[1]);
			int offset = i.oplands[2].immediate;
			addr += offset;
			
			try {
				int value = fetch_r(i.oplands[0]);
				ram[addr] = value;
			} catch (Exception e) {
				Utility.errPrintf("Memory Index Out of Bound. at %d\n", i.raw);
				this.fireEvent(SimulationEventType.ERROR, "Index out of bound.");
				return false;
			}
			
			if (this.mode == 1) {
				if (!this.updatedAddr.contains(addr))
					this.updatedAddr.add(addr);
				this.fireEvent(SimulationEventType.MEMORY);
			}
			if (this.running)
				this.lastModifiedMemory = addr;
		}
		return true;
	}

	boolean proc_ldf(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		try {
			float value = Float.intBitsToFloat(ram[addr]);
			set_f(i.oplands[0], value);
		} catch (Exception e) {
			Utility.errPrintf("Memory Index Out of Bound. at %d\n");
			return false;	
		}
		
		return true;
	}
	boolean proc_stf(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		try {
			float src = fetch_f(i.oplands[0]);
			ram[addr] = Float.floatToIntBits(src);
		} catch (Exception e)  {
			Utility.errPrintf("Memory Index Out of Bound. at %d\n");
			return false;
		}
		
		if (this.mode == 1) {
			if (!this.updatedAddr.contains(addr))
				this.updatedAddr.add(addr);
			this.fireEvent(SimulationEventType.MEMORY);
		}
		if (this.running)
			this.lastModifiedMemory = addr;
		
		return true;
	}
	
	boolean proc_prt(Instruction i) {
		int v = 0;
		if (i.fl) {
			if (!verifyOplandPattern(i, "NF")) return false;
			
			v = Float.floatToIntBits(fetch_f(i.oplands[1]));
			
		} else {
			if (!verifyOplandPattern(i, "NR")) return false;
			v = fetch_r(i.oplands[1]);
		}
		
		byte output = 0;
		
		if (i.active_byte[0]) output = (byte)((v >> 24) & 255);
		if (i.active_byte[1]) output = (byte)((v >> 16) & 255);
		if (i.active_byte[2]) output = (byte)((v >> 8) & 255);
		if (i.active_byte[3]) output = (byte)((v >> 0) & 255);
		
		Utility.output(output);
		this.fireEvent(SimulationEventType.PRINT, output);
		
		return true;
	}
	boolean proc_scn(Instruction i) {
		if (i.fl){
			return false;
		} else {
			if (!verifyOplandPattern(i, "RR")) return false;
			
			int input = 0;
			switch (mode) {
			case 0:
				try {
					input = System.in.read();
				} catch (Exception e) {
					return false;
				}
				break;
			case 1:
				try {
					input = this.inputStream.read();
				} catch (Exception e) {
					return false;
				}
				break;
			}
			if (input == -1) {
				this.cc = true;
				return true;
			} else {
				this.cc = false;
			}
			
			int v = fetch_r(i.oplands[1]);
			if (i.active_byte[0]) v = (v & (0x00FFFFFF)) + (input << 24);
			if (i.active_byte[1]) v = (v & (0xFF00FFFF)) + (input << 16);
			if (i.active_byte[2]) v = (v & (0xFFFF00FF)) + (input << 8);
			if (i.active_byte[3]) v = (v & (0xFFFFFF00)) + (input);
			
			set_r(i.oplands[0], v);
		}
		return true;
	}
	
	boolean proc_hlt(Instruction i) {
		Utility.errPrintf("Program is halted by hlt instruction\n");
		this.halt = true;
		this.fireEvent(SimulationEventType.HALT);
		return true;
	}
}
