package cpuex2;

import java.io.*;
import java.util.*;
import java.util.Map;

import gnu.getopt.*;

public class Main {
	public static long start, end;
	
	public static void main(String[] args) {
		if (args.length == 0) {
			MainFrame frame = MainFrame.getInstance();
		} else {
			// アセンブラ
			boolean asm = false;
			boolean ruby = false;
			boolean int_output = false;
			boolean bin_output = false;
			boolean asc_output = false;

			Utility.showOnTerminal = true;
			
			Simulation simu = Simulation.createSimulation(new File(args[args.length-1]));
			if (simu == null) return;
			
			Getopt options = new Getopt("simulator", args, "aAibcM:");
			
			int c;
			int memory_size = -1;
			while ((c = options.getopt()) != -1) {
				switch(c) {
				case 'a':
					asm = true;
					break;
				case 'A':
					asm = true;
					ruby = true;
					break;
				case 'i':
					int_output = true;
					break;
				case 'b':
					bin_output = true;
					break;
				case 'c':
					asc_output = true;
					break;
				case 'M':
					memory_size = Integer.parseInt(options.getOptarg());
					break;
				}
			}
			if (memory_size != -1) {
				simu.ramsize = memory_size;
			}
			
			// display missing labels
			for (String label : simu.missing_labels) {
				Utility.errPrintf("Missing Label: %s\n", label);
			}
			
			simu.initialize();
			simu.fireable = false;
			simu.mode = 0;
			
			if (asm) {
				try {
					Utility.println("memory_initialization_radix = 2;");
					Utility.println("memory_initialization_vector =");
					
					String[] dat = simu.assemble(ruby);
					for (int i=0; i<dat.length; i++) {
						Utility.println(dat[i]);
					}
				} catch (Exception e) {}
			} else {
				if (int_output) {
					Utility.outputmode = 1;
				}
				if (bin_output) {
					Utility.outputmode = 2;
				}
				if (asc_output){
					Utility.outputmode = 3;
				}
				
				start = java.lang.System.currentTimeMillis();
				while(!simu.halt && !simu.error && !simu.exit) {
					simu.step();
				}
				end = java.lang.System.currentTimeMillis();
				
				// 命令統計の出力
				HashMap<OpCode, Integer> genstat = new HashMap<OpCode, Integer>();
				HashMap<OpCode, Integer> flstat = new HashMap<OpCode, Integer>();
				for (OpCode op : OpCode.values()) {
					genstat.put(op, 0);
					flstat.put(op, 0);
				}
				for (int i=0; i<simu.line_count.length; i++) {
					Instruction inst = simu.program.instructions[i];
					if (inst.fl) {
						flstat.put(inst.opcode, flstat.get(inst.opcode) + simu.line_count[i]);
					} else {
						genstat.put(inst.opcode, genstat.get(inst.opcode) + simu.line_count[i]);
					}
				}
				Utility.errPrintf("\n[Operation Statistics]\n");
				for (Map.Entry<OpCode, Integer> entry : genstat.entrySet()) {
					switch(entry.getKey()) {
						case mov:
						case sqr:
						case inv:
						case mul:
						case neg:
						case nop:
						case hlt:
							break;
						default:
							Utility.errPrintf("%s: %d\n", entry.getKey().toString(), entry.getValue());
							break;
					}
				}
				for (Map.Entry<OpCode, Integer> entry : flstat.entrySet()) {
					switch(entry.getKey()) {
						case add:
						case sub:
						case mul:
						case inv:
						case sqr:
						case neg:
						case mvh:
						case mvl:
						case mov:
							Utility.errPrintf("f%s: %d\n", entry.getKey().toString(), entry.getValue());
							break;
					}
				}
				
				// call統計の出力
				Utility.errPrintf("\n[Call Statistics]\n");
				for (int i=0; i<simu.call_count.length; i++) {
					if (simu.call_count[i] > 0) {
						for (Map.Entry<String, Integer> entry : simu.program.labels.entrySet()) {
							if (entry.getValue() == i) {
								Utility.errPrintf("%s: %d\n", entry.getKey(), simu.call_count[i]);
								break;
							}
						}
					}
				}
				
				// タグ統計の出力
				Utility.errPrintf("\n[Tag Statistics]\n");
				HashMap<String, Integer> tagstat = new HashMap<String, Integer>();
				for (int i=0; i<simu.program.instructions.length; i++) {
					Instruction inst = simu.program.instructions[i];
					if (!inst.tag.equals("")) {
						if (!tagstat.containsKey(inst.tag))
							tagstat.put(inst.tag, 0);
						tagstat.put(inst.tag, tagstat.get(inst.tag) + simu.line_count[i]);
					}
				}
				for (Map.Entry<String, Integer> entry : tagstat.entrySet()) {
					Utility.errPrintf("[%s]: %d\n", entry.getKey(), entry.getValue());
				}
				
				// シミュレーション情報の出力
				Utility.errPrintf("\n[Simulation Information]\n");
				if (end-start > 0)
					Utility.errPrintf("%d ms (%d instructions/sec)\n", end - start, simu.total / (end-start) * 1000);
				else
					Utility.errPrintf("%d ms (inf instructions/sec)\n", end - start);
				Utility.errPrintf("(total %d instructions executed)\n", simu.total);
				Utility.errPrintf("(total %d instructions issued)\n", simu.issued);
			}
		}
	}
}
