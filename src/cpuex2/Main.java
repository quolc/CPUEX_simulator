package cpuex2;

import javax.swing.JFrame;

public class Main {
	public static void main(String[] args) {
		/*
		JFrame frame = new JFrame("CPUEX2 Simulator");
		frame.setBounds(200, 200, 1200, 800);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
		*/
		// test
		Simulation simu = Simulation.createSimulation("./input/fib.s");
		simu.initialize();
		while(!simu.halt && !simu.error) {
			simu.step();
		}
	}
}
