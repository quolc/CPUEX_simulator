package cpuex2;

import java.util.*;

public class BitWriter {
	ArrayList<Boolean> data;
	
	public BitWriter() {
		this.data = new ArrayList<Boolean>();
	}
	
	// 上位ビットから順にbooleanで流し込んでいく
	public void push(boolean[] bits) {
		for(boolean b : bits)
			data.add(b);
	}
	
	public Byte[] output() {
		ArrayList<Byte> result = new ArrayList<Byte>();
		
		while(data.size() >= 8) {
			byte b = 0;
			for (int i=0; i<8; i++) {
				b += (data.get(0) ? 1 : 0) * (1 << (7-i));
				data.remove(0);
			}
			
			result.add(b);
		}
		
		return result.toArray(new Byte[]{});
	}
	
}
