package cpuex2;

public class Simulation {
	public Program program;
	
	// constants
	public final int ramsize = 134217728;
	
	// register
	public int pc;
	public int[] r;
	public double[] f;
	public boolean[] cr;
	
	// ram
	public byte[] ram;
	
	private Simulation() {
		this.r = new int[32];
		this.f = new double[32];
		this.cr = new boolean[4];
		this.ram = new byte[ramsize];
	}
	
	public static Simulation createSimulation(String asmFileName) {
		Simulation simulation = new Simulation();
		
		simulation.program = Program.parseAsmFile(asmFileName);
		if (simulation.program == null) return null;
		
		return simulation;
	}
	
	public void initialize() {
		for (int i=0; i<32; i++) {
			this.r[i] = 0;
			this.f[i] = 0;
		}
		for (int i=0; i<4; i++) {
			this.cr[i] = false;
		}
		this.pc = 0;
		for (int i=0; i<ramsize; i++) {
			this.ram[i] = 0;
		}
	}
	
	public void initialize(String ramFileName) {
		this.initialize();
	}
	
	public void step() {
		Instruction instruction = program.instructions[pc];
		
		
		
		pc++;
	}
}
