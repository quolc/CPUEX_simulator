	addi	r3, r0, 100	# r3に100を保存
	mif	f1, r3	# r3からf1にキャスト
	sfu	f1, r0, 0 # 0にf1の上位32bitを保存
	sfl		f1, r0, 1 # 1にf1の下位32bitを保存　
	lfu	f2, r0, 0 # 0からf2に上位32bitを読み込み
	lfl		f2, r0, 1 # 1からf2に下位32bitを読み込み
	mfi	r4, f2	# f2からr4にキャスト
	prt	r4