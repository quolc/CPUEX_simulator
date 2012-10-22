package cpuex2;

public class FPU {
	public static void printFloat(float a) {
		int ai = Float.floatToIntBits(a);
		
		for (int i=31; i>=0; i--) {
			System.out.print((ai >>> i) & 1);
		}
	}
	
	public static boolean bit_check(int a, int i) {
		return (((a >> i) & 1) == 1);
	}
	
	public static int bit_clear(int a, int i) {
		return a & ~(1 << i);
	}
	
	public static int bit_set(int a, int i) {
		return a | (1 << i);
	}
	
	public static float fadd(float a, float b) {
		int ai, bi;
		ai = Float.floatToIntBits(a);
		bi = Float.floatToIntBits(b);
		
		int sign=0;
		int exp=0;
		int frac=0;
		int ci;
		
		int expl, exps, fracl, fracs;
		int shamt;
		int lzc;
		int round;
		
		boolean operation = true; // true:add false:sub
		
		if (!bit_check(ai, 31) && !bit_check(bi, 31)) {
			operation = true;
		} else if (!bit_check(ai, 31) && bit_check(bi, 31)) {
			operation = false;
		} else if (bit_check(ai, 31) && !bit_check(bi, 31)) {
			operation = false;
		} else if (bit_check(ai, 31) && bit_check(bi, 31)) {
			operation = true;
		}
		
		if (bit_clear(ai, 31) >= bit_clear(bi, 31)) {
			if (bit_check(ai, 31)) {
				sign = 1;
			} else {
				sign = 0;
			}
			expl = ai >>> 23;
			expl = bit_clear(expl, 8);
			exps = bi >>> 23;
			exps = bit_clear(exps, 8);
			fracl = ai & 0x7FFFFF;
			fracl = fracl << 3;
			fracs = bi & 0x7FFFFF;
			fracs = fracs << 3;
		} else {
			if (bit_check(bi, 31)) {
				sign = 1;
			} else {
				sign = 0;
			}
			expl = bi >>> 23;
			expl = bit_clear(expl, 8);
			exps = ai >>> 23;
			exps = bit_clear(exps, 8);
			fracl = bi & 0x7FFFFF;
			fracl = fracl << 3;
			fracs = ai & 0x7FFFFF;
			fracs = fracs << 3;
		}
		
		shamt = expl - exps;
		
		if (expl == 0) {
			fracl = 0;
		}
		fracl = bit_set(fracl, 26);
		
		fracs = bit_set(fracs, 26);
		for (int i=0; i<shamt; i++) {
			if (bit_check(fracs, 0)) {
				fracs = fracs >>> 1;
				fracs = bit_set(fracs, 0);
			} else {
				fracs = fracs >>> 1;
			}
		}
		if (exps == 0) {
			fracs = 0;
		}
		
		if (operation) {
			frac = fracl + fracs;
		} else {
			frac = fracl - fracs;
		}
		
		ci = ((sign & 1) << 31) + ((exp & 0xFF) << 23) + (frac & 0x7FFFFF);
		
		lzc = 0;
		for (int i=27; !bit_check(frac, i); i--) {
			if (i<0) {
				lzc = 31;
				break;
			}
			lzc++;
		}
		
		if ((frac & 0x7FFFFFC) == 0x7FFFFFC && !bit_check(frac, 27)) {
			exp = expl + 2;
		} else if ((frac & 0x3FFFFFE) == 0x3FFFFFE && !bit_check(frac, 27) && !bit_check(frac, 26)) {
			exp = expl + 2;
		} else {
			exp = expl + 1;
		}
		
		round = 0;
		if (lzc == 0) {
			if (bit_check(frac, 3) && (bit_check(frac, 4) || bit_check(frac, 2) || bit_check(frac, 1) || bit_check(frac, 0))) {
				round = 1;
			}
		} else if (lzc == 1) {
			if(bit_check(frac, 2) && (bit_check(frac, 3) || bit_check(frac, 1) || bit_check(frac, 0))) {
				round = 1;
			}
		} else {
			if(bit_check(frac, 1) && (bit_check(frac, 2) || bit_check(frac, 0))){
				round = 1;
			}
		}
		
		if((lzc & 3) == 0){
			frac = bit_clear(frac, 27);
		}else if((lzc & 3) == 1){
			frac = frac << 1;
			frac = bit_clear(frac, 28);
			frac = bit_clear(frac, 27);
		}else if((lzc & 3) == 2){
			frac = frac << 2;
			frac = bit_clear(frac, 29);
			frac = bit_clear(frac, 28);
			frac = bit_clear(frac, 27);
		}else if((lzc & 3) == 3){
			frac = frac << 3;
			frac = bit_clear(frac, 30);
			frac = bit_clear(frac, 29);
			frac = bit_clear(frac, 28);
			frac = bit_clear(frac, 27);
		}
		
		if((lzc & 28) == 0){
			frac = frac + round * 16;
		}else if((lzc & 28) == 4){
			frac = frac << 4;
			frac = frac & 0x7FFFFFF;
		}else if((lzc & 28) == 8){
			frac = frac << 8;
			frac = frac & 0x7FFFFF0;
		}else if((lzc & 28) == 12){
			frac = frac << 12;
			frac = frac & 0x7FFFF00;
		}else if((lzc & 28) == 16){
			frac = frac << 16;
			frac = frac & 0x7FFF000;
		}else if((lzc & 28) == 20){
			frac = frac << 20;
			frac = frac & 0x7FF0000;
		}else if((lzc & 28) == 24){
			frac = frac << 24;
			frac = frac & 0x7F00000;
		}
		frac = frac >>> 4;
		frac &= 0x7FFFFF;
		
		if(lzc == 31){
			exp = 0;
		}else if(exp <= lzc){
			exp = 0;
		}else{
			exp = exp - lzc;
		}
		
		ci = 0;
		if (sign == 1) ci = bit_set(ci, 31);
		ci = ci | ((exp & 255) << 23);
		ci = ci | (frac & 0x7FFFFF);
		
		return Float.intBitsToFloat(ci);
	}
	
	public static float fsub(float a, float b) {
		return fadd(a, -b);
	}
	
	public static float fmul(float a, float b) {
		int ai, bi, ci=0;
		ai = Float.floatToIntBits(a);
		bi = Float.floatToIntBits(b);
		
		int a_sign, a_exp, a_frac;
		int b_sign, b_exp, b_frac;
		int sign, exp, frac;
		
		a_sign = (ai >>> 31) & 1;
		a_exp = ai >>> 23 & 255;
		a_frac = ai & 0x7FFFFF;
		
		b_sign = bi >>> 31 & 1;
		b_exp = bi >>> 23 & 255;
		b_frac = bi & 0x7FFFFF;
		
		// signals
		boolean iszero = false;
		
		// zero detection
		if (ai == 0 || bi == 0) iszero = true;
		
		// Step 1.
		int ah, al, bh, bl;
		ah = a_frac >> 11;
		al = a_frac & 2047;
		bh = b_frac >> 11;
		bl = b_frac & 2047;
		
		// Step 2.
		ah += (1 << 12);
		bh += (1 << 12);
		int hh, hl, lh;
		hh = ah*bh;
		hl = ah*bl;
		lh = al*bh;
		
		// Step 3.
		frac = hh + (hl >> 11) + (lh >> 11) + 2;
		
		// Step 4.
		int i;
		for (i=31; i>22; i--) {
			if ((frac >> i) != 0) {
				frac = (frac >> i-23) & 0x7FFFFF;
				break;
			}
		}
		
		// Step 5.
		if (i==25)
			exp = a_exp + b_exp + 130;
		else
			exp = a_exp + b_exp + 129;
		
		if ((exp & 256) == 0) exp = 0; //underflow
		
		if (exp == 0 || (exp & 255) == 255)
			frac = 0;
		
		sign = a_sign ^ b_sign;
		
		ci = ((sign & 1) << 31) | ((exp & 0xFF) << 23) | (frac & 0x7FFFFF);
		
		// zero
		if (iszero) ci = 0;
		
		return Float.intBitsToFloat(ci);
	}
	
	public static float finv(float a) {
		// TODO
		return 1/a;
	}
	
	public static float fsqr(float a) {
		// TODO
		return (float)Math.sqrt(a);
	}
	
	public static float fneg(float a) {
		return -a;
	}
}

/*
// fmulのテスト
try {
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	String line;
	while ((line = br.readLine()) != null) {
		int a=0;
		int b=0;
		for (int i=0; i<32; i++) {
			a += (line.charAt(i) == '1' ? 1 : 0) * (1 << (31-i));
			b += (line.charAt(32+i) == '1' ? 1 : 0) * (1 << (31-i));
		}
		float fa, fb;
		fa = Float.intBitsToFloat(a);
		fb = Float.intBitsToFloat(b);
		
		float fc = FPU.fmul(fa, fb);
		int c = Float.floatToIntBits(fc);
		
		for (int i=0; i<8; i++) {
			System.out.printf("%X", ((c >> 4*(7-i)) & 15));
		}
		System.out.println();
	}
} catch (Exception e) {}

System.exit(0);
*/
