	jmpi	_min_caml_start
dbl.105:
	fadd	f1, f1, f1
	jmp	r31
iloop.126:
	subis	r0, r2, 0
	jmpine	jmpeq_else.179
	addi	r2, r0, 49
	prt1	r2
	jmp	r31
jmpeq_else.179:
	fsub	f3, f3, f4
	fadd	f3, f3, f5
	stf	f5, r1, -1
	stw	r2, r1, -3
	stf	f3, r1, -5
	stf	f6, r1, -7
	stf	f2, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	dbl.105
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fmul	f1, f1, f2
	ldf	f6, r1, -7
	fadd	f2, f1, f6
	ldf	f1, r1, -5
	fmul	f3, f1, f1
	fmul	f4, f2, f2
	fadd	f5, f3, f4
	addi	r14, r0, 16512
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f7, r14, r0
	fsubs	f0, f5, f7
	jmpigt	jmple_else.181
	ldw	r2, r1, -3
	subi	r2, r2, 1
	ldf	f5, r1, -1
	jmpi	iloop.126
jmple_else.181:
	addi	r2, r0, 48
	prt1	r2
	jmp	r31
xloop.110:
	subis	r0, r2, 400
	jmpilt	jmpge_else.182
	jmp	r31
jmpge_else.182:
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	min_caml_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	dbl.105
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 17352
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	addi	r14, r0, 16320
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsub	f1, f1, f2
	ldw	r2, r1, -2
	stf	f1, r1, -3
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	min_caml_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	dbl.105
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 17352
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsub	f6, f1, f2
	addi	r2, r0, 1000
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	ldf	f5, r1, -3
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	iloop.126
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	addi	r2, r2, 1
	ldw	r5, r1, -2
	jmpi	xloop.110
yloop.107:
	subis	r0, r2, 400
	jmpilt	jmpge_else.184
	jmp	r31
jmpge_else.184:
	addi	r5, r0, 0
	stw	r2, r1, -1
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	xloop.110
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	addi	r2, r2, 1
	jmpi	yloop.107
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
	addi	r4,r0,0
   # main program start
	addi	r2, r0, 0
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	yloop.107
	ldw	r31, r1, 1
	ldw	r1, r1, 0
   # main program end
	hlt
min_caml_float_of_int:
	subis	r0, r2, 0
	jmpilt	float_of_int.1 	#minus
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	subs	r0, r2, r6
	jmpige	float_of_int.2 	#large
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	oor	r2, r2, r5
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	jmp	r31
float_of_int.2:
	addi	r5, r0, -1
float_of_int.21:
	addi	r5, r5, 1
	subs	r2, r2, r6
	jmpigt	float_of_int.21
	add	r2, r2, r6
	mif	f2, r5		# f2 = 8388608.0
	fmov	f1, f0
float_of_int.22:
	fadd	f3, f3, f2
	subis	r5, r5, 1
	jmpigt	float_of_int.22
	cali	min_caml_float_of_int
	fadd	f1, f1, f3
	jmp	r31
float_of_int.1:
	sub	r2, r0, r2
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	subs	r0, r2, r6
	jmpige	float_of_int.3 	#large
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	oor	r2, r2, r5
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	fneg	f1, f1
	jmp	r31
float_of_int.3:
	addi	r5, r0, -1
float_of_int.31:
	addi	r5, r5, 1
	subs	r2, r2, r6
	jmpigt	float_of_int.31
	add	r2, r2, r6
	addi	r7, r0, 75
	slli	r7, r7, 24	# r7 = 0x4B000000
	mif	f2, r7		# f2 = 8388608.0
	fmov	f1, f0
float_of_int.32:
	fadd	f3, f3, f2
	subis	r5, r5, 1
	jmpigt	float_of_int.32
	cali	min_caml_float_of_int
	fadd	f1, f1, f3
	fneg	f1, f1
	jmp	r31
