package cpuex2;

public class Utility {
	static final boolean showOnTerminal = false;
	
	public static void print(String str) {
		if (showOnTerminal)
			System.out.print(str);
	}
	
	public static void println(String str) {
		if (showOnTerminal)
			System.out.println(str);
	}
	
	public static void println(int str) {
		if (showOnTerminal)
			System.out.println(str);
	}

	public static void printf(String str, Object... args) {
		if (showOnTerminal)
			System.out.printf(str, args);
	}
	
	public static void errPrintf(String str, Object... args) {
		if (showOnTerminal)
			System.err.printf(str, args);
	}
}
