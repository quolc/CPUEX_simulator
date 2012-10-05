package cpuex2;

enum OplandType {
	R, F, I
}

public class Opland {
	OplandType type;
	int index;		// レジスタオペランド
	int immediate;	// イミディエイトオペランド
	String label;	// jmp系命令で使用するラベルイミディエイト
}
