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
	
	public static Program parseAsmFile(String asmFileName) {
		Program program = new Program();
		ArrayList<Instruction> instructions = new ArrayList<Instruction>();
		
		try {
			FileReader reader = new FileReader(asmFileName);
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
				} else { // label
					line = line.trim();
					System.out.println(line);
					if (line.indexOf(':') != line.length() - 1) {
						System.err.printf("Invalid Label Formatting on Line %d\n", l);
						return null;
					}
					String label = line.substring(0, line.length()-1);
					program.labels.put(label, instructions.size());
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
