	addi	r3, r0, 100	# r3に100を保存
	mif	f1, r3	# r3からf1にキャスト
	stf		f1, r0, 0
	ldf	f2, r0, 0
	mfi	r4, f2	# f2からr4にキャスト
	prt	r4