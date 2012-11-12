package cpuex2;

import java.io.*;
import java.util.*;
import java.util.regex.*;

public class Program {
	public Instruction[] instructions;
	public Map<String, Integer> labels;
	
	private Program() {
		this.labels = new HashMap<String, Integer>();
	}
	
	public static Program parseAsmFile(File asmFile) {
		Program program = new Program();
		ArrayList<Instruction> instructions = new ArrayList<Instruction>();
		
		try {
			FileReader reader = new FileReader(asmFile);
			BufferedReader br = new BufferedReader(reader);
			int l=0;
			
			String line;
			while ((line = br.readLine()) != null) {
				l++;
				
				// remove comment
				int commentStart;
				if ((commentStart = line.indexOf('#')) >= 0) {
					line = line.substring(0, commentStart);
				}
				
				// 空行と空白文字しか含まれない行は飛ばす
				if (line.length() == 0) continue;
				Pattern spacePattern = Pattern.compile("\\s*");
				Matcher m = spacePattern.matcher(line);
				if (m.find()) {
					if (m.group().length() == line.length()) {
						continue;
					}
				}
				
				if (line.charAt(0) == '\t') { // Instruction
					Instruction instruction = Instruction.parseLine(line);
					if (instruction == null) return null;
					instructions.add(instruction);
					// hlt用のラベル挿入
					if (instruction.opcode == OpCode.hlt) {
						String label = String.format("hlt_here_%d", instructions.size()-1);
						program.labels.put(label, instructions.size()-1);
					}
				} else { // label
					line = line.trim();
					Utility.errPrintf(line+"\n");
					if (line.indexOf(':') != line.length() - 1) {
						Utility.errPrintf("Invalid Label Formatting on Line %d\n", l);
						return null;
					}
					String label = line.substring(0, line.length()-1);
					program.labels.put(label, instructions.size());
				}
			}
			
			// マクロの処理 ... subi, mov, nop, hlt
			for (int i=0; i<instructions.size(); i++) {
				Instruction instruction = instructions.get(i);
				if (instruction.opcode == OpCode.sub && !instruction.fl && instruction.immediate) {
					instruction.opcode = OpCode.add;
					instruction.oplands[2].immediate = -instruction.oplands[2].immediate;
				}
				if (instruction.opcode == OpCode.mov && !instruction.fl) {
					instruction.opcode = OpCode.add;
					instruction.immediate = true;
					instruction.oplands[2] = new Opland();
					instruction.oplands[2].type = OplandType.I;
					instruction.oplands[2].immediate = 0;
				}
				if (instruction.opcode == OpCode.nop) {
					instruction.opcode = OpCode.add;
					instruction.immediate = true;
					instruction.oplands[0] = new Opland();
					instruction.oplands[0].type = OplandType.R;
					instruction.oplands[0].index = 0;
					instruction.oplands[1] = new Opland();
					instruction.oplands[1].type = OplandType.R;
					instruction.oplands[1].index = 0;
					instruction.oplands[2] = new Opland();
					instruction.oplands[2].type = OplandType.I;
					instruction.oplands[2].immediate = 0;
				}
				
				// TODO hlt
				if (instruction.opcode == OpCode.hlt) {
					instruction.opcode = OpCode.jmp;
					instruction.immediate = true;
					instruction.oplands[0] = new Opland();
					instruction.oplands[0].type = OplandType.J;
					instruction.oplands[0].label = String.format("hlt_here_%d", i);
				}
			}
			
			// h16, l16の処理
			for (Instruction instruction : instructions) {
				for (Opland opland : instruction.oplands) {
					if (opland == null) break;
					if (opland.type == OplandType.AH) {
						opland.type = OplandType.I;
						opland.immediate = program.labels.get(opland.label) >> 16;
					}
					if (opland.type == OplandType.AL) {
						opland.type = OplandType.I;
						opland.immediate = program.labels.get(opland.label) & 65535;
					}
				}
			}
			
			br.close();
			reader.close();
		} catch(IOException e) {
			e.printStackTrace();
			return null;
		}
		
		program.instructions = instructions.toArray(new Instruction[]{});
		
		return program;
	}
}
