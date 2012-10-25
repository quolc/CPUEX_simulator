	jmpi	_min_caml_start
fless.2764:
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9571
	addi	r2, r0, 0
	jmp	r31
jmple_else.9571:
	addi	r2, r0, 1
	jmp	r31
fispos.2767:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9572
	addi	r2, r0, 0
	jmp	r31
jmple_else.9572:
	addi	r2, r0, 1
	jmp	r31
fisneg.2770:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9573
	addi	r2, r0, 0
	jmp	r31
jmple_else.9573:
	addi	r2, r0, 1
	jmp	r31
fiszero.2773:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpine	jmpeq_else.9574
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9574:
	addi	r2, r0, 0
	jmp	r31
fabs.2776:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9575
	jmp	r31
jmple_else.9575:
	fneg	f1, f1
	jmp	r31
fneg.2781:
	fneg	f1, f1
	jmp	r31
fhalf.2783:
	addi	r14, r0, 16128	#r14 = 3f000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	jmp	r31
fsqr.2786:
	fmul	f1, f1, f1
	jmp	r31
mul10.2788:
	slai	r5, r2, 3
	slai	r2, r2, 1
	add	r2, r5, r2
	jmp	r31
read_int_token.2800:
	ldw	r6, r30, 2
	ldw	r7, r30, 1
scanlabel.0:
	scn1s	r8, r0
	jmpics	scanlabel.0
	subis	r0, r8, 48
	jmpilt	jmpge_else.9576
	subis	r0, r8, 57
	jmpigt	jmple_else.9578
	addi	r9, r0, 0
	jmpi	jmple_cont.9579
jmple_else.9578:
	addi	r9, r0, 1
jmple_cont.9579:
	jmpi	jmpge_cont.9577
jmpge_else.9576:
	addi	r9, r0, 1
jmpge_cont.9577:
	subis	r0, r9, 0
	jmpine	jmpeq_else.9580
	ldw	r2, r6, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9581
	subis	r0, r5, 45
	jmpine	jmpeq_else.9583
	addi	r2, r0, -1
	stw	r2, r6, 0
	jmpi	jmpeq_cont.9584
jmpeq_else.9583:
	addi	r2, r0, 1
	stw	r2, r6, 0
jmpeq_cont.9584:
	jmpi	jmpeq_cont.9582
jmpeq_else.9581:
jmpeq_cont.9582:
	ldw	r2, r7, 0
	stw	r30, r1, -1
	stw	r7, r1, -2
	stw	r8, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	mul10.2788
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -3
	subi	r6, r5, 48
	add	r2, r2, r6
	ldw	r6, r1, -2
	stw	r2, r6, 0
	addi	r2, r0, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9580:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9585
	addi	r2, r0, 0
	addi	r5, r8, 0
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9585:
	ldw	r2, r6, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9586
	ldw	r2, r7, 0
	jmp	r31
jmpeq_else.9586:
	ldw	r2, r7, 0
	sub	r2, r0, r2
	jmp	r31
read_int.2836:
	ldw	r2, r30, 3
	ldw	r5, r30, 2
	ldw	r6, r30, 1
	addi	r7, r0, 0
	stw	r7, r6, 0
	addi	r6, r0, 0
	stw	r6, r5, 0
	addi	r5, r0, 0
	addi	r6, r0, 32
	addi	r30, r2, 0
	addi	r2, r5, 0
	addi	r5, r6, 0
	ldw	r29, r30, 0
	jmp	r29
read_float_token1.2858:
	ldw	r6, r30, 2
	ldw	r7, r30, 1
scanlabel.1:
	scn1s	r8, r0
	jmpics	scanlabel.1
	subis	r0, r8, 48
	jmpilt	jmpge_else.9587
	subis	r0, r8, 57
	jmpigt	jmple_else.9589
	addi	r9, r0, 0
	jmpi	jmple_cont.9590
jmple_else.9589:
	addi	r9, r0, 1
jmple_cont.9590:
	jmpi	jmpge_cont.9588
jmpge_else.9587:
	addi	r9, r0, 1
jmpge_cont.9588:
	subis	r0, r9, 0
	jmpine	jmpeq_else.9591
	ldw	r2, r6, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9592
	subis	r0, r5, 45
	jmpine	jmpeq_else.9594
	addi	r2, r0, -1
	stw	r2, r6, 0
	jmpi	jmpeq_cont.9595
jmpeq_else.9594:
	addi	r2, r0, 1
	stw	r2, r6, 0
jmpeq_cont.9595:
	jmpi	jmpeq_cont.9593
jmpeq_else.9592:
jmpeq_cont.9593:
	ldw	r2, r7, 0
	stw	r30, r1, -1
	stw	r7, r1, -2
	stw	r8, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	mul10.2788
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -3
	subi	r6, r5, 48
	add	r2, r2, r6
	ldw	r6, r1, -2
	stw	r2, r6, 0
	addi	r2, r0, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9591:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9596
	addi	r2, r0, 0
	addi	r5, r8, 0
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9596:
	addi	r2, r8, 0
	jmp	r31
read_float_token2.2888:
	ldw	r5, r30, 2
	ldw	r6, r30, 1
scanlabel.2:
	scn1s	r7, r0
	jmpics	scanlabel.2
	subis	r0, r7, 48
	jmpilt	jmpge_else.9597
	subis	r0, r7, 57
	jmpigt	jmple_else.9599
	addi	r8, r0, 0
	jmpi	jmple_cont.9600
jmple_else.9599:
	addi	r8, r0, 1
jmple_cont.9600:
	jmpi	jmpge_cont.9598
jmpge_else.9597:
	addi	r8, r0, 1
jmpge_cont.9598:
	subis	r0, r8, 0
	jmpine	jmpeq_else.9601
	ldw	r2, r5, 0
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	stw	r7, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	mul10.2788
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r5, r1, -4
	subi	r5, r5, 48
	add	r2, r2, r5
	ldw	r5, r1, -3
	stw	r2, r5, 0
	ldw	r2, r1, -2
	ldw	r5, r2, 0
	addi	r2, r5, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	mul10.2788
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r5, r1, -2
	stw	r2, r5, 0
	addi	r2, r0, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9601:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9602
	addi	r2, r0, 0
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9602:
	jmp	r31
read_float.2912:
	ldw	r2, r30, 6
	ldw	r5, r30, 5
	ldw	r6, r30, 4
	ldw	r7, r30, 3
	ldw	r8, r30, 2
	ldw	r9, r30, 1
	addi	r10, r0, 0
	stw	r10, r7, 0
	addi	r10, r0, 0
	stw	r10, r8, 0
	addi	r10, r0, 1
	stw	r10, r9, 0
	addi	r10, r0, 0
	stw	r10, r6, 0
	addi	r10, r0, 0
	addi	r11, r0, 32
	stw	r6, r1, -1
	stw	r9, r1, -2
	stw	r8, r1, -3
	stw	r7, r1, -4
	stw	r2, r1, -5
	addi	r2, r10, 0
	addi	r30, r5, 0
	addi	r5, r11, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 46
	jmpine	jmpeq_else.9604
	addi	r2, r0, 0
	ldw	r30, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -4
	ldw	r2, r2, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	external_float_of_int
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -3
	ldw	r2, r2, 0
	stf	f1, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	external_float_of_int
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -2
	ldw	r2, r2, 0
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	external_float_of_int
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldf	f2, r1, -6
	fadd	f1, f2, f1
	jmpi	jmpeq_cont.9605
jmpeq_else.9604:
	ldw	r2, r1, -4
	ldw	r2, r2, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	external_float_of_int
	addi	r1, r1, 8
	ldw	r31, r1, -8
jmpeq_cont.9605:
	ldw	r2, r1, -1
	ldw	r2, r2, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9606
	jmp	r31
jmpeq_else.9606:
	fneg	f1, f1
	jmp	r31
mul_sub.2948:
	subis	r0, r5, 0
	jmpine	jmpeq_else.9607
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9607:
	srli	r6, r5, 1
	slai	r6, r6, 1
	sub	r6, r5, r6
	subis	r0, r6, 0
	jmpine	jmpeq_else.9608
	slai	r2, r2, 1
	srli	r5, r5, 1
	jmpi	mul_sub.2948
jmpeq_else.9608:
	slai	r6, r2, 1
	srli	r5, r5, 1
	stw	r2, r1, -1
	addi	r2, r6, 0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	mul_sub.2948
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r5, r1, -1
	add	r2, r2, r5
	jmp	r31
mul.2967:
	subis	r0, r5, 0
	jmpilt	jmpge_else.9609
	jmpi	mul_sub.2948
jmpge_else.9609:
	sub	r2, r0, r2
	sub	r5, r0, r5
	jmpi	mul_sub.2948
div_binary_search.2973:
	add	r8, r6, r7
	srli	r8, r8, 1
	addi	r15, r0, 0
	sllis	r0, r5, 1
	sllics	r14, r8, 31
	addcs	r15, r15, r14
	sllis	r0, r5, 2
	sllics	r14, r8, 30
	addcs	r15, r15, r14
	sllis	r0, r5, 3
	sllics	r14, r8, 29
	addcs	r15, r15, r14
	sllis	r0, r5, 4
	sllics	r14, r8, 28
	addcs	r15, r15, r14
	sllis	r0, r5, 5
	sllics	r14, r8, 27
	addcs	r15, r15, r14
	sllis	r0, r5, 6
	sllics	r14, r8, 26
	addcs	r15, r15, r14
	sllis	r0, r5, 7
	sllics	r14, r8, 25
	addcs	r15, r15, r14
	sllis	r0, r5, 8
	sllics	r14, r8, 24
	addcs	r15, r15, r14
	sllis	r0, r5, 9
	sllics	r14, r8, 23
	addcs	r15, r15, r14
	sllis	r0, r5, 10
	sllics	r14, r8, 22
	addcs	r15, r15, r14
	sllis	r0, r5, 11
	sllics	r14, r8, 21
	addcs	r15, r15, r14
	sllis	r0, r5, 12
	sllics	r14, r8, 20
	addcs	r15, r15, r14
	sllis	r0, r5, 13
	sllics	r14, r8, 19
	addcs	r15, r15, r14
	sllis	r0, r5, 14
	sllics	r14, r8, 18
	addcs	r15, r15, r14
	sllis	r0, r5, 15
	sllics	r14, r8, 17
	addcs	r15, r15, r14
	sllis	r0, r5, 16
	sllics	r14, r8, 16
	addcs	r15, r15, r14
	sllis	r0, r5, 17
	sllics	r14, r8, 15
	addcs	r15, r15, r14
	sllis	r0, r5, 18
	sllics	r14, r8, 14
	addcs	r15, r15, r14
	sllis	r0, r5, 19
	sllics	r14, r8, 13
	addcs	r15, r15, r14
	sllis	r0, r5, 20
	sllics	r14, r8, 12
	addcs	r15, r15, r14
	sllis	r0, r5, 21
	sllics	r14, r8, 11
	addcs	r15, r15, r14
	sllis	r0, r5, 22
	sllics	r14, r8, 10
	addcs	r15, r15, r14
	sllis	r0, r5, 23
	sllics	r14, r8, 9
	addcs	r15, r15, r14
	sllis	r0, r5, 24
	sllics	r14, r8, 8
	addcs	r15, r15, r14
	sllis	r0, r5, 25
	sllics	r14, r8, 7
	addcs	r15, r15, r14
	sllis	r0, r5, 26
	sllics	r14, r8, 6
	addcs	r15, r15, r14
	sllis	r0, r5, 27
	sllics	r14, r8, 5
	addcs	r15, r15, r14
	sllis	r0, r5, 28
	sllics	r14, r8, 4
	addcs	r15, r15, r14
	sllis	r0, r5, 29
	sllics	r14, r8, 3
	addcs	r15, r15, r14
	sllis	r0, r5, 30
	sllics	r14, r8, 2
	addcs	r15, r15, r14
	sllis	r0, r5, 31
	sllics	r14, r8, 1
	addcs	r15, r15, r14
	sllis	r0, r5, 32
	sllics	r14, r8, 0
	addcs	r15, r15, r14
	addi	r9, r15, 0
	sub	r10, r7, r6
	subis	r0, r10, 1
	jmpigt	jmple_else.9610
	addi	r2, r6, 0
	jmp	r31
jmple_else.9610:
	subs	r0, r2, r9
	jmpigt	jmple_else.9611
	subs	r0, r9, r2
	jmpine	jmpeq_else.9612
	addi	r2, r8, 0
	jmp	r31
jmpeq_else.9612:
	addi	r7, r8, 0
	jmpi	div_binary_search.2973
jmple_else.9611:
	addi	r6, r8, 0
	jmpi	div_binary_search.2973
div_sub.2984:
	slai	r7, r5, 1
	stw	r5, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	addi	r5, r6, 0
	addi	r2, r7, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	mul.2967
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -3
	subs	r0, r2, r5
	jmpigt	jmple_else.9613
	ldw	r2, r1, -2
	slai	r6, r2, 1
	ldw	r2, r1, -1
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	jmpi	div_sub.2984
jmple_else.9613:
	ldw	r6, r1, -2
	slai	r7, r6, 1
	ldw	r2, r1, -1
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	jmpi	div_binary_search.2973
div.2995:
	subis	r0, r2, 0
	jmpilt	jmpge_else.9614
	addi	r6, r2, 0
	jmpi	jmpge_cont.9615
jmpge_else.9614:
	sub	r6, r0, r2
jmpge_cont.9615:
	subis	r0, r5, 0
	jmpilt	jmpge_else.9616
	addi	r7, r5, 0
	jmpi	jmpge_cont.9617
jmpge_else.9616:
	sub	r7, r0, r5
jmpge_cont.9617:
	subs	r0, r7, r6
	jmpigt	jmple_else.9618
	addi	r8, r0, 1
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	div_sub.2984
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r5, r1, -2
	subis	r0, r5, 0
	jmpilt	jmpge_else.9619
	ldw	r5, r1, -1
	subis	r0, r5, 0
	jmpilt	jmpge_else.9620
	jmp	r31
jmpge_else.9620:
	sub	r2, r0, r2
	jmp	r31
jmpge_else.9619:
	ldw	r5, r1, -1
	subis	r0, r5, 0
	jmpilt	jmpge_else.9621
	sub	r2, r0, r2
	jmp	r31
jmpge_else.9621:
	jmp	r31
jmple_else.9618:
	addi	r2, r0, 0
	jmp	r31
print_int.3007:
	subis	r0, r2, 0
	jmpilt	jmpge_else.9622
	addi	r5, r0, 1525	#r5 = 100000000
	slli	r5, r5, 16
	addi	r5, r5, 24832
	addi	r5, r5, 32767
	addi	r5, r5, 1
	addi	r6, r0, 0
	addi	r7, r0, 3
	stw	r2, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	div_binary_search.2973
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r5, r0, 1525	#r5 = 100000000
	slli	r5, r5, 16
	addi	r5, r5, 24832
	addi	r5, r5, 32767
	addi	r5, r5, 1
	addi	r15, r0, 0
	sllis	r0, r5, 1
	sllics	r14, r2, 31
	addcs	r15, r15, r14
	sllis	r0, r5, 2
	sllics	r14, r2, 30
	addcs	r15, r15, r14
	sllis	r0, r5, 3
	sllics	r14, r2, 29
	addcs	r15, r15, r14
	sllis	r0, r5, 4
	sllics	r14, r2, 28
	addcs	r15, r15, r14
	sllis	r0, r5, 5
	sllics	r14, r2, 27
	addcs	r15, r15, r14
	sllis	r0, r5, 6
	sllics	r14, r2, 26
	addcs	r15, r15, r14
	sllis	r0, r5, 7
	sllics	r14, r2, 25
	addcs	r15, r15, r14
	sllis	r0, r5, 8
	sllics	r14, r2, 24
	addcs	r15, r15, r14
	sllis	r0, r5, 9
	sllics	r14, r2, 23
	addcs	r15, r15, r14
	sllis	r0, r5, 10
	sllics	r14, r2, 22
	addcs	r15, r15, r14
	sllis	r0, r5, 11
	sllics	r14, r2, 21
	addcs	r15, r15, r14
	sllis	r0, r5, 12
	sllics	r14, r2, 20
	addcs	r15, r15, r14
	sllis	r0, r5, 13
	sllics	r14, r2, 19
	addcs	r15, r15, r14
	sllis	r0, r5, 14
	sllics	r14, r2, 18
	addcs	r15, r15, r14
	sllis	r0, r5, 15
	sllics	r14, r2, 17
	addcs	r15, r15, r14
	sllis	r0, r5, 16
	sllics	r14, r2, 16
	addcs	r15, r15, r14
	sllis	r0, r5, 17
	sllics	r14, r2, 15
	addcs	r15, r15, r14
	sllis	r0, r5, 18
	sllics	r14, r2, 14
	addcs	r15, r15, r14
	sllis	r0, r5, 19
	sllics	r14, r2, 13
	addcs	r15, r15, r14
	sllis	r0, r5, 20
	sllics	r14, r2, 12
	addcs	r15, r15, r14
	sllis	r0, r5, 21
	sllics	r14, r2, 11
	addcs	r15, r15, r14
	sllis	r0, r5, 22
	sllics	r14, r2, 10
	addcs	r15, r15, r14
	sllis	r0, r5, 23
	sllics	r14, r2, 9
	addcs	r15, r15, r14
	sllis	r0, r5, 24
	sllics	r14, r2, 8
	addcs	r15, r15, r14
	sllis	r0, r5, 25
	sllics	r14, r2, 7
	addcs	r15, r15, r14
	sllis	r0, r5, 26
	sllics	r14, r2, 6
	addcs	r15, r15, r14
	sllis	r0, r5, 27
	sllics	r14, r2, 5
	addcs	r15, r15, r14
	sllis	r0, r5, 28
	sllics	r14, r2, 4
	addcs	r15, r15, r14
	sllis	r0, r5, 29
	sllics	r14, r2, 3
	addcs	r15, r15, r14
	sllis	r0, r5, 30
	sllics	r14, r2, 2
	addcs	r15, r15, r14
	sllis	r0, r5, 31
	sllics	r14, r2, 1
	addcs	r15, r15, r14
	sllis	r0, r5, 32
	sllics	r14, r2, 0
	addcs	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -1
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9623
	addi	r2, r0, 0
	jmpi	jmple_cont.9624
jmple_else.9623:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9624:
	addi	r6, r0, 152	#r6 = 10000000
	slli	r6, r6, 16
	addi	r6, r6, 5760
	addi	r6, r6, 32767
	addi	r6, r6, 1
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -2
	stw	r5, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	div_binary_search.2973
	addi	r1, r1, 4
	ldw	r31, r1, -4
	addi	r5, r0, 152	#r5 = 10000000
	slli	r5, r5, 16
	addi	r5, r5, 5760
	addi	r5, r5, 32767
	addi	r5, r5, 1
	addi	r15, r0, 0
	sllis	r0, r5, 1
	sllics	r14, r2, 31
	addcs	r15, r15, r14
	sllis	r0, r5, 2
	sllics	r14, r2, 30
	addcs	r15, r15, r14
	sllis	r0, r5, 3
	sllics	r14, r2, 29
	addcs	r15, r15, r14
	sllis	r0, r5, 4
	sllics	r14, r2, 28
	addcs	r15, r15, r14
	sllis	r0, r5, 5
	sllics	r14, r2, 27
	addcs	r15, r15, r14
	sllis	r0, r5, 6
	sllics	r14, r2, 26
	addcs	r15, r15, r14
	sllis	r0, r5, 7
	sllics	r14, r2, 25
	addcs	r15, r15, r14
	sllis	r0, r5, 8
	sllics	r14, r2, 24
	addcs	r15, r15, r14
	sllis	r0, r5, 9
	sllics	r14, r2, 23
	addcs	r15, r15, r14
	sllis	r0, r5, 10
	sllics	r14, r2, 22
	addcs	r15, r15, r14
	sllis	r0, r5, 11
	sllics	r14, r2, 21
	addcs	r15, r15, r14
	sllis	r0, r5, 12
	sllics	r14, r2, 20
	addcs	r15, r15, r14
	sllis	r0, r5, 13
	sllics	r14, r2, 19
	addcs	r15, r15, r14
	sllis	r0, r5, 14
	sllics	r14, r2, 18
	addcs	r15, r15, r14
	sllis	r0, r5, 15
	sllics	r14, r2, 17
	addcs	r15, r15, r14
	sllis	r0, r5, 16
	sllics	r14, r2, 16
	addcs	r15, r15, r14
	sllis	r0, r5, 17
	sllics	r14, r2, 15
	addcs	r15, r15, r14
	sllis	r0, r5, 18
	sllics	r14, r2, 14
	addcs	r15, r15, r14
	sllis	r0, r5, 19
	sllics	r14, r2, 13
	addcs	r15, r15, r14
	sllis	r0, r5, 20
	sllics	r14, r2, 12
	addcs	r15, r15, r14
	sllis	r0, r5, 21
	sllics	r14, r2, 11
	addcs	r15, r15, r14
	sllis	r0, r5, 22
	sllics	r14, r2, 10
	addcs	r15, r15, r14
	sllis	r0, r5, 23
	sllics	r14, r2, 9
	addcs	r15, r15, r14
	sllis	r0, r5, 24
	sllics	r14, r2, 8
	addcs	r15, r15, r14
	sllis	r0, r5, 25
	sllics	r14, r2, 7
	addcs	r15, r15, r14
	sllis	r0, r5, 26
	sllics	r14, r2, 6
	addcs	r15, r15, r14
	sllis	r0, r5, 27
	sllics	r14, r2, 5
	addcs	r15, r15, r14
	sllis	r0, r5, 28
	sllics	r14, r2, 4
	addcs	r15, r15, r14
	sllis	r0, r5, 29
	sllics	r14, r2, 3
	addcs	r15, r15, r14
	sllis	r0, r5, 30
	sllics	r14, r2, 2
	addcs	r15, r15, r14
	sllis	r0, r5, 31
	sllics	r14, r2, 1
	addcs	r15, r15, r14
	sllis	r0, r5, 32
	sllics	r14, r2, 0
	addcs	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -3
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9625
	ldw	r6, r1, -2
	subis	r0, r6, 0
	jmpine	jmpeq_else.9627
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9628
jmpeq_else.9627:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9628:
	jmpi	jmple_cont.9626
jmple_else.9625:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9626:
	addi	r6, r0, 15	#r6 = 1000000
	slli	r6, r6, 16
	oori	r6, r6, 16960
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -4
	stw	r5, r1, -5
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	div_binary_search.2973
	addi	r1, r1, 6
	ldw	r31, r1, -6
	addi	r5, r0, 15	#r5 = 1000000
	slli	r5, r5, 16
	oori	r5, r5, 16960
	addi	r15, r0, 0
	sllis	r0, r5, 1
	sllics	r14, r2, 31
	addcs	r15, r15, r14
	sllis	r0, r5, 2
	sllics	r14, r2, 30
	addcs	r15, r15, r14
	sllis	r0, r5, 3
	sllics	r14, r2, 29
	addcs	r15, r15, r14
	sllis	r0, r5, 4
	sllics	r14, r2, 28
	addcs	r15, r15, r14
	sllis	r0, r5, 5
	sllics	r14, r2, 27
	addcs	r15, r15, r14
	sllis	r0, r5, 6
	sllics	r14, r2, 26
	addcs	r15, r15, r14
	sllis	r0, r5, 7
	sllics	r14, r2, 25
	addcs	r15, r15, r14
	sllis	r0, r5, 8
	sllics	r14, r2, 24
	addcs	r15, r15, r14
	sllis	r0, r5, 9
	sllics	r14, r2, 23
	addcs	r15, r15, r14
	sllis	r0, r5, 10
	sllics	r14, r2, 22
	addcs	r15, r15, r14
	sllis	r0, r5, 11
	sllics	r14, r2, 21
	addcs	r15, r15, r14
	sllis	r0, r5, 12
	sllics	r14, r2, 20
	addcs	r15, r15, r14
	sllis	r0, r5, 13
	sllics	r14, r2, 19
	addcs	r15, r15, r14
	sllis	r0, r5, 14
	sllics	r14, r2, 18
	addcs	r15, r15, r14
	sllis	r0, r5, 15
	sllics	r14, r2, 17
	addcs	r15, r15, r14
	sllis	r0, r5, 16
	sllics	r14, r2, 16
	addcs	r15, r15, r14
	sllis	r0, r5, 17
	sllics	r14, r2, 15
	addcs	r15, r15, r14
	sllis	r0, r5, 18
	sllics	r14, r2, 14
	addcs	r15, r15, r14
	sllis	r0, r5, 19
	sllics	r14, r2, 13
	addcs	r15, r15, r14
	sllis	r0, r5, 20
	sllics	r14, r2, 12
	addcs	r15, r15, r14
	sllis	r0, r5, 21
	sllics	r14, r2, 11
	addcs	r15, r15, r14
	sllis	r0, r5, 22
	sllics	r14, r2, 10
	addcs	r15, r15, r14
	sllis	r0, r5, 23
	sllics	r14, r2, 9
	addcs	r15, r15, r14
	sllis	r0, r5, 24
	sllics	r14, r2, 8
	addcs	r15, r15, r14
	sllis	r0, r5, 25
	sllics	r14, r2, 7
	addcs	r15, r15, r14
	sllis	r0, r5, 26
	sllics	r14, r2, 6
	addcs	r15, r15, r14
	sllis	r0, r5, 27
	sllics	r14, r2, 5
	addcs	r15, r15, r14
	sllis	r0, r5, 28
	sllics	r14, r2, 4
	addcs	r15, r15, r14
	sllis	r0, r5, 29
	sllics	r14, r2, 3
	addcs	r15, r15, r14
	sllis	r0, r5, 30
	sllics	r14, r2, 2
	addcs	r15, r15, r14
	sllis	r0, r5, 31
	sllics	r14, r2, 1
	addcs	r15, r15, r14
	sllis	r0, r5, 32
	sllics	r14, r2, 0
	addcs	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -5
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9629
	ldw	r6, r1, -4
	subis	r0, r6, 0
	jmpine	jmpeq_else.9631
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9632
jmpeq_else.9631:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9632:
	jmpi	jmple_cont.9630
jmple_else.9629:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9630:
	addi	r6, r0, 1	#r6 = 100000
	slli	r6, r6, 16
	addi	r6, r6, 1696
	addi	r6, r6, 32767
	addi	r6, r6, 1
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -6
	stw	r5, r1, -7
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	div_binary_search.2973
	addi	r1, r1, 8
	ldw	r31, r1, -8
	addi	r5, r0, 1	#r5 = 100000
	slli	r5, r5, 16
	addi	r5, r5, 1696
	addi	r5, r5, 32767
	addi	r5, r5, 1
	addi	r15, r0, 0
	sllis	r0, r5, 1
	sllics	r14, r2, 31
	addcs	r15, r15, r14
	sllis	r0, r5, 2
	sllics	r14, r2, 30
	addcs	r15, r15, r14
	sllis	r0, r5, 3
	sllics	r14, r2, 29
	addcs	r15, r15, r14
	sllis	r0, r5, 4
	sllics	r14, r2, 28
	addcs	r15, r15, r14
	sllis	r0, r5, 5
	sllics	r14, r2, 27
	addcs	r15, r15, r14
	sllis	r0, r5, 6
	sllics	r14, r2, 26
	addcs	r15, r15, r14
	sllis	r0, r5, 7
	sllics	r14, r2, 25
	addcs	r15, r15, r14
	sllis	r0, r5, 8
	sllics	r14, r2, 24
	addcs	r15, r15, r14
	sllis	r0, r5, 9
	sllics	r14, r2, 23
	addcs	r15, r15, r14
	sllis	r0, r5, 10
	sllics	r14, r2, 22
	addcs	r15, r15, r14
	sllis	r0, r5, 11
	sllics	r14, r2, 21
	addcs	r15, r15, r14
	sllis	r0, r5, 12
	sllics	r14, r2, 20
	addcs	r15, r15, r14
	sllis	r0, r5, 13
	sllics	r14, r2, 19
	addcs	r15, r15, r14
	sllis	r0, r5, 14
	sllics	r14, r2, 18
	addcs	r15, r15, r14
	sllis	r0, r5, 15
	sllics	r14, r2, 17
	addcs	r15, r15, r14
	sllis	r0, r5, 16
	sllics	r14, r2, 16
	addcs	r15, r15, r14
	sllis	r0, r5, 17
	sllics	r14, r2, 15
	addcs	r15, r15, r14
	sllis	r0, r5, 18
	sllics	r14, r2, 14
	addcs	r15, r15, r14
	sllis	r0, r5, 19
	sllics	r14, r2, 13
	addcs	r15, r15, r14
	sllis	r0, r5, 20
	sllics	r14, r2, 12
	addcs	r15, r15, r14
	sllis	r0, r5, 21
	sllics	r14, r2, 11
	addcs	r15, r15, r14
	sllis	r0, r5, 22
	sllics	r14, r2, 10
	addcs	r15, r15, r14
	sllis	r0, r5, 23
	sllics	r14, r2, 9
	addcs	r15, r15, r14
	sllis	r0, r5, 24
	sllics	r14, r2, 8
	addcs	r15, r15, r14
	sllis	r0, r5, 25
	sllics	r14, r2, 7
	addcs	r15, r15, r14
	sllis	r0, r5, 26
	sllics	r14, r2, 6
	addcs	r15, r15, r14
	sllis	r0, r5, 27
	sllics	r14, r2, 5
	addcs	r15, r15, r14
	sllis	r0, r5, 28
	sllics	r14, r2, 4
	addcs	r15, r15, r14
	sllis	r0, r5, 29
	sllics	r14, r2, 3
	addcs	r15, r15, r14
	sllis	r0, r5, 30
	sllics	r14, r2, 2
	addcs	r15, r15, r14
	sllis	r0, r5, 31
	sllics	r14, r2, 1
	addcs	r15, r15, r14
	sllis	r0, r5, 32
	sllics	r14, r2, 0
	addcs	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -7
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9633
	ldw	r6, r1, -6
	subis	r0, r6, 0
	jmpine	jmpeq_else.9635
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9636
jmpeq_else.9635:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9636:
	jmpi	jmple_cont.9634
jmple_else.9633:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9634:
	addi	r6, r0, 10000
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -8
	stw	r5, r1, -9
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	div_binary_search.2973
	addi	r1, r1, 10
	ldw	r31, r1, -10
	addi	r15, r0, 0
	slli	r14, r2, 4
	add	r15, r15, r14
	slli	r14, r2, 8
	add	r15, r15, r14
	slli	r14, r2, 9
	add	r15, r15, r14
	slli	r14, r2, 10
	add	r15, r15, r14
	slli	r14, r2, 13
	add	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -9
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9637
	ldw	r6, r1, -8
	subis	r0, r6, 0
	jmpine	jmpeq_else.9639
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9640
jmpeq_else.9639:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9640:
	jmpi	jmple_cont.9638
jmple_else.9637:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9638:
	addi	r6, r0, 1000
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -10
	stw	r5, r1, -11
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	div_binary_search.2973
	addi	r1, r1, 12
	ldw	r31, r1, -12
	addi	r15, r0, 0
	slli	r14, r2, 3
	add	r15, r15, r14
	slli	r14, r2, 5
	add	r15, r15, r14
	slli	r14, r2, 6
	add	r15, r15, r14
	slli	r14, r2, 7
	add	r15, r15, r14
	slli	r14, r2, 8
	add	r15, r15, r14
	slli	r14, r2, 9
	add	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -11
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9641
	ldw	r6, r1, -10
	subis	r0, r6, 0
	jmpine	jmpeq_else.9643
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9644
jmpeq_else.9643:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9644:
	jmpi	jmple_cont.9642
jmple_else.9641:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9642:
	addi	r6, r0, 100
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -12
	stw	r5, r1, -13
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	div_binary_search.2973
	addi	r1, r1, 14
	ldw	r31, r1, -14
	addi	r15, r0, 0
	slli	r14, r2, 2
	add	r15, r15, r14
	slli	r14, r2, 5
	add	r15, r15, r14
	slli	r14, r2, 6
	add	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -13
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9645
	ldw	r6, r1, -12
	subis	r0, r6, 0
	jmpine	jmpeq_else.9647
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9648
jmpeq_else.9647:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9648:
	jmpi	jmple_cont.9646
jmple_else.9645:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9646:
	addi	r6, r0, 10
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -14
	stw	r5, r1, -15
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	div_binary_search.2973
	addi	r1, r1, 16
	ldw	r31, r1, -16
	addi	r15, r0, 0
	slli	r14, r2, 1
	add	r15, r15, r14
	slli	r14, r2, 3
	add	r15, r15, r14
	addi	r5, r15, 0
	ldw	r6, r1, -15
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9649
	ldw	r6, r1, -14
	subis	r0, r6, 0
	jmpine	jmpeq_else.9651
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9652
jmpeq_else.9651:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9652:
	jmpi	jmple_cont.9650
jmple_else.9649:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9650:
	addi	r2, r5, 48
	prt1	r2
	jmp	r31
jmpge_else.9622:
	addi	r5, r0, 45
	prt1	r5
	sub	r2, r0, r2
	jmpi	print_int.3007
atan_sub.3144:
	addi	r14, r0, 16128	#r14 = 3f000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fsubs	f0, f4, f1
	jmpigt	jmple_else.9653
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fsub	f4, f1, f4
	fmul	f5, f1, f1
	fmul	f5, f5, f2
	fadd	f1, f1, f1
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f6, r14, r0
	fadd	f1, f1, f6
	fadd	f1, f1, f3
	finv	f31, f1, f0
	fmul	f3, f5, f31
	fmov	f1, f4
	jmpi	atan_sub.3144
jmple_else.9653:
	fmov	f1, f3
	jmp	r31
atan.3158:
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9654
	addi	r14, r0, -16512	#r14 = bf800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9656
	addi	r2, r0, 0
	jmpi	jmple_cont.9657
jmple_else.9656:
	addi	r2, r0, -1
jmple_cont.9657:
	jmpi	jmple_cont.9655
jmple_else.9654:
	addi	r2, r0, 1
jmple_cont.9655:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9658
	jmpi	jmpeq_cont.9659
jmpeq_else.9658:
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	finv	f31, f1, f0
	fmul	f1, f2, f31
jmpeq_cont.9659:
	addi	r14, r0, 16688	#r14 = 41300000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f3, f1, f1
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	stw	r2, r1, -1
	stf	f1, r1, -2
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	atan_sub.3144
	addi	r1, r1, 3
	ldw	r31, r1, -3
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fadd	f1, f2, f1
	ldf	f2, r1, -2
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r2, r1, -1
	subis	r0, r2, 0
	jmpigt	jmple_else.9660
	subis	r0, r2, 0
	jmpilt	jmpge_else.9661
	jmp	r31
jmpge_else.9661:
	addi	r14, r0, -16439	#r14 = bfc90fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsub	f1, f2, f1
	jmp	r31
jmple_else.9660:
	addi	r14, r0, 16329	#r14 = 3fc90fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsub	f1, f2, f1
	jmp	r31
tan_sub.3183:
	addi	r14, r0, 16416	#r14 = 40200000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fsubs	f0, f4, f1
	jmpigt	jmple_else.9662
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fsub	f4, f1, f4
	fsub	f1, f1, f3
	finv	f31, f1, f0
	fmul	f3, f2, f31
	fmov	f1, f4
	jmpi	tan_sub.3183
jmple_else.9662:
	fmov	f1, f3
	jmp	r31
tan.3181:
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	addi	r14, r0, 16656	#r14 = 41100000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	fmul	f4, f1, f1
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f5, r14, r0
	stf	f1, r1, -1
	stf	f2, r1, -2
	fmov	f2, f4
	fmov	f1, f3
	fmov	f3, f5
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	tan_sub.3183
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldf	f2, r1, -2
	fsub	f1, f2, f1
	ldf	f2, r1, -1
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmp	r31
sin_sub.3198:
	addi	r14, r0, 16585	#r14 = 40c90fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9663
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	fsubs	f0, f3, f1
	jmpigt	jmple_else.9664
	jmp	r31
jmple_else.9664:
	fadd	f1, f1, f2
	jmpi	sin_sub.3198
jmple_else.9663:
	fsub	f1, f1, f2
	jmpi	sin_sub.3198
sin.3205:
	addi	r14, r0, 16457	#r14 = 40490fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	addi	r14, r0, 16585	#r14 = 40c90fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f3, r14, r0
	addi	r14, r0, 16329	#r14 = 3fc90fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f4, r14, r0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f5, r14, r0
	fsubs	f0, f1, f5
	jmpigt	jmple_else.9665
	addi	r2, r0, 0
	jmpi	jmple_cont.9666
jmple_else.9665:
	addi	r2, r0, 1
jmple_cont.9666:
	stf	f4, r1, -1
	stf	f3, r1, -2
	stw	r2, r1, -3
	stf	f2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fabs.2776
	addi	r1, r1, 5
	ldw	r31, r1, -5
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	sin_sub.3198
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldf	f2, r1, -4
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9667
	ldw	r2, r1, -3
	jmpi	jmple_cont.9668
jmple_else.9667:
	ldw	r2, r1, -3
	subis	r0, r2, 0
	jmpine	jmpeq_else.9669
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9670
jmpeq_else.9669:
	addi	r2, r0, 0
jmpeq_cont.9670:
jmple_cont.9668:
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9671
	jmpi	jmple_cont.9672
jmple_else.9671:
	ldf	f3, r1, -2
	fsub	f1, f3, f1
jmple_cont.9672:
	ldf	f3, r1, -1
	fsubs	f0, f1, f3
	jmpigt	jmple_else.9673
	jmpi	jmple_cont.9674
jmple_else.9673:
	fsub	f1, f2, f1
jmple_cont.9674:
	addi	r14, r0, 16128	#r14 = 3f000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stw	r2, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	tan.3181
	addi	r1, r1, 6
	ldw	r31, r1, -6
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f2, f2, f1
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	fmul	f1, f1, f1
	fadd	f1, f3, f1
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r2, r1, -5
	subis	r0, r2, 0
	jmpine	jmpeq_else.9675
	jmpi	fneg.2781
jmpeq_else.9675:
	jmp	r31
cos.3230:
	addi	r14, r0, 16329	#r14 = 3fc90fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsub	f1, f2, f1
	jmpi	sin.3205
xor.3360:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9676
	addi	r2, r5, 0
	jmp	r31
jmpeq_else.9676:
	subis	r0, r5, 0
	jmpine	jmpeq_else.9677
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9677:
	addi	r2, r0, 0
	jmp	r31
sgn.3365:
	stf	f1, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	fiszero.2773
	addi	r1, r1, 2
	ldw	r31, r1, -2
	subis	r0, r2, 0
	jmpine	jmpeq_else.9678
	ldf	f1, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	fispos.2767
	addi	r1, r1, 2
	ldw	r31, r1, -2
	subis	r0, r2, 0
	jmpine	jmpeq_else.9679
	addi	r14, r0, -16512	#r14 = bf800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmp	r31
jmpeq_else.9679:
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmp	r31
jmpeq_else.9678:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmp	r31
fneg_cond.3371:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9680
	jmpi	fneg.2781
jmpeq_else.9680:
	jmp	r31
add_mod5.3375:
	add	r2, r2, r5
	subis	r0, r2, 5
	jmpilt	jmpge_else.9681
	subi	r2, r2, 5
	jmp	r31
jmpge_else.9681:
	jmp	r31
vecset.3381:
	stf	f1, r2, 0
	stf	f2, r2, 1
	stf	f3, r2, 2
	jmp	r31
vecfill.3391:
	stf	f1, r2, 0
	stf	f1, r2, 1
	stf	f1, r2, 2
	jmp	r31
vecbzero.3399:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmpi	vecfill.3391
veccpy.3402:
	ldf	f1, r5, 0
	stf	f1, r2, 0
	ldf	f1, r5, 1
	stf	f1, r2, 1
	ldf	f1, r5, 2
	stf	f1, r2, 2
	jmp	r31
vecunit_sgn.3468:
	ldf	f1, r2, 0
	stw	r5, r1, -1
	stw	r2, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	fsqr.2786
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	stf	f1, r1, -3
	fmov	f1, f2
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	fsqr.2786
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldf	f2, r1, -3
	fadd	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	stf	f1, r1, -4
	fmov	f1, f2
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fsqr.2786
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldf	f2, r1, -4
	fadd	f1, f2, f1
	fsqr	f1, f1
	stf	f1, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fiszero.2773
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 0
	jmpine	jmpeq_else.9685
	ldw	r2, r1, -1
	subis	r0, r2, 0
	jmpine	jmpeq_else.9687
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -5
	finv	f31, f2, f0
	fmul	f1, f1, f31
	jmpi	jmpeq_cont.9688
jmpeq_else.9687:
	addi	r14, r0, -16512	#r14 = bf800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -5
	finv	f31, f2, f0
	fmul	f1, f1, f31
jmpeq_cont.9688:
	jmpi	jmpeq_cont.9686
jmpeq_else.9685:
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9686:
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	fmul	f2, f2, f1
	stf	f2, r2, 0
	ldf	f2, r2, 1
	fmul	f2, f2, f1
	stf	f2, r2, 1
	ldf	f2, r2, 2
	fmul	f1, f2, f1
	stf	f1, r2, 2
	jmp	r31
veciprod.3503:
	ldf	f1, r2, 0
	ldf	f2, r5, 0
	fmul	f1, f1, f2
	ldf	f2, r2, 1
	ldf	f3, r5, 1
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldf	f2, r2, 2
	ldf	f3, r5, 2
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	jmp	r31
veciprod2.3522:
	ldf	f4, r2, 0
	fmul	f1, f4, f1
	ldf	f4, r2, 1
	fmul	f2, f4, f2
	fadd	f1, f1, f2
	ldf	f2, r2, 2
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	jmp	r31
vecaccum.3537:
	ldf	f2, r2, 0
	ldf	f3, r5, 0
	fmul	f3, f1, f3
	fadd	f2, f2, f3
	stf	f2, r2, 0
	ldf	f2, r2, 1
	ldf	f3, r5, 1
	fmul	f3, f1, f3
	fadd	f2, f2, f3
	stf	f2, r2, 1
	ldf	f2, r2, 2
	ldf	f3, r5, 2
	fmul	f1, f1, f3
	fadd	f1, f2, f1
	stf	f1, r2, 2
	jmp	r31
vecadd.3564:
	ldf	f1, r2, 0
	ldf	f2, r5, 0
	fadd	f1, f1, f2
	stf	f1, r2, 0
	ldf	f1, r2, 1
	ldf	f2, r5, 1
	fadd	f1, f1, f2
	stf	f1, r2, 1
	ldf	f1, r2, 2
	ldf	f2, r5, 2
	fadd	f1, f1, f2
	stf	f1, r2, 2
	jmp	r31
vecscale.3610:
	ldf	f2, r2, 0
	fmul	f2, f2, f1
	stf	f2, r2, 0
	ldf	f2, r2, 1
	fmul	f2, f2, f1
	stf	f2, r2, 1
	ldf	f2, r2, 2
	fmul	f1, f2, f1
	stf	f1, r2, 2
	jmp	r31
vecaccumv.3627:
	ldf	f1, r2, 0
	ldf	f2, r5, 0
	ldf	f3, r6, 0
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	stf	f1, r2, 0
	ldf	f1, r2, 1
	ldf	f2, r5, 1
	ldf	f3, r6, 1
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	stf	f1, r2, 1
	ldf	f1, r2, 2
	ldf	f2, r5, 2
	ldf	f3, r6, 2
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	stf	f1, r2, 2
	jmp	r31
o_texturetype.3660:
	ldw	r2, r2, 0
	jmp	r31
o_form.3673:
	ldw	r2, r2, 1
	jmp	r31
o_reflectiontype.3686:
	ldw	r2, r2, 2
	jmp	r31
o_isinvert.3699:
	ldw	r2, r2, 6
	jmp	r31
o_isrot.3712:
	ldw	r2, r2, 3
	jmp	r31
o_param_a.3725:
	ldw	r2, r2, 4
	ldf	f1, r2, 0
	jmp	r31
o_param_b.3739:
	ldw	r2, r2, 4
	ldf	f1, r2, 1
	jmp	r31
o_param_c.3753:
	ldw	r2, r2, 4
	ldf	f1, r2, 2
	jmp	r31
o_param_abc.3767:
	ldw	r2, r2, 4
	jmp	r31
o_param_x.3780:
	ldw	r2, r2, 5
	ldf	f1, r2, 0
	jmp	r31
o_param_y.3794:
	ldw	r2, r2, 5
	ldf	f1, r2, 1
	jmp	r31
o_param_z.3808:
	ldw	r2, r2, 5
	ldf	f1, r2, 2
	jmp	r31
o_diffuse.3822:
	ldw	r2, r2, 7
	ldf	f1, r2, 0
	jmp	r31
o_hilight.3836:
	ldw	r2, r2, 7
	ldf	f1, r2, 1
	jmp	r31
o_color_red.3850:
	ldw	r2, r2, 8
	ldf	f1, r2, 0
	jmp	r31
o_color_green.3864:
	ldw	r2, r2, 8
	ldf	f1, r2, 1
	jmp	r31
o_color_blue.3878:
	ldw	r2, r2, 8
	ldf	f1, r2, 2
	jmp	r31
o_param_r1.3892:
	ldw	r2, r2, 9
	ldf	f1, r2, 0
	jmp	r31
o_param_r2.3906:
	ldw	r2, r2, 9
	ldf	f1, r2, 1
	jmp	r31
o_param_r3.3920:
	ldw	r2, r2, 9
	ldf	f1, r2, 2
	jmp	r31
o_param_ctbl.3934:
	ldw	r2, r2, 10
	jmp	r31
p_rgb.3947:
	ldw	r2, r2, 0
	jmp	r31
p_intersection_points.3957:
	ldw	r2, r2, 1
	jmp	r31
p_surface_ids.3967:
	ldw	r2, r2, 2
	jmp	r31
p_calc_diffuse.3977:
	ldw	r2, r2, 3
	jmp	r31
p_energy.3987:
	ldw	r2, r2, 4
	jmp	r31
p_received_ray_20percent.3997:
	ldw	r2, r2, 5
	jmp	r31
p_group_id.4007:
	ldw	r2, r2, 6
	ldw	r2, r2, 0
	jmp	r31
p_set_group_id.4018:
	ldw	r2, r2, 6
	stw	r5, r2, 0
	jmp	r31
p_nvectors.4030:
	ldw	r2, r2, 7
	jmp	r31
d_vec.4040:
	ldw	r2, r2, 0
	jmp	r31
d_const.4044:
	ldw	r2, r2, 1
	jmp	r31
r_surface_id.4048:
	ldw	r2, r2, 0
	jmp	r31
r_dvec.4053:
	ldw	r2, r2, 1
	jmp	r31
r_bright.4058:
	ldf	f1, r2, 2
	jmp	r31
rad.4063:
	addi	r14, r0, 15502	#r14 = 3c8efa35
	slli	r14, r14, 16
	addi	r14, r14, 31285
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	fmul	f1, f1, f2
	jmp	r31
read_screen_settings.4066:
	ldw	r2, r30, 6
	ldw	r5, r30, 5
	ldw	r6, r30, 4
	ldw	r7, r30, 3
	ldw	r8, r30, 2
	ldw	r30, r30, 1
	stw	r2, r1, -1
	stw	r6, r1, -2
	stw	r7, r1, -3
	stw	r5, r1, -4
	stw	r30, r1, -5
	stw	r8, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -6
	stf	f1, r2, 0
	ldw	r30, r1, -5
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -6
	stf	f1, r2, 1
	ldw	r30, r1, -5
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -6
	stf	f1, r2, 2
	ldw	r30, r1, -5
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	rad.4063
	addi	r1, r1, 7
	ldw	r31, r1, -7
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	cos.3230
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	stf	f1, r1, -8
	fmov	f1, f2
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	sin.3205
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r30, r1, -5
	stf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 10
	ldw	r31, r1, -10
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	rad.4063
	addi	r1, r1, 10
	ldw	r31, r1, -10
	stf	f1, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	cos.3230
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -10
	stf	f1, r1, -11
	fmov	f1, f2
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	sin.3205
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldf	f2, r1, -8
	fmul	f3, f2, f1
	addi	r14, r0, 17224	#r14 = 43480000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fmul	f3, f3, f4
	ldw	r2, r1, -4
	stf	f3, r2, 0
	addi	r14, r0, -15544	#r14 = c3480000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldf	f4, r1, -9
	fmul	f3, f4, f3
	stf	f3, r2, 1
	ldf	f3, r1, -11
	fmul	f5, f2, f3
	addi	r14, r0, 17224	#r14 = 43480000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f6, r14, r0
	fmul	f5, f5, f6
	stf	f5, r2, 2
	ldw	r5, r1, -3
	stf	f3, r5, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f5, r14, r0
	stf	f5, r5, 1
	stf	f1, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fneg.2781
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r2, r1, -3
	stf	f1, r2, 2
	ldf	f1, r1, -9
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fneg.2781
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -12
	fmul	f1, f1, f2
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldf	f1, r1, -8
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fneg.2781
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldf	f1, r1, -9
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fneg.2781
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -11
	fmul	f1, f1, f2
	ldw	r2, r1, -2
	stf	f1, r2, 2
	ldw	r2, r1, -6
	ldf	f1, r2, 0
	ldw	r5, r1, -4
	ldf	f2, r5, 0
	fsub	f1, f1, f2
	ldw	r6, r1, -1
	stf	f1, r6, 0
	ldf	f1, r2, 1
	ldf	f2, r5, 1
	fsub	f1, f1, f2
	stf	f1, r6, 1
	ldf	f1, r2, 2
	ldf	f2, r5, 2
	fsub	f1, f1, f2
	stf	f1, r6, 2
	jmp	r31
read_light.4143:
	ldw	r2, r30, 4
	ldw	r5, r30, 3
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	stw	r7, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	addi	r30, r2, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r30, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	rad.4063
	addi	r1, r1, 4
	ldw	r31, r1, -4
	stf	f1, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	sin.3205
	addi	r1, r1, 5
	ldw	r31, r1, -5
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fneg.2781
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	rad.4063
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldf	f2, r1, -4
	stf	f1, r1, -5
	fmov	f1, f2
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	cos.3230
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f2, r1, -5
	stf	f1, r1, -6
	fmov	f1, f2
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	sin.3205
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f2, r1, -6
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldf	f1, r1, -5
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	cos.3230
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f2, r1, -6
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r2, 2
	ldw	r30, r1, -3
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -1
	stf	f1, r2, 0
	jmp	r31
rotate_quadratic_matrix.4169:
	ldf	f1, r5, 0
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	cos.3230
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	stf	f1, r1, -3
	fmov	f1, f2
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	sin.3205
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	stf	f1, r1, -4
	fmov	f1, f2
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	cos.3230
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	stf	f1, r1, -5
	fmov	f1, f2
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	sin.3205
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	stf	f1, r1, -6
	fmov	f1, f2
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	cos.3230
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	stf	f1, r1, -7
	fmov	f1, f2
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	sin.3205
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -5
	ldf	f3, r1, -7
	fmul	f4, f2, f3
	ldf	f5, r1, -4
	ldf	f6, r1, -6
	fmul	f7, f5, f6
	fmul	f7, f7, f3
	ldf	f8, r1, -3
	fmul	f9, f8, f1
	fsub	f7, f7, f9
	fmul	f9, f8, f6
	fmul	f9, f9, f3
	fmul	f10, f5, f1
	fadd	f9, f9, f10
	fmul	f10, f2, f1
	fmul	f11, f5, f6
	fmul	f11, f11, f1
	fmul	f12, f8, f3
	fadd	f11, f11, f12
	fmul	f12, f8, f6
	fmul	f1, f12, f1
	fmul	f3, f5, f3
	fsub	f1, f1, f3
	stf	f1, r1, -8
	stf	f9, r1, -9
	stf	f11, r1, -10
	stf	f7, r1, -11
	stf	f10, r1, -12
	stf	f4, r1, -13
	fmov	f1, f6
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	fneg.2781
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -4
	ldf	f3, r1, -5
	fmul	f2, f2, f3
	ldf	f4, r1, -3
	fmul	f3, f4, f3
	ldw	r2, r1, -1
	ldf	f4, r2, 0
	ldf	f5, r2, 1
	ldf	f6, r2, 2
	ldf	f7, r1, -13
	stf	f3, r1, -14
	stf	f2, r1, -15
	stf	f6, r1, -16
	stf	f1, r1, -17
	stf	f5, r1, -18
	stf	f4, r1, -19
	fmov	f1, f7
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	fsqr.2786
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldf	f3, r1, -12
	stf	f1, r1, -20
	fmov	f1, f3
	stw	r31, r1, -21
	addi	r1, r1, -21
	cali	fsqr.2786
	addi	r1, r1, 21
	ldw	r31, r1, -21
	ldf	f2, r1, -18
	fmul	f1, f2, f1
	ldf	f3, r1, -20
	fadd	f1, f3, f1
	ldf	f3, r1, -17
	stf	f1, r1, -21
	fmov	f1, f3
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	fsqr.2786
	addi	r1, r1, 22
	ldw	r31, r1, -22
	ldf	f2, r1, -16
	fmul	f1, f2, f1
	ldf	f3, r1, -21
	fadd	f1, f3, f1
	ldw	r2, r1, -1
	stf	f1, r2, 0
	ldf	f1, r1, -11
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	fsqr.2786
	addi	r1, r1, 22
	ldw	r31, r1, -22
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldf	f3, r1, -10
	stf	f1, r1, -22
	fmov	f1, f3
	stw	r31, r1, -23
	addi	r1, r1, -23
	cali	fsqr.2786
	addi	r1, r1, 23
	ldw	r31, r1, -23
	ldf	f2, r1, -18
	fmul	f1, f2, f1
	ldf	f3, r1, -22
	fadd	f1, f3, f1
	ldf	f3, r1, -15
	stf	f1, r1, -23
	fmov	f1, f3
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	fsqr.2786
	addi	r1, r1, 24
	ldw	r31, r1, -24
	ldf	f2, r1, -16
	fmul	f1, f2, f1
	ldf	f3, r1, -23
	fadd	f1, f3, f1
	ldw	r2, r1, -1
	stf	f1, r2, 1
	ldf	f1, r1, -9
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	fsqr.2786
	addi	r1, r1, 24
	ldw	r31, r1, -24
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldf	f3, r1, -8
	stf	f1, r1, -24
	fmov	f1, f3
	stw	r31, r1, -25
	addi	r1, r1, -25
	cali	fsqr.2786
	addi	r1, r1, 25
	ldw	r31, r1, -25
	ldf	f2, r1, -18
	fmul	f1, f2, f1
	ldf	f3, r1, -24
	fadd	f1, f3, f1
	ldf	f3, r1, -14
	stf	f1, r1, -25
	fmov	f1, f3
	stw	r31, r1, -26
	addi	r1, r1, -26
	cali	fsqr.2786
	addi	r1, r1, 26
	ldw	r31, r1, -26
	ldf	f2, r1, -16
	fmul	f1, f2, f1
	ldf	f3, r1, -25
	fadd	f1, f3, f1
	ldw	r2, r1, -1
	stf	f1, r2, 2
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f3, r1, -19
	ldf	f4, r1, -11
	fmul	f5, f3, f4
	ldf	f6, r1, -9
	fmul	f5, f5, f6
	ldf	f7, r1, -18
	ldf	f8, r1, -10
	fmul	f9, f7, f8
	ldf	f10, r1, -8
	fmul	f9, f9, f10
	fadd	f5, f5, f9
	ldf	f9, r1, -15
	fmul	f11, f2, f9
	ldf	f12, r1, -14
	fmul	f11, f11, f12
	fadd	f5, f5, f11
	fmul	f1, f1, f5
	ldw	r2, r1, -2
	stf	f1, r2, 0
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f5, r1, -13
	fmul	f11, f3, f5
	fmul	f6, f11, f6
	ldf	f11, r1, -12
	fmul	f13, f7, f11
	fmul	f10, f13, f10
	fadd	f6, f6, f10
	ldf	f10, r1, -17
	fmul	f13, f2, f10
	fmul	f12, f13, f12
	fadd	f6, f6, f12
	fmul	f1, f1, f6
	stf	f1, r2, 1
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	fmul	f3, f3, f5
	fmul	f3, f3, f4
	fmul	f4, f7, f11
	fmul	f4, f4, f8
	fadd	f3, f3, f4
	fmul	f2, f2, f10
	fmul	f2, f2, f9
	fadd	f2, f3, f2
	fmul	f1, f1, f2
	stf	f1, r2, 2
	jmp	r31
read_nth_object.4282:
	ldw	r5, r30, 3
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	stw	r7, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stw	r5, r1, -4
	addi	r30, r5, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
	subis	r0, r2, -1
	jmpine	jmpeq_else.9698
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9698:
	ldw	r30, r1, -4
	stw	r2, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r30, r1, -4
	stw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r30, r1, -4
	stw	r2, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 8
	ldw	r31, r1, -8
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	external_create_float_array
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r30, r1, -3
	stw	r2, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -9
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r31, r1, -10
	addi	r1, r1, -10
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -9
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r31, r1, -10
	addi	r1, r1, -10
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -9
	stf	f1, r2, 2
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	external_create_float_array
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r30, r1, -3
	stw	r2, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r2, r1, -10
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r2, r1, -10
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r2, r1, -10
	stf	f1, r2, 2
	ldw	r30, r1, -3
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	fisneg.2770
	addi	r1, r1, 11
	ldw	r31, r1, -11
	addi	r5, r0, 2
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -11
	addi	r2, r5, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	external_create_float_array
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r30, r1, -3
	stw	r2, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r2, r1, -12
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r31, r1, -13
	addi	r1, r1, -13
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r2, r1, -12
	stf	f1, r2, 1
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r2, r5, 0
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	external_create_float_array
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r30, r1, -3
	stw	r2, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r2, r1, -13
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r31, r1, -14
	addi	r1, r1, -14
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r2, r1, -13
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r31, r1, -14
	addi	r1, r1, -14
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r2, r1, -13
	stf	f1, r2, 2
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r2, r5, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	external_create_float_array
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r5, r1, -8
	subis	r0, r5, 0
	jmpine	jmpeq_else.9699
	jmpi	jmpeq_cont.9700
jmpeq_else.9699:
	ldw	r30, r1, -3
	stw	r2, r1, -14
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	rad.4063
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldw	r2, r1, -14
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	rad.4063
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldw	r2, r1, -14
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	rad.4063
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldw	r2, r1, -14
	stf	f1, r2, 2
jmpeq_cont.9700:
	ldw	r5, r1, -6
	subis	r0, r5, 2
	jmpine	jmpeq_else.9701
	addi	r6, r0, 1
	jmpi	jmpeq_cont.9702
jmpeq_else.9701:
	ldw	r6, r1, -11
jmpeq_cont.9702:
	addi	r7, r0, 4
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r6, r1, -15
	stw	r2, r1, -14
	addi	r2, r7, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	external_create_float_array
	addi	r1, r1, 16
	ldw	r31, r1, -16
	addi	r5, r4, 0
	addi	r4, r4, 11
	stw	r2, r5, 10
	ldw	r2, r1, -14
	stw	r2, r5, 9
	ldw	r6, r1, -13
	stw	r6, r5, 8
	ldw	r6, r1, -12
	stw	r6, r5, 7
	ldw	r6, r1, -15
	stw	r6, r5, 6
	ldw	r6, r1, -10
	stw	r6, r5, 5
	ldw	r6, r1, -9
	stw	r6, r5, 4
	ldw	r7, r1, -8
	stw	r7, r5, 3
	ldw	r8, r1, -7
	stw	r8, r5, 2
	ldw	r8, r1, -6
	stw	r8, r5, 1
	ldw	r9, r1, -5
	stw	r9, r5, 0
	ldw	r9, r1, -2
	slli	r9, r9, 0
	ldw	r10, r1, -1
	add	r14, r10, r9
	stw	r5, r14, 0
	subis	r0, r8, 3
	jmpine	jmpeq_else.9703
	ldf	f1, r6, 0
	stf	f1, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	fiszero.2773
	addi	r1, r1, 17
	ldw	r31, r1, -17
	subis	r0, r2, 0
	jmpine	jmpeq_else.9705
	ldf	f1, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	sgn.3365
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -16
	stf	f1, r1, -17
	fmov	f1, f2
	stw	r31, r1, -18
	addi	r1, r1, -18
	cali	fsqr.2786
	addi	r1, r1, 18
	ldw	r31, r1, -18
	ldf	f2, r1, -17
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmpi	jmpeq_cont.9706
jmpeq_else.9705:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9706:
	ldw	r2, r1, -9
	stf	f1, r2, 0
	ldf	f1, r2, 1
	stf	f1, r1, -18
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	fiszero.2773
	addi	r1, r1, 19
	ldw	r31, r1, -19
	subis	r0, r2, 0
	jmpine	jmpeq_else.9707
	ldf	f1, r1, -18
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	sgn.3365
	addi	r1, r1, 19
	ldw	r31, r1, -19
	ldf	f2, r1, -18
	stf	f1, r1, -19
	fmov	f1, f2
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	fsqr.2786
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldf	f2, r1, -19
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmpi	jmpeq_cont.9708
jmpeq_else.9707:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9708:
	ldw	r2, r1, -9
	stf	f1, r2, 1
	ldf	f1, r2, 2
	stf	f1, r1, -20
	stw	r31, r1, -21
	addi	r1, r1, -21
	cali	fiszero.2773
	addi	r1, r1, 21
	ldw	r31, r1, -21
	subis	r0, r2, 0
	jmpine	jmpeq_else.9709
	ldf	f1, r1, -20
	stw	r31, r1, -21
	addi	r1, r1, -21
	cali	sgn.3365
	addi	r1, r1, 21
	ldw	r31, r1, -21
	ldf	f2, r1, -20
	stf	f1, r1, -21
	fmov	f1, f2
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	fsqr.2786
	addi	r1, r1, 22
	ldw	r31, r1, -22
	ldf	f2, r1, -21
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmpi	jmpeq_cont.9710
jmpeq_else.9709:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9710:
	ldw	r2, r1, -9
	stf	f1, r2, 2
	jmpi	jmpeq_cont.9704
jmpeq_else.9703:
	subis	r0, r8, 2
	jmpine	jmpeq_else.9711
	ldw	r5, r1, -11
	subis	r0, r5, 0
	jmpine	jmpeq_else.9713
	addi	r5, r0, 1
	jmpi	jmpeq_cont.9714
jmpeq_else.9713:
	addi	r5, r0, 0
jmpeq_cont.9714:
	addi	r2, r6, 0
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	vecunit_sgn.3468
	addi	r1, r1, 22
	ldw	r31, r1, -22
	jmpi	jmpeq_cont.9712
jmpeq_else.9711:
jmpeq_cont.9712:
jmpeq_cont.9704:
	ldw	r2, r1, -8
	subis	r0, r2, 0
	jmpine	jmpeq_else.9715
	jmpi	jmpeq_cont.9716
jmpeq_else.9715:
	ldw	r2, r1, -9
	ldw	r5, r1, -14
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	rotate_quadratic_matrix.4169
	addi	r1, r1, 22
	ldw	r31, r1, -22
jmpeq_cont.9716:
	addi	r2, r0, 1
	jmp	r31
read_object.4412:
	ldw	r5, r30, 2
	ldw	r6, r30, 1
	subis	r0, r2, 60
	jmpilt	jmpge_else.9717
	jmp	r31
jmpge_else.9717:
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	addi	r30, r5, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	subis	r0, r2, 0
	jmpine	jmpeq_else.9719
	ldw	r2, r1, -3
	ldw	r5, r1, -2
	stw	r2, r5, 0
	jmp	r31
jmpeq_else.9719:
	ldw	r2, r1, -3
	addi	r2, r2, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
read_all_object.4420:
	ldw	r30, r30, 1
	addi	r2, r0, 0
	ldw	r29, r30, 0
	jmp	r29
read_net_item.4423:
	ldw	r5, r30, 1
	stw	r30, r1, -1
	stw	r2, r1, -2
	addi	r30, r5, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 3
	ldw	r31, r1, -3
	subis	r0, r2, -1
	jmpine	jmpeq_else.9721
	ldw	r2, r1, -2
	addi	r2, r2, 1
	addi	r5, r0, -1
	jmpi	external_create_array
jmpeq_else.9721:
	ldw	r5, r1, -2
	addi	r6, r5, 1
	ldw	r30, r1, -1
	stw	r2, r1, -3
	addi	r2, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -2
	slli	r5, r5, 0
	ldw	r6, r1, -3
	add	r14, r2, r5
	stw	r6, r14, 0
	jmp	r31
read_or_network.4437:
	ldw	r5, r30, 1
	addi	r6, r0, 0
	stw	r30, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	addi	r30, r5, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 3
	ldw	r31, r1, -3
	mov	r5, r2
	ldw	r2, r5, 0
	subis	r0, r2, -1
	jmpine	jmpeq_else.9722
	ldw	r2, r1, -2
	addi	r2, r2, 1
	jmpi	external_create_array
jmpeq_else.9722:
	ldw	r2, r1, -2
	addi	r6, r2, 1
	ldw	r30, r1, -1
	stw	r5, r1, -3
	addi	r2, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -2
	slli	r5, r5, 0
	ldw	r6, r1, -3
	add	r14, r2, r5
	stw	r6, r14, 0
	jmp	r31
read_and_network.4451:
	ldw	r5, r30, 2
	ldw	r6, r30, 1
	addi	r7, r0, 0
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	addi	r2, r7, 0
	addi	r30, r5, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r2, 0
	subis	r0, r5, -1
	jmpine	jmpeq_else.9723
	jmp	r31
jmpeq_else.9723:
	ldw	r5, r1, -3
	slli	r6, r5, 0
	ldw	r7, r1, -2
	add	r14, r7, r6
	stw	r2, r14, 0
	addi	r2, r5, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
read_parameter.4462:
	ldw	r2, r30, 6
	ldw	r5, r30, 5
	ldw	r6, r30, 4
	ldw	r7, r30, 3
	ldw	r8, r30, 2
	ldw	r9, r30, 1
	stw	r9, r1, -1
	stw	r5, r1, -2
	stw	r7, r1, -3
	stw	r8, r1, -4
	stw	r6, r1, -5
	addi	r30, r2, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r30, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r30, r1, -4
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	addi	r2, r0, 0
	ldw	r30, r1, -3
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	addi	r2, r0, 0
	ldw	r30, r1, -2
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r5, r1, -1
	stw	r2, r5, 0
	jmp	r31
solver_rect_surface.4475:
	ldw	r9, r30, 1
	slli	r10, r6, 0
	add	r14, r5, r10
	ldf	f4, r14, 0
	stw	r9, r1, -1
	stf	f3, r1, -2
	stw	r8, r1, -3
	stf	f2, r1, -4
	stw	r7, r1, -5
	stf	f1, r1, -6
	stw	r5, r1, -7
	stw	r6, r1, -8
	stw	r2, r1, -9
	fmov	f1, f4
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fiszero.2773
	addi	r1, r1, 10
	ldw	r31, r1, -10
	subis	r0, r2, 0
	jmpine	jmpeq_else.9726
	ldw	r2, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_abc.3767
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r5, r1, -9
	stw	r2, r1, -10
	addi	r2, r5, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_isinvert.3699
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r5, r1, -8
	slli	r6, r5, 0
	ldw	r7, r1, -7
	add	r14, r7, r6
	ldf	f1, r14, 0
	stw	r2, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	fisneg.2770
	addi	r1, r1, 12
	ldw	r31, r1, -12
	mov	r5, r2
	ldw	r2, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	xor.3360
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r5, r1, -8
	slli	r6, r5, 0
	ldw	r7, r1, -10
	add	r14, r7, r6
	ldf	f1, r14, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	fneg_cond.3371
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldf	f2, r1, -6
	fsub	f1, f1, f2
	ldw	r2, r1, -8
	slli	r2, r2, 0
	ldw	r5, r1, -7
	add	r14, r5, r2
	ldf	f2, r14, 0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -5
	slli	r6, r2, 0
	add	r14, r5, r6
	ldf	f2, r14, 0
	fmul	f2, f1, f2
	ldf	f3, r1, -4
	fadd	f2, f2, f3
	stf	f1, r1, -12
	fmov	f1, f2
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fabs.2776
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r2, r1, -5
	slli	r2, r2, 0
	ldw	r5, r1, -10
	add	r14, r5, r2
	ldf	f2, r14, 0
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fless.2764
	addi	r1, r1, 13
	ldw	r31, r1, -13
	subis	r0, r2, 0
	jmpine	jmpeq_else.9727
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9727:
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -7
	add	r14, r6, r5
	ldf	f1, r14, 0
	ldf	f2, r1, -12
	fmul	f1, f2, f1
	ldf	f3, r1, -2
	fadd	f1, f1, f3
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fabs.2776
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r2, r1, -3
	slli	r2, r2, 0
	ldw	r5, r1, -10
	add	r14, r5, r2
	ldf	f2, r14, 0
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fless.2764
	addi	r1, r1, 13
	ldw	r31, r1, -13
	subis	r0, r2, 0
	jmpine	jmpeq_else.9728
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9728:
	ldf	f1, r1, -12
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9726:
	addi	r2, r0, 0
	jmp	r31
solver_rect.4513:
	ldw	r30, r30, 1
	addi	r6, r0, 0
	addi	r7, r0, 1
	addi	r8, r0, 2
	stf	f1, r1, -1
	stf	f3, r1, -2
	stf	f2, r1, -3
	stw	r5, r1, -4
	stw	r2, r1, -5
	stw	r30, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9729
	addi	r6, r0, 1
	addi	r7, r0, 2
	addi	r8, r0, 0
	ldw	r2, r1, -5
	ldw	r5, r1, -4
	ldf	f1, r1, -3
	ldf	f2, r1, -2
	ldf	f3, r1, -1
	ldw	r30, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9730
	addi	r6, r0, 2
	addi	r7, r0, 0
	addi	r8, r0, 1
	ldw	r2, r1, -5
	ldw	r5, r1, -4
	ldf	f1, r1, -2
	ldf	f2, r1, -1
	ldf	f3, r1, -3
	ldw	r30, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9731
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9731:
	addi	r2, r0, 3
	jmp	r31
jmpeq_else.9730:
	addi	r2, r0, 2
	jmp	r31
jmpeq_else.9729:
	addi	r2, r0, 1
	jmp	r31
solver_surface.4534:
	ldw	r6, r30, 1
	stw	r6, r1, -1
	stf	f3, r1, -2
	stf	f2, r1, -3
	stf	f1, r1, -4
	stw	r5, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_param_abc.3767
	addi	r1, r1, 6
	ldw	r31, r1, -6
	mov	r5, r2
	ldw	r2, r1, -5
	stw	r5, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	veciprod.3503
	addi	r1, r1, 7
	ldw	r31, r1, -7
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fispos.2767
	addi	r1, r1, 8
	ldw	r31, r1, -8
	subis	r0, r2, 0
	jmpine	jmpeq_else.9732
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9732:
	ldw	r2, r1, -6
	ldf	f1, r1, -4
	ldf	f2, r1, -3
	ldf	f3, r1, -2
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	veciprod2.3522
	addi	r1, r1, 8
	ldw	r31, r1, -8
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fneg.2781
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
quadratic.4549:
	stf	f1, r1, -1
	stf	f3, r1, -2
	stf	f2, r1, -3
	stw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fsqr.2786
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -4
	stf	f1, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_param_a.3725
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f2, r1, -5
	fmul	f1, f2, f1
	ldf	f2, r1, -3
	stf	f1, r1, -6
	fmov	f1, f2
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	fsqr.2786
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -4
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_param_b.3739
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldf	f2, r1, -6
	fadd	f1, f2, f1
	ldf	f2, r1, -2
	stf	f1, r1, -8
	fmov	f1, f2
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	fsqr.2786
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r2, r1, -4
	stf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_c.3753
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldf	f2, r1, -8
	fadd	f1, f2, f1
	ldw	r2, r1, -4
	stf	f1, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_isrot.3712
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9733
	ldf	f1, r1, -10
	jmp	r31
jmpeq_else.9733:
	ldf	f1, r1, -3
	ldf	f2, r1, -2
	fmul	f3, f1, f2
	ldw	r2, r1, -4
	stf	f3, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	o_param_r1.3892
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	ldf	f2, r1, -10
	fadd	f1, f2, f1
	ldf	f2, r1, -2
	ldf	f3, r1, -1
	fmul	f2, f2, f3
	ldw	r2, r1, -4
	stf	f1, r1, -12
	stf	f2, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	o_param_r2.3906
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -13
	fmul	f1, f2, f1
	ldf	f2, r1, -12
	fadd	f1, f2, f1
	ldf	f2, r1, -1
	ldf	f3, r1, -3
	fmul	f2, f2, f3
	ldw	r2, r1, -4
	stf	f1, r1, -14
	stf	f2, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	o_param_r3.3920
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldf	f2, r1, -15
	fmul	f1, f2, f1
	ldf	f2, r1, -14
	fadd	f1, f2, f1
	jmp	r31
bilinear.4578:
	fmul	f7, f1, f4
	stf	f4, r1, -1
	stf	f1, r1, -2
	stf	f6, r1, -3
	stf	f3, r1, -4
	stw	r2, r1, -5
	stf	f5, r1, -6
	stf	f2, r1, -7
	stf	f7, r1, -8
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	o_param_a.3725
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldf	f2, r1, -8
	fmul	f1, f2, f1
	ldf	f2, r1, -7
	ldf	f3, r1, -6
	fmul	f4, f2, f3
	ldw	r2, r1, -5
	stf	f1, r1, -9
	stf	f4, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_param_b.3739
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -10
	fmul	f1, f2, f1
	ldf	f2, r1, -9
	fadd	f1, f2, f1
	ldf	f2, r1, -4
	ldf	f3, r1, -3
	fmul	f4, f2, f3
	ldw	r2, r1, -5
	stf	f1, r1, -11
	stf	f4, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_param_c.3753
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -12
	fmul	f1, f2, f1
	ldf	f2, r1, -11
	fadd	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	o_isrot.3712
	addi	r1, r1, 14
	ldw	r31, r1, -14
	subis	r0, r2, 0
	jmpine	jmpeq_else.9734
	ldf	f1, r1, -13
	jmp	r31
jmpeq_else.9734:
	ldf	f1, r1, -4
	ldf	f2, r1, -6
	fmul	f3, f1, f2
	ldf	f4, r1, -7
	ldf	f5, r1, -3
	fmul	f6, f4, f5
	fadd	f3, f3, f6
	ldw	r2, r1, -5
	stf	f3, r1, -14
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	o_param_r1.3892
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -14
	fmul	f1, f2, f1
	ldf	f2, r1, -2
	ldf	f3, r1, -3
	fmul	f3, f2, f3
	ldf	f4, r1, -4
	ldf	f5, r1, -1
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	ldw	r2, r1, -5
	stf	f1, r1, -15
	stf	f3, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	o_param_r2.3906
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -16
	fmul	f1, f2, f1
	ldf	f2, r1, -15
	fadd	f1, f2, f1
	ldf	f2, r1, -2
	ldf	f3, r1, -6
	fmul	f2, f2, f3
	ldf	f3, r1, -7
	ldf	f4, r1, -1
	fmul	f3, f3, f4
	fadd	f2, f2, f3
	ldw	r2, r1, -5
	stf	f1, r1, -17
	stf	f2, r1, -18
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	o_param_r3.3920
	addi	r1, r1, 19
	ldw	r31, r1, -19
	ldf	f2, r1, -18
	fmul	f1, f2, f1
	ldf	f2, r1, -17
	fadd	f1, f2, f1
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	fhalf.2783
	addi	r1, r1, 19
	ldw	r31, r1, -19
	ldf	f2, r1, -13
	fadd	f1, f2, f1
	jmp	r31
solver_second.4617:
	ldw	r6, r30, 1
	ldf	f4, r5, 0
	ldf	f5, r5, 1
	ldf	f6, r5, 2
	stw	r6, r1, -1
	stf	f3, r1, -2
	stf	f2, r1, -3
	stf	f1, r1, -4
	stw	r2, r1, -5
	stw	r5, r1, -6
	fmov	f3, f6
	fmov	f2, f5
	fmov	f1, f4
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	quadratic.4549
	addi	r1, r1, 7
	ldw	r31, r1, -7
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fiszero.2773
	addi	r1, r1, 8
	ldw	r31, r1, -8
	subis	r0, r2, 0
	jmpine	jmpeq_else.9735
	ldw	r2, r1, -6
	ldf	f1, r2, 0
	ldf	f2, r2, 1
	ldf	f3, r2, 2
	ldw	r2, r1, -5
	ldf	f4, r1, -4
	ldf	f5, r1, -3
	ldf	f6, r1, -2
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	bilinear.4578
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r2, r1, -5
	ldf	f2, r1, -4
	ldf	f3, r1, -3
	ldf	f4, r1, -2
	stf	f1, r1, -8
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	quadratic.4549
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r2, r1, -5
	stf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_form.3673
	addi	r1, r1, 10
	ldw	r31, r1, -10
	subis	r0, r2, 3
	jmpine	jmpeq_else.9736
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	jmpi	jmpeq_cont.9737
jmpeq_else.9736:
	ldf	f1, r1, -9
jmpeq_cont.9737:
	ldf	f2, r1, -8
	stf	f1, r1, -10
	fmov	f1, f2
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	fsqr.2786
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -7
	ldf	f3, r1, -10
	fmul	f3, f2, f3
	fsub	f1, f1, f3
	stf	f1, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	fispos.2767
	addi	r1, r1, 12
	ldw	r31, r1, -12
	subis	r0, r2, 0
	jmpine	jmpeq_else.9738
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9738:
	ldf	f1, r1, -11
	fsqr	f1, f1
	ldw	r2, r1, -5
	stf	f1, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_isinvert.3699
	addi	r1, r1, 13
	ldw	r31, r1, -13
	subis	r0, r2, 0
	jmpine	jmpeq_else.9739
	ldf	f1, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fneg.2781
	addi	r1, r1, 13
	ldw	r31, r1, -13
	jmpi	jmpeq_cont.9740
jmpeq_else.9739:
	ldf	f1, r1, -12
jmpeq_cont.9740:
	ldf	f2, r1, -8
	fsub	f1, f1, f2
	ldf	f2, r1, -7
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9735:
	addi	r2, r0, 0
	jmp	r31
solver.4657:
	ldw	r7, r30, 4
	ldw	r8, r30, 3
	ldw	r9, r30, 2
	ldw	r10, r30, 1
	slli	r2, r2, 0
	add	r14, r10, r2
	ldw	r2, r14, 0
	ldf	f1, r6, 0
	stw	r8, r1, -1
	stw	r7, r1, -2
	stw	r5, r1, -3
	stw	r9, r1, -4
	stw	r2, r1, -5
	stw	r6, r1, -6
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_param_x.3780
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -6
	ldf	f2, r2, 1
	ldw	r5, r1, -5
	stf	f1, r1, -8
	stf	f2, r1, -9
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_y.3794
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	ldw	r2, r1, -6
	ldf	f2, r2, 2
	ldw	r2, r1, -5
	stf	f1, r1, -10
	stf	f2, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	o_param_z.3808
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldf	f2, r1, -11
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_form.3673
	addi	r1, r1, 13
	ldw	r31, r1, -13
	subis	r0, r2, 1
	jmpine	jmpeq_else.9741
	ldw	r2, r1, -5
	ldw	r5, r1, -3
	ldf	f1, r1, -8
	ldf	f2, r1, -10
	ldf	f3, r1, -12
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9741:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9742
	ldw	r2, r1, -5
	ldw	r5, r1, -3
	ldf	f1, r1, -8
	ldf	f2, r1, -10
	ldf	f3, r1, -12
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9742:
	ldw	r2, r1, -5
	ldw	r5, r1, -3
	ldf	f1, r1, -8
	ldf	f2, r1, -10
	ldf	f3, r1, -12
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
solver_rect_fast.4677:
	ldw	r7, r30, 1
	ldf	f4, r6, 0
	fsub	f4, f4, f1
	ldf	f5, r6, 1
	fmul	f4, f4, f5
	ldf	f5, r5, 1
	fmul	f5, f4, f5
	fadd	f5, f5, f2
	stw	r7, r1, -1
	stf	f1, r1, -2
	stf	f2, r1, -3
	stw	r6, r1, -4
	stf	f3, r1, -5
	stf	f4, r1, -6
	stw	r5, r1, -7
	stw	r2, r1, -8
	fmov	f1, f5
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	fabs.2776
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r2, r1, -8
	stf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_b.3739
	addi	r1, r1, 10
	ldw	r31, r1, -10
	fmov	f2, f1
	ldf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fless.2764
	addi	r1, r1, 10
	ldw	r31, r1, -10
	subis	r0, r2, 0
	jmpine	jmpeq_else.9743
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9744
jmpeq_else.9743:
	ldw	r2, r1, -7
	ldf	f1, r2, 2
	ldf	f2, r1, -6
	fmul	f1, f2, f1
	ldf	f3, r1, -5
	fadd	f1, f1, f3
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fabs.2776
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -8
	stf	f1, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_param_c.3753
	addi	r1, r1, 11
	ldw	r31, r1, -11
	fmov	f2, f1
	ldf	f1, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	fless.2764
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9745
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9746
jmpeq_else.9745:
	ldw	r2, r1, -4
	ldf	f1, r2, 1
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	fiszero.2773
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9747
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9748
jmpeq_else.9747:
	addi	r2, r0, 0
jmpeq_cont.9748:
jmpeq_cont.9746:
jmpeq_cont.9744:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9749
	ldw	r2, r1, -4
	ldf	f1, r2, 2
	ldf	f2, r1, -3
	fsub	f1, f1, f2
	ldf	f3, r2, 3
	fmul	f1, f1, f3
	ldw	r5, r1, -7
	ldf	f3, r5, 0
	fmul	f3, f1, f3
	ldf	f4, r1, -2
	fadd	f3, f3, f4
	stf	f1, r1, -11
	fmov	f1, f3
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	fabs.2776
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -8
	stf	f1, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_param_a.3725
	addi	r1, r1, 13
	ldw	r31, r1, -13
	fmov	f2, f1
	ldf	f1, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fless.2764
	addi	r1, r1, 13
	ldw	r31, r1, -13
	subis	r0, r2, 0
	jmpine	jmpeq_else.9750
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9751
jmpeq_else.9750:
	ldw	r2, r1, -7
	ldf	f1, r2, 2
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	ldf	f3, r1, -5
	fadd	f1, f1, f3
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fabs.2776
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldw	r2, r1, -8
	stf	f1, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	o_param_c.3753
	addi	r1, r1, 14
	ldw	r31, r1, -14
	fmov	f2, f1
	ldf	f1, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	fless.2764
	addi	r1, r1, 14
	ldw	r31, r1, -14
	subis	r0, r2, 0
	jmpine	jmpeq_else.9752
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9753
jmpeq_else.9752:
	ldw	r2, r1, -4
	ldf	f1, r2, 3
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	fiszero.2773
	addi	r1, r1, 14
	ldw	r31, r1, -14
	subis	r0, r2, 0
	jmpine	jmpeq_else.9754
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9755
jmpeq_else.9754:
	addi	r2, r0, 0
jmpeq_cont.9755:
jmpeq_cont.9753:
jmpeq_cont.9751:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9756
	ldw	r2, r1, -4
	ldf	f1, r2, 4
	ldf	f2, r1, -5
	fsub	f1, f1, f2
	ldf	f2, r2, 5
	fmul	f1, f1, f2
	ldw	r5, r1, -7
	ldf	f2, r5, 0
	fmul	f2, f1, f2
	ldf	f3, r1, -2
	fadd	f2, f2, f3
	stf	f1, r1, -14
	fmov	f1, f2
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	fabs.2776
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldw	r2, r1, -8
	stf	f1, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	o_param_a.3725
	addi	r1, r1, 16
	ldw	r31, r1, -16
	fmov	f2, f1
	ldf	f1, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fless.2764
	addi	r1, r1, 16
	ldw	r31, r1, -16
	subis	r0, r2, 0
	jmpine	jmpeq_else.9757
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9758
jmpeq_else.9757:
	ldw	r2, r1, -7
	ldf	f1, r2, 1
	ldf	f2, r1, -14
	fmul	f1, f2, f1
	ldf	f3, r1, -3
	fadd	f1, f1, f3
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fabs.2776
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -8
	stf	f1, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	o_param_b.3739
	addi	r1, r1, 17
	ldw	r31, r1, -17
	fmov	f2, f1
	ldf	f1, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	fless.2764
	addi	r1, r1, 17
	ldw	r31, r1, -17
	subis	r0, r2, 0
	jmpine	jmpeq_else.9759
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9760
jmpeq_else.9759:
	ldw	r2, r1, -4
	ldf	f1, r2, 5
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	fiszero.2773
	addi	r1, r1, 17
	ldw	r31, r1, -17
	subis	r0, r2, 0
	jmpine	jmpeq_else.9761
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9762
jmpeq_else.9761:
	addi	r2, r0, 0
jmpeq_cont.9762:
jmpeq_cont.9760:
jmpeq_cont.9758:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9763
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9763:
	ldf	f1, r1, -14
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 3
	jmp	r31
jmpeq_else.9756:
	ldf	f1, r1, -11
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 2
	jmp	r31
jmpeq_else.9749:
	ldf	f1, r1, -6
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
solver_surface_fast.4774:
	ldw	r2, r30, 1
	ldf	f4, r5, 0
	stw	r2, r1, -1
	stf	f3, r1, -2
	stf	f2, r1, -3
	stf	f1, r1, -4
	stw	r5, r1, -5
	fmov	f1, f4
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fisneg.2770
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 0
	jmpine	jmpeq_else.9764
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9764:
	ldw	r2, r1, -5
	ldf	f1, r2, 1
	ldf	f2, r1, -4
	fmul	f1, f1, f2
	ldf	f2, r2, 2
	ldf	f3, r1, -3
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldf	f2, r2, 3
	ldf	f3, r1, -2
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
solver_second_fast.4797:
	ldw	r6, r30, 1
	ldf	f4, r5, 0
	stw	r6, r1, -1
	stf	f4, r1, -2
	stw	r2, r1, -3
	stf	f3, r1, -4
	stf	f2, r1, -5
	stf	f1, r1, -6
	stw	r5, r1, -7
	fmov	f1, f4
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fiszero.2773
	addi	r1, r1, 8
	ldw	r31, r1, -8
	subis	r0, r2, 0
	jmpine	jmpeq_else.9765
	ldw	r2, r1, -7
	ldf	f1, r2, 1
	ldf	f2, r1, -6
	fmul	f1, f1, f2
	ldf	f3, r2, 2
	ldf	f4, r1, -5
	fmul	f3, f3, f4
	fadd	f1, f1, f3
	ldf	f3, r2, 3
	ldf	f5, r1, -4
	fmul	f3, f3, f5
	fadd	f1, f1, f3
	ldw	r5, r1, -3
	stf	f1, r1, -8
	addi	r2, r5, 0
	fmov	f3, f5
	fmov	f1, f2
	fmov	f2, f4
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	quadratic.4549
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r2, r1, -3
	stf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_form.3673
	addi	r1, r1, 10
	ldw	r31, r1, -10
	subis	r0, r2, 3
	jmpine	jmpeq_else.9766
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	jmpi	jmpeq_cont.9767
jmpeq_else.9766:
	ldf	f1, r1, -9
jmpeq_cont.9767:
	ldf	f2, r1, -8
	stf	f1, r1, -10
	fmov	f1, f2
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	fsqr.2786
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -2
	ldf	f3, r1, -10
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	stf	f1, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	fispos.2767
	addi	r1, r1, 12
	ldw	r31, r1, -12
	subis	r0, r2, 0
	jmpine	jmpeq_else.9768
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9768:
	ldw	r2, r1, -3
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	o_isinvert.3699
	addi	r1, r1, 12
	ldw	r31, r1, -12
	subis	r0, r2, 0
	jmpine	jmpeq_else.9769
	ldf	f1, r1, -11
	fsqr	f1, f1
	ldf	f2, r1, -8
	fsub	f1, f2, f1
	ldw	r2, r1, -7
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
	jmpi	jmpeq_cont.9770
jmpeq_else.9769:
	ldf	f1, r1, -11
	fsqr	f1, f1
	ldf	f2, r1, -8
	fadd	f1, f2, f1
	ldw	r2, r1, -7
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
jmpeq_cont.9770:
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9765:
	addi	r2, r0, 0
	jmp	r31
solver_fast.4843:
	ldw	r7, r30, 4
	ldw	r8, r30, 3
	ldw	r9, r30, 2
	ldw	r10, r30, 1
	slli	r11, r2, 0
	add	r14, r10, r11
	ldw	r10, r14, 0
	ldf	f1, r6, 0
	stw	r8, r1, -1
	stw	r7, r1, -2
	stw	r9, r1, -3
	stw	r2, r1, -4
	stw	r5, r1, -5
	stw	r10, r1, -6
	stw	r6, r1, -7
	stf	f1, r1, -8
	addi	r2, r10, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	o_param_x.3780
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldf	f2, r1, -8
	fsub	f1, f2, f1
	ldw	r2, r1, -7
	ldf	f2, r2, 1
	ldw	r5, r1, -6
	stf	f1, r1, -9
	stf	f2, r1, -10
	addi	r2, r5, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_param_y.3794
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -10
	fsub	f1, f2, f1
	ldw	r2, r1, -7
	ldf	f2, r2, 2
	ldw	r2, r1, -6
	stf	f1, r1, -11
	stf	f2, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_param_z.3808
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -12
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	d_const.4044
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r5, r1, -4
	slli	r5, r5, 0
	add	r14, r2, r5
	ldw	r2, r14, 0
	ldw	r5, r1, -6
	stw	r2, r1, -14
	addi	r2, r5, 0
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	o_form.3673
	addi	r1, r1, 15
	ldw	r31, r1, -15
	subis	r0, r2, 1
	jmpine	jmpeq_else.9771
	ldw	r2, r1, -5
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	d_vec.4040
	addi	r1, r1, 15
	ldw	r31, r1, -15
	mov	r5, r2
	ldw	r2, r1, -6
	ldw	r6, r1, -14
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9771:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9772
	ldw	r2, r1, -6
	ldw	r5, r1, -14
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9772:
	ldw	r2, r1, -6
	ldw	r5, r1, -14
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
solver_surface_fast2.4866:
	ldw	r2, r30, 1
	ldf	f1, r5, 0
	stw	r2, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	fisneg.2770
	addi	r1, r1, 4
	ldw	r31, r1, -4
	subis	r0, r2, 0
	jmpine	jmpeq_else.9773
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9773:
	ldw	r2, r1, -3
	ldf	f1, r2, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 3
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
solver_second_fast2.4884:
	ldw	r7, r30, 1
	ldf	f4, r5, 0
	stw	r7, r1, -1
	stw	r2, r1, -2
	stf	f4, r1, -3
	stw	r6, r1, -4
	stf	f3, r1, -5
	stf	f2, r1, -6
	stf	f1, r1, -7
	stw	r5, r1, -8
	fmov	f1, f4
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	fiszero.2773
	addi	r1, r1, 9
	ldw	r31, r1, -9
	subis	r0, r2, 0
	jmpine	jmpeq_else.9774
	ldw	r2, r1, -8
	ldf	f1, r2, 1
	ldf	f2, r1, -7
	fmul	f1, f1, f2
	ldf	f2, r2, 2
	ldf	f3, r1, -6
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldf	f2, r2, 3
	ldf	f3, r1, -5
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldw	r5, r1, -4
	ldf	f2, r5, 3
	stf	f1, r1, -9
	stf	f2, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	fsqr.2786
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -3
	ldf	f3, r1, -10
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	stf	f1, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	fispos.2767
	addi	r1, r1, 12
	ldw	r31, r1, -12
	subis	r0, r2, 0
	jmpine	jmpeq_else.9775
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9775:
	ldw	r2, r1, -2
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	o_isinvert.3699
	addi	r1, r1, 12
	ldw	r31, r1, -12
	subis	r0, r2, 0
	jmpine	jmpeq_else.9776
	ldf	f1, r1, -11
	fsqr	f1, f1
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	ldw	r2, r1, -8
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
	jmpi	jmpeq_cont.9777
jmpeq_else.9776:
	ldf	f1, r1, -11
	fsqr	f1, f1
	ldf	f2, r1, -9
	fadd	f1, f2, f1
	ldw	r2, r1, -8
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
jmpeq_cont.9777:
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9774:
	addi	r2, r0, 0
	jmp	r31
solver_fast2.4928:
	ldw	r6, r30, 4
	ldw	r7, r30, 3
	ldw	r8, r30, 2
	ldw	r9, r30, 1
	slli	r10, r2, 0
	add	r14, r9, r10
	ldw	r9, r14, 0
	stw	r7, r1, -1
	stw	r6, r1, -2
	stw	r8, r1, -3
	stw	r9, r1, -4
	stw	r2, r1, -5
	stw	r5, r1, -6
	addi	r2, r9, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_param_ctbl.3934
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f1, r2, 0
	ldf	f2, r2, 1
	ldf	f3, r2, 2
	ldw	r5, r1, -6
	stw	r2, r1, -7
	stf	f3, r1, -8
	stf	f2, r1, -9
	stf	f1, r1, -10
	addi	r2, r5, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	d_const.4044
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r5, r1, -5
	slli	r5, r5, 0
	add	r14, r2, r5
	ldw	r2, r14, 0
	ldw	r5, r1, -4
	stw	r2, r1, -11
	addi	r2, r5, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	o_form.3673
	addi	r1, r1, 12
	ldw	r31, r1, -12
	subis	r0, r2, 1
	jmpine	jmpeq_else.9778
	ldw	r2, r1, -6
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	d_vec.4040
	addi	r1, r1, 12
	ldw	r31, r1, -12
	mov	r5, r2
	ldw	r2, r1, -4
	ldw	r6, r1, -11
	ldf	f1, r1, -10
	ldf	f2, r1, -9
	ldf	f3, r1, -8
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9778:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9779
	ldw	r2, r1, -4
	ldw	r5, r1, -11
	ldw	r6, r1, -7
	ldf	f1, r1, -10
	ldf	f2, r1, -9
	ldf	f3, r1, -8
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9779:
	ldw	r2, r1, -4
	ldw	r5, r1, -11
	ldw	r6, r1, -7
	ldf	f1, r1, -10
	ldf	f2, r1, -9
	ldf	f3, r1, -8
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
setup_rect_table.4945:
	addi	r6, r0, 6
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	external_create_float_array
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	stw	r2, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	fiszero.2773
	addi	r1, r1, 4
	ldw	r31, r1, -4
	subis	r0, r2, 0
	jmpine	jmpeq_else.9780
	ldw	r2, r1, -1
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	o_isinvert.3699
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	stw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fisneg.2770
	addi	r1, r1, 5
	ldw	r31, r1, -5
	mov	r5, r2
	ldw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	xor.3360
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r5, r1, -1
	stw	r2, r1, -5
	addi	r2, r5, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_param_a.3725
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fneg_cond.3371
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -3
	stf	f1, r2, 0
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -2
	ldf	f2, r5, 0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r2, 1
	jmpi	jmpeq_cont.9781
jmpeq_else.9780:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 1
jmpeq_cont.9781:
	ldw	r5, r1, -2
	ldf	f1, r5, 1
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fiszero.2773
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 0
	jmpine	jmpeq_else.9782
	ldw	r2, r1, -1
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_isinvert.3699
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r5, r1, -2
	ldf	f1, r5, 1
	stw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	fisneg.2770
	addi	r1, r1, 7
	ldw	r31, r1, -7
	mov	r5, r2
	ldw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	xor.3360
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -1
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_param_b.3739
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r2, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fneg_cond.3371
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r2, r1, -3
	stf	f1, r2, 2
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -2
	ldf	f2, r5, 1
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r2, 3
	jmpi	jmpeq_cont.9783
jmpeq_else.9782:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 3
jmpeq_cont.9783:
	ldw	r5, r1, -2
	ldf	f1, r5, 2
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fiszero.2773
	addi	r1, r1, 8
	ldw	r31, r1, -8
	subis	r0, r2, 0
	jmpine	jmpeq_else.9784
	ldw	r2, r1, -1
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_isinvert.3699
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r5, r1, -2
	ldf	f1, r5, 2
	stw	r2, r1, -8
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	fisneg.2770
	addi	r1, r1, 9
	ldw	r31, r1, -9
	mov	r5, r2
	ldw	r2, r1, -8
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	xor.3360
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r5, r1, -1
	stw	r2, r1, -9
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_c.3753
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fneg_cond.3371
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -3
	stf	f1, r2, 4
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -2
	ldf	f2, r5, 2
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r2, 5
	jmpi	jmpeq_cont.9785
jmpeq_else.9784:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 5
jmpeq_cont.9785:
	jmp	r31
setup_surface_table.5014:
	addi	r6, r0, 4
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	external_create_float_array
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	ldw	r6, r1, -1
	stw	r2, r1, -3
	stf	f1, r1, -4
	addi	r2, r6, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_param_a.3725
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldf	f2, r1, -4
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	ldw	r5, r1, -1
	stf	f1, r1, -5
	stf	f2, r1, -6
	addi	r2, r5, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_param_b.3739
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f2, r1, -6
	fmul	f1, f2, f1
	ldf	f2, r1, -5
	fadd	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	ldw	r2, r1, -1
	stf	f1, r1, -7
	stf	f2, r1, -8
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	o_param_c.3753
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldf	f2, r1, -8
	fmul	f1, f2, f1
	ldf	f2, r1, -7
	fadd	f1, f2, f1
	stf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fispos.2767
	addi	r1, r1, 10
	ldw	r31, r1, -10
	subis	r0, r2, 0
	jmpine	jmpeq_else.9786
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 0
	jmpi	jmpeq_cont.9787
jmpeq_else.9786:
	addi	r14, r0, -16512	#r14 = bf800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -9
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -3
	stf	f1, r2, 0
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_a.3725
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -9
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fneg.2781
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -3
	stf	f1, r2, 1
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_b.3739
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -9
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fneg.2781
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -3
	stf	f1, r2, 2
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_c.3753
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -9
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fneg.2781
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -3
	stf	f1, r2, 3
jmpeq_cont.9787:
	jmp	r31
setup_second_table.5057:
	addi	r6, r0, 5
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	external_create_float_array
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	ldf	f2, r5, 1
	ldf	f3, r5, 2
	ldw	r6, r1, -1
	stw	r2, r1, -3
	addi	r2, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	quadratic.4549
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	ldw	r5, r1, -1
	stf	f1, r1, -4
	stf	f2, r1, -5
	addi	r2, r5, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_param_a.3725
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f2, r1, -5
	fmul	f1, f2, f1
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fneg.2781
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	ldw	r5, r1, -1
	stf	f1, r1, -6
	stf	f2, r1, -7
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_param_b.3739
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fneg.2781
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	ldw	r5, r1, -1
	stf	f1, r1, -8
	stf	f2, r1, -9
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_c.3753
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fneg.2781
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -4
	ldw	r2, r1, -3
	stf	f2, r2, 0
	ldw	r5, r1, -1
	stf	f1, r1, -10
	addi	r2, r5, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_isrot.3712
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9788
	ldf	f1, r1, -6
	ldw	r2, r1, -3
	stf	f1, r2, 1
	ldf	f1, r1, -8
	stf	f1, r2, 2
	ldf	f1, r1, -10
	stf	f1, r2, 3
	jmpi	jmpeq_cont.9789
jmpeq_else.9788:
	ldw	r2, r1, -2
	ldf	f1, r2, 2
	ldw	r5, r1, -1
	stf	f1, r1, -11
	addi	r2, r5, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	o_param_r2.3906
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	ldw	r5, r1, -1
	stf	f1, r1, -12
	stf	f2, r1, -13
	addi	r2, r5, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	o_param_r3.3920
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -13
	fmul	f1, f2, f1
	ldf	f2, r1, -12
	fadd	f1, f2, f1
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	fhalf.2783
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -6
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r2, 1
	ldw	r5, r1, -2
	ldf	f1, r5, 2
	ldw	r6, r1, -1
	stf	f1, r1, -14
	addi	r2, r6, 0
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	o_param_r1.3892
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -14
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	ldw	r5, r1, -1
	stf	f1, r1, -15
	stf	f2, r1, -16
	addi	r2, r5, 0
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	o_param_r3.3920
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -16
	fmul	f1, f2, f1
	ldf	f2, r1, -15
	fadd	f1, f2, f1
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	fhalf.2783
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -8
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r2, 2
	ldw	r5, r1, -2
	ldf	f1, r5, 1
	ldw	r6, r1, -1
	stf	f1, r1, -17
	addi	r2, r6, 0
	stw	r31, r1, -18
	addi	r1, r1, -18
	cali	o_param_r1.3892
	addi	r1, r1, 18
	ldw	r31, r1, -18
	ldf	f2, r1, -17
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	ldw	r2, r1, -1
	stf	f1, r1, -18
	stf	f2, r1, -19
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	o_param_r2.3906
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldf	f2, r1, -18
	fadd	f1, f2, f1
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	fhalf.2783
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldf	f2, r1, -10
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r2, 3
jmpeq_cont.9789:
	ldf	f1, r1, -4
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	fiszero.2773
	addi	r1, r1, 20
	ldw	r31, r1, -20
	subis	r0, r2, 0
	jmpine	jmpeq_else.9790
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -4
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -3
	stf	f1, r2, 4
	jmpi	jmpeq_cont.9791
jmpeq_else.9790:
jmpeq_cont.9791:
	ldw	r2, r1, -3
	jmp	r31
iter_setup_dirvec_constants.5139:
	ldw	r6, r30, 1
	subis	r0, r5, 0
	jmpilt	jmpge_else.9792
	slli	r7, r5, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	stw	r30, r1, -1
	stw	r5, r1, -2
	stw	r6, r1, -3
	stw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	d_const.4044
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r5, r1, -4
	stw	r2, r1, -5
	addi	r2, r5, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	d_vec.4040
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r5, r1, -3
	stw	r2, r1, -6
	addi	r2, r5, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_form.3673
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 1
	jmpine	jmpeq_else.9793
	ldw	r2, r1, -6
	ldw	r5, r1, -3
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	setup_rect_table.4945
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	stw	r2, r14, 0
	jmpi	jmpeq_cont.9794
jmpeq_else.9793:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9795
	ldw	r2, r1, -6
	ldw	r5, r1, -3
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	setup_surface_table.5014
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	stw	r2, r14, 0
	jmpi	jmpeq_cont.9796
jmpeq_else.9795:
	ldw	r2, r1, -6
	ldw	r5, r1, -3
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	setup_second_table.5057
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	stw	r2, r14, 0
jmpeq_cont.9796:
jmpeq_cont.9794:
	subi	r5, r5, 1
	ldw	r2, r1, -4
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9792:
	jmp	r31
setup_dirvec_constants.5155:
	ldw	r5, r30, 2
	ldw	r30, r30, 1
	ldw	r5, r5, 0
	subi	r5, r5, 1
	ldw	r29, r30, 0
	jmp	r29
setup_startp_constants.5161:
	ldw	r6, r30, 1
	subis	r0, r5, 0
	jmpilt	jmpge_else.9798
	slli	r7, r5, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	stw	r30, r1, -1
	stw	r5, r1, -2
	stw	r2, r1, -3
	stw	r6, r1, -4
	addi	r2, r6, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_param_ctbl.3934
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r5, r1, -4
	stw	r2, r1, -5
	addi	r2, r5, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_form.3673
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r5, r1, -3
	ldf	f1, r5, 0
	ldw	r6, r1, -4
	stw	r2, r1, -6
	stf	f1, r1, -7
	addi	r2, r6, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_param_x.3780
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r2, 0
	ldw	r5, r1, -3
	ldf	f1, r5, 1
	ldw	r6, r1, -4
	stf	f1, r1, -8
	addi	r2, r6, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	o_param_y.3794
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldf	f2, r1, -8
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r2, 1
	ldw	r5, r1, -3
	ldf	f1, r5, 2
	ldw	r6, r1, -4
	stf	f1, r1, -9
	addi	r2, r6, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_z.3808
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r2, 2
	ldw	r5, r1, -6
	subis	r0, r5, 2
	jmpine	jmpeq_else.9799
	ldw	r5, r1, -4
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_abc.3767
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r5, r1, -5
	ldf	f1, r5, 0
	ldf	f2, r5, 1
	ldf	f3, r5, 2
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	veciprod2.3522
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -5
	stf	f1, r2, 3
	jmpi	jmpeq_cont.9800
jmpeq_else.9799:
	subis	r0, r5, 2
	jmpigt	jmple_else.9801
	jmpi	jmple_cont.9802
jmple_else.9801:
	ldf	f1, r2, 0
	ldf	f2, r2, 1
	ldf	f3, r2, 2
	ldw	r6, r1, -4
	addi	r2, r6, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	quadratic.4549
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -6
	subis	r0, r2, 3
	jmpine	jmpeq_else.9803
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsub	f1, f1, f2
	jmpi	jmpeq_cont.9804
jmpeq_else.9803:
jmpeq_cont.9804:
	ldw	r2, r1, -5
	stf	f1, r2, 3
jmple_cont.9802:
jmpeq_cont.9800:
	ldw	r2, r1, -2
	subi	r5, r2, 1
	ldw	r2, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9798:
	jmp	r31
setup_startp.5211:
	ldw	r5, r30, 3
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	stw	r2, r1, -1
	stw	r6, r1, -2
	stw	r7, r1, -3
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	veccpy.3402
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r2, r1, -3
	ldw	r2, r2, 0
	subi	r5, r2, 1
	ldw	r2, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
is_rect_outside.5218:
	stf	f3, r1, -1
	stf	f2, r1, -2
	stw	r2, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	fabs.2776
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r2, r1, -3
	stf	f1, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_param_a.3725
	addi	r1, r1, 5
	ldw	r31, r1, -5
	fmov	f2, f1
	ldf	f1, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fless.2764
	addi	r1, r1, 5
	ldw	r31, r1, -5
	subis	r0, r2, 0
	jmpine	jmpeq_else.9806
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9807
jmpeq_else.9806:
	ldf	f1, r1, -2
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fabs.2776
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -3
	stf	f1, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_param_b.3739
	addi	r1, r1, 6
	ldw	r31, r1, -6
	fmov	f2, f1
	ldf	f1, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fless.2764
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 0
	jmpine	jmpeq_else.9808
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9809
jmpeq_else.9808:
	ldf	f1, r1, -1
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fabs.2776
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -3
	stf	f1, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_param_c.3753
	addi	r1, r1, 7
	ldw	r31, r1, -7
	fmov	f2, f1
	ldf	f1, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	fless.2764
	addi	r1, r1, 7
	ldw	r31, r1, -7
jmpeq_cont.9809:
jmpeq_cont.9807:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9810
	ldw	r2, r1, -3
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_isinvert.3699
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9811
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9811:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9810:
	ldw	r2, r1, -3
	jmpi	o_isinvert.3699
is_plane_outside.5237:
	stw	r2, r1, -1
	stf	f3, r1, -2
	stf	f2, r1, -3
	stf	f1, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_param_abc.3767
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldf	f1, r1, -4
	ldf	f2, r1, -3
	ldf	f3, r1, -2
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	veciprod2.3522
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -1
	stf	f1, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_isinvert.3699
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f1, r1, -5
	stw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	fisneg.2770
	addi	r1, r1, 7
	ldw	r31, r1, -7
	mov	r5, r2
	ldw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	xor.3360
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9812
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9812:
	addi	r2, r0, 0
	jmp	r31
is_second_outside.5248:
	stw	r2, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	quadratic.4549
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r2, r1, -1
	stf	f1, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	o_form.3673
	addi	r1, r1, 3
	ldw	r31, r1, -3
	subis	r0, r2, 3
	jmpine	jmpeq_else.9813
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -2
	fsub	f1, f2, f1
	jmpi	jmpeq_cont.9814
jmpeq_else.9813:
	ldf	f1, r1, -2
jmpeq_cont.9814:
	ldw	r2, r1, -1
	stf	f1, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	o_isinvert.3699
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldf	f1, r1, -3
	stw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fisneg.2770
	addi	r1, r1, 5
	ldw	r31, r1, -5
	mov	r5, r2
	ldw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	xor.3360
	addi	r1, r1, 5
	ldw	r31, r1, -5
	subis	r0, r2, 0
	jmpine	jmpeq_else.9815
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9815:
	addi	r2, r0, 0
	jmp	r31
is_outside.5262:
	stf	f3, r1, -1
	stf	f2, r1, -2
	stw	r2, r1, -3
	stf	f1, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_param_x.3780
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldf	f2, r1, -4
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_param_y.3794
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f2, r1, -2
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_param_z.3808
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f2, r1, -1
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_form.3673
	addi	r1, r1, 8
	ldw	r31, r1, -8
	subis	r0, r2, 1
	jmpine	jmpeq_else.9816
	ldw	r2, r1, -3
	ldf	f1, r1, -5
	ldf	f2, r1, -6
	ldf	f3, r1, -7
	jmpi	is_rect_outside.5218
jmpeq_else.9816:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9817
	ldw	r2, r1, -3
	ldf	f1, r1, -5
	ldf	f2, r1, -6
	ldf	f3, r1, -7
	jmpi	is_plane_outside.5237
jmpeq_else.9817:
	ldw	r2, r1, -3
	ldf	f1, r1, -5
	ldf	f2, r1, -6
	ldf	f3, r1, -7
	jmpi	is_second_outside.5248
check_all_inside.5276:
	ldw	r6, r30, 1
	slli	r7, r2, 0
	add	r14, r5, r7
	ldw	r7, r14, 0
	subis	r0, r7, -1
	jmpine	jmpeq_else.9818
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9818:
	slli	r7, r7, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	stf	f3, r1, -1
	stf	f2, r1, -2
	stf	f1, r1, -3
	stw	r5, r1, -4
	stw	r30, r1, -5
	stw	r2, r1, -6
	addi	r2, r6, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	is_outside.5262
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9819
	ldw	r2, r1, -6
	addi	r2, r2, 1
	ldw	r5, r1, -4
	ldf	f1, r1, -3
	ldf	f2, r1, -2
	ldf	f3, r1, -1
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9819:
	addi	r2, r0, 0
	jmp	r31
shadow_check_and_group.5290:
	ldw	r6, r30, 7
	ldw	r7, r30, 6
	ldw	r8, r30, 5
	ldw	r9, r30, 4
	ldw	r10, r30, 3
	ldw	r11, r30, 2
	ldw	r12, r30, 1
	slli	r13, r2, 0
	add	r14, r5, r13
	ldw	r13, r14, 0
	subis	r0, r13, -1
	jmpine	jmpeq_else.9820
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9820:
	slli	r13, r2, 0
	add	r14, r5, r13
	ldw	r13, r14, 0
	stw	r12, r1, -1
	stw	r11, r1, -2
	stw	r10, r1, -3
	stw	r5, r1, -4
	stw	r30, r1, -5
	stw	r2, r1, -6
	stw	r8, r1, -7
	stw	r13, r1, -8
	stw	r7, r1, -9
	addi	r5, r9, 0
	addi	r2, r13, 0
	addi	r30, r6, 0
	addi	r6, r11, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r5, r1, -9
	ldf	f1, r5, 0
	stf	f1, r1, -10
	subis	r0, r2, 0
	jmpine	jmpeq_else.9821
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9822
jmpeq_else.9821:
	addi	r14, r0, -16820	#r14 = be4ccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	fless.2764
	addi	r1, r1, 11
	ldw	r31, r1, -11
jmpeq_cont.9822:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9823
	ldw	r2, r1, -8
	slli	r2, r2, 0
	ldw	r5, r1, -7
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_isinvert.3699
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9824
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9824:
	ldw	r2, r1, -6
	addi	r2, r2, 1
	ldw	r5, r1, -4
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9823:
	addi	r14, r0, 15395	#r14 = 3c23d70a
	slli	r14, r14, 16
	addi	r14, r14, 22282
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f1, r14, r0
	ldf	f2, r1, -10
	fadd	f1, f2, f1
	ldw	r2, r1, -3
	ldf	f2, r2, 0
	fmul	f2, f2, f1
	ldw	r5, r1, -2
	ldf	f3, r5, 0
	fadd	f2, f2, f3
	ldf	f3, r2, 1
	fmul	f3, f3, f1
	ldf	f4, r5, 1
	fadd	f3, f3, f4
	ldf	f4, r2, 2
	fmul	f1, f4, f1
	ldf	f4, r5, 2
	fadd	f1, f1, f4
	addi	r2, r0, 0
	ldw	r5, r1, -4
	ldw	r30, r1, -1
	fmov	f30, f3
	fmov	f3, f1
	fmov	f1, f2
	fmov	f2, f30
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9825
	ldw	r2, r1, -6
	addi	r2, r2, 1
	ldw	r5, r1, -4
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9825:
	addi	r2, r0, 1
	jmp	r31
shadow_check_one_or_group.5334:
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	slli	r8, r2, 0
	add	r14, r5, r8
	ldw	r8, r14, 0
	subis	r0, r8, -1
	jmpine	jmpeq_else.9826
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9826:
	slli	r8, r8, 0
	add	r14, r7, r8
	ldw	r7, r14, 0
	addi	r8, r0, 0
	stw	r5, r1, -1
	stw	r30, r1, -2
	stw	r2, r1, -3
	addi	r5, r7, 0
	addi	r2, r8, 0
	addi	r30, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	subis	r0, r2, 0
	jmpine	jmpeq_else.9827
	ldw	r2, r1, -3
	addi	r2, r2, 1
	ldw	r5, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9827:
	addi	r2, r0, 1
	jmp	r31
shadow_check_one_or_matrix.5346:
	ldw	r6, r30, 5
	ldw	r7, r30, 4
	ldw	r8, r30, 3
	ldw	r9, r30, 2
	ldw	r10, r30, 1
	slli	r11, r2, 0
	add	r14, r5, r11
	ldw	r11, r14, 0
	ldw	r12, r11, 0
	subis	r0, r12, -1
	jmpine	jmpeq_else.9828
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9828:
	stw	r11, r1, -1
	stw	r8, r1, -2
	stw	r5, r1, -3
	stw	r30, r1, -4
	stw	r2, r1, -5
	subis	r0, r12, 99
	jmpine	jmpeq_else.9829
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9830
jmpeq_else.9829:
	stw	r7, r1, -6
	addi	r5, r9, 0
	addi	r2, r12, 0
	addi	r30, r6, 0
	addi	r6, r10, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9831
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9832
jmpeq_else.9831:
	ldw	r2, r1, -6
	ldf	f1, r2, 0
	addi	r14, r0, -16948	#r14 = bdcccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	fless.2764
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9833
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9834
jmpeq_else.9833:
	addi	r2, r0, 1
	ldw	r5, r1, -1
	ldw	r30, r1, -2
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9835
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9836
jmpeq_else.9835:
	addi	r2, r0, 1
jmpeq_cont.9836:
jmpeq_cont.9834:
jmpeq_cont.9832:
jmpeq_cont.9830:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9837
	ldw	r2, r1, -5
	addi	r2, r2, 1
	ldw	r5, r1, -3
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9837:
	addi	r2, r0, 1
	ldw	r5, r1, -1
	ldw	r30, r1, -2
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpine	jmpeq_else.9838
	ldw	r2, r1, -5
	addi	r2, r2, 1
	ldw	r5, r1, -3
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9838:
	addi	r2, r0, 1
	jmp	r31
solve_each_element.5374:
	ldw	r7, r30, 9
	ldw	r8, r30, 8
	ldw	r9, r30, 7
	ldw	r10, r30, 6
	ldw	r11, r30, 5
	ldw	r12, r30, 4
	ldw	r13, r30, 3
	ldw	r16, r30, 2
	ldw	r17, r30, 1
	slli	r18, r2, 0
	add	r14, r5, r18
	ldw	r18, r14, 0
	subis	r0, r18, -1
	jmpine	jmpeq_else.9839
	jmp	r31
jmpeq_else.9839:
	stw	r12, r1, -1
	stw	r16, r1, -2
	stw	r13, r1, -3
	stw	r17, r1, -4
	stw	r8, r1, -5
	stw	r7, r1, -6
	stw	r9, r1, -7
	stw	r6, r1, -8
	stw	r5, r1, -9
	stw	r30, r1, -10
	stw	r2, r1, -11
	stw	r11, r1, -12
	stw	r18, r1, -13
	addi	r5, r6, 0
	addi	r2, r18, 0
	addi	r30, r10, 0
	addi	r6, r8, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 14
	ldw	r31, r1, -14
	subis	r0, r2, 0
	jmpine	jmpeq_else.9841
	ldw	r2, r1, -13
	slli	r2, r2, 0
	ldw	r5, r1, -12
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	o_isinvert.3699
	addi	r1, r1, 14
	ldw	r31, r1, -14
	subis	r0, r2, 0
	jmpine	jmpeq_else.9842
	jmp	r31
jmpeq_else.9842:
	ldw	r2, r1, -11
	addi	r2, r2, 1
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r30, r1, -10
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9841:
	ldw	r5, r1, -7
	ldf	f2, r5, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -14
	stf	f2, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fless.2764
	addi	r1, r1, 16
	ldw	r31, r1, -16
	subis	r0, r2, 0
	jmpine	jmpeq_else.9844
	jmpi	jmpeq_cont.9845
jmpeq_else.9844:
	ldw	r2, r1, -6
	ldf	f2, r2, 0
	ldf	f1, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fless.2764
	addi	r1, r1, 16
	ldw	r31, r1, -16
	subis	r0, r2, 0
	jmpine	jmpeq_else.9846
	jmpi	jmpeq_cont.9847
jmpeq_else.9846:
	addi	r14, r0, 15395	#r14 = 3c23d70a
	slli	r14, r14, 16
	addi	r14, r14, 22282
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f1, r14, r0
	ldf	f2, r1, -15
	fadd	f1, f2, f1
	ldw	r2, r1, -8
	ldf	f2, r2, 0
	fmul	f2, f2, f1
	ldw	r5, r1, -5
	ldf	f3, r5, 0
	fadd	f2, f2, f3
	ldf	f3, r2, 1
	fmul	f3, f3, f1
	ldf	f4, r5, 1
	fadd	f3, f3, f4
	ldf	f4, r2, 2
	fmul	f4, f4, f1
	ldf	f5, r5, 2
	fadd	f4, f4, f5
	addi	r5, r0, 0
	ldw	r6, r1, -9
	ldw	r30, r1, -4
	stf	f4, r1, -16
	stf	f3, r1, -17
	stf	f2, r1, -18
	stf	f1, r1, -19
	addi	r2, r5, 0
	addi	r5, r6, 0
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r31, r1, -20
	addi	r1, r1, -20
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 20
	ldw	r31, r1, -20
	subis	r0, r2, 0
	jmpine	jmpeq_else.9848
	jmpi	jmpeq_cont.9849
jmpeq_else.9848:
	ldf	f1, r1, -19
	ldw	r2, r1, -6
	stf	f1, r2, 0
	ldw	r2, r1, -3
	ldf	f1, r1, -18
	ldf	f2, r1, -17
	ldf	f3, r1, -16
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	vecset.3381
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r2, r1, -13
	ldw	r5, r1, -2
	stw	r2, r5, 0
	ldw	r2, r1, -14
	ldw	r5, r1, -1
	stw	r2, r5, 0
jmpeq_cont.9849:
jmpeq_cont.9847:
jmpeq_cont.9845:
	ldw	r2, r1, -11
	addi	r2, r2, 1
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r30, r1, -10
	ldw	r29, r30, 0
	jmp	r29
solve_one_or_network.5429:
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	slli	r9, r2, 0
	add	r14, r5, r9
	ldw	r9, r14, 0
	subis	r0, r9, -1
	jmpine	jmpeq_else.9850
	jmp	r31
jmpeq_else.9850:
	slli	r9, r9, 0
	add	r14, r8, r9
	ldw	r8, r14, 0
	addi	r9, r0, 0
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r30, r1, -3
	stw	r2, r1, -4
	addi	r5, r8, 0
	addi	r2, r9, 0
	addi	r30, r7, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
trace_or_matrix.5441:
	ldw	r7, r30, 5
	ldw	r8, r30, 4
	ldw	r9, r30, 3
	ldw	r10, r30, 2
	ldw	r11, r30, 1
	slli	r12, r2, 0
	add	r14, r5, r12
	ldw	r12, r14, 0
	ldw	r13, r12, 0
	subis	r0, r13, -1
	jmpine	jmpeq_else.9852
	jmp	r31
jmpeq_else.9852:
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r30, r1, -3
	stw	r2, r1, -4
	subis	r0, r13, 99
	jmpine	jmpeq_else.9854
	addi	r7, r0, 1
	addi	r5, r12, 0
	addi	r2, r7, 0
	addi	r30, r11, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
	jmpi	jmpeq_cont.9855
jmpeq_else.9854:
	stw	r12, r1, -5
	stw	r11, r1, -6
	stw	r7, r1, -7
	stw	r9, r1, -8
	addi	r5, r6, 0
	addi	r2, r13, 0
	addi	r30, r10, 0
	addi	r6, r8, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 9
	ldw	r31, r1, -9
	subis	r0, r2, 0
	jmpine	jmpeq_else.9856
	jmpi	jmpeq_cont.9857
jmpeq_else.9856:
	ldw	r2, r1, -8
	ldf	f1, r2, 0
	ldw	r2, r1, -7
	ldf	f2, r2, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	fless.2764
	addi	r1, r1, 9
	ldw	r31, r1, -9
	subis	r0, r2, 0
	jmpine	jmpeq_else.9858
	jmpi	jmpeq_cont.9859
jmpeq_else.9858:
	addi	r2, r0, 1
	ldw	r5, r1, -5
	ldw	r6, r1, -1
	ldw	r30, r1, -6
	stw	r31, r1, -9
	addi	r1, r1, -9
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 9
	ldw	r31, r1, -9
jmpeq_cont.9859:
jmpeq_cont.9857:
jmpeq_cont.9855:
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
judge_intersection.5464:
	ldw	r5, r30, 3
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	addi	r14, r0, 20078	#r14 = 4e6e6b28
	slli	r14, r14, 16
	oori	r14, r14, 27432
	mif	f1, r14, r0
	stf	f1, r6, 0
	addi	r8, r0, 0
	ldw	r7, r7, 0
	stw	r6, r1, -1
	addi	r6, r2, 0
	addi	r30, r5, 0
	addi	r5, r7, 0
	addi	r2, r8, 0
	stw	r31, r1, -2
	addi	r1, r1, -2
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r2, r1, -1
	ldf	f2, r2, 0
	addi	r14, r0, -16948	#r14 = bdcccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f1, r14, r0
	stf	f2, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	fless.2764
	addi	r1, r1, 3
	ldw	r31, r1, -3
	subis	r0, r2, 0
	jmpine	jmpeq_else.9860
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9860:
	addi	r14, r0, 19646	#r14 = 4cbebc20
	slli	r14, r14, 16
	addi	r14, r14, 15392
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	ldf	f1, r1, -2
	jmpi	fless.2764
solve_each_element_fast.5479:
	ldw	r7, r30, 9
	ldw	r8, r30, 8
	ldw	r9, r30, 7
	ldw	r10, r30, 6
	ldw	r11, r30, 5
	ldw	r12, r30, 4
	ldw	r13, r30, 3
	ldw	r16, r30, 2
	ldw	r17, r30, 1
	stw	r12, r1, -1
	stw	r16, r1, -2
	stw	r13, r1, -3
	stw	r17, r1, -4
	stw	r8, r1, -5
	stw	r7, r1, -6
	stw	r10, r1, -7
	stw	r30, r1, -8
	stw	r11, r1, -9
	stw	r6, r1, -10
	stw	r9, r1, -11
	stw	r5, r1, -12
	stw	r2, r1, -13
	addi	r2, r6, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	d_vec.4040
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r5, r1, -13
	slli	r6, r5, 0
	ldw	r7, r1, -12
	add	r14, r7, r6
	ldw	r6, r14, 0
	subis	r0, r6, -1
	jmpine	jmpeq_else.9861
	jmp	r31
jmpeq_else.9861:
	ldw	r8, r1, -10
	ldw	r30, r1, -11
	stw	r2, r1, -14
	stw	r6, r1, -15
	addi	r5, r8, 0
	addi	r2, r6, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 16
	ldw	r31, r1, -16
	subis	r0, r2, 0
	jmpine	jmpeq_else.9863
	ldw	r2, r1, -15
	slli	r2, r2, 0
	ldw	r5, r1, -9
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	o_isinvert.3699
	addi	r1, r1, 16
	ldw	r31, r1, -16
	subis	r0, r2, 0
	jmpine	jmpeq_else.9864
	jmp	r31
jmpeq_else.9864:
	ldw	r2, r1, -13
	addi	r2, r2, 1
	ldw	r5, r1, -12
	ldw	r6, r1, -10
	ldw	r30, r1, -8
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9863:
	ldw	r5, r1, -7
	ldf	f2, r5, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -16
	stf	f2, r1, -17
	stw	r31, r1, -18
	addi	r1, r1, -18
	cali	fless.2764
	addi	r1, r1, 18
	ldw	r31, r1, -18
	subis	r0, r2, 0
	jmpine	jmpeq_else.9866
	jmpi	jmpeq_cont.9867
jmpeq_else.9866:
	ldw	r2, r1, -6
	ldf	f2, r2, 0
	ldf	f1, r1, -17
	stw	r31, r1, -18
	addi	r1, r1, -18
	cali	fless.2764
	addi	r1, r1, 18
	ldw	r31, r1, -18
	subis	r0, r2, 0
	jmpine	jmpeq_else.9868
	jmpi	jmpeq_cont.9869
jmpeq_else.9868:
	addi	r14, r0, 15395	#r14 = 3c23d70a
	slli	r14, r14, 16
	addi	r14, r14, 22282
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f1, r14, r0
	ldf	f2, r1, -17
	fadd	f1, f2, f1
	ldw	r2, r1, -14
	ldf	f2, r2, 0
	fmul	f2, f2, f1
	ldw	r5, r1, -5
	ldf	f3, r5, 0
	fadd	f2, f2, f3
	ldf	f3, r2, 1
	fmul	f3, f3, f1
	ldf	f4, r5, 1
	fadd	f3, f3, f4
	ldf	f4, r2, 2
	fmul	f4, f4, f1
	ldf	f5, r5, 2
	fadd	f4, f4, f5
	addi	r2, r0, 0
	ldw	r5, r1, -12
	ldw	r30, r1, -4
	stf	f4, r1, -18
	stf	f3, r1, -19
	stf	f2, r1, -20
	stf	f1, r1, -21
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r31, r1, -22
	addi	r1, r1, -22
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 22
	ldw	r31, r1, -22
	subis	r0, r2, 0
	jmpine	jmpeq_else.9870
	jmpi	jmpeq_cont.9871
jmpeq_else.9870:
	ldf	f1, r1, -21
	ldw	r2, r1, -6
	stf	f1, r2, 0
	ldw	r2, r1, -3
	ldf	f1, r1, -20
	ldf	f2, r1, -19
	ldf	f3, r1, -18
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	vecset.3381
	addi	r1, r1, 22
	ldw	r31, r1, -22
	ldw	r2, r1, -15
	ldw	r5, r1, -2
	stw	r2, r5, 0
	ldw	r2, r1, -16
	ldw	r5, r1, -1
	stw	r2, r5, 0
jmpeq_cont.9871:
jmpeq_cont.9869:
jmpeq_cont.9867:
	ldw	r2, r1, -13
	addi	r2, r2, 1
	ldw	r5, r1, -12
	ldw	r6, r1, -10
	ldw	r30, r1, -8
	ldw	r29, r30, 0
	jmp	r29
solve_one_or_network_fast.5535:
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	slli	r9, r2, 0
	add	r14, r5, r9
	ldw	r9, r14, 0
	subis	r0, r9, -1
	jmpine	jmpeq_else.9872
	jmp	r31
jmpeq_else.9872:
	slli	r9, r9, 0
	add	r14, r8, r9
	ldw	r8, r14, 0
	addi	r9, r0, 0
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r30, r1, -3
	stw	r2, r1, -4
	addi	r5, r8, 0
	addi	r2, r9, 0
	addi	r30, r7, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
trace_or_matrix_fast.5547:
	ldw	r7, r30, 4
	ldw	r8, r30, 3
	ldw	r9, r30, 2
	ldw	r10, r30, 1
	slli	r11, r2, 0
	add	r14, r5, r11
	ldw	r11, r14, 0
	ldw	r12, r11, 0
	subis	r0, r12, -1
	jmpine	jmpeq_else.9874
	jmp	r31
jmpeq_else.9874:
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r30, r1, -3
	stw	r2, r1, -4
	subis	r0, r12, 99
	jmpine	jmpeq_else.9876
	addi	r7, r0, 1
	addi	r5, r11, 0
	addi	r2, r7, 0
	addi	r30, r10, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
	jmpi	jmpeq_cont.9877
jmpeq_else.9876:
	stw	r11, r1, -5
	stw	r10, r1, -6
	stw	r7, r1, -7
	stw	r9, r1, -8
	addi	r5, r6, 0
	addi	r2, r12, 0
	addi	r30, r8, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 9
	ldw	r31, r1, -9
	subis	r0, r2, 0
	jmpine	jmpeq_else.9878
	jmpi	jmpeq_cont.9879
jmpeq_else.9878:
	ldw	r2, r1, -8
	ldf	f1, r2, 0
	ldw	r2, r1, -7
	ldf	f2, r2, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	fless.2764
	addi	r1, r1, 9
	ldw	r31, r1, -9
	subis	r0, r2, 0
	jmpine	jmpeq_else.9880
	jmpi	jmpeq_cont.9881
jmpeq_else.9880:
	addi	r2, r0, 1
	ldw	r5, r1, -5
	ldw	r6, r1, -1
	ldw	r30, r1, -6
	stw	r31, r1, -9
	addi	r1, r1, -9
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 9
	ldw	r31, r1, -9
jmpeq_cont.9881:
jmpeq_cont.9879:
jmpeq_cont.9877:
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
judge_intersection_fast.5570:
	ldw	r5, r30, 3
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	addi	r14, r0, 20078	#r14 = 4e6e6b28
	slli	r14, r14, 16
	oori	r14, r14, 27432
	mif	f1, r14, r0
	stf	f1, r6, 0
	addi	r8, r0, 0
	ldw	r7, r7, 0
	stw	r6, r1, -1
	addi	r6, r2, 0
	addi	r30, r5, 0
	addi	r5, r7, 0
	addi	r2, r8, 0
	stw	r31, r1, -2
	addi	r1, r1, -2
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r2, r1, -1
	ldf	f2, r2, 0
	addi	r14, r0, -16948	#r14 = bdcccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f1, r14, r0
	stf	f2, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	fless.2764
	addi	r1, r1, 3
	ldw	r31, r1, -3
	subis	r0, r2, 0
	jmpine	jmpeq_else.9882
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9882:
	addi	r14, r0, 19646	#r14 = 4cbebc20
	slli	r14, r14, 16
	addi	r14, r14, 15392
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	ldf	f1, r1, -2
	jmpi	fless.2764
get_nvector_rect.5585:
	ldw	r5, r30, 2
	ldw	r6, r30, 1
	ldw	r6, r6, 0
	stw	r5, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	addi	r2, r5, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	vecbzero.3399
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r2, r1, -3
	subi	r5, r2, 1
	subi	r2, r2, 1
	slli	r2, r2, 0
	ldw	r6, r1, -2
	add	r14, r6, r2
	ldf	f1, r14, 0
	stw	r5, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	sgn.3365
	addi	r1, r1, 5
	ldw	r31, r1, -5
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fneg.2781
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -4
	slli	r2, r2, 0
	ldw	r5, r1, -1
	add	r14, r5, r2
	stf	f1, r14, 0
	jmp	r31
get_nvector_plane.5597:
	ldw	r5, r30, 1
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	o_param_a.3725
	addi	r1, r1, 3
	ldw	r31, r1, -3
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	fneg.2781
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	o_param_b.3739
	addi	r1, r1, 3
	ldw	r31, r1, -3
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	fneg.2781
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	o_param_c.3753
	addi	r1, r1, 3
	ldw	r31, r1, -3
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	fneg.2781
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r2, r1, -2
	stf	f1, r2, 2
	jmp	r31
get_nvector_second.5610:
	ldw	r5, r30, 2
	ldw	r6, r30, 1
	ldf	f1, r6, 0
	stw	r5, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stf	f1, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_param_x.3780
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldf	f2, r1, -4
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	ldf	f2, r2, 1
	ldw	r5, r1, -2
	stf	f1, r1, -5
	stf	f2, r1, -6
	addi	r2, r5, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_param_y.3794
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f2, r1, -6
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	ldf	f2, r2, 2
	ldw	r2, r1, -2
	stf	f1, r1, -7
	stf	f2, r1, -8
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	o_param_z.3808
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldf	f2, r1, -8
	fsub	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	o_param_a.3725
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f2, r1, -5
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_param_b.3739
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	o_param_c.3753
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_isrot.3712
	addi	r1, r1, 13
	ldw	r31, r1, -13
	subis	r0, r2, 0
	jmpine	jmpeq_else.9885
	ldf	f1, r1, -10
	ldw	r2, r1, -1
	stf	f1, r2, 0
	ldf	f1, r1, -11
	stf	f1, r2, 1
	ldf	f1, r1, -12
	stf	f1, r2, 2
	jmpi	jmpeq_cont.9886
jmpeq_else.9885:
	ldw	r2, r1, -2
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_param_r3.3920
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	o_param_r2.3906
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldf	f3, r1, -13
	fadd	f1, f3, f1
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	fhalf.2783
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -10
	fadd	f1, f2, f1
	ldw	r2, r1, -1
	stf	f1, r2, 0
	ldw	r5, r1, -2
	addi	r2, r5, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	o_param_r3.3920
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -5
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -14
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	o_param_r1.3892
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldf	f2, r1, -14
	fadd	f1, f2, f1
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	fhalf.2783
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -11
	fadd	f1, f2, f1
	ldw	r2, r1, -1
	stf	f1, r2, 1
	ldw	r5, r1, -2
	addi	r2, r5, 0
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	o_param_r2.3906
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -5
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	o_param_r1.3892
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldf	f2, r1, -15
	fadd	f1, f2, f1
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fhalf.2783
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldf	f2, r1, -12
	fadd	f1, f2, f1
	ldw	r2, r1, -1
	stf	f1, r2, 2
jmpeq_cont.9886:
	ldw	r5, r1, -2
	addi	r2, r5, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	o_isinvert.3699
	addi	r1, r1, 16
	ldw	r31, r1, -16
	mov	r5, r2
	ldw	r2, r1, -1
	jmpi	vecunit_sgn.3468
get_nvector.5665:
	ldw	r6, r30, 3
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	stw	r6, r1, -1
	stw	r2, r1, -2
	stw	r8, r1, -3
	stw	r5, r1, -4
	stw	r7, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_form.3673
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 1
	jmpine	jmpeq_else.9887
	ldw	r2, r1, -4
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9887:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9888
	ldw	r2, r1, -2
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9888:
	ldw	r2, r1, -2
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
utexture.5671:
	ldw	r6, r30, 1
	stw	r5, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	o_texturetype.3660
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -3
	stw	r2, r1, -4
	addi	r2, r5, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_color_red.3850
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldw	r5, r1, -3
	addi	r2, r5, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_color_green.3864
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldw	r5, r1, -3
	addi	r2, r5, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_color_blue.3878
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r2, r1, -2
	stf	f1, r2, 2
	ldw	r5, r1, -4
	subis	r0, r5, 1
	jmpine	jmpeq_else.9889
	ldw	r5, r1, -1
	ldf	f1, r5, 0
	ldw	r6, r1, -3
	stf	f1, r1, -5
	addi	r2, r6, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	o_param_x.3780
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f2, r1, -5
	fsub	f1, f2, f1
	addi	r14, r0, 15692	#r14 = 3d4ccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	fmul	f2, f1, f2
	stf	f1, r1, -6
	fmov	f1, f2
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	external_floor
	addi	r1, r1, 7
	ldw	r31, r1, -7
	addi	r14, r0, 16800	#r14 = 41a00000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	ldf	f2, r1, -6
	fsub	f1, f2, f1
	addi	r14, r0, 16672	#r14 = 41200000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	fless.2764
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -1
	ldf	f1, r5, 2
	ldw	r5, r1, -3
	stw	r2, r1, -7
	stf	f1, r1, -8
	addi	r2, r5, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	o_param_z.3808
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldf	f2, r1, -8
	fsub	f1, f2, f1
	addi	r14, r0, 15692	#r14 = 3d4ccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	fmul	f2, f1, f2
	stf	f1, r1, -9
	fmov	f1, f2
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	external_floor
	addi	r1, r1, 10
	ldw	r31, r1, -10
	addi	r14, r0, 16800	#r14 = 41a00000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	addi	r14, r0, 16672	#r14 = 41200000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fless.2764
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r5, r1, -7
	subis	r0, r5, 0
	jmpine	jmpeq_else.9890
	subis	r0, r2, 0
	jmpine	jmpeq_else.9892
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmpi	jmpeq_cont.9893
jmpeq_else.9892:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9893:
	jmpi	jmpeq_cont.9891
jmpeq_else.9890:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9894
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmpi	jmpeq_cont.9895
jmpeq_else.9894:
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9895:
jmpeq_cont.9891:
	ldw	r2, r1, -2
	stf	f1, r2, 1
	jmp	r31
jmpeq_else.9889:
	subis	r0, r5, 2
	jmpine	jmpeq_else.9897
	ldw	r5, r1, -1
	ldf	f1, r5, 1
	addi	r14, r0, 16000	#r14 = 3e800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	sin.3205
	addi	r1, r1, 10
	ldw	r31, r1, -10
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fsqr.2786
	addi	r1, r1, 10
	ldw	r31, r1, -10
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f2, f2, f1
	ldw	r2, r1, -2
	stf	f2, r2, 0
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	fsub	f1, f3, f1
	fmul	f1, f2, f1
	stf	f1, r2, 1
	jmp	r31
jmpeq_else.9897:
	subis	r0, r5, 3
	jmpine	jmpeq_else.9899
	ldw	r5, r1, -1
	ldf	f1, r5, 0
	ldw	r6, r1, -3
	stf	f1, r1, -10
	addi	r2, r6, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_param_x.3780
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -10
	fsub	f1, f2, f1
	ldw	r2, r1, -1
	ldf	f2, r2, 2
	ldw	r2, r1, -3
	stf	f1, r1, -11
	stf	f2, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_param_z.3808
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -12
	fsub	f1, f2, f1
	ldf	f2, r1, -11
	stf	f1, r1, -13
	fmov	f1, f2
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	fsqr.2786
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f2, r1, -13
	stf	f1, r1, -14
	fmov	f1, f2
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	fsqr.2786
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -14
	fadd	f1, f2, f1
	fsqr	f1, f1
	addi	r14, r0, 16672	#r14 = 41200000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	external_floor
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldf	f2, r1, -15
	fsub	f1, f2, f1
	addi	r14, r0, 16457	#r14 = 40490fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	cos.3230
	addi	r1, r1, 16
	ldw	r31, r1, -16
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fsqr.2786
	addi	r1, r1, 16
	ldw	r31, r1, -16
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f2, f1, f2
	ldw	r2, r1, -2
	stf	f2, r2, 1
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsub	f1, f2, f1
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stf	f1, r2, 2
	jmp	r31
jmpeq_else.9899:
	subis	r0, r5, 4
	jmpine	jmpeq_else.9901
	ldw	r5, r1, -1
	ldf	f1, r5, 0
	ldw	r6, r1, -3
	stf	f1, r1, -16
	addi	r2, r6, 0
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	o_param_x.3780
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -16
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -17
	stw	r31, r1, -18
	addi	r1, r1, -18
	cali	o_param_a.3725
	addi	r1, r1, 18
	ldw	r31, r1, -18
	fsqr	f1, f1
	ldf	f2, r1, -17
	fmul	f1, f2, f1
	ldw	r2, r1, -1
	ldf	f2, r2, 2
	ldw	r5, r1, -3
	stf	f1, r1, -18
	stf	f2, r1, -19
	addi	r2, r5, 0
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	o_param_z.3808
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldf	f2, r1, -19
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -20
	stw	r31, r1, -21
	addi	r1, r1, -21
	cali	o_param_c.3753
	addi	r1, r1, 21
	ldw	r31, r1, -21
	fsqr	f1, f1
	ldf	f2, r1, -20
	fmul	f1, f2, f1
	ldf	f2, r1, -18
	stf	f1, r1, -21
	fmov	f1, f2
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	fsqr.2786
	addi	r1, r1, 22
	ldw	r31, r1, -22
	ldf	f2, r1, -21
	stf	f1, r1, -22
	fmov	f1, f2
	stw	r31, r1, -23
	addi	r1, r1, -23
	cali	fsqr.2786
	addi	r1, r1, 23
	ldw	r31, r1, -23
	ldf	f2, r1, -22
	fadd	f1, f2, f1
	ldf	f2, r1, -18
	stf	f1, r1, -23
	fmov	f1, f2
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	fabs.2776
	addi	r1, r1, 24
	ldw	r31, r1, -24
	addi	r14, r0, 14545	#r14 = 38d1b717
	slli	r14, r14, 16
	addi	r14, r14, 14103
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	fless.2764
	addi	r1, r1, 24
	ldw	r31, r1, -24
	subis	r0, r2, 0
	jmpine	jmpeq_else.9902
	ldf	f1, r1, -21
	ldf	f2, r1, -18
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	fabs.2776
	addi	r1, r1, 24
	ldw	r31, r1, -24
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	atan.3158
	addi	r1, r1, 24
	ldw	r31, r1, -24
	addi	r14, r0, 16880	#r14 = 41f00000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16457	#r14 = 40490fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	jmpi	jmpeq_cont.9903
jmpeq_else.9902:
	addi	r14, r0, 16752	#r14 = 41700000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9903:
	stf	f1, r1, -24
	stw	r31, r1, -25
	addi	r1, r1, -25
	cali	external_floor
	addi	r1, r1, 25
	ldw	r31, r1, -25
	ldf	f2, r1, -24
	fsub	f1, f2, f1
	ldw	r2, r1, -1
	ldf	f2, r2, 1
	ldw	r2, r1, -3
	stf	f1, r1, -25
	stf	f2, r1, -26
	stw	r31, r1, -27
	addi	r1, r1, -27
	cali	o_param_y.3794
	addi	r1, r1, 27
	ldw	r31, r1, -27
	ldf	f2, r1, -26
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -27
	stw	r31, r1, -28
	addi	r1, r1, -28
	cali	o_param_b.3739
	addi	r1, r1, 28
	ldw	r31, r1, -28
	fsqr	f1, f1
	ldf	f2, r1, -27
	fmul	f1, f2, f1
	ldf	f2, r1, -23
	stf	f1, r1, -28
	fmov	f1, f2
	stw	r31, r1, -29
	addi	r1, r1, -29
	cali	fabs.2776
	addi	r1, r1, 29
	ldw	r31, r1, -29
	addi	r14, r0, 14545	#r14 = 38d1b717
	slli	r14, r14, 16
	addi	r14, r14, 14103
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	stw	r31, r1, -29
	addi	r1, r1, -29
	cali	fless.2764
	addi	r1, r1, 29
	ldw	r31, r1, -29
	subis	r0, r2, 0
	jmpine	jmpeq_else.9904
	ldf	f1, r1, -28
	ldf	f2, r1, -23
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r31, r1, -29
	addi	r1, r1, -29
	cali	fabs.2776
	addi	r1, r1, 29
	ldw	r31, r1, -29
	stw	r31, r1, -29
	addi	r1, r1, -29
	cali	atan.3158
	addi	r1, r1, 29
	ldw	r31, r1, -29
	addi	r14, r0, 16880	#r14 = 41f00000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16457	#r14 = 40490fdb
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	jmpi	jmpeq_cont.9905
jmpeq_else.9904:
	addi	r14, r0, 16752	#r14 = 41700000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9905:
	stf	f1, r1, -29
	stw	r31, r1, -30
	addi	r1, r1, -30
	cali	external_floor
	addi	r1, r1, 30
	ldw	r31, r1, -30
	ldf	f2, r1, -29
	fsub	f1, f2, f1
	addi	r14, r0, 15897	#r14 = 3e19999a
	slli	r14, r14, 16
	addi	r14, r14, 6554
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	addi	r14, r0, 16128	#r14 = 3f000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldf	f4, r1, -25
	fsub	f3, f3, f4
	stf	f1, r1, -30
	stf	f2, r1, -31
	fmov	f1, f3
	stw	r31, r1, -32
	addi	r1, r1, -32
	cali	fsqr.2786
	addi	r1, r1, 32
	ldw	r31, r1, -32
	ldf	f2, r1, -31
	fsub	f1, f2, f1
	addi	r14, r0, 16128	#r14 = 3f000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldf	f3, r1, -30
	fsub	f2, f2, f3
	stf	f1, r1, -32
	fmov	f1, f2
	stw	r31, r1, -33
	addi	r1, r1, -33
	cali	fsqr.2786
	addi	r1, r1, 33
	ldw	r31, r1, -33
	ldf	f2, r1, -32
	fsub	f1, f2, f1
	stf	f1, r1, -33
	stw	r31, r1, -34
	addi	r1, r1, -34
	cali	fisneg.2770
	addi	r1, r1, 34
	ldw	r31, r1, -34
	subis	r0, r2, 0
	jmpine	jmpeq_else.9906
	ldf	f1, r1, -33
	jmpi	jmpeq_cont.9907
jmpeq_else.9906:
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9907:
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f2, f1
	addi	r14, r0, 16025	#r14 = 3e99999a
	slli	r14, r14, 16
	addi	r14, r14, 6554
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -2
	stf	f1, r2, 2
	jmp	r31
jmpeq_else.9901:
	jmp	r31
add_light.5828:
	ldw	r2, r30, 2
	ldw	r5, r30, 1
	stf	f3, r1, -1
	stf	f2, r1, -2
	stf	f1, r1, -3
	stw	r2, r1, -4
	stw	r5, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fispos.2767
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 0
	jmpine	jmpeq_else.9910
	jmpi	jmpeq_cont.9911
jmpeq_else.9910:
	ldw	r2, r1, -5
	ldw	r5, r1, -4
	ldf	f1, r1, -3
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	vecaccum.3537
	addi	r1, r1, 6
	ldw	r31, r1, -6
jmpeq_cont.9911:
	ldf	f1, r1, -2
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fispos.2767
	addi	r1, r1, 6
	ldw	r31, r1, -6
	subis	r0, r2, 0
	jmpine	jmpeq_else.9912
	jmp	r31
jmpeq_else.9912:
	ldf	f1, r1, -2
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fsqr.2786
	addi	r1, r1, 6
	ldw	r31, r1, -6
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fsqr.2786
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f2, r1, -1
	fmul	f1, f1, f2
	ldw	r2, r1, -5
	ldf	f2, r2, 0
	fadd	f2, f2, f1
	stf	f2, r2, 0
	ldf	f2, r2, 1
	fadd	f2, f2, f1
	stf	f2, r2, 1
	ldf	f2, r2, 2
	fadd	f1, f2, f1
	stf	f1, r2, 2
	jmp	r31
trace_reflections.5854:
	ldw	r6, r30, 8
	ldw	r7, r30, 7
	ldw	r8, r30, 6
	ldw	r9, r30, 5
	ldw	r10, r30, 4
	ldw	r11, r30, 3
	ldw	r12, r30, 2
	ldw	r13, r30, 1
	subis	r0, r2, 0
	jmpilt	jmpge_else.9915
	slli	r16, r2, 0
	add	r14, r7, r16
	ldw	r7, r14, 0
	stw	r30, r1, -1
	stw	r2, r1, -2
	stf	f2, r1, -3
	stw	r13, r1, -4
	stw	r5, r1, -5
	stf	f1, r1, -6
	stw	r9, r1, -7
	stw	r6, r1, -8
	stw	r8, r1, -9
	stw	r7, r1, -10
	stw	r11, r1, -11
	stw	r12, r1, -12
	stw	r10, r1, -13
	addi	r2, r7, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	r_dvec.4053
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r30, r1, -13
	stw	r2, r1, -14
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	subis	r0, r2, 0
	jmpine	jmpeq_else.9916
	jmpi	jmpeq_cont.9917
jmpeq_else.9916:
	ldw	r2, r1, -12
	ldw	r2, r2, 0
	slai	r2, r2, 2
	ldw	r5, r1, -11
	ldw	r5, r5, 0
	add	r2, r2, r5
	ldw	r5, r1, -10
	stw	r2, r1, -15
	addi	r2, r5, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	r_surface_id.4048
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r5, r1, -15
	subs	r0, r5, r2
	jmpine	jmpeq_else.9918
	addi	r2, r0, 0
	ldw	r5, r1, -9
	ldw	r5, r5, 0
	ldw	r30, r1, -8
	stw	r31, r1, -16
	addi	r1, r1, -16
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 16
	ldw	r31, r1, -16
	subis	r0, r2, 0
	jmpine	jmpeq_else.9920
	ldw	r2, r1, -14
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	d_vec.4040
	addi	r1, r1, 16
	ldw	r31, r1, -16
	mov	r5, r2
	ldw	r2, r1, -7
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	veciprod.3503
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -10
	stf	f1, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	r_bright.4058
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -6
	fmul	f3, f1, f2
	ldf	f4, r1, -16
	fmul	f3, f3, f4
	ldw	r2, r1, -14
	stf	f3, r1, -17
	stf	f1, r1, -18
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	d_vec.4040
	addi	r1, r1, 19
	ldw	r31, r1, -19
	mov	r5, r2
	ldw	r2, r1, -5
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	veciprod.3503
	addi	r1, r1, 19
	ldw	r31, r1, -19
	ldf	f2, r1, -18
	fmul	f2, f2, f1
	ldf	f1, r1, -17
	ldf	f3, r1, -3
	ldw	r30, r1, -4
	stw	r31, r1, -19
	addi	r1, r1, -19
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 19
	ldw	r31, r1, -19
	jmpi	jmpeq_cont.9921
jmpeq_else.9920:
jmpeq_cont.9921:
	jmpi	jmpeq_cont.9919
jmpeq_else.9918:
jmpeq_cont.9919:
jmpeq_cont.9917:
	ldw	r2, r1, -2
	subi	r2, r2, 1
	ldw	r5, r1, -5
	ldf	f1, r1, -6
	ldf	f2, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9915:
	jmp	r31
trace_ray.5888:
	ldw	r7, r30, 20
	ldw	r8, r30, 19
	ldw	r9, r30, 18
	ldw	r10, r30, 17
	ldw	r11, r30, 16
	ldw	r12, r30, 15
	ldw	r13, r30, 14
	ldw	r16, r30, 13
	ldw	r17, r30, 12
	ldw	r18, r30, 11
	ldw	r19, r30, 10
	ldw	r20, r30, 9
	ldw	r21, r30, 8
	ldw	r22, r30, 7
	ldw	r23, r30, 6
	ldw	r24, r30, 5
	ldw	r25, r30, 4
	ldw	r26, r30, 3
	ldw	r27, r30, 2
	ldw	r28, r30, 1
	subis	r0, r2, 4
	jmpigt	jmple_else.9923
	stw	r30, r1, -1
	stf	f2, r1, -2
	stw	r9, r1, -3
	stw	r8, r1, -4
	stw	r20, r1, -5
	stw	r13, r1, -6
	stw	r28, r1, -7
	stw	r12, r1, -8
	stw	r17, r1, -9
	stw	r19, r1, -10
	stw	r10, r1, -11
	stw	r6, r1, -12
	stw	r23, r1, -13
	stw	r7, r1, -14
	stw	r24, r1, -15
	stw	r11, r1, -16
	stw	r26, r1, -17
	stw	r18, r1, -18
	stw	r25, r1, -19
	stw	r16, r1, -20
	stw	r27, r1, -21
	stf	f1, r1, -22
	stw	r21, r1, -23
	stw	r2, r1, -24
	stw	r5, r1, -25
	stw	r22, r1, -26
	addi	r2, r6, 0
	stw	r31, r1, -27
	addi	r1, r1, -27
	cali	p_surface_ids.3967
	addi	r1, r1, 27
	ldw	r31, r1, -27
	ldw	r5, r1, -25
	ldw	r30, r1, -26
	stw	r2, r1, -27
	addi	r2, r5, 0
	stw	r31, r1, -28
	addi	r1, r1, -28
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 28
	ldw	r31, r1, -28
	subis	r0, r2, 0
	jmpine	jmpeq_else.9924
	addi	r2, r0, -1
	ldw	r5, r1, -24
	slli	r6, r5, 0
	ldw	r7, r1, -27
	add	r14, r7, r6
	stw	r2, r14, 0
	subis	r0, r5, 0
	jmpine	jmpeq_else.9925
	jmp	r31
jmpeq_else.9925:
	ldw	r2, r1, -25
	ldw	r5, r1, -23
	stw	r31, r1, -28
	addi	r1, r1, -28
	cali	veciprod.3503
	addi	r1, r1, 28
	ldw	r31, r1, -28
	stw	r31, r1, -28
	addi	r1, r1, -28
	cali	fneg.2781
	addi	r1, r1, 28
	ldw	r31, r1, -28
	stf	f1, r1, -28
	stw	r31, r1, -29
	addi	r1, r1, -29
	cali	fispos.2767
	addi	r1, r1, 29
	ldw	r31, r1, -29
	subis	r0, r2, 0
	jmpine	jmpeq_else.9927
	jmp	r31
jmpeq_else.9927:
	ldf	f1, r1, -28
	stw	r31, r1, -29
	addi	r1, r1, -29
	cali	fsqr.2786
	addi	r1, r1, 29
	ldw	r31, r1, -29
	ldf	f2, r1, -28
	fmul	f1, f1, f2
	ldf	f2, r1, -22
	fmul	f1, f1, f2
	ldw	r2, r1, -21
	ldf	f2, r2, 0
	fmul	f1, f1, f2
	ldw	r2, r1, -20
	ldf	f2, r2, 0
	fadd	f2, f2, f1
	stf	f2, r2, 0
	ldf	f2, r2, 1
	fadd	f2, f2, f1
	stf	f2, r2, 1
	ldf	f2, r2, 2
	fadd	f1, f2, f1
	stf	f1, r2, 2
	jmp	r31
jmpeq_else.9924:
	ldw	r2, r1, -19
	ldw	r2, r2, 0
	slli	r5, r2, 0
	ldw	r6, r1, -18
	add	r14, r6, r5
	ldw	r5, r14, 0
	stw	r2, r1, -29
	stw	r5, r1, -30
	addi	r2, r5, 0
	stw	r31, r1, -31
	addi	r1, r1, -31
	cali	o_reflectiontype.3686
	addi	r1, r1, 31
	ldw	r31, r1, -31
	ldw	r5, r1, -30
	stw	r2, r1, -31
	addi	r2, r5, 0
	stw	r31, r1, -32
	addi	r1, r1, -32
	cali	o_diffuse.3822
	addi	r1, r1, 32
	ldw	r31, r1, -32
	ldf	f2, r1, -22
	fmul	f1, f1, f2
	ldw	r2, r1, -30
	ldw	r5, r1, -25
	ldw	r30, r1, -17
	stf	f1, r1, -32
	stw	r31, r1, -33
	addi	r1, r1, -33
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 33
	ldw	r31, r1, -33
	ldw	r2, r1, -16
	ldw	r5, r1, -15
	stw	r31, r1, -33
	addi	r1, r1, -33
	cali	veccpy.3402
	addi	r1, r1, 33
	ldw	r31, r1, -33
	ldw	r2, r1, -30
	ldw	r5, r1, -15
	ldw	r30, r1, -14
	stw	r31, r1, -33
	addi	r1, r1, -33
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 33
	ldw	r31, r1, -33
	ldw	r2, r1, -29
	slai	r2, r2, 2
	ldw	r5, r1, -13
	ldw	r5, r5, 0
	add	r2, r2, r5
	ldw	r5, r1, -24
	slli	r6, r5, 0
	ldw	r7, r1, -27
	add	r14, r7, r6
	stw	r2, r14, 0
	ldw	r2, r1, -12
	stw	r31, r1, -33
	addi	r1, r1, -33
	cali	p_intersection_points.3957
	addi	r1, r1, 33
	ldw	r31, r1, -33
	ldw	r5, r1, -24
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	ldw	r6, r1, -15
	addi	r5, r6, 0
	stw	r31, r1, -33
	addi	r1, r1, -33
	cali	veccpy.3402
	addi	r1, r1, 33
	ldw	r31, r1, -33
	ldw	r2, r1, -12
	stw	r31, r1, -33
	addi	r1, r1, -33
	cali	p_calc_diffuse.3977
	addi	r1, r1, 33
	ldw	r31, r1, -33
	ldw	r5, r1, -30
	stw	r2, r1, -33
	addi	r2, r5, 0
	stw	r31, r1, -34
	addi	r1, r1, -34
	cali	o_diffuse.3822
	addi	r1, r1, 34
	ldw	r31, r1, -34
	addi	r14, r0, 16128	#r14 = 3f000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r31, r1, -34
	addi	r1, r1, -34
	cali	fless.2764
	addi	r1, r1, 34
	ldw	r31, r1, -34
	subis	r0, r2, 0
	jmpine	jmpeq_else.9930
	addi	r2, r0, 1
	ldw	r5, r1, -24
	slli	r6, r5, 0
	ldw	r7, r1, -33
	add	r14, r7, r6
	stw	r2, r14, 0
	ldw	r2, r1, -12
	stw	r31, r1, -34
	addi	r1, r1, -34
	cali	p_energy.3987
	addi	r1, r1, 34
	ldw	r31, r1, -34
	ldw	r5, r1, -24
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -11
	stw	r2, r1, -34
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r31, r1, -35
	addi	r1, r1, -35
	cali	veccpy.3402
	addi	r1, r1, 35
	ldw	r31, r1, -35
	ldw	r2, r1, -24
	slli	r5, r2, 0
	ldw	r6, r1, -34
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r14, r0, 15232	#r14 = 3b800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -32
	fmul	f1, f1, f2
	addi	r2, r5, 0
	stw	r31, r1, -35
	addi	r1, r1, -35
	cali	vecscale.3610
	addi	r1, r1, 35
	ldw	r31, r1, -35
	ldw	r2, r1, -12
	stw	r31, r1, -35
	addi	r1, r1, -35
	cali	p_nvectors.4030
	addi	r1, r1, 35
	ldw	r31, r1, -35
	ldw	r5, r1, -24
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	ldw	r6, r1, -10
	addi	r5, r6, 0
	stw	r31, r1, -35
	addi	r1, r1, -35
	cali	veccpy.3402
	addi	r1, r1, 35
	ldw	r31, r1, -35
	jmpi	jmpeq_cont.9931
jmpeq_else.9930:
	addi	r2, r0, 0
	ldw	r5, r1, -24
	slli	r6, r5, 0
	ldw	r7, r1, -33
	add	r14, r7, r6
	stw	r2, r14, 0
jmpeq_cont.9931:
	addi	r14, r0, -16384	#r14 = c0000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -25
	ldw	r5, r1, -10
	stf	f1, r1, -35
	stw	r31, r1, -36
	addi	r1, r1, -36
	cali	veciprod.3503
	addi	r1, r1, 36
	ldw	r31, r1, -36
	ldf	f2, r1, -35
	fmul	f1, f2, f1
	ldw	r2, r1, -25
	ldw	r5, r1, -10
	stw	r31, r1, -36
	addi	r1, r1, -36
	cali	vecaccum.3537
	addi	r1, r1, 36
	ldw	r31, r1, -36
	ldw	r2, r1, -30
	stw	r31, r1, -36
	addi	r1, r1, -36
	cali	o_hilight.3836
	addi	r1, r1, 36
	ldw	r31, r1, -36
	ldf	f2, r1, -22
	fmul	f1, f2, f1
	addi	r2, r0, 0
	ldw	r5, r1, -9
	ldw	r5, r5, 0
	ldw	r30, r1, -8
	stf	f1, r1, -36
	stw	r31, r1, -37
	addi	r1, r1, -37
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 37
	ldw	r31, r1, -37
	subis	r0, r2, 0
	jmpine	jmpeq_else.9932
	ldw	r2, r1, -10
	ldw	r5, r1, -23
	stw	r31, r1, -37
	addi	r1, r1, -37
	cali	veciprod.3503
	addi	r1, r1, 37
	ldw	r31, r1, -37
	stw	r31, r1, -37
	addi	r1, r1, -37
	cali	fneg.2781
	addi	r1, r1, 37
	ldw	r31, r1, -37
	ldf	f2, r1, -32
	fmul	f1, f1, f2
	ldw	r2, r1, -25
	ldw	r5, r1, -23
	stf	f1, r1, -37
	stw	r31, r1, -38
	addi	r1, r1, -38
	cali	veciprod.3503
	addi	r1, r1, 38
	ldw	r31, r1, -38
	stw	r31, r1, -38
	addi	r1, r1, -38
	cali	fneg.2781
	addi	r1, r1, 38
	ldw	r31, r1, -38
	fmov	f2, f1
	ldf	f1, r1, -37
	ldf	f3, r1, -36
	ldw	r30, r1, -7
	stw	r31, r1, -38
	addi	r1, r1, -38
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 38
	ldw	r31, r1, -38
	jmpi	jmpeq_cont.9933
jmpeq_else.9932:
jmpeq_cont.9933:
	ldw	r2, r1, -15
	ldw	r30, r1, -6
	stw	r31, r1, -38
	addi	r1, r1, -38
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 38
	ldw	r31, r1, -38
	ldw	r2, r1, -5
	ldw	r2, r2, 0
	subi	r2, r2, 1
	ldw	r5, r1, -25
	ldf	f1, r1, -32
	ldf	f2, r1, -36
	ldw	r30, r1, -4
	stw	r31, r1, -38
	addi	r1, r1, -38
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 38
	ldw	r31, r1, -38
	addi	r14, r0, 15820	#r14 = 3dcccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f1, r14, r0
	ldf	f2, r1, -22
	stw	r31, r1, -38
	addi	r1, r1, -38
	cali	fless.2764
	addi	r1, r1, 38
	ldw	r31, r1, -38
	subis	r0, r2, 0
	jmpine	jmpeq_else.9934
	jmp	r31
jmpeq_else.9934:
	ldw	r2, r1, -24
	subis	r0, r2, 4
	jmpilt	jmpge_else.9936
	jmpi	jmpge_cont.9937
jmpge_else.9936:
	addi	r5, r2, 1
	addi	r6, r0, -1
	slli	r5, r5, 0
	ldw	r7, r1, -27
	add	r14, r7, r5
	stw	r6, r14, 0
jmpge_cont.9937:
	ldw	r5, r1, -31
	subis	r0, r5, 2
	jmpine	jmpeq_else.9938
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -30
	stf	f1, r1, -38
	addi	r2, r5, 0
	stw	r31, r1, -39
	addi	r1, r1, -39
	cali	o_diffuse.3822
	addi	r1, r1, 39
	ldw	r31, r1, -39
	ldf	f2, r1, -38
	fsub	f1, f2, f1
	ldf	f2, r1, -22
	fmul	f1, f2, f1
	ldw	r2, r1, -24
	addi	r2, r2, 1
	ldw	r5, r1, -3
	ldf	f2, r5, 0
	ldf	f3, r1, -2
	fadd	f2, f3, f2
	ldw	r5, r1, -25
	ldw	r6, r1, -12
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9938:
	jmp	r31
jmple_else.9923:
	jmp	r31
trace_diffuse_ray.6006:
	ldw	r5, r30, 12
	ldw	r6, r30, 11
	ldw	r7, r30, 10
	ldw	r8, r30, 9
	ldw	r9, r30, 8
	ldw	r10, r30, 7
	ldw	r11, r30, 6
	ldw	r12, r30, 5
	ldw	r13, r30, 4
	ldw	r16, r30, 3
	ldw	r17, r30, 2
	ldw	r18, r30, 1
	stw	r6, r1, -1
	stw	r18, r1, -2
	stf	f1, r1, -3
	stw	r11, r1, -4
	stw	r10, r1, -5
	stw	r7, r1, -6
	stw	r8, r1, -7
	stw	r13, r1, -8
	stw	r5, r1, -9
	stw	r17, r1, -10
	stw	r2, r1, -11
	stw	r9, r1, -12
	stw	r16, r1, -13
	addi	r30, r12, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 14
	ldw	r31, r1, -14
	subis	r0, r2, 0
	jmpine	jmpeq_else.9941
	jmp	r31
jmpeq_else.9941:
	ldw	r2, r1, -13
	ldw	r2, r2, 0
	slli	r2, r2, 0
	ldw	r5, r1, -12
	add	r14, r5, r2
	ldw	r2, r14, 0
	ldw	r5, r1, -11
	stw	r2, r1, -14
	addi	r2, r5, 0
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	d_vec.4040
	addi	r1, r1, 15
	ldw	r31, r1, -15
	mov	r5, r2
	ldw	r2, r1, -14
	ldw	r30, r1, -10
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldw	r2, r1, -14
	ldw	r5, r1, -8
	ldw	r30, r1, -9
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	addi	r2, r0, 0
	ldw	r5, r1, -7
	ldw	r5, r5, 0
	ldw	r30, r1, -6
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	subis	r0, r2, 0
	jmpine	jmpeq_else.9943
	ldw	r2, r1, -5
	ldw	r5, r1, -4
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	veciprod.3503
	addi	r1, r1, 15
	ldw	r31, r1, -15
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	fneg.2781
	addi	r1, r1, 15
	ldw	r31, r1, -15
	stf	f1, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fispos.2767
	addi	r1, r1, 16
	ldw	r31, r1, -16
	subis	r0, r2, 0
	jmpine	jmpeq_else.9944
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmpi	jmpeq_cont.9945
jmpeq_else.9944:
	ldf	f1, r1, -15
jmpeq_cont.9945:
	ldf	f2, r1, -3
	fmul	f1, f2, f1
	ldw	r2, r1, -14
	stf	f1, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	o_diffuse.3822
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -16
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldw	r5, r1, -1
	jmpi	vecaccum.3537
jmpeq_else.9943:
	jmp	r31
iter_trace_diffuse_rays.6030:
	ldw	r8, r30, 1
	subis	r0, r7, 0
	jmpilt	jmpge_else.9947
	slli	r9, r7, 0
	add	r14, r2, r9
	ldw	r9, r14, 0
	stw	r6, r1, -1
	stw	r30, r1, -2
	stw	r8, r1, -3
	stw	r2, r1, -4
	stw	r7, r1, -5
	stw	r5, r1, -6
	addi	r2, r9, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	d_vec.4040
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	veciprod.3503
	addi	r1, r1, 7
	ldw	r31, r1, -7
	stf	f1, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fisneg.2770
	addi	r1, r1, 8
	ldw	r31, r1, -8
	subis	r0, r2, 0
	jmpine	jmpeq_else.9948
	ldw	r2, r1, -5
	slli	r5, r2, 0
	ldw	r6, r1, -4
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r14, r0, 17174	#r14 = 43160000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -7
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r30, r1, -3
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 8
	ldw	r31, r1, -8
	jmpi	jmpeq_cont.9949
jmpeq_else.9948:
	ldw	r2, r1, -5
	addi	r5, r2, 1
	slli	r5, r5, 0
	ldw	r6, r1, -4
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r14, r0, -15594	#r14 = c3160000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -7
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r30, r1, -3
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 8
	ldw	r31, r1, -8
jmpeq_cont.9949:
	ldw	r2, r1, -5
	subi	r7, r2, 2
	ldw	r2, r1, -4
	ldw	r5, r1, -6
	ldw	r6, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9947:
	jmp	r31
trace_diffuse_rays.6052:
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r2, r1, -3
	stw	r8, r1, -4
	addi	r2, r6, 0
	addi	r30, r7, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
	addi	r7, r0, 118
	ldw	r2, r1, -3
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
trace_diffuse_ray_80percent.6058:
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r7, r1, -3
	stw	r8, r1, -4
	stw	r2, r1, -5
	subis	r0, r2, 0
	jmpine	jmpeq_else.9951
	jmpi	jmpeq_cont.9952
jmpeq_else.9951:
	ldw	r9, r8, 0
	addi	r2, r9, 0
	addi	r30, r7, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
jmpeq_cont.9952:
	ldw	r2, r1, -5
	subis	r0, r2, 1
	jmpine	jmpeq_else.9953
	jmpi	jmpeq_cont.9954
jmpeq_else.9953:
	ldw	r5, r1, -4
	ldw	r6, r5, 1
	ldw	r7, r1, -2
	ldw	r8, r1, -1
	ldw	r30, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
jmpeq_cont.9954:
	ldw	r2, r1, -5
	subis	r0, r2, 2
	jmpine	jmpeq_else.9955
	jmpi	jmpeq_cont.9956
jmpeq_else.9955:
	ldw	r5, r1, -4
	ldw	r6, r5, 2
	ldw	r7, r1, -2
	ldw	r8, r1, -1
	ldw	r30, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
jmpeq_cont.9956:
	ldw	r2, r1, -5
	subis	r0, r2, 3
	jmpine	jmpeq_else.9957
	jmpi	jmpeq_cont.9958
jmpeq_else.9957:
	ldw	r5, r1, -4
	ldw	r6, r5, 3
	ldw	r7, r1, -2
	ldw	r8, r1, -1
	ldw	r30, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
jmpeq_cont.9958:
	ldw	r2, r1, -5
	subis	r0, r2, 4
	jmpine	jmpeq_else.9959
	jmp	r31
jmpeq_else.9959:
	ldw	r2, r1, -4
	ldw	r2, r2, 4
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
calc_diffuse_using_1point.6081:
	ldw	r6, r30, 3
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	stw	r7, r1, -1
	stw	r6, r1, -2
	stw	r8, r1, -3
	stw	r5, r1, -4
	stw	r2, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	p_received_ray_20percent.3997
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r5, r1, -5
	stw	r2, r1, -6
	addi	r2, r5, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	p_nvectors.4030
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -5
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	p_intersection_points.3957
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r5, r1, -5
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	p_energy.3987
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r5, r1, -4
	slli	r6, r5, 0
	ldw	r7, r1, -6
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -3
	stw	r2, r1, -9
	addi	r5, r6, 0
	addi	r2, r7, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	veccpy.3402
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -5
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	p_group_id.4007
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r5, r1, -4
	slli	r6, r5, 0
	ldw	r7, r1, -7
	add	r14, r7, r6
	ldw	r6, r14, 0
	slli	r7, r5, 0
	ldw	r8, r1, -8
	add	r14, r8, r7
	ldw	r7, r14, 0
	ldw	r30, r1, -2
	addi	r5, r6, 0
	addi	r6, r7, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -4
	slli	r2, r2, 0
	ldw	r5, r1, -9
	add	r14, r5, r2
	ldw	r5, r14, 0
	ldw	r2, r1, -1
	ldw	r6, r1, -3
	jmpi	vecaccumv.3627
calc_diffuse_using_5points.6095:
	ldw	r9, r30, 2
	ldw	r10, r30, 1
	slli	r11, r2, 0
	add	r14, r5, r11
	ldw	r5, r14, 0
	stw	r9, r1, -1
	stw	r10, r1, -2
	stw	r8, r1, -3
	stw	r7, r1, -4
	stw	r6, r1, -5
	stw	r2, r1, -6
	addi	r2, r5, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	p_received_ray_20percent.3997
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -6
	subi	r6, r5, 1
	slli	r6, r6, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -7
	addi	r2, r6, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	p_received_ray_20percent.3997
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r5, r1, -6
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -8
	addi	r2, r6, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	p_received_ray_20percent.3997
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r5, r1, -6
	addi	r6, r5, 1
	slli	r6, r6, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -9
	addi	r2, r6, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	p_received_ray_20percent.3997
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r5, r1, -6
	slli	r6, r5, 0
	ldw	r7, r1, -4
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -10
	addi	r2, r6, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	p_received_ray_20percent.3997
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r5, r1, -3
	slli	r6, r5, 0
	ldw	r7, r1, -7
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -2
	stw	r2, r1, -11
	addi	r5, r6, 0
	addi	r2, r7, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	veccpy.3402
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -8
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	vecadd.3564
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -9
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	vecadd.3564
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -10
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	vecadd.3564
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -11
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	vecadd.3564
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -6
	slli	r2, r2, 0
	ldw	r5, r1, -5
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	p_energy.3987
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r5, r1, -3
	slli	r5, r5, 0
	add	r14, r2, r5
	ldw	r5, r14, 0
	ldw	r2, r1, -1
	ldw	r6, r1, -2
	jmpi	vecaccumv.3627
do_without_neighbors.6128:
	ldw	r6, r30, 1
	subis	r0, r5, 4
	jmpigt	jmple_else.9961
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	stw	r5, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	p_surface_ids.3967
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r5, r1, -4
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpilt	jmpge_else.9962
	ldw	r2, r1, -3
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	p_calc_diffuse.3977
	addi	r1, r1, 5
	ldw	r31, r1, -5
	ldw	r5, r1, -4
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9963
	jmpi	jmpeq_cont.9964
jmpeq_else.9963:
	ldw	r2, r1, -3
	ldw	r30, r1, -2
	stw	r31, r1, -5
	addi	r1, r1, -5
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 5
	ldw	r31, r1, -5
jmpeq_cont.9964:
	ldw	r2, r1, -4
	addi	r5, r2, 1
	ldw	r2, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9962:
	jmp	r31
jmple_else.9961:
	jmp	r31
neighbors_exist.6141:
	ldw	r6, r30, 1
	ldw	r7, r6, 1
	addi	r8, r5, 1
	subs	r0, r7, r8
	jmpigt	jmple_else.9967
	addi	r2, r0, 0
	jmp	r31
jmple_else.9967:
	subis	r0, r5, 0
	jmpigt	jmple_else.9968
	addi	r2, r0, 0
	jmp	r31
jmple_else.9968:
	ldw	r5, r6, 0
	addi	r6, r2, 1
	subs	r0, r5, r6
	jmpigt	jmple_else.9969
	addi	r2, r0, 0
	jmp	r31
jmple_else.9969:
	subis	r0, r2, 0
	jmpigt	jmple_else.9970
	addi	r2, r0, 0
	jmp	r31
jmple_else.9970:
	addi	r2, r0, 1
	jmp	r31
get_surface_id.6155:
	stw	r5, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	p_surface_ids.3967
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r5, r1, -1
	slli	r5, r5, 0
	add	r14, r2, r5
	ldw	r2, r14, 0
	jmp	r31
neighbors_are_available.6159:
	slli	r9, r2, 0
	add	r14, r6, r9
	ldw	r9, r14, 0
	stw	r6, r1, -1
	stw	r7, r1, -2
	stw	r8, r1, -3
	stw	r5, r1, -4
	stw	r2, r1, -5
	addi	r5, r8, 0
	addi	r2, r9, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	get_surface_id.6155
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r5, r1, -5
	slli	r6, r5, 0
	ldw	r7, r1, -4
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -3
	stw	r2, r1, -6
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	get_surface_id.6155
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.9971
	ldw	r2, r1, -5
	slli	r6, r2, 0
	ldw	r7, r1, -2
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	get_surface_id.6155
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.9972
	ldw	r2, r1, -5
	subi	r6, r2, 1
	slli	r6, r6, 0
	ldw	r7, r1, -1
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r8, r1, -3
	addi	r5, r8, 0
	addi	r2, r6, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	get_surface_id.6155
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.9973
	ldw	r2, r1, -5
	addi	r2, r2, 1
	slli	r2, r2, 0
	ldw	r6, r1, -1
	add	r14, r6, r2
	ldw	r2, r14, 0
	ldw	r6, r1, -3
	addi	r5, r6, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	get_surface_id.6155
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.9974
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9974:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9973:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9972:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9971:
	addi	r2, r0, 0
	jmp	r31
try_exploit_neighbors.6179:
	ldw	r10, r30, 2
	ldw	r11, r30, 1
	slli	r12, r2, 0
	add	r14, r7, r12
	ldw	r12, r14, 0
	subis	r0, r9, 4
	jmpigt	jmple_else.9975
	stw	r5, r1, -1
	stw	r30, r1, -2
	stw	r11, r1, -3
	stw	r12, r1, -4
	stw	r10, r1, -5
	stw	r9, r1, -6
	stw	r8, r1, -7
	stw	r7, r1, -8
	stw	r6, r1, -9
	stw	r2, r1, -10
	addi	r5, r9, 0
	addi	r2, r12, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	get_surface_id.6155
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpilt	jmpge_else.9976
	ldw	r2, r1, -10
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r7, r1, -7
	ldw	r8, r1, -6
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	neighbors_are_available.6159
	addi	r1, r1, 11
	ldw	r31, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9977
	ldw	r2, r1, -10
	slli	r2, r2, 0
	ldw	r5, r1, -8
	add	r14, r5, r2
	ldw	r2, r14, 0
	ldw	r5, r1, -6
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9977:
	ldw	r2, r1, -4
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	p_calc_diffuse.3977
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r8, r1, -6
	slli	r5, r8, 0
	add	r14, r2, r5
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9978
	jmpi	jmpeq_cont.9979
jmpeq_else.9978:
	ldw	r2, r1, -10
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r7, r1, -7
	ldw	r30, r1, -3
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
jmpeq_cont.9979:
	ldw	r2, r1, -6
	addi	r9, r2, 1
	ldw	r2, r1, -10
	ldw	r5, r1, -1
	ldw	r6, r1, -9
	ldw	r7, r1, -8
	ldw	r8, r1, -7
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9976:
	jmp	r31
jmple_else.9975:
	jmp	r31
write_ppm_header.6199:
	ldw	r2, r30, 1
	addi	r5, r0, 80
	prt1	r5
	addi	r5, r0, 51
	prt1	r5
	addi	r5, r0, 10
	prt1	r5
	ldw	r5, r2, 0
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	print_int.3007
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r2, r0, 32
	prt1	r2
	ldw	r2, r1, -1
	ldw	r2, r2, 1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	print_int.3007
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r2, r0, 32
	prt1	r2
	addi	r2, r0, 255
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	print_int.3007
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r2, r0, 10
	prt1	r2
	jmp	r31
write_rgb_element.6222:
	stw	r31, r1, -1
	addi	r1, r1, -1
	cali	external_int_of_float
	addi	r1, r1, 1
	ldw	r31, r1, -1
	subis	r0, r2, 255
	jmpigt	jmple_else.9982
	subis	r0, r2, 0
	jmpilt	jmpge_else.9984
	jmpi	jmpge_cont.9985
jmpge_else.9984:
	addi	r2, r0, 0
jmpge_cont.9985:
	jmpi	jmple_cont.9983
jmple_else.9982:
	addi	r2, r0, 255
jmple_cont.9983:
	jmpi	print_int.3007
write_rgb.6228:
	ldw	r2, r30, 1
	ldf	f1, r2, 0
	stw	r2, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	write_rgb_element.6222
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r2, r0, 32
	prt1	r2
	ldw	r2, r1, -1
	ldf	f1, r2, 1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	write_rgb_element.6222
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r2, r0, 32
	prt1	r2
	ldw	r2, r1, -1
	ldf	f1, r2, 2
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	write_rgb_element.6222
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r2, r0, 10
	prt1	r2
	jmp	r31
pretrace_diffuse_rays.6244:
	ldw	r6, r30, 3
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	subis	r0, r5, 4
	jmpigt	jmple_else.9986
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r7, r1, -3
	stw	r8, r1, -4
	stw	r5, r1, -5
	stw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	get_surface_id.6155
	addi	r1, r1, 7
	ldw	r31, r1, -7
	subis	r0, r2, 0
	jmpilt	jmpge_else.9987
	ldw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	p_calc_diffuse.3977
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -5
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9988
	jmpi	jmpeq_cont.9989
jmpeq_else.9988:
	ldw	r2, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	p_group_id.4007
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r5, r1, -4
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	vecbzero.3399
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r2, r1, -6
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	p_nvectors.4030
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r5, r1, -6
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	p_intersection_points.3957
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r5, r1, -7
	slli	r5, r5, 0
	ldw	r6, r1, -3
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -5
	slli	r7, r6, 0
	ldw	r8, r1, -8
	add	r14, r8, r7
	ldw	r7, r14, 0
	slli	r8, r6, 0
	add	r14, r2, r8
	ldw	r2, r14, 0
	ldw	r30, r1, -2
	addi	r6, r2, 0
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r2, r1, -6
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	p_received_ray_20percent.3997
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r5, r1, -5
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	ldw	r6, r1, -4
	addi	r5, r6, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	veccpy.3402
	addi	r1, r1, 9
	ldw	r31, r1, -9
jmpeq_cont.9989:
	ldw	r2, r1, -5
	addi	r5, r2, 1
	ldw	r2, r1, -6
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9987:
	jmp	r31
jmple_else.9986:
	jmp	r31
pretrace_pixels.6266:
	ldw	r7, r30, 9
	ldw	r8, r30, 8
	ldw	r9, r30, 7
	ldw	r10, r30, 6
	ldw	r11, r30, 5
	ldw	r12, r30, 4
	ldw	r13, r30, 3
	ldw	r16, r30, 2
	ldw	r17, r30, 1
	subis	r0, r5, 0
	jmpilt	jmpge_else.9992
	ldf	f4, r11, 0
	ldw	r11, r17, 0
	sub	r11, r5, r11
	stw	r30, r1, -1
	stw	r16, r1, -2
	stw	r6, r1, -3
	stw	r8, r1, -4
	stw	r2, r1, -5
	stw	r5, r1, -6
	stw	r7, r1, -7
	stw	r9, r1, -8
	stw	r12, r1, -9
	stf	f3, r1, -10
	stf	f2, r1, -11
	stw	r13, r1, -12
	stf	f1, r1, -13
	stw	r10, r1, -14
	stf	f4, r1, -15
	addi	r2, r11, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	external_float_of_int
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldf	f2, r1, -15
	fmul	f1, f2, f1
	ldw	r2, r1, -14
	ldf	f2, r2, 0
	fmul	f2, f1, f2
	ldf	f3, r1, -13
	fadd	f2, f2, f3
	ldw	r5, r1, -12
	stf	f2, r5, 0
	ldf	f2, r2, 1
	fmul	f2, f1, f2
	ldf	f4, r1, -11
	fadd	f2, f2, f4
	stf	f2, r5, 1
	ldf	f2, r2, 2
	fmul	f1, f1, f2
	ldf	f2, r1, -10
	fadd	f1, f1, f2
	stf	f1, r5, 2
	addi	r2, r0, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	vecunit_sgn.3468
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -9
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	vecbzero.3399
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -8
	ldw	r5, r1, -7
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	veccpy.3402
	addi	r1, r1, 16
	ldw	r31, r1, -16
	addi	r2, r0, 0
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -6
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r8, r1, -12
	ldw	r30, r1, -4
	addi	r5, r8, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -6
	slli	r5, r2, 0
	ldw	r6, r1, -5
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	p_rgb.3947
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r5, r1, -9
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	veccpy.3402
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -6
	slli	r5, r2, 0
	ldw	r6, r1, -5
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r7, r1, -3
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	p_set_group_id.4018
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -6
	slli	r5, r2, 0
	ldw	r6, r1, -5
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r7, r0, 0
	ldw	r30, r1, -2
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r2, r1, -6
	subi	r2, r2, 1
	addi	r5, r0, 1
	ldw	r6, r1, -3
	stw	r2, r1, -16
	addi	r2, r6, 0
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	add_mod5.3375
	addi	r1, r1, 17
	ldw	r31, r1, -17
	mov	r6, r2
	ldw	r2, r1, -5
	ldw	r5, r1, -16
	ldf	f1, r1, -13
	ldf	f2, r1, -11
	ldf	f3, r1, -10
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9992:
	jmp	r31
pretrace_line.6320:
	ldw	r7, r30, 6
	ldw	r8, r30, 5
	ldw	r9, r30, 4
	ldw	r10, r30, 3
	ldw	r11, r30, 2
	ldw	r12, r30, 1
	ldf	f1, r9, 0
	ldw	r9, r12, 1
	sub	r5, r5, r9
	stw	r6, r1, -1
	stw	r2, r1, -2
	stw	r10, r1, -3
	stw	r11, r1, -4
	stw	r7, r1, -5
	stw	r8, r1, -6
	stf	f1, r1, -7
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	external_float_of_int
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldw	r2, r1, -6
	ldf	f2, r2, 0
	fmul	f2, f1, f2
	ldw	r5, r1, -5
	ldf	f3, r5, 0
	fadd	f2, f2, f3
	ldf	f3, r2, 1
	fmul	f3, f1, f3
	ldf	f4, r5, 1
	fadd	f3, f3, f4
	ldf	f4, r2, 2
	fmul	f1, f1, f4
	ldf	f4, r5, 2
	fadd	f1, f1, f4
	ldw	r2, r1, -4
	ldw	r2, r2, 0
	subi	r5, r2, 1
	ldw	r2, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	fmov	f30, f3
	fmov	f3, f1
	fmov	f1, f2
	fmov	f2, f30
	ldw	r29, r30, 0
	jmp	r29
scan_pixel.6353:
	ldw	r9, r30, 6
	ldw	r10, r30, 5
	ldw	r11, r30, 4
	ldw	r12, r30, 3
	ldw	r13, r30, 2
	ldw	r16, r30, 1
	ldw	r13, r13, 0
	subs	r0, r13, r2
	jmpigt	jmple_else.9994
	jmp	r31
jmple_else.9994:
	slli	r13, r2, 0
	add	r14, r7, r13
	ldw	r13, r14, 0
	stw	r30, r1, -1
	stw	r9, r1, -2
	stw	r6, r1, -3
	stw	r10, r1, -4
	stw	r16, r1, -5
	stw	r7, r1, -6
	stw	r8, r1, -7
	stw	r5, r1, -8
	stw	r2, r1, -9
	stw	r12, r1, -10
	stw	r11, r1, -11
	addi	r2, r13, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	p_rgb.3947
	addi	r1, r1, 12
	ldw	r31, r1, -12
	mov	r5, r2
	ldw	r2, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	veccpy.3402
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -9
	ldw	r5, r1, -8
	ldw	r6, r1, -7
	ldw	r30, r1, -10
	stw	r31, r1, -12
	addi	r1, r1, -12
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 12
	ldw	r31, r1, -12
	subis	r0, r2, 0
	jmpine	jmpeq_else.9996
	ldw	r2, r1, -9
	slli	r5, r2, 0
	ldw	r6, r1, -6
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r7, r0, 0
	ldw	r30, r1, -5
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 12
	ldw	r31, r1, -12
	jmpi	jmpeq_cont.9997
jmpeq_else.9996:
	addi	r9, r0, 0
	ldw	r2, r1, -9
	ldw	r5, r1, -8
	ldw	r6, r1, -3
	ldw	r7, r1, -6
	ldw	r8, r1, -7
	ldw	r30, r1, -4
	stw	r31, r1, -12
	addi	r1, r1, -12
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 12
	ldw	r31, r1, -12
jmpeq_cont.9997:
	ldw	r30, r1, -2
	stw	r31, r1, -12
	addi	r1, r1, -12
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -9
	addi	r2, r2, 1
	ldw	r5, r1, -8
	ldw	r6, r1, -3
	ldw	r7, r1, -6
	ldw	r8, r1, -7
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
scan_line.6374:
	ldw	r9, r30, 3
	ldw	r10, r30, 2
	ldw	r11, r30, 1
	ldw	r12, r11, 1
	subs	r0, r12, r2
	jmpigt	jmple_else.9998
	jmp	r31
jmple_else.9998:
	ldw	r11, r11, 1
	subi	r11, r11, 1
	stw	r30, r1, -1
	stw	r8, r1, -2
	stw	r7, r1, -3
	stw	r6, r1, -4
	stw	r5, r1, -5
	stw	r2, r1, -6
	stw	r9, r1, -7
	subs	r0, r11, r2
	jmpigt	jmple_else.10000
	jmpi	jmple_cont.10001
jmple_else.10000:
	addi	r11, r2, 1
	addi	r6, r8, 0
	addi	r5, r11, 0
	addi	r2, r7, 0
	addi	r30, r10, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 8
	ldw	r31, r1, -8
jmple_cont.10001:
	addi	r2, r0, 0
	ldw	r5, r1, -6
	ldw	r6, r1, -5
	ldw	r7, r1, -4
	ldw	r8, r1, -3
	ldw	r30, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r2, r1, -6
	addi	r2, r2, 1
	addi	r5, r0, 2
	ldw	r6, r1, -2
	stw	r2, r1, -8
	addi	r2, r6, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	add_mod5.3375
	addi	r1, r1, 9
	ldw	r31, r1, -9
	mov	r8, r2
	ldw	r2, r1, -8
	ldw	r5, r1, -4
	ldw	r6, r1, -3
	ldw	r7, r1, -5
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
create_float5x3array.6395:
	addi	r2, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r31, r1, -1
	addi	r1, r1, -1
	cali	external_create_float_array
	addi	r1, r1, 1
	ldw	r31, r1, -1
	mov	r5, r2
	addi	r2, r0, 5
	stw	r31, r1, -1
	addi	r1, r1, -1
	cali	external_create_array
	addi	r1, r1, 1
	ldw	r31, r1, -1
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	external_create_float_array
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r5, r1, -1
	stw	r2, r5, 1
	addi	r2, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	external_create_float_array
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r5, r1, -1
	stw	r2, r5, 2
	addi	r2, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	external_create_float_array
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r5, r1, -1
	stw	r2, r5, 3
	addi	r2, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	external_create_float_array
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldw	r5, r1, -1
	stw	r2, r5, 4
	addi	r2, r5, 0
	jmp	r31
create_pixel.6422:
	addi	r2, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r31, r1, -1
	addi	r1, r1, -1
	cali	external_create_float_array
	addi	r1, r1, 1
	ldw	r31, r1, -1
	stw	r2, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	create_float5x3array.6395
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r5, r0, 5
	addi	r6, r0, 0
	stw	r2, r1, -2
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	external_create_array
	addi	r1, r1, 3
	ldw	r31, r1, -3
	addi	r5, r0, 5
	addi	r6, r0, 0
	stw	r2, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	external_create_array
	addi	r1, r1, 4
	ldw	r31, r1, -4
	stw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	create_float5x3array.6395
	addi	r1, r1, 5
	ldw	r31, r1, -5
	stw	r2, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	create_float5x3array.6395
	addi	r1, r1, 6
	ldw	r31, r1, -6
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -6
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	external_create_array
	addi	r1, r1, 7
	ldw	r31, r1, -7
	stw	r2, r1, -7
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	create_float5x3array.6395
	addi	r1, r1, 8
	ldw	r31, r1, -8
	addi	r5, r4, 0
	addi	r4, r4, 8
	stw	r2, r5, 7
	ldw	r2, r1, -7
	stw	r2, r5, 6
	ldw	r2, r1, -6
	stw	r2, r5, 5
	ldw	r2, r1, -5
	stw	r2, r5, 4
	ldw	r2, r1, -4
	stw	r2, r5, 3
	ldw	r2, r1, -3
	stw	r2, r5, 2
	ldw	r2, r1, -2
	stw	r2, r5, 1
	ldw	r2, r1, -1
	stw	r2, r5, 0
	addi	r2, r5, 0
	jmp	r31
init_line_elements.6444:
	subis	r0, r5, 0
	jmpilt	jmpge_else.10002
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	create_pixel.6422
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -1
	add	r14, r7, r6
	stw	r2, r14, 0
	subi	r5, r5, 1
	addi	r2, r7, 0
	jmpi	init_line_elements.6444
jmpge_else.10002:
	jmp	r31
create_pixelline.6453:
	ldw	r2, r30, 1
	ldw	r5, r2, 0
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	create_pixel.6422
	addi	r1, r1, 3
	ldw	r31, r1, -3
	mov	r5, r2
	ldw	r2, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	external_create_array
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r5, r1, -1
	ldw	r5, r5, 0
	subi	r5, r5, 2
	jmpi	init_line_elements.6444
tan.6464:
	stf	f1, r1, -1
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	sin.3205
	addi	r1, r1, 2
	ldw	r31, r1, -2
	ldf	f2, r1, -1
	stf	f1, r1, -2
	fmov	f1, f2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	cos.3230
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldf	f2, r1, -2
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmp	r31
adjust_position.6468:
	fmul	f1, f1, f1
	addi	r14, r0, 15820	#r14 = 3dcccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f3, r14, r0
	fadd	f1, f1, f3
	fsqr	f1, f1
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	finv	f31, f1, f0
	fmul	f3, f3, f31
	stf	f1, r1, -1
	stf	f2, r1, -2
	fmov	f1, f3
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	atan.3158
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldf	f2, r1, -2
	fmul	f1, f1, f2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	tan.6464
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldf	f2, r1, -1
	fmul	f1, f1, f2
	jmp	r31
calc_dirvec.6480:
	ldw	r7, r30, 1
	subis	r0, r2, 5
	jmpilt	jmpge_else.10003
	stw	r6, r1, -1
	stw	r7, r1, -2
	stw	r5, r1, -3
	stf	f1, r1, -4
	stf	f2, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	fsqr.2786
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldf	f2, r1, -5
	stf	f1, r1, -6
	fmov	f1, f2
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	fsqr.2786
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f2, r1, -6
	fadd	f1, f2, f1
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fadd	f1, f1, f2
	fsqr	f1, f1
	ldf	f2, r1, -4
	finv	f31, f1, f0
	fmul	f2, f2, f31
	ldf	f3, r1, -5
	finv	f31, f1, f0
	fmul	f3, f3, f31
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	finv	f31, f1, f0
	fmul	f1, f4, f31
	ldw	r2, r1, -3
	slli	r2, r2, 0
	ldw	r5, r1, -2
	add	r14, r5, r2
	ldw	r2, r14, 0
	ldw	r5, r1, -1
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r6, r14, 0
	stw	r2, r1, -7
	stf	f1, r1, -8
	stf	f3, r1, -9
	stf	f2, r1, -10
	addi	r2, r6, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	d_vec.4040
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f1, r1, -10
	ldf	f2, r1, -9
	ldf	f3, r1, -8
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	vecset.3381
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r2, r1, -1
	addi	r5, r2, 40
	slli	r5, r5, 0
	ldw	r6, r1, -7
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	d_vec.4040
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f1, r1, -9
	stw	r2, r1, -11
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	fneg.2781
	addi	r1, r1, 12
	ldw	r31, r1, -12
	fmov	f3, f1
	ldw	r2, r1, -11
	ldf	f1, r1, -10
	ldf	f2, r1, -8
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	vecset.3381
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldw	r2, r1, -1
	addi	r5, r2, 80
	slli	r5, r5, 0
	ldw	r6, r1, -7
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	d_vec.4040
	addi	r1, r1, 12
	ldw	r31, r1, -12
	ldf	f1, r1, -10
	stw	r2, r1, -12
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	fneg.2781
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -9
	stf	f1, r1, -13
	fmov	f1, f2
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	fneg.2781
	addi	r1, r1, 14
	ldw	r31, r1, -14
	fmov	f3, f1
	ldw	r2, r1, -12
	ldf	f1, r1, -8
	ldf	f2, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	vecset.3381
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldw	r2, r1, -1
	addi	r5, r2, 1
	slli	r5, r5, 0
	ldw	r6, r1, -7
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	d_vec.4040
	addi	r1, r1, 14
	ldw	r31, r1, -14
	ldf	f1, r1, -10
	stw	r2, r1, -14
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	fneg.2781
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -9
	stf	f1, r1, -15
	fmov	f1, f2
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	fneg.2781
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldf	f2, r1, -8
	stf	f1, r1, -16
	fmov	f1, f2
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	fneg.2781
	addi	r1, r1, 17
	ldw	r31, r1, -17
	fmov	f3, f1
	ldw	r2, r1, -14
	ldf	f1, r1, -15
	ldf	f2, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	vecset.3381
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldw	r2, r1, -1
	addi	r5, r2, 41
	slli	r5, r5, 0
	ldw	r6, r1, -7
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	d_vec.4040
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f1, r1, -10
	stw	r2, r1, -17
	stw	r31, r1, -18
	addi	r1, r1, -18
	cali	fneg.2781
	addi	r1, r1, 18
	ldw	r31, r1, -18
	ldf	f2, r1, -8
	stf	f1, r1, -18
	fmov	f1, f2
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	fneg.2781
	addi	r1, r1, 19
	ldw	r31, r1, -19
	fmov	f2, f1
	ldw	r2, r1, -17
	ldf	f1, r1, -18
	ldf	f3, r1, -9
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	vecset.3381
	addi	r1, r1, 19
	ldw	r31, r1, -19
	ldw	r2, r1, -1
	addi	r2, r2, 81
	slli	r2, r2, 0
	ldw	r5, r1, -7
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	d_vec.4040
	addi	r1, r1, 19
	ldw	r31, r1, -19
	ldf	f1, r1, -8
	stw	r2, r1, -19
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	fneg.2781
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r2, r1, -19
	ldf	f2, r1, -10
	ldf	f3, r1, -9
	jmpi	vecset.3381
jmpge_else.10003:
	stf	f3, r1, -20
	stw	r6, r1, -1
	stw	r5, r1, -3
	stw	r30, r1, -21
	stf	f4, r1, -22
	stw	r2, r1, -23
	fmov	f1, f2
	fmov	f2, f3
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	adjust_position.6468
	addi	r1, r1, 24
	ldw	r31, r1, -24
	ldw	r2, r1, -23
	addi	r2, r2, 1
	ldf	f2, r1, -22
	stf	f1, r1, -24
	stw	r2, r1, -25
	stw	r31, r1, -26
	addi	r1, r1, -26
	cali	adjust_position.6468
	addi	r1, r1, 26
	ldw	r31, r1, -26
	fmov	f2, f1
	ldw	r2, r1, -25
	ldw	r5, r1, -3
	ldw	r6, r1, -1
	ldf	f1, r1, -24
	ldf	f3, r1, -20
	ldf	f4, r1, -22
	ldw	r30, r1, -21
	ldw	r29, r30, 0
	jmp	r29
calc_dirvecs.6540:
	ldw	r7, r30, 1
	subis	r0, r2, 0
	jmpilt	jmpge_else.10004
	stw	r30, r1, -1
	stw	r2, r1, -2
	stf	f1, r1, -3
	stw	r6, r1, -4
	stw	r5, r1, -5
	stw	r7, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	external_float_of_int
	addi	r1, r1, 7
	ldw	r31, r1, -7
	addi	r14, r0, 15948	#r14 = 3e4ccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16230	#r14 = 3f666666
	slli	r14, r14, 16
	oori	r14, r14, 26214
	mif	f2, r14, r0
	fsub	f3, f1, f2
	addi	r2, r0, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r5, r1, -5
	ldw	r6, r1, -4
	ldf	f4, r1, -3
	ldw	r30, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -2
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	external_float_of_int
	addi	r1, r1, 7
	ldw	r31, r1, -7
	addi	r14, r0, 15948	#r14 = 3e4ccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 15820	#r14 = 3dcccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	fadd	f3, f1, f2
	addi	r2, r0, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r5, r1, -4
	addi	r6, r5, 2
	ldw	r7, r1, -5
	ldf	f4, r1, -3
	ldw	r30, r1, -6
	addi	r5, r7, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldw	r2, r1, -2
	subi	r2, r2, 1
	addi	r5, r0, 1
	ldw	r6, r1, -5
	stw	r2, r1, -7
	addi	r2, r6, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	add_mod5.3375
	addi	r1, r1, 8
	ldw	r31, r1, -8
	mov	r5, r2
	ldw	r2, r1, -7
	ldw	r6, r1, -4
	ldf	f1, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10004:
	jmp	r31
calc_dirvec_rows.6570:
	ldw	r7, r30, 1
	subis	r0, r2, 0
	jmpilt	jmpge_else.10006
	stw	r30, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stw	r5, r1, -4
	stw	r7, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	external_float_of_int
	addi	r1, r1, 6
	ldw	r31, r1, -6
	addi	r14, r0, 15948	#r14 = 3e4ccccd
	slli	r14, r14, 16
	addi	r14, r14, 19661
	addi	r14, r14, 32767
	addi	r14, r14, 1
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16230	#r14 = 3f666666
	slli	r14, r14, 16
	oori	r14, r14, 26214
	mif	f2, r14, r0
	fsub	f1, f1, f2
	addi	r2, r0, 4
	ldw	r5, r1, -4
	ldw	r6, r1, -3
	ldw	r30, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -2
	subi	r2, r2, 1
	addi	r5, r0, 2
	ldw	r6, r1, -4
	stw	r2, r1, -6
	addi	r2, r6, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	add_mod5.3375
	addi	r1, r1, 7
	ldw	r31, r1, -7
	mov	r5, r2
	ldw	r2, r1, -3
	addi	r6, r2, 4
	ldw	r2, r1, -6
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10006:
	jmp	r31
create_dirvec.6588:
	ldw	r2, r30, 1
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	external_create_float_array
	addi	r1, r1, 2
	ldw	r31, r1, -2
	mov	r5, r2
	ldw	r2, r1, -1
	ldw	r2, r2, 0
	stw	r5, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	external_create_array
	addi	r1, r1, 3
	ldw	r31, r1, -3
	addi	r5, r4, 0
	addi	r4, r4, 2
	stw	r2, r5, 1
	ldw	r2, r1, -2
	stw	r2, r5, 0
	addi	r2, r5, 0
	jmp	r31
create_dirvec_elements.6596:
	ldw	r6, r30, 1
	subis	r0, r5, 0
	jmpilt	jmpge_else.10008
	stw	r30, r1, -1
	stw	r2, r1, -2
	stw	r5, r1, -3
	addi	r30, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r5, r1, -3
	slli	r6, r5, 0
	ldw	r7, r1, -2
	add	r14, r7, r6
	stw	r2, r14, 0
	subi	r5, r5, 1
	ldw	r30, r1, -1
	addi	r2, r7, 0
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10008:
	jmp	r31
create_dirvecs.6605:
	ldw	r5, r30, 3
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	subis	r0, r2, 0
	jmpilt	jmpge_else.10010
	addi	r8, r0, 120
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	stw	r2, r1, -4
	stw	r8, r1, -5
	addi	r30, r7, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	mov	r5, r2
	ldw	r2, r1, -5
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	external_create_array
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r5, r1, -4
	slli	r6, r5, 0
	ldw	r7, r1, -3
	add	r14, r7, r6
	stw	r2, r14, 0
	slli	r2, r5, 0
	add	r14, r7, r2
	ldw	r2, r14, 0
	addi	r6, r0, 118
	ldw	r30, r1, -2
	addi	r5, r6, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 6
	ldw	r31, r1, -6
	ldw	r2, r1, -4
	subi	r2, r2, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10010:
	jmp	r31
init_dirvec_constants.6618:
	ldw	r6, r30, 1
	subis	r0, r5, 0
	jmpilt	jmpge_else.10012
	slli	r7, r5, 0
	add	r14, r2, r7
	ldw	r7, r14, 0
	stw	r2, r1, -1
	stw	r30, r1, -2
	stw	r5, r1, -3
	addi	r2, r7, 0
	addi	r30, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 4
	ldw	r31, r1, -4
	ldw	r2, r1, -3
	subi	r5, r2, 1
	ldw	r2, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10012:
	jmp	r31
init_vecset_constants.6626:
	ldw	r5, r30, 2
	ldw	r6, r30, 1
	subis	r0, r2, 0
	jmpilt	jmpge_else.10014
	slli	r7, r2, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	addi	r7, r0, 119
	stw	r30, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	addi	r30, r5, 0
	addi	r5, r7, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 3
	ldw	r31, r1, -3
	ldw	r2, r1, -2
	subi	r2, r2, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10014:
	jmp	r31
init_dirvecs.6634:
	ldw	r2, r30, 3
	ldw	r5, r30, 2
	ldw	r6, r30, 1
	addi	r7, r0, 4
	stw	r2, r1, -1
	stw	r6, r1, -2
	addi	r2, r7, 0
	addi	r30, r5, 0
	stw	r31, r1, -3
	addi	r1, r1, -3
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 3
	ldw	r31, r1, -3
	addi	r2, r0, 9
	addi	r5, r0, 0
	addi	r6, r0, 0
	ldw	r30, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 3
	ldw	r31, r1, -3
	addi	r2, r0, 4
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
add_reflection.6643:
	ldw	r6, r30, 3
	ldw	r7, r30, 2
	ldw	r30, r30, 1
	stw	r7, r1, -1
	stw	r2, r1, -2
	stw	r5, r1, -3
	stf	f1, r1, -4
	stw	r6, r1, -5
	stf	f4, r1, -6
	stf	f3, r1, -7
	stf	f2, r1, -8
	stw	r31, r1, -9
	addi	r1, r1, -9
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 9
	ldw	r31, r1, -9
	stw	r2, r1, -9
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	d_vec.4040
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldf	f1, r1, -8
	ldf	f2, r1, -7
	ldf	f3, r1, -6
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	vecset.3381
	addi	r1, r1, 10
	ldw	r31, r1, -10
	ldw	r2, r1, -9
	ldw	r30, r1, -5
	stw	r31, r1, -10
	addi	r1, r1, -10
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 10
	ldw	r31, r1, -10
	addi	r2, r4, 0
	addi	r4, r4, 3
	ldf	f1, r1, -4
	stf	f1, r2, 2
	ldw	r5, r1, -9
	stw	r5, r2, 1
	ldw	r5, r1, -3
	stw	r5, r2, 0
	ldw	r5, r1, -2
	slli	r5, r5, 0
	ldw	r6, r1, -1
	add	r14, r6, r5
	stw	r2, r14, 0
	jmp	r31
setup_rect_reflection.6656:
	ldw	r6, r30, 3
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	slai	r2, r2, 2
	ldw	r9, r6, 0
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r6, r1, -1
	stw	r9, r1, -2
	stw	r8, r1, -3
	stw	r2, r1, -4
	stw	r7, r1, -5
	stf	f1, r1, -6
	addi	r2, r5, 0
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	o_diffuse.3822
	addi	r1, r1, 7
	ldw	r31, r1, -7
	ldf	f2, r1, -6
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	ldf	f2, r2, 0
	stf	f1, r1, -7
	fmov	f1, f2
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	fneg.2781
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldw	r2, r1, -5
	ldf	f2, r2, 1
	stf	f1, r1, -8
	fmov	f1, f2
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	fneg.2781
	addi	r1, r1, 9
	ldw	r31, r1, -9
	ldw	r2, r1, -5
	ldf	f2, r2, 2
	stf	f1, r1, -9
	fmov	f1, f2
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	fneg.2781
	addi	r1, r1, 10
	ldw	r31, r1, -10
	fmov	f4, f1
	ldw	r2, r1, -4
	addi	r5, r2, 1
	ldw	r6, r1, -5
	ldf	f2, r6, 0
	ldw	r7, r1, -2
	ldf	f1, r1, -7
	ldf	f3, r1, -9
	ldw	r30, r1, -3
	stf	f4, r1, -10
	addi	r2, r7, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r2, r1, -2
	addi	r5, r2, 1
	ldw	r6, r1, -4
	addi	r7, r6, 2
	ldw	r8, r1, -5
	ldf	f3, r8, 1
	ldf	f1, r1, -7
	ldf	f2, r1, -8
	ldf	f4, r1, -10
	ldw	r30, r1, -3
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r2, r1, -2
	addi	r5, r2, 2
	ldw	r6, r1, -4
	addi	r6, r6, 3
	ldw	r7, r1, -5
	ldf	f4, r7, 2
	ldf	f1, r1, -7
	ldf	f2, r1, -8
	ldf	f3, r1, -9
	ldw	r30, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldw	r2, r1, -2
	addi	r2, r2, 3
	ldw	r5, r1, -1
	stw	r2, r5, 0
	jmp	r31
setup_surface_reflection.6697:
	ldw	r6, r30, 3
	ldw	r7, r30, 2
	ldw	r8, r30, 1
	slai	r2, r2, 2
	addi	r2, r2, 1
	ldw	r9, r6, 0
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r6, r1, -1
	stw	r2, r1, -2
	stw	r9, r1, -3
	stw	r8, r1, -4
	stw	r7, r1, -5
	stw	r5, r1, -6
	stf	f1, r1, -7
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	o_diffuse.3822
	addi	r1, r1, 8
	ldw	r31, r1, -8
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -6
	stf	f1, r1, -8
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	o_param_abc.3767
	addi	r1, r1, 9
	ldw	r31, r1, -9
	mov	r5, r2
	ldw	r2, r1, -5
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	veciprod.3503
	addi	r1, r1, 9
	ldw	r31, r1, -9
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r2, r1, -6
	stf	f1, r1, -9
	stf	f2, r1, -10
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	o_param_a.3725
	addi	r1, r1, 11
	ldw	r31, r1, -11
	ldf	f2, r1, -10
	fmul	f1, f2, f1
	ldf	f2, r1, -9
	fmul	f1, f1, f2
	ldw	r2, r1, -5
	ldf	f3, r2, 0
	fsub	f1, f1, f3
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldw	r5, r1, -6
	stf	f1, r1, -11
	stf	f3, r1, -12
	addi	r2, r5, 0
	stw	r31, r1, -13
	addi	r1, r1, -13
	cali	o_param_b.3739
	addi	r1, r1, 13
	ldw	r31, r1, -13
	ldf	f2, r1, -12
	fmul	f1, f2, f1
	ldf	f2, r1, -9
	fmul	f1, f1, f2
	ldw	r2, r1, -5
	ldf	f3, r2, 1
	fsub	f1, f1, f3
	addi	r14, r0, 16384	#r14 = 40000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldw	r5, r1, -6
	stf	f1, r1, -13
	stf	f3, r1, -14
	addi	r2, r5, 0
	stw	r31, r1, -15
	addi	r1, r1, -15
	cali	o_param_c.3753
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldf	f2, r1, -14
	fmul	f1, f2, f1
	ldf	f2, r1, -9
	fmul	f1, f1, f2
	ldw	r2, r1, -5
	ldf	f2, r2, 2
	fsub	f4, f1, f2
	ldw	r2, r1, -3
	ldw	r5, r1, -2
	ldf	f1, r1, -8
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	ldw	r30, r1, -4
	stw	r31, r1, -15
	addi	r1, r1, -15
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 15
	ldw	r31, r1, -15
	ldw	r2, r1, -3
	addi	r2, r2, 1
	ldw	r5, r1, -1
	stw	r2, r5, 0
	jmp	r31
setup_reflections.6736:
	ldw	r5, r30, 3
	ldw	r6, r30, 2
	ldw	r7, r30, 1
	subis	r0, r2, 0
	jmpilt	jmpge_else.10019
	slli	r8, r2, 0
	add	r14, r7, r8
	ldw	r7, r14, 0
	stw	r5, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stw	r7, r1, -4
	addi	r2, r7, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_reflectiontype.3686
	addi	r1, r1, 5
	ldw	r31, r1, -5
	subis	r0, r2, 2
	jmpine	jmpeq_else.10020
	ldw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_diffuse.3822
	addi	r1, r1, 5
	ldw	r31, r1, -5
	addi	r14, r0, 16256	#r14 = 3f800000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	fless.2764
	addi	r1, r1, 5
	ldw	r31, r1, -5
	subis	r0, r2, 0
	jmpine	jmpeq_else.10021
	jmp	r31
jmpeq_else.10021:
	ldw	r2, r1, -4
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	o_form.3673
	addi	r1, r1, 5
	ldw	r31, r1, -5
	subis	r0, r2, 1
	jmpine	jmpeq_else.10023
	ldw	r2, r1, -2
	ldw	r5, r1, -4
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.10023:
	subis	r0, r2, 2
	jmpine	jmpeq_else.10024
	ldw	r2, r1, -2
	ldw	r5, r1, -4
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.10024:
	jmp	r31
jmpeq_else.10020:
	jmp	r31
jmpge_else.10019:
	jmp	r31
rt.6749:
	ldw	r6, r30, 14
	ldw	r7, r30, 13
	ldw	r8, r30, 12
	ldw	r9, r30, 11
	ldw	r10, r30, 10
	ldw	r11, r30, 9
	ldw	r12, r30, 8
	ldw	r13, r30, 7
	ldw	r16, r30, 6
	ldw	r17, r30, 5
	ldw	r18, r30, 4
	ldw	r19, r30, 3
	ldw	r20, r30, 2
	ldw	r21, r30, 1
	stw	r2, r19, 0
	stw	r5, r19, 1
	addi	r19, r0, 2
	stw	r10, r1, -1
	stw	r12, r1, -2
	stw	r7, r1, -3
	stw	r13, r1, -4
	stw	r8, r1, -5
	stw	r17, r1, -6
	stw	r16, r1, -7
	stw	r18, r1, -8
	stw	r6, r1, -9
	stw	r11, r1, -10
	stw	r21, r1, -11
	stw	r9, r1, -12
	stw	r2, r1, -13
	stw	r5, r1, -14
	stw	r20, r1, -15
	addi	r5, r19, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	div.2995
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r5, r1, -15
	stw	r2, r5, 0
	addi	r2, r0, 2
	ldw	r6, r1, -14
	addi	r5, r2, 0
	addi	r2, r6, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	div.2995
	addi	r1, r1, 16
	ldw	r31, r1, -16
	ldw	r5, r1, -15
	stw	r2, r5, 1
	addi	r14, r0, 17152	#r14 = 43000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -13
	stf	f1, r1, -16
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	external_float_of_int
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldf	f2, r1, -16
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r2, r1, -12
	stf	f1, r2, 0
	ldw	r30, r1, -11
	stw	r31, r1, -17
	addi	r1, r1, -17
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 17
	ldw	r31, r1, -17
	ldw	r30, r1, -11
	stw	r2, r1, -17
	stw	r31, r1, -18
	addi	r1, r1, -18
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 18
	ldw	r31, r1, -18
	ldw	r30, r1, -11
	stw	r2, r1, -18
	stw	r31, r1, -19
	addi	r1, r1, -19
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 19
	ldw	r31, r1, -19
	ldw	r30, r1, -10
	stw	r2, r1, -19
	stw	r31, r1, -20
	addi	r1, r1, -20
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r30, r1, -9
	stw	r31, r1, -20
	addi	r1, r1, -20
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r30, r1, -8
	stw	r31, r1, -20
	addi	r1, r1, -20
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r2, r1, -7
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	d_vec.4040
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r5, r1, -6
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	veccpy.3402
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r2, r1, -7
	ldw	r30, r1, -5
	stw	r31, r1, -20
	addi	r1, r1, -20
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 20
	ldw	r31, r1, -20
	ldw	r2, r1, -4
	ldw	r2, r2, 0
	subi	r2, r2, 1
	ldw	r30, r1, -3
	stw	r31, r1, -20
	addi	r1, r1, -20
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 20
	ldw	r31, r1, -20
	addi	r5, r0, 0
	addi	r6, r0, 0
	ldw	r2, r1, -18
	ldw	r30, r1, -2
	stw	r31, r1, -20
	addi	r1, r1, -20
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 20
	ldw	r31, r1, -20
	addi	r2, r0, 0
	addi	r8, r0, 2
	ldw	r5, r1, -17
	ldw	r6, r1, -18
	ldw	r7, r1, -19
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,19
	addi	r4,r0,0
   # main program start
	addi	r2, r0, 1
	addi	r5, r0, 0
	stw	r31, r1, -1
	addi	r1, r1, -1
	cali	external_create_array
	addi	r1, r1, 1
	ldw	r31, r1, -1
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -1
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -2
	addi	r1, r1, -2
	cali	external_create_array
	addi	r1, r1, 2
	ldw	r31, r1, -2
	addi	r5, r4, 0
	addi	r4, r4, 3
	addi	r6, r0, h16(read_int_token.2800)
	slli	r6, r6, 16
	addi	r6, r6, l16(read_int_token.2800)
	stw	r6, r5, 0
	stw	r2, r5, 2
	ldw	r6, r1, -1
	stw	r6, r5, 1
	addi	r7, r4, 0
	addi	r4, r4, 4
	addi	r8, r0, h16(read_int.2836)
	slli	r8, r8, 16
	addi	r8, r8, l16(read_int.2836)
	stw	r8, r7, 0
	stw	r5, r7, 3
	stw	r2, r7, 2
	stw	r6, r7, 1
	addi	r2, r0, 1
	addi	r5, r0, 0
	stw	r7, r1, -2
	stw	r31, r1, -3
	addi	r1, r1, -3
	cali	external_create_array
	addi	r1, r1, 3
	ldw	r31, r1, -3
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -4
	addi	r1, r1, -4
	cali	external_create_array
	addi	r1, r1, 4
	ldw	r31, r1, -4
	addi	r5, r0, 1
	addi	r6, r0, 1
	stw	r2, r1, -4
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -5
	addi	r1, r1, -5
	cali	external_create_array
	addi	r1, r1, 5
	ldw	r31, r1, -5
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -5
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -6
	addi	r1, r1, -6
	cali	external_create_array
	addi	r1, r1, 6
	ldw	r31, r1, -6
	addi	r5, r4, 0
	addi	r4, r4, 3
	addi	r6, r0, h16(read_float_token1.2858)
	slli	r6, r6, 16
	addi	r6, r6, l16(read_float_token1.2858)
	stw	r6, r5, 0
	stw	r2, r5, 2
	ldw	r6, r1, -3
	stw	r6, r5, 1
	addi	r7, r4, 0
	addi	r4, r4, 3
	addi	r8, r0, h16(read_float_token2.2888)
	slli	r8, r8, 16
	addi	r8, r8, l16(read_float_token2.2888)
	stw	r8, r7, 0
	ldw	r8, r1, -4
	stw	r8, r7, 2
	ldw	r9, r1, -5
	stw	r9, r7, 1
	addi	r10, r4, 0
	addi	r4, r4, 7
	addi	r11, r0, h16(read_float.2912)
	slli	r11, r11, 16
	addi	r11, r11, l16(read_float.2912)
	stw	r11, r10, 0
	stw	r7, r10, 6
	stw	r5, r10, 5
	stw	r2, r10, 4
	stw	r6, r10, 3
	stw	r8, r10, 2
	stw	r9, r10, 1
	addi	r2, r0, 1
	addi	r5, r0, 0
	stw	r10, r1, -6
	stw	r31, r1, -7
	addi	r1, r1, -7
	cali	external_create_array
	addi	r1, r1, 7
	ldw	r31, r1, -7
	addi	r5, r0, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	external_create_float_array
	addi	r1, r1, 8
	ldw	r31, r1, -8
	addi	r5, r0, 60
	addi	r6, r0, 0
	addi	r7, r0, 0
	addi	r8, r0, 0
	addi	r9, r0, 0
	addi	r10, r0, 0
	addi	r11, r4, 0
	addi	r4, r4, 11
	stw	r2, r11, 10
	stw	r2, r11, 9
	stw	r2, r11, 8
	stw	r2, r11, 7
	stw	r10, r11, 6
	stw	r2, r11, 5
	stw	r2, r11, 4
	stw	r9, r11, 3
	stw	r8, r11, 2
	stw	r7, r11, 1
	stw	r6, r11, 0
	addi	r2, r11, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r31, r1, -8
	addi	r1, r1, -8
	cali	external_create_array
	addi	r1, r1, 8
	ldw	r31, r1, -8
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r31, r1, -9
	addi	r1, r1, -9
	cali	external_create_float_array
	addi	r1, r1, 9
	ldw	r31, r1, -9
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -9
	addi	r2, r5, 0
	stw	r31, r1, -10
	addi	r1, r1, -10
	cali	external_create_float_array
	addi	r1, r1, 10
	ldw	r31, r1, -10
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -10
	addi	r2, r5, 0
	stw	r31, r1, -11
	addi	r1, r1, -11
	cali	external_create_float_array
	addi	r1, r1, 11
	ldw	r31, r1, -11
	addi	r5, r0, 1
	addi	r14, r0, 17279	#r14 = 437f0000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -11
	addi	r2, r5, 0
	stw	r31, r1, -12
	addi	r1, r1, -12
	cali	external_create_float_array
	addi	r1, r1, 12
	ldw	r31, r1, -12
	addi	r5, r0, 50
	addi	r6, r0, 1
	addi	r7, r0, -1
	stw	r2, r1, -12
	stw	r5, r1, -13
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	external_create_array
	addi	r1, r1, 14
	ldw	r31, r1, -14
	mov	r5, r2
	ldw	r2, r1, -13
	stw	r31, r1, -14
	addi	r1, r1, -14
	cali	external_create_array
	addi	r1, r1, 14
	ldw	r31, r1, -14
	addi	r5, r0, 1
	addi	r6, r0, 1
	ldw	r7, r2, 0
	stw	r2, r1, -14
	stw	r5, r1, -15
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	external_create_array
	addi	r1, r1, 16
	ldw	r31, r1, -16
	mov	r5, r2
	ldw	r2, r1, -15
	stw	r31, r1, -16
	addi	r1, r1, -16
	cali	external_create_array
	addi	r1, r1, 16
	ldw	r31, r1, -16
	addi	r5, r0, 1
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -16
	addi	r2, r5, 0
	stw	r31, r1, -17
	addi	r1, r1, -17
	cali	external_create_float_array
	addi	r1, r1, 17
	ldw	r31, r1, -17
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -17
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -18
	addi	r1, r1, -18
	cali	external_create_array
	addi	r1, r1, 18
	ldw	r31, r1, -18
	addi	r5, r0, 1
	addi	r14, r0, 20078	#r14 = 4e6e6b28
	slli	r14, r14, 16
	oori	r14, r14, 27432
	mif	f1, r14, r0
	stw	r2, r1, -18
	addi	r2, r5, 0
	stw	r31, r1, -19
	addi	r1, r1, -19
	cali	external_create_float_array
	addi	r1, r1, 19
	ldw	r31, r1, -19
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -19
	addi	r2, r5, 0
	stw	r31, r1, -20
	addi	r1, r1, -20
	cali	external_create_float_array
	addi	r1, r1, 20
	ldw	r31, r1, -20
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -20
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -21
	addi	r1, r1, -21
	cali	external_create_array
	addi	r1, r1, 21
	ldw	r31, r1, -21
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -21
	addi	r2, r5, 0
	stw	r31, r1, -22
	addi	r1, r1, -22
	cali	external_create_float_array
	addi	r1, r1, 22
	ldw	r31, r1, -22
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -22
	addi	r2, r5, 0
	stw	r31, r1, -23
	addi	r1, r1, -23
	cali	external_create_float_array
	addi	r1, r1, 23
	ldw	r31, r1, -23
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -23
	addi	r2, r5, 0
	stw	r31, r1, -24
	addi	r1, r1, -24
	cali	external_create_float_array
	addi	r1, r1, 24
	ldw	r31, r1, -24
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -24
	addi	r2, r5, 0
	stw	r31, r1, -25
	addi	r1, r1, -25
	cali	external_create_float_array
	addi	r1, r1, 25
	ldw	r31, r1, -25
	addi	r5, r0, 2
	addi	r6, r0, 0
	stw	r2, r1, -25
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -26
	addi	r1, r1, -26
	cali	external_create_array
	addi	r1, r1, 26
	ldw	r31, r1, -26
	addi	r5, r0, 2
	addi	r6, r0, 0
	stw	r2, r1, -26
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -27
	addi	r1, r1, -27
	cali	external_create_array
	addi	r1, r1, 27
	ldw	r31, r1, -27
	addi	r5, r0, 1
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -27
	addi	r2, r5, 0
	stw	r31, r1, -28
	addi	r1, r1, -28
	cali	external_create_float_array
	addi	r1, r1, 28
	ldw	r31, r1, -28
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -28
	addi	r2, r5, 0
	stw	r31, r1, -29
	addi	r1, r1, -29
	cali	external_create_float_array
	addi	r1, r1, 29
	ldw	r31, r1, -29
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -29
	addi	r2, r5, 0
	stw	r31, r1, -30
	addi	r1, r1, -30
	cali	external_create_float_array
	addi	r1, r1, 30
	ldw	r31, r1, -30
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -30
	addi	r2, r5, 0
	stw	r31, r1, -31
	addi	r1, r1, -31
	cali	external_create_float_array
	addi	r1, r1, 31
	ldw	r31, r1, -31
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -31
	addi	r2, r5, 0
	stw	r31, r1, -32
	addi	r1, r1, -32
	cali	external_create_float_array
	addi	r1, r1, 32
	ldw	r31, r1, -32
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -32
	addi	r2, r5, 0
	stw	r31, r1, -33
	addi	r1, r1, -33
	cali	external_create_float_array
	addi	r1, r1, 33
	ldw	r31, r1, -33
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -33
	addi	r2, r5, 0
	stw	r31, r1, -34
	addi	r1, r1, -34
	cali	external_create_float_array
	addi	r1, r1, 34
	ldw	r31, r1, -34
	addi	r5, r0, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -34
	addi	r2, r5, 0
	stw	r31, r1, -35
	addi	r1, r1, -35
	cali	external_create_float_array
	addi	r1, r1, 35
	ldw	r31, r1, -35
	mov	r5, r2
	addi	r2, r0, 0
	stw	r5, r1, -35
	stw	r31, r1, -36
	addi	r1, r1, -36
	cali	external_create_array
	addi	r1, r1, 36
	ldw	r31, r1, -36
	addi	r5, r0, 0
	addi	r6, r4, 0
	addi	r4, r4, 2
	stw	r2, r6, 1
	ldw	r2, r1, -35
	stw	r2, r6, 0
	addi	r2, r6, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r31, r1, -36
	addi	r1, r1, -36
	cali	external_create_array
	addi	r1, r1, 36
	ldw	r31, r1, -36
	mov	r5, r2
	addi	r2, r0, 5
	stw	r31, r1, -36
	addi	r1, r1, -36
	cali	external_create_array
	addi	r1, r1, 36
	ldw	r31, r1, -36
	addi	r5, r0, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -36
	addi	r2, r5, 0
	stw	r31, r1, -37
	addi	r1, r1, -37
	cali	external_create_float_array
	addi	r1, r1, 37
	ldw	r31, r1, -37
	addi	r5, r0, 3
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -37
	addi	r2, r5, 0
	stw	r31, r1, -38
	addi	r1, r1, -38
	cali	external_create_float_array
	addi	r1, r1, 38
	ldw	r31, r1, -38
	addi	r5, r0, 60
	ldw	r6, r1, -37
	stw	r2, r1, -38
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -39
	addi	r1, r1, -39
	cali	external_create_array
	addi	r1, r1, 39
	ldw	r31, r1, -39
	addi	r5, r4, 0
	addi	r4, r4, 2
	stw	r2, r5, 1
	ldw	r2, r1, -38
	stw	r2, r5, 0
	addi	r2, r5, 0
	addi	r5, r0, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -39
	addi	r2, r5, 0
	stw	r31, r1, -40
	addi	r1, r1, -40
	cali	external_create_float_array
	addi	r1, r1, 40
	ldw	r31, r1, -40
	mov	r5, r2
	addi	r2, r0, 0
	stw	r5, r1, -40
	stw	r31, r1, -41
	addi	r1, r1, -41
	cali	external_create_array
	addi	r1, r1, 41
	ldw	r31, r1, -41
	addi	r5, r4, 0
	addi	r4, r4, 2
	stw	r2, r5, 1
	ldw	r2, r1, -40
	stw	r2, r5, 0
	addi	r2, r5, 0
	addi	r5, r0, 180
	addi	r6, r0, 0
	addi	r14, r0, 0	#r14 = 00000000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r7, r4, 0
	addi	r4, r4, 3
	stf	f1, r7, 2
	stw	r2, r7, 1
	stw	r6, r7, 0
	addi	r2, r7, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r31, r1, -41
	addi	r1, r1, -41
	cali	external_create_array
	addi	r1, r1, 41
	ldw	r31, r1, -41
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -41
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r31, r1, -42
	addi	r1, r1, -42
	cali	external_create_array
	addi	r1, r1, 42
	ldw	r31, r1, -42
	addi	r5, r4, 0
	addi	r4, r4, 7
	addi	r6, r0, h16(read_screen_settings.4066)
	slli	r6, r6, 16
	addi	r6, r6, l16(read_screen_settings.4066)
	stw	r6, r5, 0
	ldw	r6, r1, -10
	stw	r6, r5, 6
	ldw	r7, r1, -33
	stw	r7, r5, 5
	ldw	r8, r1, -32
	stw	r8, r5, 4
	ldw	r9, r1, -31
	stw	r9, r5, 3
	ldw	r10, r1, -9
	stw	r10, r5, 2
	ldw	r10, r1, -6
	stw	r10, r5, 1
	addi	r11, r4, 0
	addi	r4, r4, 5
	addi	r12, r0, h16(read_light.4143)
	slli	r12, r12, 16
	addi	r12, r12, l16(read_light.4143)
	stw	r12, r11, 0
	ldw	r12, r1, -2
	stw	r12, r11, 4
	stw	r10, r11, 3
	ldw	r13, r1, -11
	stw	r13, r11, 2
	ldw	r16, r1, -12
	stw	r16, r11, 1
	addi	r17, r4, 0
	addi	r4, r4, 4
	addi	r18, r0, h16(read_nth_object.4282)
	slli	r18, r18, 16
	addi	r18, r18, l16(read_nth_object.4282)
	stw	r18, r17, 0
	stw	r12, r17, 3
	stw	r10, r17, 2
	ldw	r10, r1, -8
	stw	r10, r17, 1
	addi	r18, r4, 0
	addi	r4, r4, 3
	addi	r19, r0, h16(read_object.4412)
	slli	r19, r19, 16
	addi	r19, r19, l16(read_object.4412)
	stw	r19, r18, 0
	stw	r17, r18, 2
	ldw	r17, r1, -7
	stw	r17, r18, 1
	addi	r19, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(read_all_object.4420)
	slli	r20, r20, 16
	addi	r20, r20, l16(read_all_object.4420)
	stw	r20, r19, 0
	stw	r18, r19, 1
	addi	r18, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(read_net_item.4423)
	slli	r20, r20, 16
	addi	r20, r20, l16(read_net_item.4423)
	stw	r20, r18, 0
	stw	r12, r18, 1
	addi	r12, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(read_or_network.4437)
	slli	r20, r20, 16
	addi	r20, r20, l16(read_or_network.4437)
	stw	r20, r12, 0
	stw	r18, r12, 1
	addi	r20, r4, 0
	addi	r4, r4, 3
	addi	r21, r0, h16(read_and_network.4451)
	slli	r21, r21, 16
	addi	r21, r21, l16(read_and_network.4451)
	stw	r21, r20, 0
	stw	r18, r20, 2
	ldw	r18, r1, -14
	stw	r18, r20, 1
	addi	r21, r4, 0
	addi	r4, r4, 7
	addi	r22, r0, h16(read_parameter.4462)
	slli	r22, r22, 16
	addi	r22, r22, l16(read_parameter.4462)
	stw	r22, r21, 0
	stw	r5, r21, 6
	stw	r12, r21, 5
	stw	r11, r21, 4
	stw	r20, r21, 3
	stw	r19, r21, 2
	ldw	r5, r1, -16
	stw	r5, r21, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r12, r0, h16(solver_rect_surface.4475)
	slli	r12, r12, 16
	addi	r12, r12, l16(solver_rect_surface.4475)
	stw	r12, r11, 0
	ldw	r12, r1, -17
	stw	r12, r11, 1
	addi	r19, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(solver_rect.4513)
	slli	r20, r20, 16
	addi	r20, r20, l16(solver_rect.4513)
	stw	r20, r19, 0
	stw	r11, r19, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(solver_surface.4534)
	slli	r20, r20, 16
	addi	r20, r20, l16(solver_surface.4534)
	stw	r20, r11, 0
	stw	r12, r11, 1
	addi	r20, r4, 0
	addi	r4, r4, 2
	addi	r22, r0, h16(solver_second.4617)
	slli	r22, r22, 16
	addi	r22, r22, l16(solver_second.4617)
	stw	r22, r20, 0
	stw	r12, r20, 1
	addi	r22, r4, 0
	addi	r4, r4, 5
	addi	r23, r0, h16(solver.4657)
	slli	r23, r23, 16
	addi	r23, r23, l16(solver.4657)
	stw	r23, r22, 0
	stw	r11, r22, 4
	stw	r20, r22, 3
	stw	r19, r22, 2
	stw	r10, r22, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r19, r0, h16(solver_rect_fast.4677)
	slli	r19, r19, 16
	addi	r19, r19, l16(solver_rect_fast.4677)
	stw	r19, r11, 0
	stw	r12, r11, 1
	addi	r19, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(solver_surface_fast.4774)
	slli	r20, r20, 16
	addi	r20, r20, l16(solver_surface_fast.4774)
	stw	r20, r19, 0
	stw	r12, r19, 1
	addi	r20, r4, 0
	addi	r4, r4, 2
	addi	r23, r0, h16(solver_second_fast.4797)
	slli	r23, r23, 16
	addi	r23, r23, l16(solver_second_fast.4797)
	stw	r23, r20, 0
	stw	r12, r20, 1
	addi	r23, r4, 0
	addi	r4, r4, 5
	addi	r24, r0, h16(solver_fast.4843)
	slli	r24, r24, 16
	addi	r24, r24, l16(solver_fast.4843)
	stw	r24, r23, 0
	stw	r19, r23, 4
	stw	r20, r23, 3
	stw	r11, r23, 2
	stw	r10, r23, 1
	addi	r19, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(solver_surface_fast2.4866)
	slli	r20, r20, 16
	addi	r20, r20, l16(solver_surface_fast2.4866)
	stw	r20, r19, 0
	stw	r12, r19, 1
	addi	r20, r4, 0
	addi	r4, r4, 2
	addi	r24, r0, h16(solver_second_fast2.4884)
	slli	r24, r24, 16
	addi	r24, r24, l16(solver_second_fast2.4884)
	stw	r24, r20, 0
	stw	r12, r20, 1
	addi	r24, r4, 0
	addi	r4, r4, 5
	addi	r25, r0, h16(solver_fast2.4928)
	slli	r25, r25, 16
	addi	r25, r25, l16(solver_fast2.4928)
	stw	r25, r24, 0
	stw	r19, r24, 4
	stw	r20, r24, 3
	stw	r11, r24, 2
	stw	r10, r24, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r19, r0, h16(iter_setup_dirvec_constants.5139)
	slli	r19, r19, 16
	addi	r19, r19, l16(iter_setup_dirvec_constants.5139)
	stw	r19, r11, 0
	stw	r10, r11, 1
	addi	r19, r4, 0
	addi	r4, r4, 3
	addi	r20, r0, h16(setup_dirvec_constants.5155)
	slli	r20, r20, 16
	addi	r20, r20, l16(setup_dirvec_constants.5155)
	stw	r20, r19, 0
	stw	r17, r19, 2
	stw	r11, r19, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(setup_startp_constants.5161)
	slli	r20, r20, 16
	addi	r20, r20, l16(setup_startp_constants.5161)
	stw	r20, r11, 0
	stw	r10, r11, 1
	addi	r20, r4, 0
	addi	r4, r4, 4
	addi	r25, r0, h16(setup_startp.5211)
	slli	r25, r25, 16
	addi	r25, r25, l16(setup_startp.5211)
	stw	r25, r20, 0
	ldw	r25, r1, -30
	stw	r25, r20, 3
	stw	r11, r20, 2
	stw	r17, r20, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r26, r0, h16(check_all_inside.5276)
	slli	r26, r26, 16
	addi	r26, r26, l16(check_all_inside.5276)
	stw	r26, r11, 0
	stw	r10, r11, 1
	addi	r26, r4, 0
	addi	r4, r4, 8
	addi	r27, r0, h16(shadow_check_and_group.5290)
	slli	r27, r27, 16
	addi	r27, r27, l16(shadow_check_and_group.5290)
	stw	r27, r26, 0
	stw	r23, r26, 7
	stw	r12, r26, 6
	stw	r10, r26, 5
	ldw	r27, r1, -39
	stw	r27, r26, 4
	stw	r13, r26, 3
	ldw	r28, r1, -20
	stw	r28, r26, 2
	stw	r11, r26, 1
	addi	r29, r4, 0
	addi	r4, r4, 3
	addi	r30, r0, h16(shadow_check_one_or_group.5334)
	slli	r30, r30, 16
	addi	r30, r30, l16(shadow_check_one_or_group.5334)
	stw	r30, r29, 0
	stw	r26, r29, 2
	stw	r18, r29, 1
	addi	r26, r4, 0
	addi	r4, r4, 6
	addi	r30, r0, h16(shadow_check_one_or_matrix.5346)
	slli	r30, r30, 16
	addi	r30, r30, l16(shadow_check_one_or_matrix.5346)
	stw	r30, r26, 0
	stw	r23, r26, 5
	stw	r12, r26, 4
	stw	r29, r26, 3
	stw	r27, r26, 2
	stw	r28, r26, 1
	addi	r23, r4, 0
	addi	r4, r4, 10
	addi	r29, r0, h16(solve_each_element.5374)
	slli	r29, r29, 16
	addi	r29, r29, l16(solve_each_element.5374)
	stw	r29, r23, 0
	ldw	r29, r1, -19
	stw	r29, r23, 9
	ldw	r30, r1, -29
	stw	r30, r23, 8
	stw	r12, r23, 7
	stw	r22, r23, 6
	stw	r10, r23, 5
	ldw	r27, r1, -18
	stw	r27, r23, 4
	stw	r28, r23, 3
	stw	r21, r1, -42
	ldw	r21, r1, -21
	stw	r21, r23, 2
	stw	r11, r23, 1
	stw	r19, r1, -43
	addi	r19, r4, 0
	addi	r4, r4, 3
	addi	r17, r0, h16(solve_one_or_network.5429)
	slli	r17, r17, 16
	addi	r17, r17, l16(solve_one_or_network.5429)
	stw	r17, r19, 0
	stw	r23, r19, 2
	stw	r18, r19, 1
	addi	r17, r4, 0
	addi	r4, r4, 6
	addi	r23, r0, h16(trace_or_matrix.5441)
	slli	r23, r23, 16
	addi	r23, r23, l16(trace_or_matrix.5441)
	stw	r23, r17, 0
	stw	r29, r17, 5
	stw	r30, r17, 4
	stw	r12, r17, 3
	stw	r22, r17, 2
	stw	r19, r17, 1
	addi	r19, r4, 0
	addi	r4, r4, 4
	addi	r22, r0, h16(judge_intersection.5464)
	slli	r22, r22, 16
	addi	r22, r22, l16(judge_intersection.5464)
	stw	r22, r19, 0
	stw	r17, r19, 3
	stw	r29, r19, 2
	stw	r5, r19, 1
	addi	r17, r4, 0
	addi	r4, r4, 10
	addi	r22, r0, h16(solve_each_element_fast.5479)
	slli	r22, r22, 16
	addi	r22, r22, l16(solve_each_element_fast.5479)
	stw	r22, r17, 0
	stw	r29, r17, 9
	stw	r25, r17, 8
	stw	r24, r17, 7
	stw	r12, r17, 6
	stw	r10, r17, 5
	stw	r27, r17, 4
	stw	r28, r17, 3
	stw	r21, r17, 2
	stw	r11, r17, 1
	addi	r11, r4, 0
	addi	r4, r4, 3
	addi	r22, r0, h16(solve_one_or_network_fast.5535)
	slli	r22, r22, 16
	addi	r22, r22, l16(solve_one_or_network_fast.5535)
	stw	r22, r11, 0
	stw	r17, r11, 2
	stw	r18, r11, 1
	addi	r17, r4, 0
	addi	r4, r4, 5
	addi	r18, r0, h16(trace_or_matrix_fast.5547)
	slli	r18, r18, 16
	addi	r18, r18, l16(trace_or_matrix_fast.5547)
	stw	r18, r17, 0
	stw	r29, r17, 4
	stw	r24, r17, 3
	stw	r12, r17, 2
	stw	r11, r17, 1
	addi	r11, r4, 0
	addi	r4, r4, 4
	addi	r12, r0, h16(judge_intersection_fast.5570)
	slli	r12, r12, 16
	addi	r12, r12, l16(judge_intersection_fast.5570)
	stw	r12, r11, 0
	stw	r17, r11, 3
	stw	r29, r11, 2
	stw	r5, r11, 1
	addi	r12, r4, 0
	addi	r4, r4, 3
	addi	r17, r0, h16(get_nvector_rect.5585)
	slli	r17, r17, 16
	addi	r17, r17, l16(get_nvector_rect.5585)
	stw	r17, r12, 0
	ldw	r17, r1, -22
	stw	r17, r12, 2
	stw	r27, r12, 1
	addi	r18, r4, 0
	addi	r4, r4, 2
	addi	r22, r0, h16(get_nvector_plane.5597)
	slli	r22, r22, 16
	addi	r22, r22, l16(get_nvector_plane.5597)
	stw	r22, r18, 0
	stw	r17, r18, 1
	addi	r22, r4, 0
	addi	r4, r4, 3
	addi	r23, r0, h16(get_nvector_second.5610)
	slli	r23, r23, 16
	addi	r23, r23, l16(get_nvector_second.5610)
	stw	r23, r22, 0
	stw	r17, r22, 2
	stw	r28, r22, 1
	addi	r23, r4, 0
	addi	r4, r4, 4
	addi	r24, r0, h16(get_nvector.5665)
	slli	r24, r24, 16
	addi	r24, r24, l16(get_nvector.5665)
	stw	r24, r23, 0
	stw	r22, r23, 3
	stw	r12, r23, 2
	stw	r18, r23, 1
	addi	r12, r4, 0
	addi	r4, r4, 2
	addi	r18, r0, h16(utexture.5671)
	slli	r18, r18, 16
	addi	r18, r18, l16(utexture.5671)
	stw	r18, r12, 0
	ldw	r18, r1, -23
	stw	r18, r12, 1
	addi	r22, r4, 0
	addi	r4, r4, 3
	addi	r24, r0, h16(add_light.5828)
	slli	r24, r24, 16
	addi	r24, r24, l16(add_light.5828)
	stw	r24, r22, 0
	stw	r18, r22, 2
	ldw	r24, r1, -25
	stw	r24, r22, 1
	addi	r25, r4, 0
	addi	r4, r4, 9
	addi	r8, r0, h16(trace_reflections.5854)
	slli	r8, r8, 16
	addi	r8, r8, l16(trace_reflections.5854)
	stw	r8, r25, 0
	stw	r26, r25, 8
	ldw	r8, r1, -41
	stw	r8, r25, 7
	stw	r5, r25, 6
	stw	r17, r25, 5
	stw	r11, r25, 4
	stw	r27, r25, 3
	stw	r21, r25, 2
	stw	r22, r25, 1
	addi	r8, r4, 0
	addi	r4, r4, 21
	addi	r7, r0, h16(trace_ray.5888)
	slli	r7, r7, 16
	addi	r7, r7, l16(trace_ray.5888)
	stw	r7, r8, 0
	stw	r12, r8, 20
	stw	r25, r8, 19
	stw	r29, r8, 18
	stw	r18, r8, 17
	stw	r30, r8, 16
	stw	r26, r8, 15
	stw	r20, r8, 14
	stw	r24, r8, 13
	stw	r5, r8, 12
	stw	r10, r8, 11
	stw	r17, r8, 10
	stw	r2, r8, 9
	stw	r13, r8, 8
	stw	r19, r8, 7
	stw	r27, r8, 6
	stw	r28, r8, 5
	stw	r21, r8, 4
	stw	r23, r8, 3
	stw	r16, r8, 2
	stw	r22, r8, 1
	addi	r7, r4, 0
	addi	r4, r4, 13
	addi	r16, r0, h16(trace_diffuse_ray.6006)
	slli	r16, r16, 16
	addi	r16, r16, l16(trace_diffuse_ray.6006)
	stw	r16, r7, 0
	stw	r12, r7, 12
	stw	r18, r7, 11
	stw	r26, r7, 10
	stw	r5, r7, 9
	stw	r10, r7, 8
	stw	r17, r7, 7
	stw	r13, r7, 6
	stw	r11, r7, 5
	stw	r28, r7, 4
	stw	r21, r7, 3
	stw	r23, r7, 2
	ldw	r5, r1, -24
	stw	r5, r7, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r12, r0, h16(iter_trace_diffuse_rays.6030)
	slli	r12, r12, 16
	addi	r12, r12, l16(iter_trace_diffuse_rays.6030)
	stw	r12, r11, 0
	stw	r7, r11, 1
	addi	r7, r4, 0
	addi	r4, r4, 3
	addi	r12, r0, h16(trace_diffuse_rays.6052)
	slli	r12, r12, 16
	addi	r12, r12, l16(trace_diffuse_rays.6052)
	stw	r12, r7, 0
	stw	r20, r7, 2
	stw	r11, r7, 1
	addi	r11, r4, 0
	addi	r4, r4, 3
	addi	r12, r0, h16(trace_diffuse_ray_80percent.6058)
	slli	r12, r12, 16
	addi	r12, r12, l16(trace_diffuse_ray_80percent.6058)
	stw	r12, r11, 0
	stw	r7, r11, 2
	ldw	r12, r1, -36
	stw	r12, r11, 1
	addi	r16, r4, 0
	addi	r4, r4, 4
	addi	r17, r0, h16(calc_diffuse_using_1point.6081)
	slli	r17, r17, 16
	addi	r17, r17, l16(calc_diffuse_using_1point.6081)
	stw	r17, r16, 0
	stw	r11, r16, 3
	stw	r24, r16, 2
	stw	r5, r16, 1
	addi	r11, r4, 0
	addi	r4, r4, 3
	addi	r17, r0, h16(calc_diffuse_using_5points.6095)
	slli	r17, r17, 16
	addi	r17, r17, l16(calc_diffuse_using_5points.6095)
	stw	r17, r11, 0
	stw	r24, r11, 2
	stw	r5, r11, 1
	addi	r17, r4, 0
	addi	r4, r4, 2
	addi	r18, r0, h16(do_without_neighbors.6128)
	slli	r18, r18, 16
	addi	r18, r18, l16(do_without_neighbors.6128)
	stw	r18, r17, 0
	stw	r16, r17, 1
	addi	r16, r4, 0
	addi	r4, r4, 2
	addi	r18, r0, h16(neighbors_exist.6141)
	slli	r18, r18, 16
	addi	r18, r18, l16(neighbors_exist.6141)
	stw	r18, r16, 0
	ldw	r18, r1, -26
	stw	r18, r16, 1
	addi	r19, r4, 0
	addi	r4, r4, 3
	addi	r20, r0, h16(try_exploit_neighbors.6179)
	slli	r20, r20, 16
	addi	r20, r20, l16(try_exploit_neighbors.6179)
	stw	r20, r19, 0
	stw	r17, r19, 2
	stw	r11, r19, 1
	addi	r11, r4, 0
	addi	r4, r4, 2
	addi	r20, r0, h16(write_ppm_header.6199)
	slli	r20, r20, 16
	addi	r20, r20, l16(write_ppm_header.6199)
	stw	r20, r11, 0
	stw	r18, r11, 1
	addi	r20, r4, 0
	addi	r4, r4, 2
	addi	r21, r0, h16(write_rgb.6228)
	slli	r21, r21, 16
	addi	r21, r21, l16(write_rgb.6228)
	stw	r21, r20, 0
	stw	r24, r20, 1
	addi	r21, r4, 0
	addi	r4, r4, 4
	addi	r22, r0, h16(pretrace_diffuse_rays.6244)
	slli	r22, r22, 16
	addi	r22, r22, l16(pretrace_diffuse_rays.6244)
	stw	r22, r21, 0
	stw	r7, r21, 3
	stw	r12, r21, 2
	stw	r5, r21, 1
	addi	r5, r4, 0
	addi	r4, r4, 10
	addi	r7, r0, h16(pretrace_pixels.6266)
	slli	r7, r7, 16
	addi	r7, r7, l16(pretrace_pixels.6266)
	stw	r7, r5, 0
	stw	r6, r5, 9
	stw	r8, r5, 8
	stw	r30, r5, 7
	stw	r9, r5, 6
	ldw	r6, r1, -28
	stw	r6, r5, 5
	stw	r24, r5, 4
	ldw	r7, r1, -34
	stw	r7, r5, 3
	stw	r21, r5, 2
	ldw	r7, r1, -27
	stw	r7, r5, 1
	addi	r8, r4, 0
	addi	r4, r4, 7
	addi	r9, r0, h16(pretrace_line.6320)
	slli	r9, r9, 16
	addi	r9, r9, l16(pretrace_line.6320)
	stw	r9, r8, 0
	ldw	r9, r1, -33
	stw	r9, r8, 6
	ldw	r9, r1, -32
	stw	r9, r8, 5
	stw	r6, r8, 4
	stw	r5, r8, 3
	stw	r18, r8, 2
	stw	r7, r8, 1
	addi	r5, r4, 0
	addi	r4, r4, 7
	addi	r9, r0, h16(scan_pixel.6353)
	slli	r9, r9, 16
	addi	r9, r9, l16(scan_pixel.6353)
	stw	r9, r5, 0
	stw	r20, r5, 6
	stw	r19, r5, 5
	stw	r24, r5, 4
	stw	r16, r5, 3
	stw	r18, r5, 2
	stw	r17, r5, 1
	addi	r9, r4, 0
	addi	r4, r4, 4
	addi	r16, r0, h16(scan_line.6374)
	slli	r16, r16, 16
	addi	r16, r16, l16(scan_line.6374)
	stw	r16, r9, 0
	stw	r5, r9, 3
	stw	r8, r9, 2
	stw	r18, r9, 1
	addi	r5, r4, 0
	addi	r4, r4, 2
	addi	r16, r0, h16(create_pixelline.6453)
	slli	r16, r16, 16
	addi	r16, r16, l16(create_pixelline.6453)
	stw	r16, r5, 0
	stw	r18, r5, 1
	addi	r16, r4, 0
	addi	r4, r4, 2
	addi	r17, r0, h16(calc_dirvec.6480)
	slli	r17, r17, 16
	addi	r17, r17, l16(calc_dirvec.6480)
	stw	r17, r16, 0
	stw	r12, r16, 1
	addi	r17, r4, 0
	addi	r4, r4, 2
	addi	r19, r0, h16(calc_dirvecs.6540)
	slli	r19, r19, 16
	addi	r19, r19, l16(calc_dirvecs.6540)
	stw	r19, r17, 0
	stw	r16, r17, 1
	addi	r16, r4, 0
	addi	r4, r4, 2
	addi	r19, r0, h16(calc_dirvec_rows.6570)
	slli	r19, r19, 16
	addi	r19, r19, l16(calc_dirvec_rows.6570)
	stw	r19, r16, 0
	stw	r17, r16, 1
	addi	r17, r4, 0
	addi	r4, r4, 2
	addi	r19, r0, h16(create_dirvec.6588)
	slli	r19, r19, 16
	addi	r19, r19, l16(create_dirvec.6588)
	stw	r19, r17, 0
	ldw	r19, r1, -7
	stw	r19, r17, 1
	addi	r20, r4, 0
	addi	r4, r4, 2
	addi	r21, r0, h16(create_dirvec_elements.6596)
	slli	r21, r21, 16
	addi	r21, r21, l16(create_dirvec_elements.6596)
	stw	r21, r20, 0
	stw	r17, r20, 1
	addi	r21, r4, 0
	addi	r4, r4, 4
	addi	r22, r0, h16(create_dirvecs.6605)
	slli	r22, r22, 16
	addi	r22, r22, l16(create_dirvecs.6605)
	stw	r22, r21, 0
	stw	r12, r21, 3
	stw	r20, r21, 2
	stw	r17, r21, 1
	addi	r20, r4, 0
	addi	r4, r4, 2
	addi	r22, r0, h16(init_dirvec_constants.6618)
	slli	r22, r22, 16
	addi	r22, r22, l16(init_dirvec_constants.6618)
	stw	r22, r20, 0
	ldw	r22, r1, -43
	stw	r22, r20, 1
	addi	r23, r4, 0
	addi	r4, r4, 3
	addi	r24, r0, h16(init_vecset_constants.6626)
	slli	r24, r24, 16
	addi	r24, r24, l16(init_vecset_constants.6626)
	stw	r24, r23, 0
	stw	r20, r23, 2
	stw	r12, r23, 1
	addi	r12, r4, 0
	addi	r4, r4, 4
	addi	r20, r0, h16(init_dirvecs.6634)
	slli	r20, r20, 16
	addi	r20, r20, l16(init_dirvecs.6634)
	stw	r20, r12, 0
	stw	r23, r12, 3
	stw	r21, r12, 2
	stw	r16, r12, 1
	addi	r16, r4, 0
	addi	r4, r4, 4
	addi	r20, r0, h16(add_reflection.6643)
	slli	r20, r20, 16
	addi	r20, r20, l16(add_reflection.6643)
	stw	r20, r16, 0
	stw	r22, r16, 3
	ldw	r20, r1, -41
	stw	r20, r16, 2
	stw	r17, r16, 1
	addi	r17, r4, 0
	addi	r4, r4, 4
	addi	r20, r0, h16(setup_rect_reflection.6656)
	slli	r20, r20, 16
	addi	r20, r20, l16(setup_rect_reflection.6656)
	stw	r20, r17, 0
	stw	r2, r17, 3
	stw	r13, r17, 2
	stw	r16, r17, 1
	addi	r20, r4, 0
	addi	r4, r4, 4
	addi	r21, r0, h16(setup_surface_reflection.6697)
	slli	r21, r21, 16
	addi	r21, r21, l16(setup_surface_reflection.6697)
	stw	r21, r20, 0
	stw	r2, r20, 3
	stw	r13, r20, 2
	stw	r16, r20, 1
	addi	r2, r4, 0
	addi	r4, r4, 4
	addi	r16, r0, h16(setup_reflections.6736)
	slli	r16, r16, 16
	addi	r16, r16, l16(setup_reflections.6736)
	stw	r16, r2, 0
	stw	r20, r2, 3
	stw	r17, r2, 2
	stw	r10, r2, 1
	addi	r30, r4, 0
	addi	r4, r4, 15
	addi	r10, r0, h16(rt.6749)
	slli	r10, r10, 16
	addi	r10, r10, l16(rt.6749)
	stw	r10, r30, 0
	stw	r11, r30, 14
	stw	r2, r30, 13
	stw	r22, r30, 12
	stw	r6, r30, 11
	stw	r9, r30, 10
	ldw	r2, r1, -42
	stw	r2, r30, 9
	stw	r8, r30, 8
	stw	r19, r30, 7
	ldw	r2, r1, -39
	stw	r2, r30, 6
	stw	r13, r30, 5
	stw	r12, r30, 4
	stw	r18, r30, 3
	stw	r7, r30, 2
	stw	r5, r30, 1
	addi	r2, r0, 128
	addi	r5, r0, 128
	stw	r31, r1, -44
	addi	r1, r1, -44
	ldw	r14, r30, 0
	cal	r14
	addi	r1, r1, 44
	ldw	r31, r1, -44
   # main program end
	hlt
external_create_array:
	mov	r6, r2
	mov	r2, r4
	subis	r0, r6, 1
	jmpmi	r31
create_array_loop:
	stw	r5, r4, 0
	addi	r4, r4, 1
	subis	r6, r6, 1
	jmpine	create_array_loop
	jmp	r31
external_create_float_array:
	mov	r6, r2
	mov	r2, r4
	subis	r0, r6, 1
	jmpmi	r31
	mfi	r5, f1, r0
create_float_array_loop:
	stw	r5, r4, 0
	addi	r4, r4, 1
	subis	r6, r6, 1
	jmpine	create_float_array_loop
	jmp	r31
external_float_of_int:
	subis	r0, r2, 0
	jmpilt	float_of_int.1		#minus
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	subs	r0, r2, r6
	jmpige	float_of_int.2		#large
	add	r2, r2, r5
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	jmp	r31
float_of_int.2:
	fmov	f3, f0
	mif	f4, r5
float_of_int.21:
	fadd	f3, f3, f4
	sub	r2, r2, r6
	subs	r0, r2, r6
	jmpigt	float_of_int.21
	add	r2, r2, r5	# f3 = m*8388608.0  r2 = n
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	fadd	f1, f1, f3
	jmp	r31
float_of_int.1:
	subs	r2, r0, r2
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	subs	r0, r2, r6
	jmpige	float_of_int.3		#large
	add	r2, r2, r5
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	fneg	f1, f1
	jmp	r31
float_of_int.3:
	fmov	f3, f0
	mif	f4, r5
float_of_int.31:
	fadd	f3, f3, f4
	sub	r2, r2, r6
	subs	r0, r2, r6
	jmpigt	float_of_int.31
	add	r2, r2, r5	# f3 = m*8388608.0  r2 = n
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	fadd	f1, f1, f3
	fneg	f1, f1
	jmp	r31
external_float_of_int:
	subis	r0, r2, 0
	jmpilt	float_of_int.1		#minus
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	subs	r0, r2, r6
	jmpige	float_of_int.2		#large
	add	r2, r2, r5
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	jmp	r31
float_of_int.2:
	fmov	f3, f0
	mif	f4, r5
float_of_int.21:
	fadd	f3, f3, f4
	sub	r2, r2, r6
	subs	r0, r2, r6
	jmpigt	float_of_int.21
	add	r2, r2, r5	# f3 = m*8388608.0  r2 = n
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	fadd	f1, f1, f3
	jmp	r31
float_of_int.1:
	subs	r2, r0, r2
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	subs	r0, r2, r6
	jmpige	float_of_int.3		#large
	add	r2, r2, r5
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	fneg	f1, f1
	jmp	r31
float_of_int.3:
	fmov	f3, f0
	mif	f4, r5
float_of_int.31:
	fadd	f3, f3, f4
	sub	r2, r2, r6
	subs	r0, r2, r6
	jmpigt	float_of_int.31
	add	r2, r2, r5	# f3 = m*8388608.0  r2 = n
	mif	f1, r2
	mif	f2, r5
	fsub	f1, f1, f2
	fadd	f1, f1, f3
	fneg	f1, f1
	jmp	r31
external_int_of_float:
	fsubs	f0, f1, f0
	jmpilt	int_of_float.1 	#minus
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	mif	f2, r5		# f2 = 8388608.0
	fsubs	f0, f1, f2
	jmpige	int_of_float.2	#large
	fadd	f1, f1, f2
	mfi	r2, f1
	sub	r2, r2, r5
	jmp	r31
int_of_float.2:
	addi	r6, r0, 0
	addi	r7, r0, 128
	slli	r7, r7, 16	# r7 = 8388608
int_of_float.21:
	add	r6, r6, r7
	fsub	f1, f1, f2
	fsubs	f0, f1, f2
	jmpigt	int_of_float.21
	fadd	f1, f1, f2
	mfi	r2, f1
	sub	r2, r2, r5
	add	r2, r2, r6
	jmp	r31
int_of_float.1:
	fneg	f1, f1
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	mif	f2, r5		# f2 = 8388608.0
	fsubs	f0, f1, f2
	jmpige	int_of_float.3	#large
	fadd	f1, f1, f2
	mfi	r2, f1
	sub	r2, r2, r5
	sub	r2, r0, r2
	jmp	r31
int_of_float.3:
	addi	r6, r0, 0
	addi	r7, r0, 128
	slli	r7, r7, 16	# r7 = 8388608
int_of_float.31:
	add	r6, r6, r7
	fsub	f1, f1, f2
	fsubs	f0, f1, f2
	jmpigt	int_of_float.31
	fadd	f1, f1, f2
	mfi	r2, f1
	sub	r2, r2, r5
	add	r2, r2, r6
	sub	r2, r0, r2
	jmp	r31
external_floor:
	fsubs	f0, f1, f0
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	mif	f2, r5		# f2 = 8388608.0
	jmpilt	floor.1 	#minus
	fsubs	f0, f2, f1
	jmplt	r31		# large->return
	fmov	f3, f1
	fadd	f1, f1, f2
	fsub	f1, f1, f2
	fsubs	f0, f3, f1
	jmpilt	floor.2
	jmp	r31
floor.2:
	addi	r5, r0, 127
	slli	r5, r5, 23	# r5 = 0x3F800000
	mif	f4, r5		# f4 = 1.0
	fsub	f1, f1, f4
	jmp	r31
floor.1:
	fneg	f1, f1
	fsubs	f0, f2, f1
	fneglt	f1, f1
	jmplt	r31		# large->return
	fmov	f3, f1
	fadd	f1, f1, f2
	fsub	f1, f1, f2
	fneg	f1, f1
	fneg	f3, f3
	fsubs	f0, f3, f1
	jmpilt	floor.3
	jmp	r31
floor.3:
	addi	r5, r0, 127
	slli	r5, r5, 23	# r5 = 0x3F800000
	mif	f4, r5	# f4 = 1.0
	fsub	f1, f1, f4
	jmp	r31
