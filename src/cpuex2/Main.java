package cpuex2;

import java.io.*;

public class Main {
	public static void main(String[] args) {
//		MainFrame frame = MainFrame.getInstance();
		
	
//		/*
		Simulation simu = Simulation.createSimulation(new File(args[0]));
		simu.initialize();
		
		long start = java.lang.System.currentTimeMillis();
		while(!simu.halt && !simu.error) {
			simu.step();
		}
		long end = java.lang.System.currentTimeMillis();
		System.out.printf("%d ms (%d instructions/sec)\n", end - start, simu.total / (end-start) * 1000);
		System.out.printf("(total %d instructions executed)", simu.total);
//		*/
	}
}
