package cpuex2;

import java.io.*;
import java.util.*;
import java.util.Map;

import gnu.getopt.*;

public class Main {
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
			
			Getopt options = new Getopt("simulator", args, "aAib");
			
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
				
				long start = java.lang.System.currentTimeMillis();
				while(!simu.halt && !simu.error && !simu.exit) {
					simu.step();
				}
				long end = java.lang.System.currentTimeMillis();
				
				// call統計の出力
				for (Map.Entry<String, Integer> entry : simu.call_count.entrySet()) {
					Utility.errPrintf("%s: %d\n", entry.getKey(), entry.getValue());
				}
				
				Utility.errPrintf("%d ms (%d instructions/sec)\n", end - start, simu.total / (end-start) * 1000);
				Utility.errPrintf("(total %d instructions executed)\n", simu.total);
			}
		}
	}
}
