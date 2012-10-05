package cpuex2;

import java.lang.reflect.*;

public class Simulation {
	public Program program;
	
	// constants
	public static final int ramsize = 134217728 / 4; // * 4bytes
	public static final int instructionLength = 36;
	
	// register
	public int pc;
	public int[] r;
	public double[] f;
	public boolean cz, cn, cv, cc;
	
	// ram
	public int[] ram;
	
	// meta
	public boolean halt;
	public boolean error;
	
	private Simulation() {
		this.r = new int[32];
		this.f = new double[32];
		this.ram = new int[ramsize];
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
				if (instruction.opcode == OpCode.jmp || instruction.opcode == OpCode.cal) jumped = true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (!jumped && !error && !halt) pc++;
		if (pc == program.instructions.length) halt = true;
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
		if (i.fl) {
			double a, b, c;
			if (!verifyOplandPattern(i, "FFF")) return false;
			a = fetch_f(i.oplands[1]);
			b = fetch_f(i.oplands[2]);
			c = a + b;
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
			}
		}
		return true;
	}
	boolean proc_sub(Instruction i) {
		if (i.fl) {
			double a, b, c;
			if (!verifyOplandPattern(i, "FFF")) return false;
			a = fetch_f(i.oplands[1]);
			b = fetch_f(i.oplands[2]);
			c = a - b;
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
			}
		} else {
			int a, b, c;
			if (!verifyOplandPattern(i, "RRI")) return false;
			a = fetch_r(i.oplands[1]);
			b = i.oplands[2].immediate;
			c = a - b;
			set_r(i.oplands[0], c);
			if (i.conditionset) {
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
			}
		}
		return true;
	}
	boolean proc_mul(Instruction i) {
		if (i.fl) {
			double a, b, c;
			if (!verifyOplandPattern(i, "FFF")) return false;
			a = fetch_f(i.oplands[1]);
			b = fetch_f(i.oplands[2]);
			c = a * b;
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
			}
		}
		return true;
	}
	boolean proc_div(Instruction i) {
		if (i.fl) {
			double a, b, c;
			if (!verifyOplandPattern(i, "FFF")) return false;
			a = fetch_f(i.oplands[1]);
			b = fetch_f(i.oplands[2]);
			c = a / b;
			set_f(i.oplands[0], c);
			if (i.conditionset) {
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				// TODO cv, ccの判定
//				cv = false;
//				cc = false;
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				cv = false;
				cc = false;
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
				if (c == 0)	cz = true;
				if (c < 0)	cn = true;
				cv = false;
				cc = false;
			}
		}
		return true;
	}
	
	boolean proc_mov(Instruction i) {
		if (i.fl) {
			double a;
			if (!verifyOplandPattern(i, "FF")) return false;
			a = fetch_f(i.oplands[1]);
			set_f(i.oplands[0], a);
		} else {
			return false;
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
			set_f(i.oplands[0], (double)a);
		}
		return true;
	}
	boolean proc_mfi(Instruction i) {
		if (i.fl) {
			return false;
		} else {
			double a;
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
				if (!verifyOplandPattern(i, "I")) return false;
				String label = i.oplands[0].label;
				System.out.printf("Jump to the label %s\n", label);
				Integer newpc = program.labels.get(label);
				if (newpc == null) {
					System.err.printf("Invalid label %s\n", label);
					return false;
				}
				this.pc = newpc;
			} else {
				if (!verifyOplandPattern(i, "R")) return false;
				int newpc = fetch_r(i.oplands[0]);
				System.out.printf("Jump to the address %d\n", newpc);
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
				if (!verifyOplandPattern(i, "I")) return false;
				String label = i.oplands[0].label;
				System.out.printf("Jump to the label %s\n", label);
				Integer newpc = program.labels.get(label);
				if (newpc == null) {
					System.err.printf("Invalid label %s\n", label);
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
				System.out.printf("Jump to the address %d\n", newpc);
				
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
		}
		return true;
	}
	boolean proc_lfu(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		long value = (int)ram[addr];
		
		double dest = fetch_f(i.oplands[0]);
		long bits = Double.doubleToLongBits(dest);
		
		bits &= 4294967295L;
		bits |= value << 32;
		
		set_f(i.oplands[0], Double.longBitsToDouble(bits));
		
		return true;
	}
	boolean proc_lfl(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		long value = (int)ram[addr];
		
		double dest = fetch_f(i.oplands[0]);
		long bits = Double.doubleToLongBits(dest);
		
		bits &= (4294967295L << 32);
		bits |= value;
		
		set_f(i.oplands[0], Double.longBitsToDouble(bits));
		
		return true;
	}
	boolean proc_sfu(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		double src = fetch_f(i.oplands[0]);
		long bits = Double.doubleToLongBits(src);
		
		bits = bits >> 32;
		
		ram[addr] = (int)bits;
		
		return true;
	}
	boolean proc_sfl(Instruction i) {
		if (!verifyOplandPattern(i, "FRI")) return false;
		int addr = fetch_r(i.oplands[1]);
		int offset = i.oplands[2].immediate;
		addr += offset;
		
		double src = fetch_f(i.oplands[0]);
		long bits = Double.doubleToLongBits(src);

		bits &= 4294967295L;
		
		ram[addr] = (int)bits;
		
		return true;
	}
	
	boolean proc_prt(Instruction i) {
		if (!verifyOplandPattern(i, "R")) return false;
		
		int v = fetch_r(i.oplands[0]);
		System.out.println(v);
		
		return true;
	}
	
	boolean proc_hlt(Instruction i) {
		System.out.println("Program is halted by hlt instruction");
		this.halt = true;
		return true;
	}
}
