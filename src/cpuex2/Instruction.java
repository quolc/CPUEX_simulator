package cpuex2;

import java.util.Map;
import java.util.regex.*;

enum OpCode {
	mov, mif, mfi, ldw, ldf, stw, stf,	// 00xxx
	prt, scn, jmp, cal, mvh, mvl,		// 01xxx
	add, sub, mul, sla, sra, inv,		// 10xxx
	and, oor, xor, sll, srl, ctd, sqr, neg, // 11xxx
	nop, hlt // 擬似命令
}
enum Condition {
	AL, NV, EQ, NE, MI, PL, VS, VC,
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
	public String tag;
	public boolean[] active_byte; // prt, scnでのみ使用する
	
	public static final int maximum_oplands = 3;
	
	private Instruction() {
		this.oplands = new Opland[maximum_oplands]; // maximum opland number = 3
		this.active_byte = new boolean[4];
		this.tag = "";
	}
	
	// Parse assembly-line & construct an Instance of Instruction
	public static Instruction parseLine(String line) {
		Instruction instruction = new Instruction();
		
		Utility.errPrintf(line + "\n");
		
		Pattern p = Pattern.compile("[^,\\s]+");
		Matcher m = p.matcher(line);
		
		// opcode
		if (m.find()) {
			int i = 0;
			
			// tag
			Pattern tagp = Pattern.compile("\\[.*\\]");
			
			String opcode = m.group();
			
			Matcher tagm = tagp.matcher(m.group());
			if (tagm.find()) {
				instruction.tag = tagm.group().substring(1, tagm.group().length() - 1);
				opcode = opcode.substring(0, tagm.start());
			}
			
			// float
			if (opcode.charAt(i) == 'f') {
				instruction.fl = true;
				i++;
			} else {
				instruction.fl = false;
			}
			
			try {
				instruction.opcode = OpCode.valueOf(opcode.substring(i, i+3));
			} catch (Exception e) {
				Utility.errPrintf("Invalid Opcode Format : %s\n", line);
				return null;
			}
			i+=3;
			
			// immediate
			if (opcode.length() > i && opcode.charAt(i) == 'i') {
				instruction.immediate = true;
				i++;
			} else {
				instruction.immediate = false;
			}
			// 暗黙的な即値命令
			if (instruction.opcode == OpCode.stw ||
				instruction.opcode == OpCode.stf ||
				instruction.opcode == OpCode.ldw ||
				instruction.opcode == OpCode.ldf ||
				instruction.opcode == OpCode.prt ||
				instruction.opcode == OpCode.scn)
				instruction.immediate = true;
			
			// condition flag
			if (opcode.length() - i >= 2) {
				try {
					instruction.condition = Condition.valueOf(opcode.substring(i, i+2).toUpperCase());
				} catch (Exception e) {
					Utility.errPrintf("Invalid Opcode Format : %s\n", line);
					return null;
				}
				i+=2;
			} else {
				instruction.condition = Condition.AL;
			}
			
			// condition set flag
			if (opcode.length() > i && opcode.charAt(i) == 's') {
				instruction.conditionset = true;
				i++;
			} else {
				instruction.conditionset = false;
			}
			if (opcode.length() != i) {
				Utility.errPrintf("Invalid Opcode Format : %s\n", line);
			}
		}
		
		// oplands
		for (int i=0; i<maximum_oplands; i++) {
			if (m.find()) {
				Opland opland = new Opland();
				instruction.oplands[i] = opland;
				// jmp系命令ではラベルをイミディエイトにするので別処理
				if ((instruction.opcode == OpCode.jmp || instruction.opcode == OpCode.cal) && instruction.immediate) {
					opland.type = OplandType.J;
					opland.label = m.group();
				} else {
					switch (m.group().charAt(0)) {
					case 'r':
						opland.type = OplandType.R;
						opland.index = Integer.valueOf(m.group().substring(1));
						break;
					case 'f':
						opland.type = OplandType.F;
						opland.index = Integer.valueOf(m.group().substring(1));
						break;
					case 'h':
						opland.type = OplandType.AH;
						opland.label = m.group().substring(4, m.group().length()-1);
						break;
					case 'l':
						opland.type = OplandType.AL;
						opland.label = m.group().substring(4, m.group().length()-1);
						break;
					default:
						opland.type = OplandType.I;
						opland.immediate = Integer.valueOf(m.group());
						break;
					}
				}
			} else {
				instruction.oplands[i] = null;
			}
		}
		
		// jmp/callの場合は第一オペランドがRsなので順番変更
		if ((instruction.opcode == OpCode.jmp || instruction.opcode == OpCode.cal) && !instruction.immediate) {
			instruction.oplands[1] = instruction.oplands[0];
			instruction.oplands[0] = null;
		}
		// prtでは第一オペランドがRsかつ第二オペランドがIなので順番変更。
		if (instruction.opcode == OpCode.prt) {
			instruction.oplands[2] = instruction.oplands[1];
			instruction.oplands[1] = instruction.oplands[0];
			instruction.oplands[0] = null;
		}
		// mvhi, mvliでは第二オペランドがIなので順番変更
		if (instruction.opcode == OpCode.mvh || instruction.opcode == OpCode.mvl) {
			instruction.oplands[2] = instruction.oplands[1];
			instruction.oplands[1] = null;
		}
		
		instruction.raw = line;
		return instruction;
	}
	
	public boolean[] makeBitPattern(Map<String, Integer> labels) {
		char[] pattern = new char[40];
		
		// Condition Flag
		String cond = "1111";
		switch (this.condition) {
		case EQ:
			cond = "0000";
			break;
		case NE:
			cond = "0001";
			break;
		case CS:
			cond = "0010";
			break;
		case CC:
			cond = "0011";
			break;
		case MI:
			cond = "0100";
			break;
		case PL:
			cond = "0101";
			break;
		case VS:
			cond = "0110";
			break;
		case VC:
			cond = "0111";
			break;
		case HI:
			cond = "1000";
			break;
		case LS:
			cond = "1001";
			break;
		case GE:
			cond = "1010";
			break;
		case LT:
			cond = "1011";
			break;
		case GT:
			cond = "1100";
			break;
		case LE:
			cond = "1101";
			break;
		case AL:
			cond = "1110";
			break;
		case NV:
			cond = "1111";
			break;
		}
		for (int i=0; i<4; i++)
			pattern[i] = cond.charAt(i);
		
		// Condition Set
		pattern[4] = this.conditionset ? '1' : '0';
		
		// Immediate Flag
		pattern[5] = this.immediate ? '1' : '0';
		
		// オペコード
		String opc = "000000"; // 大多数のR形式では0
		switch (this.opcode) {
		case mov:
			opc = "00001";
			break;
		case mif:
			opc = "00010";
			break;
		case mfi:
			opc = "00011";
			break;
		case ldw:
			opc = "00100";
			break;
		case ldf:
			opc = "00101";
			break;
		case stw:
			opc = "00110";
			break;
		case stf:
			opc = "00111";
			break;
		case prt:
			opc = "01000";
			break;
		case scn:
			opc = "01001";
			break;
		case jmp:
			opc = "01010";
			break;
		case cal:
			opc = "01011";
			break;
		case mvh:
			if (this.fl)
				opc = "01110";
			else
				opc = "01100";
			break;
		case mvl:
			if (this.fl)
				opc = "01111";
			else
				opc = "01101";
			break;
		case add:
			if (this.fl)
				opc = "10100";
			else
				opc = "10000";
			break;
		case sub:
			if (this.fl)
				opc = "10101";
			else
				opc = "10001";
			break;
		case sla:
			opc = "10010";
			break;
		case mul:
			opc = "10110";
			break;
		case sra:
			opc = "10011";
			break;
		case inv:
			opc = "10111";
			break;
		case and:
			opc = "11000";
			break;
		case oor:
			opc = "11001";
			break;
		case xor:
			opc = "11010";
			break;
		case sll:
			opc = "11011";
			break;
		case srl:
			opc = "11100";
			break;
		case ctd:
			opc = "11101";
			break;
		case sqr:
			opc = "11110";
			break;
		case neg:
			opc = "11111";
			break;
		}
		for (int i=0; i<5; i++)
			pattern[6+i] = opc.charAt(i);
		
		// reserved
		pattern[11] = '0';
		
		// R/FR形式 ... オペランドは３つともレジスタインデックス
		OpCode[] opr = new OpCode[] { // r形式を持つ命令一覧
			OpCode.mov, OpCode.mif, OpCode.mfi, OpCode.jmp, OpCode.cal,
			OpCode.add, OpCode.sub, OpCode.sla, OpCode.mul, OpCode.sra, OpCode.inv,
			OpCode.and, OpCode.oor, OpCode.xor, OpCode.sll,  OpCode.srl,
			OpCode.ctd, OpCode.sqr, OpCode.neg,
		};
		boolean isr = false;
		for (OpCode op : opr) {
			if (this.opcode == op) isr = true;
		}
		if (this.immediate) isr = false;
		if (isr) {
			// オペランド
			for (int i=0; i<3; i++) {
				for (int j=0; j<6; j++) {
					if (this.oplands[i] != null) {
						pattern[12 + i*6 + j] =
								((this.oplands[i].index & (1 << 5-j)) > 0) ? '1' : '0';
					} else {
						pattern[12 + i*6 + j] = '0';
					}
				}
			}
		}
		
		// I形式
		OpCode[] opi = new OpCode[]{
			OpCode.ldw, OpCode.stw, OpCode.ldf, OpCode.stf,
			OpCode.prt, OpCode.scn,
			OpCode.mvh, OpCode.mvl,
			OpCode.add, OpCode.sub, OpCode.sla, OpCode.sra,
			OpCode.and, OpCode.oor, OpCode.xor,
			OpCode.sll, OpCode.srl
		};
		boolean isa = false;
		for (OpCode op : opi) {
			if (this.opcode == op) isa = true;
		}
		if (!this.immediate) isa = false;
		if (isa) {
			// オペランド
			for (int i=0; i<2; i++) {
				for (int j=0; j<6; j++) {
					if (this.oplands[i] != null) {
						pattern[12 + i*6 + j] =
								((this.oplands[i].index & (1 << 5-j)) > 0) ? '1' : '0';
					} else {
						pattern[12 + i*6 + j] = '0';
					}
				}
			}
			// 即値
			for (int i=0; i<16; i++) {
				pattern[24+i] =
					(this.oplands[2].immediate & (1<<15-i)) > 0 ? '1' : '0';
			}
		}
		
		// J形式
		if (this.immediate && (this.opcode == OpCode.jmp || this.opcode == OpCode.cal)) {
			// 即値
			Integer newpc = labels.get(this.oplands[0].label);
			
			for (int i=0; i<28; i++) {
				pattern[12+i] =
					(newpc & (1<<(27-i))) > 0 ? '1' : '0';
			}
		}
		
		boolean[] result = new boolean[40];
		for (int i=0; i<40; i++) result[i] = pattern[i] == '1';
		return result;
	}
}