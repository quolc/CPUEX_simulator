package cpuex2;

import java.util.*;

public class Utility {
	static boolean showOnTerminal = false;
	
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
	
	public static int outputmode = 0;
	static ArrayList<Byte> buffer = new ArrayList<Byte>();
	public static void output(byte b) {
		if (showOnTerminal) {
			switch (outputmode) {
			case 0:
				System.out.printf("%02x", b); // デフォルトはヘックス
				break;
			case 1:
				buffer.add(b);
				while (buffer.size() >= 4) {
					int val=0;
					for (int i=0; i<4; i++) {
						val = val << 8;
						val = val + (buffer.get(0) & 0xFF);
						buffer.remove(0);
					}
					System.out.printf("%d\n", val);
				}
				break;
			case 2:
				try {
					System.out.write(new byte[]{b});
				} catch (Exception e){}
				break;
			case 3:
				System.out.print((char)b);
				break;
			}
		}
	}
	
	public static void errPrintf(String str, Object... args) {
		if (showOnTerminal)
			System.err.printf(str, args);
	}
}
