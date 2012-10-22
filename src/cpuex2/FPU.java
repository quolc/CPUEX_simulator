package cpuex2;

public class FPU {
	public static float fadd(float a, float b) {
		return a + b;
	}
	
	public static float fsub(float a, float b) {
		return a - b;
	}
	
	public static float fmul(float a, float b) {
		return a * b;
	}
	
	public static float finv(float a) {
		return 1/a;
	}
	
	public static float fsqr(float a) {
		return (float)Math.sqrt(a);
	}
	
	public static float fneg(float a) {
		return -a;
	}
}
