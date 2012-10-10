package cpuex2;

enum OplandType {
	R, F, I, J, AH, AL // R:r1 F:f1 I:100 J:label AH:h16(label) AL:l16(label)
}

public class Opland {
	OplandType type;
	int index;		// レジスタオペランド
	int immediate;	// イミディエイトオペランド
	String label;	// jmp系命令で使用するラベルイミディエイト
	
	public String toString() {
		switch(this.type) {
		case R:
			return String.format("r%d", index);
		case F:
			return String.format("f%d", index);
		case J:
			return label;
		default:
			return Integer.toString(this.immediate);
		}
	}
}
