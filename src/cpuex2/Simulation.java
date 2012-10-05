package cpuex2;

import java.lang.reflect.*;

public class Simulation {
	public Program program;
	
	// constants
	public final int ramsize = 134217728;
	
	// register
	public int pc;
	public int[] r;
	public double[] f;
	public boolean cz, cn, cv, cc;
	
	// ram
	public byte[] ram;
	
	// meta
	public boolean halt;
	public boolean error;
	
	private Simulation() {
		this.r = new int[32];
		this.f = new double[32];
		this.ram = new byte[ramsize];
	}
	
	public static Simulation createSimulation(String asmFileName) {
		Simulation simulation = new Simulation();
		
		simulation.program = Program.parseAsmFile(asmFileName);
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
	}
	
	public void initialize(String ramFileName) {
		this.initialize();
	}
	
	public void step() {
		Instruction instruction = program.instructions[pc];
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
		}
		
		if (condition) {
			try {
				Method method = this.getClass().getDeclaredMethod("proc_" + instruction.opcode, Instruction.class);
				Boolean ret = (Boolean)method.invoke(this, instruction);
				if (!ret) {
					System.err.printf("An error happened while executing %s.\n", instruction.raw);
					this.error = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (!jumped && !error && !halt) pc++;
	}
	
	// register manipulation
	int fetch_r(Opland o) {
		if (o.index == 0) return 0;
		else return this.r[o.index];
	}
	double fetch_f(Opland o) {
		if (o.index == 0) return 0.0;
		else return this.f[o.index];
	}
	void set_r(Opland o, int v) {
		if (o.index != 0) {
			this.r[o.index] = v;
		}
	}
	void set_f(Opland o, double v) {
		if (o.index != 0) {
			this.f[o.index] = v;
		}
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
		int a, b;
		if (i.immediate) {
			if (!verifyOplandPattern(i, "RRI")) return false;
			a = fetch_r(i.oplands[1]);
			b = i.oplands[2].immediate;
			set_r(i.oplands[0], a + b);
		} else {
			if (!verifyOplandPattern(i, "RRR")) return false;
			a = fetch_r(i.oplands[1]);
			b = fetch_r(i.oplands[2]);
			set_r(i.oplands[0], a + b);
		}
		return true;
	}
	
	boolean proc_prt(Instruction i) {
		if (!verifyOplandPattern(i, "R")) return false;
		
		int v = fetch_r(i.oplands[0]);
		System.out.println(v);
		
		return true;
	}
	
	boolean proc_hlt(Instruction i) {
		System.out.println("Program Halted.");
		this.halt = true;
		return true;
	}
}
