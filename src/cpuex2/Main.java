package cpuex2;

import java.io.*;

public class Main {
	public static void main(String[] args) {
		if (args.length == 0) {
			MainFrame frame = MainFrame.getInstance();
		} else {
			Utility.showOnTerminal = true;
			
			Simulation simu = Simulation.createSimulation(new File(args[args.length-1]));
			simu.initialize();
			simu.fireable = false;
			
			// アセンブラ
			if (args.length>=2) {
				// アセンブリ出力
				boolean asm = false;
				boolean ruby = false;
				for (String arg : args)
					if (arg.equals("-a")) asm = true;
				for (String arg : args) {
					if (arg.equals("-A")) {
						asm = true; ruby = true;
					}
				}
				if (asm) {
					try {
						String[] dat = simu.assemble(ruby);
						
						FileWriter fw = new FileWriter("output.dat");
						for (int i=0; i<dat.length; i++) {
							fw.append(dat[i]);
							if (i<dat.length-1)
								fw.append(",\n");
							else
								fw.append(";\n");
						}
						fw.close();
					} catch (Exception e) {
					}
					System.out.printf("outputed assembly file : output.dat\n", simu.total);
				}
			} else {
				long start = java.lang.System.currentTimeMillis();
				while(!simu.halt && !simu.error && !simu.exit) {
					simu.step();
				}
				long end = java.lang.System.currentTimeMillis();
				System.out.printf("%d ms (%d instructions/sec)\n", end - start, simu.total / (end-start) * 1000);
				System.out.printf("(total %d instructions executed)\n", simu.total);
			}
		}
	}
}
