package cpuex2;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Simulation {
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
	public int total;
	Map<OpCode, Method> proc_dic;
	
	// GUIシミュレーション用
	private ArrayList<SimulationEventListener> _listeners = new ArrayList<SimulationEventListener>();
	public boolean running;
	public boolean fireable; // fireする必要がないときはfalseにしておくと軽く動く
	
	public synchronized void addEventListener(SimulationEventListener listener) {
		_listeners.add(listener);
	}
	public synchronized void removeEventListener(SimulationEventListener listener) {
		_listeners.remove(listener);
	}
	private synchronized void fireEvent(SimulationEventType type) {
		if (!fireable) return;
		SimulationEvent e = new SimulationEvent(this, type, null);
		for (SimulationEventListener listener : this._listeners) {
			listener.handleSimulationEvent(e);
		}
	}
	private synchronized void fireEvent(SimulationEventType type, Object param) {
		if (!fireable) return;
		SimulationEvent e = new SimulationEvent(this, type, param);
		for (SimulationEventListener listener : this._listeners) {
			listener.handleSimulationEvent(e);
		}
	}
	public void stopRunning() {
		// 非同期実行を中断（その時点で割り込む。状態は保存）
			
	}
	
	private Simulation() {
		this.r = new int[32];
		this.f = new float[32];
		this.ram = new int[ramsize];
		this.proc_dic = new HashMap<OpCode, Method>();
		
		for (OpCode code : OpCode.values()) {
			try {
				Method method = Simulation.class.getDeclaredMethod("proc_" + code.toString(), Instruction.class);
				proc_dic.put(code, method);
			} catch (Exception e) {}
		}
	}
	
	public static Simulation createSimulation(File asmFile) {
		Simulation simulation = new Simulation();
		
		simulation.program = Program.parseAsmFile(asmFile);
		if (simulation.program == null) return null;
		
		return simulation;
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
		
		this.fireEvent(SimulationEventType.INIT);
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
		if (this.pc >= this.program.instructions.length) return;
		if (this.halt || this.exit || this.error) return;
		
		Instruction instruction = program.instructions[pc];
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
				Method method = (Method)proc_dic.get(instruction.opcode);
				Boolean ret = (Boolean)method.invoke(this, instruction);
				if (!ret) {
					Utility.errPrintf("An error happened while executing %s.\n", instruction.raw);
					this.error = true;
				}
				if (instruction.opcode == OpCode.jmp || instruction.opcode == OpCode.cal) jumped = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (!jumped) pc++;
		
		// 同期実行時はステップごとにイベント発行
		if (!this.running) {
			this.fireEvent(SimulationEventType.STEP);
		}
		
		// 終了判定
		if (pc == program.instructions.length) {
			exit = true;
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
		if (o.index != 0)
			this.r[o.index] = v;
	}
	void set_f(Opland o, float v) {
		if (o.index != 0)
			this.f[o.index] = v;
	}
	
	// Pattern例: "RRR"
	//     R: Integer register
	//     F: Float register
	//     I: Integer immediate
	//     N: Not use
	boolean verifyOplandPattern(Instruction instruction, String pattern) {
		for (int i=0; i<pattern.length(); i++) {
			switch (pattern.charAt(i)) {
			case 'R':
				if (instruction.oplands[i].type != OplandType.R) return false;
				break;
			case 'F':
				if (instruction.oplands[i].type != OplandType.F) return false;
				break;
			case 'I':
				if (instruction.oplands[i].type != OplandType.I) return false;
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
			c = a + b;
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
			c = a - b;
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
			c = a * b;
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
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
			c = 1 / a;
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				cz = (c == 0);
				cn = (c < 0);
				cv =  (c == Float.NEGATIVE_INFINITY || c == Float.POSITIVE_INFINITY);
				cc = false;
			}
		} else {
			return false; // 整数divは実装しない
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
			set_f(i.oplands[0], (float)a);
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
			set_r(i.oplands[0], (int)a);
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
				if (!verifyOplandPattern(i, "R")) return false;
				int newpc = fetch_r(i.oplands[0]);
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
//				Utility.printf("\nJump to the label %s\n", label);
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
				if (!verifyOplandPattern(i, "R")) return false;
				int newpc = fetch_r(i.oplands[0]);
//				Utility.printf("\nJump to the address %d\n", newpc);
				
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
			
			int value = ram[addr];
			set_r(i.oplands[0], value);
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
			
			int value = fetch_r(i.oplands[0]);
			ram[addr] = value;
			
			this.fireEvent(SimulationEventType.MEMORY, addr);
		}
		return true;
	}

	boolean proc_ldf(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		float value = Float.intBitsToFloat(ram[addr]);
		
		set_f(i.oplands[0], value);
		
		return true;
	}
	boolean proc_stf(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		float src = fetch_f(i.oplands[0]);
		
		ram[addr] = Float.floatToIntBits(src);
		
		this.fireEvent(SimulationEventType.MEMORY, addr);
		return true;
	}
	
	boolean proc_prt(Instruction i) {
		if (!verifyOplandPattern(i, "R")) return false;
		
		int v = fetch_r(i.oplands[0]);
		Utility.printf("%d\n", v);
		this.fireEvent(SimulationEventType.PRINT, v);
		
		return true;
	}
	
	boolean proc_hlt(Instruction i) {
		Utility.println("Program is halted by hlt instruction");
		this.halt = true;
		return true;
	}
}
