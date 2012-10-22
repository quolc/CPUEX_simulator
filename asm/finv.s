	addi	r3, r0, 5
	addi	r4, r0, 10
	mif	f1, r3
	mif	f2, r4
	finv	f3, f1
	fmul	f4, f2, f3
	mfi	r3, f4
	prt8	r3
	prt4	r3
	prt2	r3
	prt1	r3