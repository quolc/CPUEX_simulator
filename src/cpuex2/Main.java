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
			Utility.showOnTerminal = true;
			
			Simulation simu = Simulation.createSimulation(new File(args[args.length-1]));
			if (simu == null) return;
			
			// display missing labels
			for (String label : simu.missing_labels) {
				Utility.errPrintf("Missing Label: %s\n", label);
			}
			
			simu.initialize();
			simu.fireable = false;
			simu.mode = 0;
			
			// アセンブラ
			boolean asm = false;
			boolean ruby = false;
			boolean int_output = false;
			boolean bin_output = false;
			boolean asc_output = false;
			
			Getopt options = new Getopt("simulator", args, "aAibc");
			
			int c;
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
				}
			}
			
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
				
				// call統計の出力
				for (Map.Entry<String, Integer> entry : simu.call_count.entrySet()) {
					Utility.errPrintf("%s: %d\n", entry.getKey(), entry.getValue());
				}
				
				if (end-start > 0)
					Utility.errPrintf("%d ms (%d instructions/sec)\n", end - start, simu.total / (end-start) * 1000);
				else
					Utility.errPrintf("%d ms (inf instructions/sec)\n", end - start);
				
				Utility.errPrintf("(total %d instructions executed)\n", simu.total);
			}
		}
	}
}
