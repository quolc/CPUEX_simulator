package cpuex2;

import java.util.regex.*;

enum OpCode {
	add, sub, mul, div,
	and, oor, nor, xor,
	sll, srl, sra,
	mov, mif, mfi,
	jmp, cal,
	ldw, stw, lfl, sfl, lfu, sfu,
	hlt, prt
}
enum Condition {
	AL, EQ, NE, MI, PL, VS, VC,
	CS, CC, HI, LS, GE, LT, GT, LE
}

public class Instruction {
	public OpCode opcode;
	public Condition condition;
	public boolean conditionset;
	public boolean fl;
	public boolean immediate;
	public Opland[] oplands;
	public String raw;
	
	public static final int maximum_oplands = 3;
	
	private Instruction() {
		this.oplands = new Opland[maximum_oplands]; // maximum opland number = 3
	}
	
	// Parse assembly-line & construct an Instance of Instruction
	public static Instruction parseLine(String line) {
		Instruction instruction = new Instruction();
		
		System.out.println(line);
		
		Pattern p = Pattern.compile("[^,\\s]+");
		Matcher m = p.matcher(line);
		
		// opcode
		if (m.find()) {
			int i = 0;
			
			// float
			if (m.group().charAt(i) == 'f') {
				instruction.fl = true;
				i++;
			} else {
				instruction.fl = false;
			}
			
			try {
				instruction.opcode = OpCode.valueOf(m.group().substring(i, 3));
			} catch (Exception e) {
				System.err.printf("Invalid Opcode Format : %s\n", line);
				return null;
			}
			i+=3;
			
			// immediate
			if (m.group().length() > i && m.group().charAt(i) == 'i') {
				instruction.immediate = true;
				i++;
			} else {
				instruction.immediate = false;
			}
			
			// condition flag
			if (m.group().length() - i > 2) {
				try {
					instruction.condition = Condition.valueOf(m.group().substring(i, 2));
				} catch (Exception e) {
					System.err.printf("Invalid Opcode Format : %s\n", line);
					return null;
				}
				i+=2;
			} else {
				instruction.condition = Condition.AL;
			}
			
			// condition set flag
			if (m.group().length() > i && m.group().charAt(i) == 's') {
				instruction.conditionset = true;
				i++;
			} else {
				instruction.conditionset = false;
			}
			if (m.group().length() != i) {
				System.err.printf("Invalid Opcode Format : %s\n", line);
			}
		}
		
		// oplands
		for (int i=0; i<maximum_oplands; i++) {
			if (m.find()) {
				Opland opland = new Opland();
				instruction.oplands[i] = opland;
				switch (m.group().charAt(0)) {
				case 'r':
					opland.type = OplandType.R;
					opland.index = Integer.valueOf(m.group().substring(1));
					break;
				case 'f':
					opland.type = OplandType.F;
					opland.index = Integer.valueOf(m.group().substring(1));
					break;
				default:
					opland.type = OplandType.I;
					opland.immediate = Integer.valueOf(m.group());
					break;
				}	
			} else {
				instruction.oplands[i] = null;
			}
		}
		
		instruction.raw = line;
		return instruction;
	}
	
}