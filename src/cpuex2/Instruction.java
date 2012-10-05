package cpuex2;

import java.util.*;
import java.util.regex.*;

enum OpCode {
	mov, mif, mfi,
	jmp, cal,
	ldw, stw, lfl, sfl, lfu, sfu,
	add, sub, mul, div,
	and, oor, nor, xor,
	sll, srl, sra,
	hlt, prt
}
enum Condition {
	AL, EQ, NE, MI, PL, VS, VC,
	CS, CC, HI, LS, GE, LT, GT, LE
}
enum OpType {
	R,	// 3 opland, 例外はjump, call(1op), fmv, mif, mfi (2op)
	I,	// 3 opland, 例外はなし
	J	// 1 opland, 例外はなし
}

public class Instruction {
	public OpCode opcode;
	public Condition condition;
	public boolean conditionset;
	public boolean fl;
	public boolean immediate;
	public Opland op1, op2, op3;
	public OpType type;
	public String raw;
	
	private Instruction() {
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
		
		// opland1
		if (m.find()) {
			Opland opland = new Opland();
			instruction.op1 = opland;
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
			instruction.op1 = null;
		}
		
		// opland2
		if (m.find()) {
			Opland opland = new Opland();
			instruction.op2 = opland;
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
			instruction.op2 = null;
		}
		
		// opland3
		if (m.find()) {
			Opland opland = new Opland();
			instruction.op3 = opland;
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
			instruction.op3 = null;
		}
		
		instruction.raw = line;
		return instruction;
	}
	
}