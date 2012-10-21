	jmpi	_min_caml_start
fless.2764:
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9569
	addi	r2, r0, 0
	jmp	r31
jmple_else.9569:
	addi	r2, r0, 1
	jmp	r31
fispos.2767:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9570
	addi	r2, r0, 0
	jmp	r31
jmple_else.9570:
	addi	r2, r0, 1
	jmp	r31
fisneg.2770:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9571
	addi	r2, r0, 0
	jmp	r31
jmple_else.9571:
	addi	r2, r0, 1
	jmp	r31
fiszero.2773:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpine	jmpeq_else.9572
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9572:
	addi	r2, r0, 0
	jmp	r31
fabs.2776:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9573
	jmp	r31
jmple_else.9573:
	fneg	f1, f1
	jmp	r31
fneg.2781:
	fneg	f1, f1
	jmp	r31
fhalf.2783:
	addi	r14, r0, 16128
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	jmp	r31
fsqr.2786:
	fmul	f1, f1, f1
	jmp	r31
mul10.2788:
	addi	r5, r0, 8
	mul	r5, r2, r5
	addi	r6, r0, 2
	mul	r2, r2, r6
	add	r2, r5, r2
	jmp	r31
read_int_token.2800:
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	scn1	r8, r0
	subis	r0, r8, 48
	jmpilt	jmpge_else.9574
	subis	r0, r8, 57
	jmpigt	jmple_else.9576
	addi	r9, r0, 0
	jmpi	jmple_cont.9577
jmple_else.9576:
	addi	r9, r0, 1
jmple_cont.9577:
	jmpi	jmpge_cont.9575
jmpge_else.9574:
	addi	r9, r0, 1
jmpge_cont.9575:
	subis	r0, r9, 0
	jmpine	jmpeq_else.9578
	ldw	r2, r6, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9579
	subis	r0, r5, 45
	jmpine	jmpeq_else.9581
	addi	r2, r0, -1
	stw	r2, r6, 0
	jmpi	jmpeq_cont.9582
jmpeq_else.9581:
	addi	r2, r0, 1
	stw	r2, r6, 0
jmpeq_cont.9582:
	jmpi	jmpeq_cont.9580
jmpeq_else.9579:
jmpeq_cont.9580:
	ldw	r2, r7, 0
	stw	r30, r1, -1
	stw	r7, r1, -2
	stw	r8, r1, -3
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	mul10.2788
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	subi	r6, r5, 48
	add	r2, r2, r6
	ldw	r6, r1, -2
	stw	r2, r6, 0
	addi	r2, r0, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9578:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9583
	addi	r2, r0, 0
	addi	r5, r8, 0
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9583:
	ldw	r2, r6, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9584
	ldw	r2, r7, 0
	jmp	r31
jmpeq_else.9584:
	ldw	r2, r7, 0
	sub	r2, r0, r2
	jmp	r31
read_int.2836:
	ldw	r2, r30, 12
	ldw	r5, r30, 8
	ldw	r6, r30, 4
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
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	scn1	r8, r0
	subis	r0, r8, 48
	jmpilt	jmpge_else.9585
	subis	r0, r8, 57
	jmpigt	jmple_else.9587
	addi	r9, r0, 0
	jmpi	jmple_cont.9588
jmple_else.9587:
	addi	r9, r0, 1
jmple_cont.9588:
	jmpi	jmpge_cont.9586
jmpge_else.9585:
	addi	r9, r0, 1
jmpge_cont.9586:
	subis	r0, r9, 0
	jmpine	jmpeq_else.9589
	ldw	r2, r6, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9590
	subis	r0, r5, 45
	jmpine	jmpeq_else.9592
	addi	r2, r0, -1
	stw	r2, r6, 0
	jmpi	jmpeq_cont.9593
jmpeq_else.9592:
	addi	r2, r0, 1
	stw	r2, r6, 0
jmpeq_cont.9593:
	jmpi	jmpeq_cont.9591
jmpeq_else.9590:
jmpeq_cont.9591:
	ldw	r2, r7, 0
	stw	r30, r1, -1
	stw	r7, r1, -2
	stw	r8, r1, -3
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	mul10.2788
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	subi	r6, r5, 48
	add	r2, r2, r6
	ldw	r6, r1, -2
	stw	r2, r6, 0
	addi	r2, r0, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9589:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9594
	addi	r2, r0, 0
	addi	r5, r8, 0
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9594:
	addi	r2, r8, 0
	jmp	r31
read_float_token2.2888:
	ldw	r5, r30, 8
	ldw	r6, r30, 4
	scn1	r7, r0
	subis	r0, r7, 48
	jmpilt	jmpge_else.9595
	subis	r0, r7, 57
	jmpigt	jmple_else.9597
	addi	r8, r0, 0
	jmpi	jmple_cont.9598
jmple_else.9597:
	addi	r8, r0, 1
jmple_cont.9598:
	jmpi	jmpge_cont.9596
jmpge_else.9595:
	addi	r8, r0, 1
jmpge_cont.9596:
	subis	r0, r8, 0
	jmpine	jmpeq_else.9599
	ldw	r2, r5, 0
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	stw	r7, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	mul10.2788
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	subi	r5, r5, 48
	add	r2, r2, r5
	ldw	r5, r1, -3
	stw	r2, r5, 0
	ldw	r2, r1, -2
	ldw	r5, r2, 0
	addi	r2, r5, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	mul10.2788
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	stw	r2, r5, 0
	addi	r2, r0, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9599:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9600
	addi	r2, r0, 0
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9600:
	jmp	r31
read_float.2912:
	ldw	r2, r30, 24
	ldw	r5, r30, 20
	ldw	r6, r30, 16
	ldw	r7, r30, 12
	ldw	r8, r30, 8
	ldw	r9, r30, 4
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
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 46
	jmpine	jmpeq_else.9602
	addi	r2, r0, 0
	ldw	r30, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -4
	ldw	r2, r2, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	ldw	r2, r2, 0
	stf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldw	r2, r2, 0
	stf	f1, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldf	f2, r1, -7
	fadd	f1, f2, f1
	jmpi	jmpeq_cont.9603
jmpeq_else.9602:
	ldw	r2, r1, -4
	ldw	r2, r2, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9603:
	ldw	r2, r1, -1
	ldw	r2, r2, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9605
	jmp	r31
jmpeq_else.9605:
	fneg	f1, f1
	jmp	r31
mul_sub.2948:
	subis	r0, r5, 0
	jmpine	jmpeq_else.9606
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9606:
	addi	r6, r0, 2
	inv	r6, r5, r6
	addi	r7, r0, 2
	mul	r6, r6, r7
	sub	r6, r5, r6
	subis	r0, r6, 0
	jmpine	jmpeq_else.9607
	addi	r6, r0, 2
	mul	r2, r2, r6
	addi	r6, r0, 2
	inv	r5, r5, r6
	jmpi	mul_sub.2948
jmpeq_else.9607:
	addi	r6, r0, 2
	mul	r6, r2, r6
	addi	r7, r0, 2
	inv	r5, r5, r7
	stw	r2, r1, -1
	addi	r2, r6, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	mul_sub.2948
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	add	r2, r2, r5
	jmp	r31
mul.2967:
	subis	r0, r5, 0
	jmpilt	jmpge_else.9608
	jmpi	mul_sub.2948
jmpge_else.9608:
	sub	r2, r0, r2
	sub	r5, r0, r5
	jmpi	mul_sub.2948
div_binary_search.2973:
	add	r8, r6, r7
	addi	r9, r0, 2
	inv	r8, r8, r9
	mul	r9, r8, r5
	sub	r10, r7, r6
	subis	r0, r10, 1
	jmpigt	jmple_else.9609
	addi	r2, r6, 0
	jmp	r31
jmple_else.9609:
	subs	r0, r2, r9
	jmpigt	jmple_else.9610
	subs	r0, r9, r2
	jmpine	jmpeq_else.9611
	addi	r2, r8, 0
	jmp	r31
jmpeq_else.9611:
	addi	r7, r8, 0
	jmpi	div_binary_search.2973
jmple_else.9610:
	addi	r6, r8, 0
	jmpi	div_binary_search.2973
div_sub.2984:
	addi	r7, r0, 2
	mul	r7, r5, r7
	stw	r5, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	addi	r5, r6, 0
	addi	r2, r7, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	mul.2967
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	subs	r0, r2, r5
	jmpigt	jmple_else.9612
	addi	r2, r0, 2
	ldw	r6, r1, -2
	mul	r6, r6, r2
	ldw	r2, r1, -1
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	jmpi	div_sub.2984
jmple_else.9612:
	addi	r2, r0, 2
	ldw	r6, r1, -2
	mul	r7, r6, r2
	ldw	r2, r1, -1
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	jmpi	div_binary_search.2973
div.2995:
	subis	r0, r2, 0
	jmpilt	jmpge_else.9613
	addi	r6, r2, 0
	jmpi	jmpge_cont.9614
jmpge_else.9613:
	sub	r6, r0, r2
jmpge_cont.9614:
	subis	r0, r5, 0
	jmpilt	jmpge_else.9615
	addi	r7, r5, 0
	jmpi	jmpge_cont.9616
jmpge_else.9615:
	sub	r7, r0, r5
jmpge_cont.9616:
	subs	r0, r7, r6
	jmpigt	jmple_else.9617
	addi	r8, r0, 1
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	div_sub.2984
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	subis	r0, r5, 0
	jmpilt	jmpge_else.9618
	ldw	r5, r1, -1
	subis	r0, r5, 0
	jmpilt	jmpge_else.9619
	jmp	r31
jmpge_else.9619:
	sub	r2, r0, r2
	jmp	r31
jmpge_else.9618:
	ldw	r5, r1, -1
	subis	r0, r5, 0
	jmpilt	jmpge_else.9620
	sub	r2, r0, r2
	jmp	r31
jmpge_else.9620:
	jmp	r31
jmple_else.9617:
	addi	r2, r0, 0
	jmp	r31
print_int.3007:
	subis	r0, r2, 0
	jmpilt	jmpge_else.9621
	addi	r5, r0, 1525
	slli	r5, r5, 16
	oori	r5, r5, 57600
	addi	r6, r0, 0
	addi	r7, r0, 3
	stw	r2, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1525
	slli	r5, r5, 16
	oori	r5, r5, 57600
	mul	r5, r2, r5
	ldw	r6, r1, -1
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9622
	addi	r2, r0, 0
	jmpi	jmple_cont.9623
jmple_else.9622:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9623:
	addi	r6, r0, 152
	slli	r6, r6, 16
	oori	r6, r6, 38528
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -2
	stw	r5, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 152
	slli	r5, r5, 16
	oori	r5, r5, 38528
	mul	r5, r2, r5
	ldw	r6, r1, -3
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9624
	ldw	r6, r1, -2
	subis	r0, r6, 0
	jmpine	jmpeq_else.9626
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9627
jmpeq_else.9626:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9627:
	jmpi	jmple_cont.9625
jmple_else.9624:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9625:
	addi	r6, r0, 15
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
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 15
	slli	r5, r5, 16
	oori	r5, r5, 16960
	mul	r5, r2, r5
	ldw	r6, r1, -5
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9628
	ldw	r6, r1, -4
	subis	r0, r6, 0
	jmpine	jmpeq_else.9630
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9631
jmpeq_else.9630:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9631:
	jmpi	jmple_cont.9629
jmple_else.9628:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9629:
	addi	r6, r0, 1
	slli	r6, r6, 16
	oori	r6, r6, 34464
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -6
	stw	r5, r1, -7
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	slli	r5, r5, 16
	oori	r5, r5, 34464
	mul	r5, r2, r5
	ldw	r6, r1, -7
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9632
	ldw	r6, r1, -6
	subis	r0, r6, 0
	jmpine	jmpeq_else.9634
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9635
jmpeq_else.9634:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9635:
	jmpi	jmple_cont.9633
jmple_else.9632:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9633:
	addi	r6, r0, 10000
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -8
	stw	r5, r1, -9
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 10000
	mul	r5, r2, r5
	ldw	r6, r1, -9
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9636
	ldw	r6, r1, -8
	subis	r0, r6, 0
	jmpine	jmpeq_else.9638
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9639
jmpeq_else.9638:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9639:
	jmpi	jmple_cont.9637
jmple_else.9636:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9637:
	addi	r6, r0, 1000
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -10
	stw	r5, r1, -11
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1000
	mul	r5, r2, r5
	ldw	r6, r1, -11
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9640
	ldw	r6, r1, -10
	subis	r0, r6, 0
	jmpine	jmpeq_else.9642
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9643
jmpeq_else.9642:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9643:
	jmpi	jmple_cont.9641
jmple_else.9640:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9641:
	addi	r6, r0, 100
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -12
	stw	r5, r1, -13
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 100
	mul	r5, r2, r5
	ldw	r6, r1, -13
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9644
	ldw	r6, r1, -12
	subis	r0, r6, 0
	jmpine	jmpeq_else.9646
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9647
jmpeq_else.9646:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9647:
	jmpi	jmple_cont.9645
jmple_else.9644:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9645:
	addi	r6, r0, 10
	addi	r7, r0, 0
	addi	r8, r0, 10
	stw	r2, r1, -14
	stw	r5, r1, -15
	addi	r2, r5, 0
	addi	r5, r6, 0
	addi	r6, r7, 0
	addi	r7, r8, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	div_binary_search.2973
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 10
	mul	r5, r2, r5
	ldw	r6, r1, -15
	sub	r5, r6, r5
	subis	r0, r2, 0
	jmpigt	jmple_else.9648
	ldw	r6, r1, -14
	subis	r0, r6, 0
	jmpine	jmpeq_else.9650
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9651
jmpeq_else.9650:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmpeq_cont.9651:
	jmpi	jmple_cont.9649
jmple_else.9648:
	addi	r2, r2, 48
	prt1	r2
	addi	r2, r0, 1
jmple_cont.9649:
	addi	r2, r5, 48
	prt1	r2
	jmp	r31
jmpge_else.9621:
	addi	r5, r0, 45
	prt1	r5
	sub	r2, r0, r2
	jmpi	print_int.3007
atan_sub.3144:
	addi	r14, r0, 16128
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fsubs	f0, f4, f1
	jmpigt	jmple_else.9652
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fsub	f4, f1, f4
	fmul	f5, f1, f1
	fmul	f5, f5, f2
	fadd	f1, f1, f1
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f6, r14, r0
	fadd	f1, f1, f6
	fadd	f1, f1, f3
	finv	f31, f1, f0
	fmul	f3, f5, f31
	fmov	f1, f4
	jmpi	atan_sub.3144
jmple_else.9652:
	fmov	f1, f3
	jmp	r31
atan.3158:
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9653
	addi	r14, r0, -16512
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsubs	f0, f2, f1
	jmpigt	jmple_else.9655
	addi	r2, r0, 0
	jmpi	jmple_cont.9656
jmple_else.9655:
	addi	r2, r0, -1
jmple_cont.9656:
	jmpi	jmple_cont.9654
jmple_else.9653:
	addi	r2, r0, 1
jmple_cont.9654:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9657
	jmpi	jmpeq_cont.9658
jmpeq_else.9657:
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	finv	f31, f1, f0
	fmul	f1, f2, f31
jmpeq_cont.9658:
	addi	r14, r0, 16688
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f3, f1, f1
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	stw	r2, r1, -1
	stf	f1, r1, -3
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	atan_sub.3144
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fadd	f1, f2, f1
	ldf	f2, r1, -3
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r2, r1, -1
	subis	r0, r2, 0
	jmpigt	jmple_else.9660
	subis	r0, r2, 0
	jmpilt	jmpge_else.9661
	jmp	r31
jmpge_else.9661:
	addi	r14, r0, -16439
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsub	f1, f2, f1
	jmp	r31
jmple_else.9660:
	addi	r14, r0, 16329
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsub	f1, f2, f1
	jmp	r31
tan_sub.3183:
	addi	r14, r0, 16416
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fsubs	f0, f4, f1
	jmpigt	jmple_else.9662
	addi	r14, r0, 16384
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
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	addi	r14, r0, 16656
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	fmul	f4, f1, f1
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f5, r14, r0
	stf	f1, r1, -1
	stf	f2, r1, -3
	fmov	f2, f4
	fmov	f1, f3
	fmov	f3, f5
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	tan_sub.3183
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -3
	fsub	f1, f2, f1
	ldf	f2, r1, -1
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmp	r31
sin_sub.3198:
	addi	r14, r0, 16585
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9663
	addi	r14, r0, 0
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
	addi	r14, r0, 16457
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	addi	r14, r0, 16585
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f3, r14, r0
	addi	r14, r0, 16329
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f4, r14, r0
	addi	r14, r0, 0
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
	stf	f3, r1, -3
	stw	r2, r1, -5
	stf	f2, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	sin_sub.3198
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9668
	ldw	r2, r1, -5
	jmpi	jmple_cont.9669
jmple_else.9668:
	ldw	r2, r1, -5
	subis	r0, r2, 0
	jmpine	jmpeq_else.9670
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9671
jmpeq_else.9670:
	addi	r2, r0, 0
jmpeq_cont.9671:
jmple_cont.9669:
	fsubs	f0, f1, f2
	jmpigt	jmple_else.9672
	jmpi	jmple_cont.9673
jmple_else.9672:
	ldf	f3, r1, -3
	fsub	f1, f3, f1
jmple_cont.9673:
	ldf	f3, r1, -1
	fsubs	f0, f1, f3
	jmpigt	jmple_else.9674
	jmpi	jmple_cont.9675
jmple_else.9674:
	fsub	f1, f2, f1
jmple_cont.9675:
	addi	r14, r0, 16128
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stw	r2, r1, -9
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	tan.3181
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16384
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f2, f2, f1
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	fmul	f1, f1, f1
	fadd	f1, f3, f1
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r2, r1, -9
	subis	r0, r2, 0
	jmpine	jmpeq_else.9676
	jmpi	fneg.2781
jmpeq_else.9676:
	jmp	r31
cos.3230:
	addi	r14, r0, 16329
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fsub	f1, f2, f1
	jmpi	sin.3205
xor.3360:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9677
	addi	r2, r5, 0
	jmp	r31
jmpeq_else.9677:
	subis	r0, r5, 0
	jmpine	jmpeq_else.9678
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9678:
	addi	r2, r0, 0
	jmp	r31
sgn.3365:
	stf	f1, r1, -1
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9679
	ldf	f1, r1, -1
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9680
	addi	r14, r0, -16512
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmp	r31
jmpeq_else.9680:
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmp	r31
jmpeq_else.9679:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmp	r31
fneg_cond.3371:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9681
	jmpi	fneg.2781
jmpeq_else.9681:
	jmp	r31
add_mod5.3375:
	add	r2, r2, r5
	subis	r0, r2, 5
	jmpilt	jmpge_else.9682
	subi	r2, r2, 5
	jmp	r31
jmpge_else.9682:
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
	addi	r14, r0, 0
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
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	stf	f1, r1, -3
	fmov	f1, f2
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -3
	fadd	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	stf	f1, r1, -5
	fmov	f1, f2
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	fadd	f1, f2, f1
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9686
	ldw	r2, r1, -1
	subis	r0, r2, 0
	jmpine	jmpeq_else.9688
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -7
	finv	f31, f2, f0
	fmul	f1, f1, f31
	jmpi	jmpeq_cont.9689
jmpeq_else.9688:
	addi	r14, r0, -16512
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -7
	finv	f31, f2, f0
	fmul	f1, f1, f31
jmpeq_cont.9689:
	jmpi	jmpeq_cont.9687
jmpeq_else.9686:
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9687:
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
	ldw	r2, r2, 4
	jmp	r31
o_reflectiontype.3686:
	ldw	r2, r2, 8
	jmp	r31
o_isinvert.3699:
	ldw	r2, r2, 24
	jmp	r31
o_isrot.3712:
	ldw	r2, r2, 12
	jmp	r31
o_param_a.3725:
	ldw	r2, r2, 16
	ldf	f1, r2, 0
	jmp	r31
o_param_b.3739:
	ldw	r2, r2, 16
	ldf	f1, r2, 1
	jmp	r31
o_param_c.3753:
	ldw	r2, r2, 16
	ldf	f1, r2, 2
	jmp	r31
o_param_abc.3767:
	ldw	r2, r2, 16
	jmp	r31
o_param_x.3780:
	ldw	r2, r2, 20
	ldf	f1, r2, 0
	jmp	r31
o_param_y.3794:
	ldw	r2, r2, 20
	ldf	f1, r2, 1
	jmp	r31
o_param_z.3808:
	ldw	r2, r2, 20
	ldf	f1, r2, 2
	jmp	r31
o_diffuse.3822:
	ldw	r2, r2, 28
	ldf	f1, r2, 0
	jmp	r31
o_hilight.3836:
	ldw	r2, r2, 28
	ldf	f1, r2, 1
	jmp	r31
o_color_red.3850:
	ldw	r2, r2, 32
	ldf	f1, r2, 0
	jmp	r31
o_color_green.3864:
	ldw	r2, r2, 32
	ldf	f1, r2, 1
	jmp	r31
o_color_blue.3878:
	ldw	r2, r2, 32
	ldf	f1, r2, 2
	jmp	r31
o_param_r1.3892:
	ldw	r2, r2, 36
	ldf	f1, r2, 0
	jmp	r31
o_param_r2.3906:
	ldw	r2, r2, 36
	ldf	f1, r2, 1
	jmp	r31
o_param_r3.3920:
	ldw	r2, r2, 36
	ldf	f1, r2, 2
	jmp	r31
o_param_ctbl.3934:
	ldw	r2, r2, 40
	jmp	r31
p_rgb.3947:
	ldw	r2, r2, 0
	jmp	r31
p_intersection_points.3957:
	ldw	r2, r2, 4
	jmp	r31
p_surface_ids.3967:
	ldw	r2, r2, 8
	jmp	r31
p_calc_diffuse.3977:
	ldw	r2, r2, 12
	jmp	r31
p_energy.3987:
	ldw	r2, r2, 16
	jmp	r31
p_received_ray_20percent.3997:
	ldw	r2, r2, 20
	jmp	r31
p_group_id.4007:
	ldw	r2, r2, 24
	ldw	r2, r2, 0
	jmp	r31
p_set_group_id.4018:
	ldw	r2, r2, 24
	stw	r5, r2, 0
	jmp	r31
p_nvectors.4030:
	ldw	r2, r2, 28
	jmp	r31
d_vec.4040:
	ldw	r2, r2, 0
	jmp	r31
d_const.4044:
	ldw	r2, r2, 4
	jmp	r31
r_surface_id.4048:
	ldw	r2, r2, 0
	jmp	r31
r_dvec.4053:
	ldw	r2, r2, 4
	jmp	r31
r_bright.4058:
	ldf	f1, r2, 8
	jmp	r31
rad.4063:
	addi	r14, r0, 15502
	slli	r14, r14, 16
	oori	r14, r14, 64053
	mif	f2, r14, r0
	fmul	f1, f1, f2
	jmp	r31
read_screen_settings.4066:
	ldw	r2, r30, 24
	ldw	r5, r30, 20
	ldw	r6, r30, 16
	ldw	r7, r30, 12
	ldw	r8, r30, 8
	ldw	r30, r30, 4
	stw	r2, r1, -1
	stw	r6, r1, -2
	stw	r7, r1, -3
	stw	r5, r1, -4
	stw	r30, r1, -5
	stw	r8, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	stf	f1, r2, 0
	ldw	r30, r1, -5
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	stf	f1, r2, 1
	ldw	r30, r1, -5
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	stf	f1, r2, 2
	ldw	r30, r1, -5
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	rad.4063
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	stf	f1, r1, -9
	fmov	f1, f2
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -5
	stf	f1, r1, -11
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	rad.4063
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -13
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	stf	f1, r1, -15
	fmov	f1, f2
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fmul	f3, f2, f1
	addi	r14, r0, 17224
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f4, r14, r0
	fmul	f3, f3, f4
	ldw	r2, r1, -4
	stf	f3, r2, 0
	addi	r14, r0, -15544
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldf	f4, r1, -11
	fmul	f3, f4, f3
	stf	f3, r2, 1
	ldf	f3, r1, -15
	fmul	f5, f2, f3
	addi	r14, r0, 17224
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f6, r14, r0
	fmul	f5, f5, f6
	stf	f5, r2, 2
	ldw	r5, r1, -3
	stf	f3, r5, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f5, r14, r0
	stf	f5, r5, 1
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	stf	f1, r2, 2
	ldf	f1, r1, -11
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	fmul	f1, f1, f2
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldf	f1, r1, -9
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldf	f1, r1, -11
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
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
	ldw	r2, r30, 16
	ldw	r5, r30, 12
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	stw	r7, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	addi	r30, r2, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -3
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	rad.4063
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -5
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	rad.4063
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	stf	f1, r1, -7
	fmov	f1, f2
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	stf	f1, r1, -9
	fmov	f1, f2
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldf	f1, r1, -7
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r2, 2
	ldw	r30, r1, -3
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	stf	f1, r2, 0
	jmp	r31
rotate_quadratic_matrix.4169:
	ldf	f1, r5, 0
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	stf	f1, r1, -3
	fmov	f1, f2
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	stf	f1, r1, -5
	fmov	f1, f2
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	stf	f1, r1, -7
	fmov	f1, f2
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	stf	f1, r1, -9
	fmov	f1, f2
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	stf	f1, r1, -11
	fmov	f1, f2
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	ldf	f3, r1, -11
	fmul	f4, f2, f3
	ldf	f5, r1, -5
	ldf	f6, r1, -9
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
	stf	f1, r1, -13
	stf	f9, r1, -15
	stf	f11, r1, -17
	stf	f7, r1, -19
	stf	f10, r1, -21
	stf	f4, r1, -23
	fmov	f1, f6
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	ldf	f3, r1, -7
	fmul	f2, f2, f3
	ldf	f4, r1, -3
	fmul	f3, f4, f3
	ldw	r2, r1, -1
	ldf	f4, r2, 0
	ldf	f5, r2, 1
	ldf	f6, r2, 2
	ldf	f7, r1, -23
	stf	f3, r1, -25
	stf	f2, r1, -27
	stf	f6, r1, -29
	stf	f1, r1, -31
	stf	f5, r1, -33
	stf	f4, r1, -35
	fmov	f1, f7
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -35
	fmul	f1, f2, f1
	ldf	f3, r1, -21
	stf	f1, r1, -37
	fmov	f1, f3
	stw	r1, r1, -43
	addi	r1, r1, -43
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -33
	fmul	f1, f2, f1
	ldf	f3, r1, -37
	fadd	f1, f3, f1
	ldf	f3, r1, -31
	stf	f1, r1, -39
	fmov	f1, f3
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -29
	fmul	f1, f2, f1
	ldf	f3, r1, -39
	fadd	f1, f3, f1
	ldw	r2, r1, -1
	stf	f1, r2, 0
	ldf	f1, r1, -19
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -35
	fmul	f1, f2, f1
	ldf	f3, r1, -17
	stf	f1, r1, -41
	fmov	f1, f3
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -33
	fmul	f1, f2, f1
	ldf	f3, r1, -41
	fadd	f1, f3, f1
	ldf	f3, r1, -27
	stf	f1, r1, -43
	fmov	f1, f3
	stw	r1, r1, -49
	addi	r1, r1, -49
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -29
	fmul	f1, f2, f1
	ldf	f3, r1, -43
	fadd	f1, f3, f1
	ldw	r2, r1, -1
	stf	f1, r2, 1
	ldf	f1, r1, -15
	stw	r1, r1, -49
	addi	r1, r1, -49
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -35
	fmul	f1, f2, f1
	ldf	f3, r1, -13
	stf	f1, r1, -45
	fmov	f1, f3
	stw	r1, r1, -51
	addi	r1, r1, -51
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -33
	fmul	f1, f2, f1
	ldf	f3, r1, -45
	fadd	f1, f3, f1
	ldf	f3, r1, -25
	stf	f1, r1, -47
	fmov	f1, f3
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -29
	fmul	f1, f2, f1
	ldf	f3, r1, -47
	fadd	f1, f3, f1
	ldw	r2, r1, -1
	stf	f1, r2, 2
	addi	r14, r0, 16384
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f3, r1, -35
	ldf	f4, r1, -19
	fmul	f5, f3, f4
	ldf	f6, r1, -15
	fmul	f5, f5, f6
	ldf	f7, r1, -33
	ldf	f8, r1, -17
	fmul	f9, f7, f8
	ldf	f10, r1, -13
	fmul	f9, f9, f10
	fadd	f5, f5, f9
	ldf	f9, r1, -27
	fmul	f11, f2, f9
	ldf	f12, r1, -25
	fmul	f11, f11, f12
	fadd	f5, f5, f11
	fmul	f1, f1, f5
	ldw	r2, r1, -2
	stf	f1, r2, 0
	addi	r14, r0, 16384
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f5, r1, -23
	fmul	f11, f3, f5
	fmul	f6, f11, f6
	ldf	f11, r1, -21
	fmul	f13, f7, f11
	fmul	f10, f13, f10
	fadd	f6, f6, f10
	ldf	f10, r1, -31
	fmul	f13, f2, f10
	fmul	f12, f13, f12
	fadd	f6, f6, f12
	fmul	f1, f1, f6
	stf	f1, r2, 1
	addi	r14, r0, 16384
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
	ldw	r5, r30, 12
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	stw	r7, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stw	r5, r1, -4
	addi	r30, r5, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, -1
	jmpine	jmpeq_else.9700
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9700:
	ldw	r30, r1, -4
	stw	r2, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -4
	stw	r2, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -4
	stw	r2, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -3
	stw	r2, r1, -9
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	stf	f1, r2, 2
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r2, r5, 0
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -3
	stw	r2, r1, -10
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -10
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -10
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -10
	stf	f1, r2, 2
	ldw	r30, r1, -3
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 2
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -11
	addi	r2, r5, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -3
	stw	r2, r1, -12
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -12
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -12
	stf	f1, r2, 1
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r2, r5, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -3
	stw	r2, r1, -13
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -13
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -13
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -13
	stf	f1, r2, 2
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r2, r5, 0
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -8
	subis	r0, r5, 0
	jmpine	jmpeq_else.9701
	jmpi	jmpeq_cont.9702
jmpeq_else.9701:
	ldw	r30, r1, -3
	stw	r2, r1, -14
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	rad.4063
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r2, 0
	ldw	r30, r1, -3
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	rad.4063
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r2, 1
	ldw	r30, r1, -3
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	rad.4063
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r2, 2
jmpeq_cont.9702:
	ldw	r5, r1, -6
	subis	r0, r5, 2
	jmpine	jmpeq_else.9703
	addi	r6, r0, 1
	jmpi	jmpeq_cont.9704
jmpeq_else.9703:
	ldw	r6, r1, -11
jmpeq_cont.9704:
	addi	r7, r0, 4
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r6, r1, -15
	stw	r2, r1, -14
	addi	r2, r7, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 48
	stw	r2, r5, 40
	ldw	r2, r1, -14
	stw	r2, r5, 36
	ldw	r6, r1, -13
	stw	r6, r5, 32
	ldw	r6, r1, -12
	stw	r6, r5, 28
	ldw	r6, r1, -15
	stw	r6, r5, 24
	ldw	r6, r1, -10
	stw	r6, r5, 20
	ldw	r6, r1, -9
	stw	r6, r5, 16
	ldw	r7, r1, -8
	stw	r7, r5, 12
	ldw	r8, r1, -7
	stw	r8, r5, 8
	ldw	r8, r1, -6
	stw	r8, r5, 4
	ldw	r9, r1, -5
	stw	r9, r5, 0
	ldw	r9, r1, -2
	slli	r9, r9, 0
	ldw	r10, r1, -1
	add	r14, r10, r9
	stw	r5, r14, 0
	subis	r0, r8, 3
	jmpine	jmpeq_else.9705
	ldf	f1, r6, 0
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9708
	ldf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	sgn.3365
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	stf	f1, r1, -19
	fmov	f1, f2
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -19
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmpi	jmpeq_cont.9709
jmpeq_else.9708:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9709:
	ldw	r2, r1, -9
	stf	f1, r2, 0
	ldf	f1, r2, 1
	stf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9710
	ldf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	sgn.3365
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -21
	stf	f1, r1, -23
	fmov	f1, f2
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -23
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmpi	jmpeq_cont.9711
jmpeq_else.9710:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9711:
	ldw	r2, r1, -9
	stf	f1, r2, 1
	ldf	f1, r2, 2
	stf	f1, r1, -25
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9712
	ldf	f1, r1, -25
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	sgn.3365
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -25
	stf	f1, r1, -27
	fmov	f1, f2
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -27
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmpi	jmpeq_cont.9713
jmpeq_else.9712:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9713:
	ldw	r2, r1, -9
	stf	f1, r2, 2
	jmpi	jmpeq_cont.9706
jmpeq_else.9705:
	subis	r0, r8, 2
	jmpine	jmpeq_else.9714
	ldw	r5, r1, -11
	subis	r0, r5, 0
	jmpine	jmpeq_else.9716
	addi	r5, r0, 1
	jmpi	jmpeq_cont.9717
jmpeq_else.9716:
	addi	r5, r0, 0
jmpeq_cont.9717:
	addi	r2, r6, 0
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	vecunit_sgn.3468
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9715
jmpeq_else.9714:
jmpeq_cont.9715:
jmpeq_cont.9706:
	ldw	r2, r1, -8
	subis	r0, r2, 0
	jmpine	jmpeq_else.9718
	jmpi	jmpeq_cont.9719
jmpeq_else.9718:
	ldw	r2, r1, -9
	ldw	r5, r1, -14
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	rotate_quadratic_matrix.4169
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9719:
	addi	r2, r0, 1
	jmp	r31
read_object.4412:
	ldw	r5, r30, 8
	ldw	r6, r30, 4
	subis	r0, r2, 60
	jmpilt	jmpge_else.9720
	jmp	r31
jmpge_else.9720:
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	addi	r30, r5, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9722
	ldw	r2, r1, -3
	ldw	r5, r1, -2
	stw	r2, r5, 0
	jmp	r31
jmpeq_else.9722:
	ldw	r2, r1, -3
	addi	r2, r2, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
read_all_object.4420:
	ldw	r30, r30, 4
	addi	r2, r0, 0
	ldw	r29, r30, 0
	jmp	r29
read_net_item.4423:
	ldw	r5, r30, 4
	stw	r30, r1, -1
	stw	r2, r1, -2
	addi	r30, r5, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, -1
	jmpine	jmpeq_else.9724
	ldw	r2, r1, -2
	addi	r2, r2, 1
	addi	r5, r0, -1
	jmpi	external_create_array
jmpeq_else.9724:
	ldw	r5, r1, -2
	addi	r6, r5, 1
	ldw	r30, r1, -1
	stw	r2, r1, -3
	addi	r2, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	slli	r5, r5, 0
	ldw	r6, r1, -3
	add	r14, r2, r5
	stw	r6, r14, 0
	jmp	r31
read_or_network.4437:
	ldw	r5, r30, 4
	addi	r6, r0, 0
	stw	r30, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	addi	r30, r5, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r5, 0
	subis	r0, r2, -1
	jmpine	jmpeq_else.9725
	ldw	r2, r1, -2
	addi	r2, r2, 1
	jmpi	external_create_array
jmpeq_else.9725:
	ldw	r2, r1, -2
	addi	r6, r2, 1
	ldw	r30, r1, -1
	stw	r5, r1, -3
	addi	r2, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	slli	r5, r5, 0
	ldw	r6, r1, -3
	add	r14, r2, r5
	stw	r6, r14, 0
	jmp	r31
read_and_network.4451:
	ldw	r5, r30, 8
	ldw	r6, r30, 4
	addi	r7, r0, 0
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	addi	r2, r7, 0
	addi	r30, r5, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r2, 0
	subis	r0, r5, -1
	jmpine	jmpeq_else.9726
	jmp	r31
jmpeq_else.9726:
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
	ldw	r2, r30, 24
	ldw	r5, r30, 20
	ldw	r6, r30, 16
	ldw	r7, r30, 12
	ldw	r8, r30, 8
	ldw	r9, r30, 4
	stw	r9, r1, -1
	stw	r5, r1, -2
	stw	r7, r1, -3
	stw	r8, r1, -4
	stw	r6, r1, -5
	addi	r30, r2, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -4
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 0
	ldw	r30, r1, -3
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 0
	ldw	r30, r1, -2
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r5, 0
	jmp	r31
solver_rect_surface.4475:
	ldw	r9, r30, 4
	slli	r10, r6, 0
	add	r14, r5, r10
	ldf	f4, r14, 0
	stw	r9, r1, -1
	stf	f3, r1, -3
	stw	r8, r1, -5
	stf	f2, r1, -7
	stw	r7, r1, -9
	stf	f1, r1, -11
	stw	r5, r1, -13
	stw	r6, r1, -14
	stw	r2, r1, -15
	fmov	f1, f4
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9732
	ldw	r2, r1, -15
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	o_param_abc.3767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -15
	stw	r2, r1, -16
	addi	r2, r5, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -14
	slli	r6, r5, 0
	ldw	r7, r1, -13
	add	r14, r7, r6
	ldf	f1, r14, 0
	stw	r2, r1, -17
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -17
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	cali	xor.3360
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -14
	slli	r6, r5, 0
	ldw	r7, r1, -16
	add	r14, r7, r6
	ldf	f1, r14, 0
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	cali	fneg_cond.3371
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fsub	f1, f1, f2
	ldw	r2, r1, -14
	slli	r2, r2, 0
	ldw	r5, r1, -13
	add	r14, r5, r2
	ldf	f2, r14, 0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -9
	slli	r6, r2, 0
	add	r14, r5, r6
	ldf	f2, r14, 0
	fmul	f2, f1, f2
	ldf	f3, r1, -7
	fadd	f2, f2, f3
	stf	f1, r1, -19
	fmov	f1, f2
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	slli	r2, r2, 0
	ldw	r5, r1, -16
	add	r14, r5, r2
	ldf	f2, r14, 0
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9734
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9734:
	ldw	r2, r1, -5
	slli	r5, r2, 0
	ldw	r6, r1, -13
	add	r14, r6, r5
	ldf	f1, r14, 0
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldf	f3, r1, -3
	fadd	f1, f1, f3
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	slli	r2, r2, 0
	ldw	r5, r1, -16
	add	r14, r5, r2
	ldf	f2, r14, 0
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9735
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9735:
	ldf	f1, r1, -19
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9732:
	addi	r2, r0, 0
	jmp	r31
solver_rect.4513:
	ldw	r30, r30, 4
	addi	r6, r0, 0
	addi	r7, r0, 1
	addi	r8, r0, 2
	stf	f1, r1, -1
	stf	f3, r1, -3
	stf	f2, r1, -5
	stw	r5, r1, -7
	stw	r2, r1, -8
	stw	r30, r1, -9
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9736
	addi	r6, r0, 1
	addi	r7, r0, 2
	addi	r8, r0, 0
	ldw	r2, r1, -8
	ldw	r5, r1, -7
	ldf	f1, r1, -5
	ldf	f2, r1, -3
	ldf	f3, r1, -1
	ldw	r30, r1, -9
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9737
	addi	r6, r0, 2
	addi	r7, r0, 0
	addi	r8, r0, 1
	ldw	r2, r1, -8
	ldw	r5, r1, -7
	ldf	f1, r1, -3
	ldf	f2, r1, -1
	ldf	f3, r1, -5
	ldw	r30, r1, -9
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9738
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9738:
	addi	r2, r0, 3
	jmp	r31
jmpeq_else.9737:
	addi	r2, r0, 2
	jmp	r31
jmpeq_else.9736:
	addi	r2, r0, 1
	jmp	r31
solver_surface.4534:
	ldw	r6, r30, 4
	stw	r6, r1, -1
	stf	f3, r1, -3
	stf	f2, r1, -5
	stf	f1, r1, -7
	stw	r5, r1, -9
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	o_param_abc.3767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -9
	stw	r5, r1, -10
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -11
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9740
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9740:
	ldw	r2, r1, -10
	ldf	f1, r1, -7
	ldf	f2, r1, -5
	ldf	f3, r1, -3
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	veciprod2.3522
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
quadratic.4549:
	stf	f1, r1, -1
	stf	f3, r1, -3
	stf	f2, r1, -5
	stw	r2, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -7
	stf	f1, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldf	f2, r1, -5
	stf	f1, r1, -11
	fmov	f1, f2
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -7
	stf	f1, r1, -13
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	fmul	f1, f2, f1
	ldf	f2, r1, -11
	fadd	f1, f2, f1
	ldf	f2, r1, -3
	stf	f1, r1, -15
	fmov	f1, f2
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -7
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	fmul	f1, f2, f1
	ldf	f2, r1, -15
	fadd	f1, f2, f1
	ldw	r2, r1, -7
	stf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	o_isrot.3712
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9742
	ldf	f1, r1, -19
	jmp	r31
jmpeq_else.9742:
	ldf	f1, r1, -5
	ldf	f2, r1, -3
	fmul	f3, f1, f2
	ldw	r2, r1, -7
	stf	f3, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	o_param_r1.3892
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -21
	fmul	f1, f2, f1
	ldf	f2, r1, -19
	fadd	f1, f2, f1
	ldf	f2, r1, -3
	ldf	f3, r1, -1
	fmul	f2, f2, f3
	ldw	r2, r1, -7
	stf	f1, r1, -23
	stf	f2, r1, -25
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	o_param_r2.3906
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -25
	fmul	f1, f2, f1
	ldf	f2, r1, -23
	fadd	f1, f2, f1
	ldf	f2, r1, -1
	ldf	f3, r1, -5
	fmul	f2, f2, f3
	ldw	r2, r1, -7
	stf	f1, r1, -27
	stf	f2, r1, -29
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	o_param_r3.3920
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -29
	fmul	f1, f2, f1
	ldf	f2, r1, -27
	fadd	f1, f2, f1
	jmp	r31
bilinear.4578:
	fmul	f7, f1, f4
	stf	f4, r1, -1
	stf	f1, r1, -3
	stf	f6, r1, -5
	stf	f3, r1, -7
	stw	r2, r1, -9
	stf	f5, r1, -11
	stf	f2, r1, -13
	stf	f7, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fmul	f1, f2, f1
	ldf	f2, r1, -13
	ldf	f3, r1, -11
	fmul	f4, f2, f3
	ldw	r2, r1, -9
	stf	f1, r1, -17
	stf	f4, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldf	f2, r1, -17
	fadd	f1, f2, f1
	ldf	f2, r1, -7
	ldf	f3, r1, -5
	fmul	f4, f2, f3
	ldw	r2, r1, -9
	stf	f1, r1, -21
	stf	f4, r1, -23
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -23
	fmul	f1, f2, f1
	ldf	f2, r1, -21
	fadd	f1, f2, f1
	ldw	r2, r1, -9
	stf	f1, r1, -25
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	o_isrot.3712
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9744
	ldf	f1, r1, -25
	jmp	r31
jmpeq_else.9744:
	ldf	f1, r1, -7
	ldf	f2, r1, -11
	fmul	f3, f1, f2
	ldf	f4, r1, -13
	ldf	f5, r1, -5
	fmul	f6, f4, f5
	fadd	f3, f3, f6
	ldw	r2, r1, -9
	stf	f3, r1, -27
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	o_param_r1.3892
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -27
	fmul	f1, f2, f1
	ldf	f2, r1, -3
	ldf	f3, r1, -5
	fmul	f3, f2, f3
	ldf	f4, r1, -7
	ldf	f5, r1, -1
	fmul	f4, f4, f5
	fadd	f3, f3, f4
	ldw	r2, r1, -9
	stf	f1, r1, -29
	stf	f3, r1, -31
	stw	r1, r1, -37
	addi	r1, r1, -37
	stw	r31, r1, 1
	cali	o_param_r2.3906
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -31
	fmul	f1, f2, f1
	ldf	f2, r1, -29
	fadd	f1, f2, f1
	ldf	f2, r1, -3
	ldf	f3, r1, -11
	fmul	f2, f2, f3
	ldf	f3, r1, -13
	ldf	f4, r1, -1
	fmul	f3, f3, f4
	fadd	f2, f2, f3
	ldw	r2, r1, -9
	stf	f1, r1, -33
	stf	f2, r1, -35
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	o_param_r3.3920
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -35
	fmul	f1, f2, f1
	ldf	f2, r1, -33
	fadd	f1, f2, f1
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	fhalf.2783
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -25
	fadd	f1, f2, f1
	jmp	r31
solver_second.4617:
	ldw	r6, r30, 4
	ldf	f4, r5, 0
	ldf	f5, r5, 1
	ldf	f6, r5, 2
	stw	r6, r1, -1
	stf	f3, r1, -3
	stf	f2, r1, -5
	stf	f1, r1, -7
	stw	r2, r1, -9
	stw	r5, r1, -10
	fmov	f3, f6
	fmov	f2, f5
	fmov	f1, f4
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	quadratic.4549
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -11
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9746
	ldw	r2, r1, -10
	ldf	f1, r2, 0
	ldf	f2, r2, 1
	ldf	f3, r2, 2
	ldw	r2, r1, -9
	ldf	f4, r1, -7
	ldf	f5, r1, -5
	ldf	f6, r1, -3
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	bilinear.4578
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	ldf	f2, r1, -7
	ldf	f3, r1, -5
	ldf	f4, r1, -3
	stf	f1, r1, -13
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	quadratic.4549
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	stf	f1, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 3
	jmpine	jmpeq_else.9747
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -15
	fsub	f1, f2, f1
	jmpi	jmpeq_cont.9748
jmpeq_else.9747:
	ldf	f1, r1, -15
jmpeq_cont.9748:
	ldf	f2, r1, -13
	stf	f1, r1, -17
	fmov	f1, f2
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	ldf	f3, r1, -17
	fmul	f3, f2, f3
	fsub	f1, f1, f3
	stf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9749
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9749:
	ldf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	stf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9750
	ldf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9751
jmpeq_else.9750:
	ldf	f1, r1, -21
jmpeq_cont.9751:
	ldf	f2, r1, -13
	fsub	f1, f1, f2
	ldf	f2, r1, -11
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9746:
	addi	r2, r0, 0
	jmp	r31
solver.4657:
	ldw	r7, r30, 16
	ldw	r8, r30, 12
	ldw	r9, r30, 8
	ldw	r10, r30, 4
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
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -6
	ldf	f2, r2, 1
	ldw	r5, r1, -5
	stf	f1, r1, -9
	stf	f2, r1, -11
	addi	r2, r5, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_param_y.3794
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fsub	f1, f2, f1
	ldw	r2, r1, -6
	ldf	f2, r2, 2
	ldw	r2, r1, -5
	stf	f1, r1, -13
	stf	f2, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9752
	ldw	r2, r1, -5
	ldw	r5, r1, -3
	ldf	f1, r1, -9
	ldf	f2, r1, -13
	ldf	f3, r1, -17
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9752:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9753
	ldw	r2, r1, -5
	ldw	r5, r1, -3
	ldf	f1, r1, -9
	ldf	f2, r1, -13
	ldf	f3, r1, -17
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9753:
	ldw	r2, r1, -5
	ldw	r5, r1, -3
	ldf	f1, r1, -9
	ldf	f2, r1, -13
	ldf	f3, r1, -17
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
solver_rect_fast.4677:
	ldw	r7, r30, 4
	ldf	f4, r6, 0
	fsub	f4, f4, f1
	ldf	f5, r6, 1
	fmul	f4, f4, f5
	ldf	f5, r5, 1
	fmul	f5, f4, f5
	fadd	f5, f5, f2
	stw	r7, r1, -1
	stf	f1, r1, -3
	stf	f2, r1, -5
	stw	r6, r1, -7
	stf	f3, r1, -9
	stf	f4, r1, -11
	stw	r5, r1, -13
	stw	r2, r1, -14
	fmov	f1, f5
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9756
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9757
jmpeq_else.9756:
	ldw	r2, r1, -13
	ldf	f1, r2, 2
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	ldf	f3, r1, -9
	fadd	f1, f1, f3
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9758
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9759
jmpeq_else.9758:
	ldw	r2, r1, -7
	ldf	f1, r2, 1
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9760
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9761
jmpeq_else.9760:
	addi	r2, r0, 0
jmpeq_cont.9761:
jmpeq_cont.9759:
jmpeq_cont.9757:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9762
	ldw	r2, r1, -7
	ldf	f1, r2, 2
	ldf	f2, r1, -5
	fsub	f1, f1, f2
	ldf	f3, r2, 3
	fmul	f1, f1, f3
	ldw	r5, r1, -13
	ldf	f3, r5, 0
	fmul	f3, f1, f3
	ldf	f4, r1, -3
	fadd	f3, f3, f4
	stf	f1, r1, -19
	fmov	f1, f3
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9763
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9764
jmpeq_else.9763:
	ldw	r2, r1, -13
	ldf	f1, r2, 2
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldf	f3, r1, -9
	fadd	f1, f1, f3
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r1, -23
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -23
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9765
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9766
jmpeq_else.9765:
	ldw	r2, r1, -7
	ldf	f1, r2, 3
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9767
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9768
jmpeq_else.9767:
	addi	r2, r0, 0
jmpeq_cont.9768:
jmpeq_cont.9766:
jmpeq_cont.9764:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9769
	ldw	r2, r1, -7
	ldf	f1, r2, 4
	ldf	f2, r1, -9
	fsub	f1, f1, f2
	ldf	f2, r2, 5
	fmul	f1, f1, f2
	ldw	r5, r1, -13
	ldf	f2, r5, 0
	fmul	f2, f1, f2
	ldf	f3, r1, -3
	fadd	f2, f2, f3
	stf	f1, r1, -25
	fmov	f1, f2
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r1, -27
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -27
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9770
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9771
jmpeq_else.9770:
	ldw	r2, r1, -13
	ldf	f1, r2, 1
	ldf	f2, r1, -25
	fmul	f1, f2, f1
	ldf	f3, r1, -5
	fadd	f1, f1, f3
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stf	f1, r1, -29
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -29
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9772
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9773
jmpeq_else.9772:
	ldw	r2, r1, -7
	ldf	f1, r2, 5
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9774
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9775
jmpeq_else.9774:
	addi	r2, r0, 0
jmpeq_cont.9775:
jmpeq_cont.9773:
jmpeq_cont.9771:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9776
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9776:
	ldf	f1, r1, -25
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 3
	jmp	r31
jmpeq_else.9769:
	ldf	f1, r1, -19
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 2
	jmp	r31
jmpeq_else.9762:
	ldf	f1, r1, -11
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
solver_surface_fast.4774:
	ldw	r2, r30, 4
	ldf	f4, r5, 0
	stw	r2, r1, -1
	stf	f3, r1, -3
	stf	f2, r1, -5
	stf	f1, r1, -7
	stw	r5, r1, -9
	fmov	f1, f4
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9778
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9778:
	ldw	r2, r1, -9
	ldf	f1, r2, 1
	ldf	f2, r1, -7
	fmul	f1, f1, f2
	ldf	f2, r2, 2
	ldf	f3, r1, -5
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldf	f2, r2, 3
	ldf	f3, r1, -3
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
	addi	r2, r0, 1
	jmp	r31
solver_second_fast.4797:
	ldw	r6, r30, 4
	ldf	f4, r5, 0
	stw	r6, r1, -1
	stf	f4, r1, -3
	stw	r2, r1, -5
	stf	f3, r1, -7
	stf	f2, r1, -9
	stf	f1, r1, -11
	stw	r5, r1, -13
	fmov	f1, f4
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9781
	ldw	r2, r1, -13
	ldf	f1, r2, 1
	ldf	f2, r1, -11
	fmul	f1, f1, f2
	ldf	f3, r2, 2
	ldf	f4, r1, -9
	fmul	f3, f3, f4
	fadd	f1, f1, f3
	ldf	f3, r2, 3
	ldf	f5, r1, -7
	fmul	f3, f3, f5
	fadd	f1, f1, f3
	ldw	r5, r1, -5
	stf	f1, r1, -15
	addi	r2, r5, 0
	fmov	f3, f5
	fmov	f1, f2
	fmov	f2, f4
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	quadratic.4549
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 3
	jmpine	jmpeq_else.9783
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -17
	fsub	f1, f2, f1
	jmpi	jmpeq_cont.9784
jmpeq_else.9783:
	ldf	f1, r1, -17
jmpeq_cont.9784:
	ldf	f2, r1, -15
	stf	f1, r1, -19
	fmov	f1, f2
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -3
	ldf	f3, r1, -19
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	stf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9785
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9785:
	ldw	r2, r1, -5
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9786
	ldf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fsub	f1, f2, f1
	ldw	r2, r1, -13
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
	jmpi	jmpeq_cont.9787
jmpeq_else.9786:
	ldf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fadd	f1, f2, f1
	ldw	r2, r1, -13
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
jmpeq_cont.9787:
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9781:
	addi	r2, r0, 0
	jmp	r31
solver_fast.4843:
	ldw	r7, r30, 16
	ldw	r8, r30, 12
	ldw	r9, r30, 8
	ldw	r10, r30, 4
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
	stf	f1, r1, -9
	addi	r2, r10, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	ldw	r2, r1, -7
	ldf	f2, r2, 1
	ldw	r5, r1, -6
	stf	f1, r1, -11
	stf	f2, r1, -13
	addi	r2, r5, 0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	o_param_y.3794
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	fsub	f1, f2, f1
	ldw	r2, r1, -7
	ldf	f2, r2, 2
	ldw	r2, r1, -6
	stf	f1, r1, -15
	stf	f2, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	d_const.4044
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	slli	r5, r5, 0
	add	r14, r2, r5
	ldw	r2, r14, 0
	ldw	r5, r1, -6
	stw	r2, r1, -21
	addi	r2, r5, 0
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9789
	ldw	r2, r1, -5
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -6
	ldw	r6, r1, -21
	ldf	f1, r1, -11
	ldf	f2, r1, -15
	ldf	f3, r1, -19
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9789:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9790
	ldw	r2, r1, -6
	ldw	r5, r1, -21
	ldf	f1, r1, -11
	ldf	f2, r1, -15
	ldf	f3, r1, -19
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9790:
	ldw	r2, r1, -6
	ldw	r5, r1, -21
	ldf	f1, r1, -11
	ldf	f2, r1, -15
	ldf	f3, r1, -19
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
solver_surface_fast2.4866:
	ldw	r2, r30, 4
	ldf	f1, r5, 0
	stw	r2, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9791
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9791:
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
	ldw	r7, r30, 4
	ldf	f4, r5, 0
	stw	r7, r1, -1
	stw	r2, r1, -2
	stf	f4, r1, -3
	stw	r6, r1, -5
	stf	f3, r1, -7
	stf	f2, r1, -9
	stf	f1, r1, -11
	stw	r5, r1, -13
	fmov	f1, f4
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9793
	ldw	r2, r1, -13
	ldf	f1, r2, 1
	ldf	f2, r1, -11
	fmul	f1, f1, f2
	ldf	f2, r2, 2
	ldf	f3, r1, -9
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldf	f2, r2, 3
	ldf	f3, r1, -7
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	ldw	r5, r1, -5
	ldf	f2, r5, 3
	stf	f1, r1, -15
	stf	f2, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -3
	ldf	f3, r1, -17
	fmul	f2, f2, f3
	fsub	f1, f1, f2
	stf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9795
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9795:
	ldw	r2, r1, -2
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9796
	ldf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fsub	f1, f2, f1
	ldw	r2, r1, -13
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
	jmpi	jmpeq_cont.9797
jmpeq_else.9796:
	ldf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fadd	f1, f2, f1
	ldw	r2, r1, -13
	ldf	f2, r2, 4
	fmul	f1, f1, f2
	ldw	r2, r1, -1
	stf	f1, r2, 0
jmpeq_cont.9797:
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9793:
	addi	r2, r0, 0
	jmp	r31
solver_fast2.4928:
	ldw	r6, r30, 16
	ldw	r7, r30, 12
	ldw	r8, r30, 8
	ldw	r9, r30, 4
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
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	o_param_ctbl.3934
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r2, 0
	ldf	f2, r2, 1
	ldf	f3, r2, 2
	ldw	r5, r1, -6
	stw	r2, r1, -7
	stf	f3, r1, -9
	stf	f2, r1, -11
	stf	f1, r1, -13
	addi	r2, r5, 0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	d_const.4044
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	slli	r5, r5, 0
	add	r14, r2, r5
	ldw	r2, r14, 0
	ldw	r5, r1, -4
	stw	r2, r1, -15
	addi	r2, r5, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9799
	ldw	r2, r1, -6
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -4
	ldw	r6, r1, -15
	ldf	f1, r1, -13
	ldf	f2, r1, -11
	ldf	f3, r1, -9
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9799:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9800
	ldw	r2, r1, -4
	ldw	r5, r1, -15
	ldw	r6, r1, -7
	ldf	f1, r1, -13
	ldf	f2, r1, -11
	ldf	f3, r1, -9
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9800:
	ldw	r2, r1, -4
	ldw	r5, r1, -15
	ldw	r6, r1, -7
	ldf	f1, r1, -13
	ldf	f2, r1, -11
	ldf	f3, r1, -9
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
setup_rect_table.4945:
	addi	r6, r0, 6
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	stw	r2, r1, -3
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9801
	ldw	r2, r1, -1
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	stw	r2, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	xor.3360
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r1, -5
	addi	r2, r5, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	fneg_cond.3371
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	stf	f1, r2, 0
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -2
	ldf	f2, r5, 0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r2, 1
	jmpi	jmpeq_cont.9802
jmpeq_else.9801:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 1
jmpeq_cont.9802:
	ldw	r5, r1, -2
	ldf	f1, r5, 1
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9803
	ldw	r2, r1, -1
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	ldf	f1, r5, 1
	stw	r2, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	xor.3360
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	fneg_cond.3371
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	stf	f1, r2, 2
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -2
	ldf	f2, r5, 1
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r2, 3
	jmpi	jmpeq_cont.9804
jmpeq_else.9803:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 3
jmpeq_cont.9804:
	ldw	r5, r1, -2
	ldf	f1, r5, 2
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9805
	ldw	r2, r1, -1
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	ldf	f1, r5, 2
	stw	r2, r1, -8
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -8
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	xor.3360
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r1, -9
	addi	r2, r5, 0
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	fneg_cond.3371
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	stf	f1, r2, 4
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -2
	ldf	f2, r5, 2
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r2, 5
	jmpi	jmpeq_cont.9806
jmpeq_else.9805:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 5
jmpeq_cont.9806:
	jmp	r31
setup_surface_table.5014:
	addi	r6, r0, 4
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	ldw	r6, r1, -1
	stw	r2, r1, -3
	stf	f1, r1, -5
	addi	r2, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	ldw	r5, r1, -1
	stf	f1, r1, -7
	stf	f2, r1, -9
	addi	r2, r5, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fmul	f1, f2, f1
	ldf	f2, r1, -7
	fadd	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	ldw	r2, r1, -1
	stf	f1, r1, -11
	stf	f2, r1, -13
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	fmul	f1, f2, f1
	ldf	f2, r1, -11
	fadd	f1, f2, f1
	stf	f1, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9808
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -3
	stf	f1, r2, 0
	jmpi	jmpeq_cont.9809
jmpeq_else.9808:
	addi	r14, r0, -16512
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -15
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -3
	stf	f1, r2, 0
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	stf	f1, r2, 1
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	stf	f1, r2, 2
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	stf	f1, r2, 3
jmpeq_cont.9809:
	jmp	r31
setup_second_table.5057:
	addi	r6, r0, 5
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r5, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	ldf	f1, r5, 0
	ldf	f2, r5, 1
	ldf	f3, r5, 2
	ldw	r6, r1, -1
	stw	r2, r1, -3
	addi	r2, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	quadratic.4549
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	ldw	r5, r1, -1
	stf	f1, r1, -5
	stf	f2, r1, -7
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	ldw	r5, r1, -1
	stf	f1, r1, -9
	stf	f2, r1, -11
	addi	r2, r5, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	ldf	f2, r2, 2
	ldw	r5, r1, -1
	stf	f1, r1, -13
	stf	f2, r1, -15
	addi	r2, r5, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fmul	f1, f2, f1
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	ldw	r2, r1, -3
	stf	f2, r2, 0
	ldw	r5, r1, -1
	stf	f1, r1, -17
	addi	r2, r5, 0
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_isrot.3712
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9811
	ldf	f1, r1, -9
	ldw	r2, r1, -3
	stf	f1, r2, 1
	ldf	f1, r1, -13
	stf	f1, r2, 2
	ldf	f1, r1, -17
	stf	f1, r2, 3
	jmpi	jmpeq_cont.9812
jmpeq_else.9811:
	ldw	r2, r1, -2
	ldf	f1, r2, 2
	ldw	r5, r1, -1
	stf	f1, r1, -19
	addi	r2, r5, 0
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	o_param_r2.3906
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 1
	ldw	r5, r1, -1
	stf	f1, r1, -21
	stf	f2, r1, -23
	addi	r2, r5, 0
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	o_param_r3.3920
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -23
	fmul	f1, f2, f1
	ldf	f2, r1, -21
	fadd	f1, f2, f1
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	fhalf.2783
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r2, 1
	ldw	r5, r1, -2
	ldf	f1, r5, 2
	ldw	r6, r1, -1
	stf	f1, r1, -25
	addi	r2, r6, 0
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	o_param_r1.3892
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -25
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	ldw	r5, r1, -1
	stf	f1, r1, -27
	stf	f2, r1, -29
	addi	r2, r5, 0
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	o_param_r3.3920
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -29
	fmul	f1, f2, f1
	ldf	f2, r1, -27
	fadd	f1, f2, f1
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	fhalf.2783
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r2, 2
	ldw	r5, r1, -2
	ldf	f1, r5, 1
	ldw	r6, r1, -1
	stf	f1, r1, -31
	addi	r2, r6, 0
	stw	r1, r1, -37
	addi	r1, r1, -37
	stw	r31, r1, 1
	cali	o_param_r1.3892
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -31
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldf	f2, r2, 0
	ldw	r2, r1, -1
	stf	f1, r1, -33
	stf	f2, r1, -35
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	o_param_r2.3906
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -35
	fmul	f1, f2, f1
	ldf	f2, r1, -33
	fadd	f1, f2, f1
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	fhalf.2783
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r2, 3
jmpeq_cont.9812:
	ldf	f1, r1, -5
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	fiszero.2773
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9813
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -5
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -3
	stf	f1, r2, 4
	jmpi	jmpeq_cont.9814
jmpeq_else.9813:
jmpeq_cont.9814:
	ldw	r2, r1, -3
	jmp	r31
iter_setup_dirvec_constants.5139:
	ldw	r6, r30, 4
	subis	r0, r5, 0
	jmpilt	jmpge_else.9815
	slli	r7, r5, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	stw	r30, r1, -1
	stw	r5, r1, -2
	stw	r6, r1, -3
	stw	r2, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	d_const.4044
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	stw	r2, r1, -5
	addi	r2, r5, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	stw	r2, r1, -6
	addi	r2, r5, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9816
	ldw	r2, r1, -6
	ldw	r5, r1, -3
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	setup_rect_table.4945
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	stw	r2, r14, 0
	jmpi	jmpeq_cont.9817
jmpeq_else.9816:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9818
	ldw	r2, r1, -6
	ldw	r5, r1, -3
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	setup_surface_table.5014
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	stw	r2, r14, 0
	jmpi	jmpeq_cont.9819
jmpeq_else.9818:
	ldw	r2, r1, -6
	ldw	r5, r1, -3
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	setup_second_table.5057
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	stw	r2, r14, 0
jmpeq_cont.9819:
jmpeq_cont.9817:
	subi	r5, r5, 1
	ldw	r2, r1, -4
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9815:
	jmp	r31
setup_dirvec_constants.5155:
	ldw	r5, r30, 8
	ldw	r30, r30, 4
	ldw	r5, r5, 0
	subi	r5, r5, 1
	ldw	r29, r30, 0
	jmp	r29
setup_startp_constants.5161:
	ldw	r6, r30, 4
	subis	r0, r5, 0
	jmpilt	jmpge_else.9821
	slli	r7, r5, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	stw	r30, r1, -1
	stw	r5, r1, -2
	stw	r2, r1, -3
	stw	r6, r1, -4
	addi	r2, r6, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_param_ctbl.3934
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	stw	r2, r1, -5
	addi	r2, r5, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	ldf	f1, r5, 0
	ldw	r6, r1, -4
	stw	r2, r1, -6
	stf	f1, r1, -7
	addi	r2, r6, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r2, 0
	ldw	r5, r1, -3
	ldf	f1, r5, 1
	ldw	r6, r1, -4
	stf	f1, r1, -9
	addi	r2, r6, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_y.3794
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r2, 1
	ldw	r5, r1, -3
	ldf	f1, r5, 2
	ldw	r6, r1, -4
	stf	f1, r1, -11
	addi	r2, r6, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r2, 2
	ldw	r5, r1, -6
	subis	r0, r5, 2
	jmpine	jmpeq_else.9822
	ldw	r5, r1, -4
	addi	r2, r5, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_param_abc.3767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	ldf	f1, r5, 0
	ldf	f2, r5, 1
	ldf	f3, r5, 2
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	veciprod2.3522
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	stf	f1, r2, 3
	jmpi	jmpeq_cont.9823
jmpeq_else.9822:
	subis	r0, r5, 2
	jmpigt	jmple_else.9824
	jmpi	jmple_cont.9825
jmple_else.9824:
	ldf	f1, r2, 0
	ldf	f2, r2, 1
	ldf	f3, r2, 2
	ldw	r6, r1, -4
	addi	r2, r6, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	quadratic.4549
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	subis	r0, r2, 3
	jmpine	jmpeq_else.9826
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsub	f1, f1, f2
	jmpi	jmpeq_cont.9827
jmpeq_else.9826:
jmpeq_cont.9827:
	ldw	r2, r1, -5
	stf	f1, r2, 3
jmple_cont.9825:
jmpeq_cont.9823:
	ldw	r2, r1, -2
	subi	r5, r2, 1
	ldw	r2, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9821:
	jmp	r31
setup_startp.5211:
	ldw	r5, r30, 12
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	stw	r2, r1, -1
	stw	r6, r1, -2
	stw	r7, r1, -3
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	ldw	r2, r2, 0
	subi	r5, r2, 1
	ldw	r2, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
is_rect_outside.5218:
	stf	f3, r1, -1
	stf	f2, r1, -3
	stw	r2, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	stf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9830
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9831
jmpeq_else.9830:
	ldf	f1, r1, -3
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	stf	f1, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9832
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9833
jmpeq_else.9832:
	ldf	f1, r1, -1
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	stf	f1, r1, -11
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -11
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9833:
jmpeq_cont.9831:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9834
	ldw	r2, r1, -5
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9835
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9835:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9834:
	ldw	r2, r1, -5
	jmpi	o_isinvert.3699
is_plane_outside.5237:
	stw	r2, r1, -1
	stf	f3, r1, -3
	stf	f2, r1, -5
	stf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_param_abc.3767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -7
	ldf	f2, r1, -5
	ldf	f3, r1, -3
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	veciprod2.3522
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	stf	f1, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -9
	stw	r2, r1, -11
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -11
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	xor.3360
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9837
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9837:
	addi	r2, r0, 0
	jmp	r31
is_second_outside.5248:
	stw	r2, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	quadratic.4549
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	stf	f1, r1, -3
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 3
	jmpine	jmpeq_else.9839
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -3
	fsub	f1, f2, f1
	jmpi	jmpeq_cont.9840
jmpeq_else.9839:
	ldf	f1, r1, -3
jmpeq_cont.9840:
	ldw	r2, r1, -1
	stf	f1, r1, -5
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -5
	stw	r2, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	xor.3360
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9841
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9841:
	addi	r2, r0, 0
	jmp	r31
is_outside.5262:
	stf	f3, r1, -1
	stf	f2, r1, -3
	stw	r2, r1, -5
	stf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_y.3794
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -3
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -11
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -1
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	stf	f1, r1, -13
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9843
	ldw	r2, r1, -5
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	jmpi	is_rect_outside.5218
jmpeq_else.9843:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9844
	ldw	r2, r1, -5
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	jmpi	is_plane_outside.5237
jmpeq_else.9844:
	ldw	r2, r1, -5
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	jmpi	is_second_outside.5248
check_all_inside.5276:
	ldw	r6, r30, 4
	slli	r7, r2, 0
	add	r14, r5, r7
	ldw	r7, r14, 0
	subis	r0, r7, -1
	jmpine	jmpeq_else.9845
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.9845:
	slli	r7, r7, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	stf	f3, r1, -1
	stf	f2, r1, -3
	stf	f1, r1, -5
	stw	r5, r1, -7
	stw	r30, r1, -8
	stw	r2, r1, -9
	addi	r2, r6, 0
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	is_outside.5262
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9846
	ldw	r2, r1, -9
	addi	r2, r2, 1
	ldw	r5, r1, -7
	ldf	f1, r1, -5
	ldf	f2, r1, -3
	ldf	f3, r1, -1
	ldw	r30, r1, -8
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9846:
	addi	r2, r0, 0
	jmp	r31
shadow_check_and_group.5290:
	ldw	r6, r30, 28
	ldw	r7, r30, 24
	ldw	r8, r30, 20
	ldw	r9, r30, 16
	ldw	r10, r30, 12
	ldw	r11, r30, 8
	ldw	r12, r30, 4
	slli	r13, r2, 0
	add	r14, r5, r13
	ldw	r13, r14, 0
	subis	r0, r13, -1
	jmpine	jmpeq_else.9847
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9847:
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
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -9
	ldf	f1, r5, 0
	stf	f1, r1, -11
	subis	r0, r2, 0
	jmpine	jmpeq_else.9849
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9850
jmpeq_else.9849:
	addi	r14, r0, -16820
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9850:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9851
	ldw	r2, r1, -8
	slli	r2, r2, 0
	ldw	r5, r1, -7
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9852
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9852:
	ldw	r2, r1, -6
	addi	r2, r2, 1
	ldw	r5, r1, -4
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9851:
	addi	r14, r0, 15395
	slli	r14, r14, 16
	oori	r14, r14, 55050
	mif	f1, r14, r0
	ldf	f2, r1, -11
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
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9853
	ldw	r2, r1, -6
	addi	r2, r2, 1
	ldw	r5, r1, -4
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9853:
	addi	r2, r0, 1
	jmp	r31
shadow_check_one_or_group.5334:
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	slli	r8, r2, 0
	add	r14, r5, r8
	ldw	r8, r14, 0
	subis	r0, r8, -1
	jmpine	jmpeq_else.9854
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9854:
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
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9855
	ldw	r2, r1, -3
	addi	r2, r2, 1
	ldw	r5, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9855:
	addi	r2, r0, 1
	jmp	r31
shadow_check_one_or_matrix.5346:
	ldw	r6, r30, 20
	ldw	r7, r30, 16
	ldw	r8, r30, 12
	ldw	r9, r30, 8
	ldw	r10, r30, 4
	slli	r11, r2, 0
	add	r14, r5, r11
	ldw	r11, r14, 0
	ldw	r12, r11, 0
	subis	r0, r12, -1
	jmpine	jmpeq_else.9856
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9856:
	stw	r11, r1, -1
	stw	r8, r1, -2
	stw	r5, r1, -3
	stw	r30, r1, -4
	stw	r2, r1, -5
	subis	r0, r12, 99
	jmpine	jmpeq_else.9857
	addi	r2, r0, 1
	jmpi	jmpeq_cont.9858
jmpeq_else.9857:
	stw	r7, r1, -6
	addi	r5, r9, 0
	addi	r2, r12, 0
	addi	r30, r6, 0
	addi	r6, r10, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9859
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9860
jmpeq_else.9859:
	ldw	r2, r1, -6
	ldf	f1, r2, 0
	addi	r14, r0, -16948
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9861
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9862
jmpeq_else.9861:
	addi	r2, r0, 1
	ldw	r5, r1, -1
	ldw	r30, r1, -2
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9863
	addi	r2, r0, 0
	jmpi	jmpeq_cont.9864
jmpeq_else.9863:
	addi	r2, r0, 1
jmpeq_cont.9864:
jmpeq_cont.9862:
jmpeq_cont.9860:
jmpeq_cont.9858:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9865
	ldw	r2, r1, -5
	addi	r2, r2, 1
	ldw	r5, r1, -3
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9865:
	addi	r2, r0, 1
	ldw	r5, r1, -1
	ldw	r30, r1, -2
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9866
	ldw	r2, r1, -5
	addi	r2, r2, 1
	ldw	r5, r1, -3
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9866:
	addi	r2, r0, 1
	jmp	r31
solve_each_element.5374:
	ldw	r7, r30, 36
	ldw	r8, r30, 32
	ldw	r9, r30, 28
	ldw	r10, r30, 24
	ldw	r11, r30, 20
	ldw	r12, r30, 16
	ldw	r13, r30, 12
	ldw	r14, r30, 8
	ldw	r15, r30, 4
	slli	r16, r2, 0
	add	r14, r5, r16
	ldw	r16, r14, 0
	subis	r0, r16, -1
	jmpine	jmpeq_else.9867
	jmp	r31
jmpeq_else.9867:
	stw	r12, r1, -1
	stw	r14, r1, -2
	stw	r13, r1, -3
	stw	r15, r1, -4
	stw	r8, r1, -5
	stw	r7, r1, -6
	stw	r9, r1, -7
	stw	r6, r1, -8
	stw	r5, r1, -9
	stw	r30, r1, -10
	stw	r2, r1, -11
	stw	r11, r1, -12
	stw	r16, r1, -13
	addi	r5, r6, 0
	addi	r2, r16, 0
	addi	r30, r10, 0
	addi	r6, r8, 0
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9869
	ldw	r2, r1, -13
	slli	r2, r2, 0
	ldw	r5, r1, -12
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9870
	jmp	r31
jmpeq_else.9870:
	ldw	r2, r1, -11
	addi	r2, r2, 1
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r30, r1, -10
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9869:
	ldw	r5, r1, -7
	ldf	f2, r5, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -14
	stf	f2, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9872
	jmpi	jmpeq_cont.9873
jmpeq_else.9872:
	ldw	r2, r1, -6
	ldf	f2, r2, 0
	ldf	f1, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9874
	jmpi	jmpeq_cont.9875
jmpeq_else.9874:
	addi	r14, r0, 15395
	slli	r14, r14, 16
	oori	r14, r14, 55050
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
	stf	f4, r1, -17
	stf	f3, r1, -19
	stf	f2, r1, -21
	stf	f1, r1, -23
	addi	r2, r5, 0
	addi	r5, r6, 0
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9876
	jmpi	jmpeq_cont.9877
jmpeq_else.9876:
	ldf	f1, r1, -23
	ldw	r2, r1, -6
	stf	f1, r2, 0
	ldw	r2, r1, -3
	ldf	f1, r1, -21
	ldf	f2, r1, -19
	ldf	f3, r1, -17
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -13
	ldw	r5, r1, -2
	stw	r2, r5, 0
	ldw	r2, r1, -14
	ldw	r5, r1, -1
	stw	r2, r5, 0
jmpeq_cont.9877:
jmpeq_cont.9875:
jmpeq_cont.9873:
	ldw	r2, r1, -11
	addi	r2, r2, 1
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r30, r1, -10
	ldw	r29, r30, 0
	jmp	r29
solve_one_or_network.5429:
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	slli	r9, r2, 0
	add	r14, r5, r9
	ldw	r9, r14, 0
	subis	r0, r9, -1
	jmpine	jmpeq_else.9878
	jmp	r31
jmpeq_else.9878:
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
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
trace_or_matrix.5441:
	ldw	r7, r30, 20
	ldw	r8, r30, 16
	ldw	r9, r30, 12
	ldw	r10, r30, 8
	ldw	r11, r30, 4
	slli	r12, r2, 0
	add	r14, r5, r12
	ldw	r12, r14, 0
	ldw	r13, r12, 0
	subis	r0, r13, -1
	jmpine	jmpeq_else.9880
	jmp	r31
jmpeq_else.9880:
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r30, r1, -3
	stw	r2, r1, -4
	subis	r0, r13, 99
	jmpine	jmpeq_else.9882
	addi	r7, r0, 1
	addi	r5, r12, 0
	addi	r2, r7, 0
	addi	r30, r11, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9883
jmpeq_else.9882:
	stw	r12, r1, -5
	stw	r11, r1, -6
	stw	r7, r1, -7
	stw	r9, r1, -8
	addi	r5, r6, 0
	addi	r2, r13, 0
	addi	r30, r10, 0
	addi	r6, r8, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9884
	jmpi	jmpeq_cont.9885
jmpeq_else.9884:
	ldw	r2, r1, -8
	ldf	f1, r2, 0
	ldw	r2, r1, -7
	ldf	f2, r2, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9886
	jmpi	jmpeq_cont.9887
jmpeq_else.9886:
	addi	r2, r0, 1
	ldw	r5, r1, -5
	ldw	r6, r1, -1
	ldw	r30, r1, -6
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9887:
jmpeq_cont.9885:
jmpeq_cont.9883:
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
judge_intersection.5464:
	ldw	r5, r30, 12
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	addi	r14, r0, 20078
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
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	ldf	f2, r2, 0
	addi	r14, r0, -16948
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f1, r14, r0
	stf	f2, r1, -3
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9889
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9889:
	addi	r14, r0, 19646
	slli	r14, r14, 16
	oori	r14, r14, 48160
	mif	f2, r14, r0
	ldf	f1, r1, -3
	jmpi	fless.2764
solve_each_element_fast.5479:
	ldw	r7, r30, 36
	ldw	r8, r30, 32
	ldw	r9, r30, 28
	ldw	r10, r30, 24
	ldw	r11, r30, 20
	ldw	r12, r30, 16
	ldw	r13, r30, 12
	ldw	r14, r30, 8
	ldw	r15, r30, 4
	stw	r12, r1, -1
	stw	r14, r1, -2
	stw	r13, r1, -3
	stw	r15, r1, -4
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
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -13
	slli	r6, r5, 0
	ldw	r7, r1, -12
	add	r14, r7, r6
	ldw	r6, r14, 0
	subis	r0, r6, -1
	jmpine	jmpeq_else.9890
	jmp	r31
jmpeq_else.9890:
	ldw	r8, r1, -10
	ldw	r30, r1, -11
	stw	r2, r1, -14
	stw	r6, r1, -15
	addi	r5, r8, 0
	addi	r2, r6, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9892
	ldw	r2, r1, -15
	slli	r2, r2, 0
	ldw	r5, r1, -9
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9893
	jmp	r31
jmpeq_else.9893:
	ldw	r2, r1, -13
	addi	r2, r2, 1
	ldw	r5, r1, -12
	ldw	r6, r1, -10
	ldw	r30, r1, -8
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9892:
	ldw	r5, r1, -7
	ldf	f2, r5, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -16
	stf	f2, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9895
	jmpi	jmpeq_cont.9896
jmpeq_else.9895:
	ldw	r2, r1, -6
	ldf	f2, r2, 0
	ldf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9897
	jmpi	jmpeq_cont.9898
jmpeq_else.9897:
	addi	r14, r0, 15395
	slli	r14, r14, 16
	oori	r14, r14, 55050
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
	stf	f4, r1, -19
	stf	f3, r1, -21
	stf	f2, r1, -23
	stf	f1, r1, -25
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9899
	jmpi	jmpeq_cont.9900
jmpeq_else.9899:
	ldf	f1, r1, -25
	ldw	r2, r1, -6
	stf	f1, r2, 0
	ldw	r2, r1, -3
	ldf	f1, r1, -23
	ldf	f2, r1, -21
	ldf	f3, r1, -19
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -15
	ldw	r5, r1, -2
	stw	r2, r5, 0
	ldw	r2, r1, -16
	ldw	r5, r1, -1
	stw	r2, r5, 0
jmpeq_cont.9900:
jmpeq_cont.9898:
jmpeq_cont.9896:
	ldw	r2, r1, -13
	addi	r2, r2, 1
	ldw	r5, r1, -12
	ldw	r6, r1, -10
	ldw	r30, r1, -8
	ldw	r29, r30, 0
	jmp	r29
solve_one_or_network_fast.5535:
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	slli	r9, r2, 0
	add	r14, r5, r9
	ldw	r9, r14, 0
	subis	r0, r9, -1
	jmpine	jmpeq_else.9901
	jmp	r31
jmpeq_else.9901:
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
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
trace_or_matrix_fast.5547:
	ldw	r7, r30, 16
	ldw	r8, r30, 12
	ldw	r9, r30, 8
	ldw	r10, r30, 4
	slli	r11, r2, 0
	add	r14, r5, r11
	ldw	r11, r14, 0
	ldw	r12, r11, 0
	subis	r0, r12, -1
	jmpine	jmpeq_else.9903
	jmp	r31
jmpeq_else.9903:
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r30, r1, -3
	stw	r2, r1, -4
	subis	r0, r12, 99
	jmpine	jmpeq_else.9905
	addi	r7, r0, 1
	addi	r5, r11, 0
	addi	r2, r7, 0
	addi	r30, r10, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9906
jmpeq_else.9905:
	stw	r11, r1, -5
	stw	r10, r1, -6
	stw	r7, r1, -7
	stw	r9, r1, -8
	addi	r5, r6, 0
	addi	r2, r12, 0
	addi	r30, r8, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9907
	jmpi	jmpeq_cont.9908
jmpeq_else.9907:
	ldw	r2, r1, -8
	ldf	f1, r2, 0
	ldw	r2, r1, -7
	ldf	f2, r2, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9909
	jmpi	jmpeq_cont.9910
jmpeq_else.9909:
	addi	r2, r0, 1
	ldw	r5, r1, -5
	ldw	r6, r1, -1
	ldw	r30, r1, -6
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9910:
jmpeq_cont.9908:
jmpeq_cont.9906:
	ldw	r2, r1, -4
	addi	r2, r2, 1
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
judge_intersection_fast.5570:
	ldw	r5, r30, 12
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	addi	r14, r0, 20078
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
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	ldf	f2, r2, 0
	addi	r14, r0, -16948
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f1, r14, r0
	stf	f2, r1, -3
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9912
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.9912:
	addi	r14, r0, 19646
	slli	r14, r14, 16
	oori	r14, r14, 48160
	mif	f2, r14, r0
	ldf	f1, r1, -3
	jmpi	fless.2764
get_nvector_rect.5585:
	ldw	r5, r30, 8
	ldw	r6, r30, 4
	ldw	r6, r6, 0
	stw	r5, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	addi	r2, r5, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	vecbzero.3399
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	subi	r5, r2, 1
	subi	r2, r2, 1
	slli	r2, r2, 0
	ldw	r6, r1, -2
	add	r14, r6, r2
	ldf	f1, r14, 0
	stw	r5, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	sgn.3365
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -4
	slli	r2, r2, 0
	ldw	r5, r1, -1
	add	r14, r5, r2
	stf	f1, r14, 0
	jmp	r31
get_nvector_plane.5597:
	ldw	r5, r30, 4
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldw	r5, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 2
	jmp	r31
get_nvector_second.5610:
	ldw	r5, r30, 8
	ldw	r6, r30, 4
	ldf	f1, r6, 0
	stw	r5, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stf	f1, r1, -5
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	ldf	f2, r2, 1
	ldw	r5, r1, -2
	stf	f1, r1, -7
	stf	f2, r1, -9
	addi	r2, r5, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_y.3794
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	ldf	f2, r2, 2
	ldw	r2, r1, -2
	stf	f1, r1, -11
	stf	f2, r1, -13
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	fsub	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -15
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	o_isrot.3712
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9916
	ldf	f1, r1, -17
	ldw	r2, r1, -1
	stf	f1, r2, 0
	ldf	f1, r1, -19
	stf	f1, r2, 1
	ldf	f1, r1, -21
	stf	f1, r2, 2
	jmpi	jmpeq_cont.9917
jmpeq_else.9916:
	ldw	r2, r1, -2
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	o_param_r3.3920
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -23
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	o_param_r2.3906
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fmul	f1, f2, f1
	ldf	f3, r1, -23
	fadd	f1, f3, f1
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	fhalf.2783
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	fadd	f1, f2, f1
	ldw	r2, r1, -1
	stf	f1, r2, 0
	ldw	r5, r1, -2
	addi	r2, r5, 0
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	o_param_r3.3920
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -25
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	o_param_r1.3892
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fmul	f1, f2, f1
	ldf	f2, r1, -25
	fadd	f1, f2, f1
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	fhalf.2783
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -19
	fadd	f1, f2, f1
	ldw	r2, r1, -1
	stf	f1, r2, 1
	ldw	r5, r1, -2
	addi	r2, r5, 0
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	o_param_r2.3906
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	stf	f1, r1, -27
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	o_param_r1.3892
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fmul	f1, f2, f1
	ldf	f2, r1, -27
	fadd	f1, f2, f1
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	fhalf.2783
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -21
	fadd	f1, f2, f1
	ldw	r2, r1, -1
	stf	f1, r2, 2
jmpeq_cont.9917:
	ldw	r5, r1, -2
	addi	r2, r5, 0
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	o_isinvert.3699
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -1
	jmpi	vecunit_sgn.3468
get_nvector.5665:
	ldw	r6, r30, 12
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	stw	r6, r1, -1
	stw	r2, r1, -2
	stw	r8, r1, -3
	stw	r5, r1, -4
	stw	r7, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.9918
	ldw	r2, r1, -4
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9918:
	subis	r0, r2, 2
	jmpine	jmpeq_else.9919
	ldw	r2, r1, -2
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9919:
	ldw	r2, r1, -2
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
utexture.5671:
	ldw	r6, r30, 4
	stw	r5, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	o_texturetype.3660
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	stw	r2, r1, -4
	addi	r2, r5, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_color_red.3850
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 0
	ldw	r5, r1, -3
	addi	r2, r5, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_color_green.3864
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 1
	ldw	r5, r1, -3
	addi	r2, r5, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_color_blue.3878
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stf	f1, r2, 2
	ldw	r5, r1, -4
	subis	r0, r5, 1
	jmpine	jmpeq_else.9920
	ldw	r5, r1, -1
	ldf	f1, r5, 0
	ldw	r6, r1, -3
	stf	f1, r1, -5
	addi	r2, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	fsub	f1, f2, f1
	addi	r14, r0, 15692
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	fmul	f2, f1, f2
	stf	f1, r1, -7
	fmov	f1, f2
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	external_floor
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16800
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	addi	r14, r0, 16672
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	ldf	f1, r5, 2
	ldw	r5, r1, -3
	stw	r2, r1, -9
	stf	f1, r1, -11
	addi	r2, r5, 0
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -11
	fsub	f1, f2, f1
	addi	r14, r0, 15692
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	fmul	f2, f1, f2
	stf	f1, r1, -13
	fmov	f1, f2
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	external_floor
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16800
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	ldf	f2, r1, -13
	fsub	f1, f2, f1
	addi	r14, r0, 16672
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -9
	subis	r0, r5, 0
	jmpine	jmpeq_else.9922
	subis	r0, r2, 0
	jmpine	jmpeq_else.9924
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmpi	jmpeq_cont.9925
jmpeq_else.9924:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9925:
	jmpi	jmpeq_cont.9923
jmpeq_else.9922:
	subis	r0, r2, 0
	jmpine	jmpeq_else.9926
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmpi	jmpeq_cont.9927
jmpeq_else.9926:
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9927:
jmpeq_cont.9923:
	ldw	r2, r1, -2
	stf	f1, r2, 1
	jmp	r31
jmpeq_else.9920:
	subis	r0, r5, 2
	jmpine	jmpeq_else.9929
	ldw	r5, r1, -1
	ldf	f1, r5, 1
	addi	r14, r0, 16000
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f2, f2, f1
	ldw	r2, r1, -2
	stf	f2, r2, 0
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	fsub	f1, f3, f1
	fmul	f1, f2, f1
	stf	f1, r2, 1
	jmp	r31
jmpeq_else.9929:
	subis	r0, r5, 3
	jmpine	jmpeq_else.9931
	ldw	r5, r1, -1
	ldf	f1, r5, 0
	ldw	r6, r1, -3
	stf	f1, r1, -15
	addi	r2, r6, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	fsub	f1, f2, f1
	ldw	r2, r1, -1
	ldf	f2, r2, 2
	ldw	r2, r1, -3
	stf	f1, r1, -17
	stf	f2, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -19
	fsub	f1, f2, f1
	ldf	f2, r1, -17
	stf	f1, r1, -21
	fmov	f1, f2
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -21
	stf	f1, r1, -23
	fmov	f1, f2
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -23
	fadd	f1, f2, f1
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16672
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stf	f1, r1, -25
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	external_floor
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -25
	fsub	f1, f2, f1
	addi	r14, r0, 16457
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f2, f1, f2
	ldw	r2, r1, -2
	stf	f2, r2, 1
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fsub	f1, f2, f1
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	stf	f1, r2, 2
	jmp	r31
jmpeq_else.9931:
	subis	r0, r5, 4
	jmpine	jmpeq_else.9933
	ldw	r5, r1, -1
	ldf	f1, r5, 0
	ldw	r6, r1, -3
	stf	f1, r1, -27
	addi	r2, r6, 0
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	o_param_x.3780
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -27
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -29
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -29
	fmul	f1, f2, f1
	ldw	r2, r1, -1
	ldf	f2, r2, 2
	ldw	r5, r1, -3
	stf	f1, r1, -31
	stf	f2, r1, -33
	addi	r2, r5, 0
	stw	r1, r1, -39
	addi	r1, r1, -39
	stw	r31, r1, 1
	cali	o_param_z.3808
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -33
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -35
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -35
	fmul	f1, f2, f1
	ldf	f2, r1, -31
	stf	f1, r1, -37
	fmov	f1, f2
	stw	r1, r1, -43
	addi	r1, r1, -43
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -37
	stf	f1, r1, -39
	fmov	f1, f2
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -39
	fadd	f1, f2, f1
	ldf	f2, r1, -31
	stf	f1, r1, -41
	fmov	f1, f2
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 14545
	slli	r14, r14, 16
	oori	r14, r14, 46871
	mif	f2, r14, r0
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9934
	ldf	f1, r1, -37
	ldf	f2, r1, -31
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	atan.3158
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16880
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16457
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	jmpi	jmpeq_cont.9935
jmpeq_else.9934:
	addi	r14, r0, 16752
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9935:
	stf	f1, r1, -43
	stw	r1, r1, -49
	addi	r1, r1, -49
	stw	r31, r1, 1
	cali	external_floor
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -43
	fsub	f1, f2, f1
	ldw	r2, r1, -1
	ldf	f2, r2, 1
	ldw	r2, r1, -3
	stf	f1, r1, -45
	stf	f2, r1, -47
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	cali	o_param_y.3794
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -47
	fsub	f1, f2, f1
	ldw	r2, r1, -3
	stf	f1, r1, -49
	stw	r1, r1, -55
	addi	r1, r1, -55
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -55
	addi	r1, r1, -55
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -49
	fmul	f1, f2, f1
	ldf	f2, r1, -41
	stf	f1, r1, -51
	fmov	f1, f2
	stw	r1, r1, -57
	addi	r1, r1, -57
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 14545
	slli	r14, r14, 16
	oori	r14, r14, 46871
	mif	f2, r14, r0
	stw	r1, r1, -57
	addi	r1, r1, -57
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9936
	ldf	f1, r1, -51
	ldf	f2, r1, -41
	finv	f31, f2, f0
	fmul	f1, f1, f31
	stw	r1, r1, -57
	addi	r1, r1, -57
	stw	r31, r1, 1
	cali	fabs.2776
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -57
	addi	r1, r1, -57
	stw	r31, r1, 1
	cali	atan.3158
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16880
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16457
	slli	r14, r14, 16
	oori	r14, r14, 4059
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	jmpi	jmpeq_cont.9937
jmpeq_else.9936:
	addi	r14, r0, 16752
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9937:
	stf	f1, r1, -53
	stw	r1, r1, -59
	addi	r1, r1, -59
	stw	r31, r1, 1
	cali	external_floor
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -53
	fsub	f1, f2, f1
	addi	r14, r0, 15897
	slli	r14, r14, 16
	oori	r14, r14, 39322
	mif	f2, r14, r0
	addi	r14, r0, 16128
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldf	f4, r1, -45
	fsub	f3, f3, f4
	stf	f1, r1, -55
	stf	f2, r1, -57
	fmov	f1, f3
	stw	r1, r1, -63
	addi	r1, r1, -63
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -57
	fsub	f1, f2, f1
	addi	r14, r0, 16128
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldf	f3, r1, -55
	fsub	f2, f2, f3
	stf	f1, r1, -59
	fmov	f1, f2
	stw	r1, r1, -65
	addi	r1, r1, -65
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -59
	fsub	f1, f2, f1
	stf	f1, r1, -61
	stw	r1, r1, -67
	addi	r1, r1, -67
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9938
	ldf	f1, r1, -61
	jmpi	jmpeq_cont.9939
jmpeq_else.9938:
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
jmpeq_cont.9939:
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fmul	f1, f2, f1
	addi	r14, r0, 16025
	slli	r14, r14, 16
	oori	r14, r14, 39322
	mif	f2, r14, r0
	finv	f31, f2, f0
	fmul	f1, f1, f31
	ldw	r2, r1, -2
	stf	f1, r2, 2
	jmp	r31
jmpeq_else.9933:
	jmp	r31
add_light.5828:
	ldw	r2, r30, 8
	ldw	r5, r30, 4
	stf	f3, r1, -1
	stf	f2, r1, -3
	stf	f1, r1, -5
	stw	r2, r1, -7
	stw	r5, r1, -8
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9942
	jmpi	jmpeq_cont.9943
jmpeq_else.9942:
	ldw	r2, r1, -8
	ldw	r5, r1, -7
	ldf	f1, r1, -5
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	vecaccum.3537
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9943:
	ldf	f1, r1, -3
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9944
	jmp	r31
jmpeq_else.9944:
	ldf	f1, r1, -3
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -1
	fmul	f1, f1, f2
	ldw	r2, r1, -8
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
	ldw	r6, r30, 32
	ldw	r7, r30, 28
	ldw	r8, r30, 24
	ldw	r9, r30, 20
	ldw	r10, r30, 16
	ldw	r11, r30, 12
	ldw	r12, r30, 8
	ldw	r13, r30, 4
	subis	r0, r2, 0
	jmpilt	jmpge_else.9947
	slli	r14, r2, 0
	add	r14, r7, r14
	ldw	r7, r14, 0
	stw	r30, r1, -1
	stw	r2, r1, -2
	stf	f2, r1, -3
	stw	r13, r1, -5
	stw	r5, r1, -6
	stf	f1, r1, -7
	stw	r9, r1, -9
	stw	r6, r1, -10
	stw	r8, r1, -11
	stw	r7, r1, -12
	stw	r11, r1, -13
	stw	r12, r1, -14
	stw	r10, r1, -15
	addi	r2, r7, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	r_dvec.4053
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -15
	stw	r2, r1, -16
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9948
	jmpi	jmpeq_cont.9949
jmpeq_else.9948:
	ldw	r2, r1, -14
	ldw	r2, r2, 0
	addi	r5, r0, 4
	mul	r2, r2, r5
	ldw	r5, r1, -13
	ldw	r5, r5, 0
	add	r2, r2, r5
	ldw	r5, r1, -12
	stw	r2, r1, -17
	addi	r2, r5, 0
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	cali	r_surface_id.4048
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -17
	subs	r0, r5, r2
	jmpine	jmpeq_else.9950
	addi	r2, r0, 0
	ldw	r5, r1, -11
	ldw	r5, r5, 0
	ldw	r30, r1, -10
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9952
	ldw	r2, r1, -16
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -9
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -12
	stf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	r_bright.4058
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fmul	f3, f1, f2
	ldf	f4, r1, -19
	fmul	f3, f3, f4
	ldw	r2, r1, -16
	stf	f3, r1, -21
	stf	f1, r1, -23
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -6
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -23
	fmul	f2, f2, f1
	ldf	f1, r1, -21
	ldf	f3, r1, -3
	ldw	r30, r1, -5
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9953
jmpeq_else.9952:
jmpeq_cont.9953:
	jmpi	jmpeq_cont.9951
jmpeq_else.9950:
jmpeq_cont.9951:
jmpeq_cont.9949:
	ldw	r2, r1, -2
	subi	r2, r2, 1
	ldw	r5, r1, -6
	ldf	f1, r1, -7
	ldf	f2, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9947:
	jmp	r31
trace_ray.5888:
	ldw	r7, r30, 80
	ldw	r8, r30, 76
	ldw	r9, r30, 72
	ldw	r10, r30, 68
	ldw	r11, r30, 64
	ldw	r12, r30, 60
	ldw	r13, r30, 56
	ldw	r14, r30, 52
	ldw	r15, r30, 48
	ldw	r16, r30, 44
	ldw	r17, r30, 40
	ldw	r18, r30, 36
	ldw	r19, r30, 32
	ldw	r20, r30, 28
	ldw	r21, r30, 24
	ldw	r22, r30, 20
	ldw	r23, r30, 16
	ldw	r24, r30, 12
	ldw	r25, r30, 8
	ldw	r26, r30, 4
	subis	r0, r2, 4
	jmpigt	jmple_else.9956
	stw	r30, r1, -1
	stf	f2, r1, -3
	stw	r9, r1, -5
	stw	r8, r1, -6
	stw	r18, r1, -7
	stw	r13, r1, -8
	stw	r26, r1, -9
	stw	r12, r1, -10
	stw	r15, r1, -11
	stw	r17, r1, -12
	stw	r10, r1, -13
	stw	r6, r1, -14
	stw	r21, r1, -15
	stw	r7, r1, -16
	stw	r22, r1, -17
	stw	r11, r1, -18
	stw	r24, r1, -19
	stw	r16, r1, -20
	stw	r23, r1, -21
	stw	r14, r1, -22
	stw	r25, r1, -23
	stf	f1, r1, -25
	stw	r19, r1, -27
	stw	r2, r1, -28
	stw	r5, r1, -29
	stw	r20, r1, -30
	addi	r2, r6, 0
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	p_surface_ids.3967
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -29
	ldw	r30, r1, -30
	stw	r2, r1, -31
	addi	r2, r5, 0
	stw	r1, r1, -32
	addi	r1, r1, -32
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9959
	addi	r2, r0, -1
	ldw	r5, r1, -28
	slli	r6, r5, 0
	ldw	r7, r1, -31
	add	r14, r7, r6
	stw	r2, r14, 0
	subis	r0, r5, 0
	jmpine	jmpeq_else.9960
	jmp	r31
jmpeq_else.9960:
	ldw	r2, r1, -29
	ldw	r5, r1, -27
	stw	r1, r1, -32
	addi	r1, r1, -32
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -32
	addi	r1, r1, -32
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -33
	stw	r1, r1, -39
	addi	r1, r1, -39
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9963
	jmp	r31
jmpeq_else.9963:
	ldf	f1, r1, -33
	stw	r1, r1, -39
	addi	r1, r1, -39
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -33
	fmul	f1, f1, f2
	ldf	f2, r1, -25
	fmul	f1, f1, f2
	ldw	r2, r1, -23
	ldf	f2, r2, 0
	fmul	f1, f1, f2
	ldw	r2, r1, -22
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
jmpeq_else.9959:
	ldw	r2, r1, -21
	ldw	r2, r2, 0
	slli	r5, r2, 0
	ldw	r6, r1, -20
	add	r14, r6, r5
	ldw	r5, r14, 0
	stw	r2, r1, -35
	stw	r5, r1, -36
	addi	r2, r5, 0
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	o_reflectiontype.3686
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -36
	stw	r2, r1, -37
	addi	r2, r5, 0
	stw	r1, r1, -42
	addi	r1, r1, -42
	stw	r31, r1, 1
	cali	o_diffuse.3822
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -25
	fmul	f1, f1, f2
	ldw	r2, r1, -36
	ldw	r5, r1, -29
	ldw	r30, r1, -19
	stf	f1, r1, -39
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -18
	ldw	r5, r1, -17
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -36
	ldw	r5, r1, -17
	ldw	r30, r1, -16
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 4
	ldw	r5, r1, -35
	mul	r2, r5, r2
	ldw	r5, r1, -15
	ldw	r5, r5, 0
	add	r2, r2, r5
	ldw	r5, r1, -28
	slli	r6, r5, 0
	ldw	r7, r1, -31
	add	r14, r7, r6
	stw	r2, r14, 0
	ldw	r2, r1, -14
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	p_intersection_points.3957
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -28
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	ldw	r6, r1, -17
	addi	r5, r6, 0
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	p_calc_diffuse.3977
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -36
	stw	r2, r1, -41
	addi	r2, r5, 0
	stw	r1, r1, -46
	addi	r1, r1, -46
	stw	r31, r1, 1
	cali	o_diffuse.3822
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16128
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r1, r1, -46
	addi	r1, r1, -46
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9967
	addi	r2, r0, 1
	ldw	r5, r1, -28
	slli	r6, r5, 0
	ldw	r7, r1, -41
	add	r14, r7, r6
	stw	r2, r14, 0
	ldw	r2, r1, -14
	stw	r1, r1, -46
	addi	r1, r1, -46
	stw	r31, r1, 1
	cali	p_energy.3987
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -28
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -13
	stw	r2, r1, -42
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -28
	slli	r5, r2, 0
	ldw	r6, r1, -42
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r14, r0, 15232
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -39
	fmul	f1, f1, f2
	addi	r2, r5, 0
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	vecscale.3610
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -14
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	p_nvectors.4030
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -28
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	ldw	r6, r1, -12
	addi	r5, r6, 0
	stw	r1, r1, -47
	addi	r1, r1, -47
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9968
jmpeq_else.9967:
	addi	r2, r0, 0
	ldw	r5, r1, -28
	slli	r6, r5, 0
	ldw	r7, r1, -41
	add	r14, r7, r6
	stw	r2, r14, 0
jmpeq_cont.9968:
	addi	r14, r0, -16384
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -29
	ldw	r5, r1, -12
	stf	f1, r1, -43
	stw	r1, r1, -49
	addi	r1, r1, -49
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -43
	fmul	f1, f2, f1
	ldw	r2, r1, -29
	ldw	r5, r1, -12
	stw	r1, r1, -49
	addi	r1, r1, -49
	stw	r31, r1, 1
	cali	vecaccum.3537
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -36
	stw	r1, r1, -49
	addi	r1, r1, -49
	stw	r31, r1, 1
	cali	o_hilight.3836
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -25
	fmul	f1, f2, f1
	addi	r2, r0, 0
	ldw	r5, r1, -11
	ldw	r5, r5, 0
	ldw	r30, r1, -10
	stf	f1, r1, -45
	stw	r1, r1, -51
	addi	r1, r1, -51
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9969
	ldw	r2, r1, -12
	ldw	r5, r1, -27
	stw	r1, r1, -51
	addi	r1, r1, -51
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -51
	addi	r1, r1, -51
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -39
	fmul	f1, f1, f2
	ldw	r2, r1, -29
	ldw	r5, r1, -27
	stf	f1, r1, -47
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldf	f1, r1, -47
	ldf	f3, r1, -45
	ldw	r30, r1, -9
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9970
jmpeq_else.9969:
jmpeq_cont.9970:
	ldw	r2, r1, -17
	ldw	r30, r1, -8
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -7
	ldw	r2, r2, 0
	subi	r2, r2, 1
	ldw	r5, r1, -29
	ldf	f1, r1, -39
	ldf	f2, r1, -45
	ldw	r30, r1, -6
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 15820
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f1, r14, r0
	ldf	f2, r1, -25
	stw	r1, r1, -53
	addi	r1, r1, -53
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9971
	jmp	r31
jmpeq_else.9971:
	ldw	r2, r1, -28
	subis	r0, r2, 4
	jmpilt	jmpge_else.9973
	jmpi	jmpge_cont.9974
jmpge_else.9973:
	addi	r5, r2, 1
	addi	r6, r0, -1
	slli	r5, r5, 0
	ldw	r7, r1, -31
	add	r14, r7, r5
	stw	r6, r14, 0
jmpge_cont.9974:
	ldw	r5, r1, -37
	subis	r0, r5, 2
	jmpine	jmpeq_else.9975
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -36
	stf	f1, r1, -49
	addi	r2, r5, 0
	stw	r1, r1, -55
	addi	r1, r1, -55
	stw	r31, r1, 1
	cali	o_diffuse.3822
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -49
	fsub	f1, f2, f1
	ldf	f2, r1, -25
	fmul	f1, f2, f1
	ldw	r2, r1, -28
	addi	r2, r2, 1
	ldw	r5, r1, -5
	ldf	f2, r5, 0
	ldf	f3, r1, -3
	fadd	f2, f3, f2
	ldw	r5, r1, -29
	ldw	r6, r1, -14
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.9975:
	jmp	r31
jmple_else.9956:
	jmp	r31
trace_diffuse_ray.6006:
	ldw	r5, r30, 48
	ldw	r6, r30, 44
	ldw	r7, r30, 40
	ldw	r8, r30, 36
	ldw	r9, r30, 32
	ldw	r10, r30, 28
	ldw	r11, r30, 24
	ldw	r12, r30, 20
	ldw	r13, r30, 16
	ldw	r14, r30, 12
	ldw	r15, r30, 8
	ldw	r16, r30, 4
	stw	r6, r1, -1
	stw	r16, r1, -2
	stf	f1, r1, -3
	stw	r11, r1, -5
	stw	r10, r1, -6
	stw	r7, r1, -7
	stw	r8, r1, -8
	stw	r13, r1, -9
	stw	r5, r1, -10
	stw	r15, r1, -11
	stw	r2, r1, -12
	stw	r9, r1, -13
	stw	r14, r1, -14
	addi	r30, r12, 0
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9978
	jmp	r31
jmpeq_else.9978:
	ldw	r2, r1, -14
	ldw	r2, r2, 0
	slli	r2, r2, 0
	ldw	r5, r1, -13
	add	r14, r5, r2
	ldw	r2, r14, 0
	ldw	r5, r1, -12
	stw	r2, r1, -15
	addi	r2, r5, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -15
	ldw	r30, r1, -11
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -15
	ldw	r5, r1, -9
	ldw	r30, r1, -10
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 0
	ldw	r5, r1, -8
	ldw	r5, r5, 0
	ldw	r30, r1, -7
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9980
	ldw	r2, r1, -6
	ldw	r5, r1, -5
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	fispos.2767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9982
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	jmpi	jmpeq_cont.9983
jmpeq_else.9982:
	ldf	f1, r1, -17
jmpeq_cont.9983:
	ldf	f2, r1, -3
	fmul	f1, f2, f1
	ldw	r2, r1, -15
	stf	f1, r1, -19
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	o_diffuse.3822
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -19
	fmul	f1, f2, f1
	ldw	r2, r1, -2
	ldw	r5, r1, -1
	jmpi	vecaccum.3537
jmpeq_else.9980:
	jmp	r31
iter_trace_diffuse_rays.6030:
	ldw	r8, r30, 4
	subis	r0, r7, 0
	jmpilt	jmpge_else.9985
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
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stf	f1, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fisneg.2770
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.9986
	ldw	r2, r1, -5
	slli	r5, r2, 0
	ldw	r6, r1, -4
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r14, r0, 17174
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -7
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r30, r1, -3
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.9987
jmpeq_else.9986:
	ldw	r2, r1, -5
	addi	r5, r2, 1
	slli	r5, r5, 0
	ldw	r6, r1, -4
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r14, r0, -15594
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldf	f2, r1, -7
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r30, r1, -3
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9987:
	ldw	r2, r1, -5
	subi	r7, r2, 2
	ldw	r2, r1, -4
	ldw	r5, r1, -6
	ldw	r6, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.9985:
	jmp	r31
trace_diffuse_rays.6052:
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r2, r1, -3
	stw	r8, r1, -4
	addi	r2, r6, 0
	addi	r30, r7, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r7, r0, 118
	ldw	r2, r1, -3
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -4
	ldw	r29, r30, 0
	jmp	r29
trace_diffuse_ray_80percent.6058:
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	stw	r6, r1, -1
	stw	r5, r1, -2
	stw	r7, r1, -3
	stw	r8, r1, -4
	stw	r2, r1, -5
	subis	r0, r2, 0
	jmpine	jmpeq_else.9989
	jmpi	jmpeq_cont.9990
jmpeq_else.9989:
	ldw	r9, r8, 0
	addi	r2, r9, 0
	addi	r30, r7, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9990:
	ldw	r2, r1, -5
	subis	r0, r2, 1
	jmpine	jmpeq_else.9991
	jmpi	jmpeq_cont.9992
jmpeq_else.9991:
	ldw	r5, r1, -4
	ldw	r6, r5, 1
	ldw	r7, r1, -2
	ldw	r8, r1, -1
	ldw	r30, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9992:
	ldw	r2, r1, -5
	subis	r0, r2, 2
	jmpine	jmpeq_else.9993
	jmpi	jmpeq_cont.9994
jmpeq_else.9993:
	ldw	r5, r1, -4
	ldw	r6, r5, 2
	ldw	r7, r1, -2
	ldw	r8, r1, -1
	ldw	r30, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9994:
	ldw	r2, r1, -5
	subis	r0, r2, 3
	jmpine	jmpeq_else.9995
	jmpi	jmpeq_cont.9996
jmpeq_else.9995:
	ldw	r5, r1, -4
	ldw	r6, r5, 3
	ldw	r7, r1, -2
	ldw	r8, r1, -1
	ldw	r30, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	addi	r6, r8, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.9996:
	ldw	r2, r1, -5
	subis	r0, r2, 4
	jmpine	jmpeq_else.9997
	jmp	r31
jmpeq_else.9997:
	ldw	r2, r1, -4
	ldw	r2, r2, 4
	ldw	r5, r1, -2
	ldw	r6, r1, -1
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
calc_diffuse_using_1point.6081:
	ldw	r6, r30, 12
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	stw	r7, r1, -1
	stw	r6, r1, -2
	stw	r8, r1, -3
	stw	r5, r1, -4
	stw	r2, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	p_received_ray_20percent.3997
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	stw	r2, r1, -6
	addi	r2, r5, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	p_nvectors.4030
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	p_intersection_points.3957
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	p_energy.3987
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	slli	r6, r5, 0
	ldw	r7, r1, -6
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -3
	stw	r2, r1, -9
	addi	r5, r6, 0
	addi	r2, r7, 0
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	p_group_id.4007
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -4
	slli	r2, r2, 0
	ldw	r5, r1, -9
	add	r14, r5, r2
	ldw	r5, r14, 0
	ldw	r2, r1, -1
	ldw	r6, r1, -3
	jmpi	vecaccumv.3627
calc_diffuse_using_5points.6095:
	ldw	r9, r30, 8
	ldw	r10, r30, 4
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
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	p_received_ray_20percent.3997
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	subi	r6, r5, 1
	slli	r6, r6, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -7
	addi	r2, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	p_received_ray_20percent.3997
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -8
	addi	r2, r6, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	p_received_ray_20percent.3997
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	addi	r6, r5, 1
	slli	r6, r6, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -9
	addi	r2, r6, 0
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	p_received_ray_20percent.3997
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	slli	r6, r5, 0
	ldw	r7, r1, -4
	add	r14, r7, r6
	ldw	r6, r14, 0
	stw	r2, r1, -10
	addi	r2, r6, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	p_received_ray_20percent.3997
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	slli	r6, r5, 0
	ldw	r7, r1, -7
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -2
	stw	r2, r1, -11
	addi	r5, r6, 0
	addi	r2, r7, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -8
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	vecadd.3564
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -9
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	vecadd.3564
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -10
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	vecadd.3564
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	slli	r5, r2, 0
	ldw	r6, r1, -11
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r6, r1, -2
	addi	r2, r6, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	vecadd.3564
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	slli	r2, r2, 0
	ldw	r5, r1, -5
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	p_energy.3987
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -3
	slli	r5, r5, 0
	add	r14, r2, r5
	ldw	r5, r14, 0
	ldw	r2, r1, -1
	ldw	r6, r1, -2
	jmpi	vecaccumv.3627
do_without_neighbors.6128:
	ldw	r6, r30, 4
	subis	r0, r5, 4
	jmpigt	jmple_else.9999
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r2, r1, -3
	stw	r5, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	p_surface_ids.3967
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpilt	jmpge_else.10000
	ldw	r2, r1, -3
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	p_calc_diffuse.3977
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.10001
	jmpi	jmpeq_cont.10002
jmpeq_else.10001:
	ldw	r2, r1, -3
	ldw	r30, r1, -2
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.10002:
	ldw	r2, r1, -4
	addi	r5, r2, 1
	ldw	r2, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10000:
	jmp	r31
jmple_else.9999:
	jmp	r31
neighbors_exist.6141:
	ldw	r6, r30, 4
	ldw	r7, r6, 1
	addi	r8, r5, 1
	subs	r0, r7, r8
	jmpigt	jmple_else.10005
	addi	r2, r0, 0
	jmp	r31
jmple_else.10005:
	subis	r0, r5, 0
	jmpigt	jmple_else.10006
	addi	r2, r0, 0
	jmp	r31
jmple_else.10006:
	ldw	r5, r6, 0
	addi	r6, r2, 1
	subs	r0, r5, r6
	jmpigt	jmple_else.10007
	addi	r2, r0, 0
	jmp	r31
jmple_else.10007:
	subis	r0, r2, 0
	jmpigt	jmple_else.10008
	addi	r2, r0, 0
	jmp	r31
jmple_else.10008:
	addi	r2, r0, 1
	jmp	r31
get_surface_id.6155:
	stw	r5, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	p_surface_ids.3967
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	get_surface_id.6155
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	slli	r6, r5, 0
	ldw	r7, r1, -4
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -3
	stw	r2, r1, -6
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	get_surface_id.6155
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.10009
	ldw	r2, r1, -5
	slli	r6, r2, 0
	ldw	r7, r1, -2
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r7, r1, -3
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	get_surface_id.6155
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.10010
	ldw	r2, r1, -5
	subi	r6, r2, 1
	slli	r6, r6, 0
	ldw	r7, r1, -1
	add	r14, r7, r6
	ldw	r6, r14, 0
	ldw	r8, r1, -3
	addi	r5, r8, 0
	addi	r2, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	get_surface_id.6155
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.10011
	ldw	r2, r1, -5
	addi	r2, r2, 1
	slli	r2, r2, 0
	ldw	r6, r1, -1
	add	r14, r6, r2
	ldw	r2, r14, 0
	ldw	r6, r1, -3
	addi	r5, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	get_surface_id.6155
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	subs	r0, r2, r5
	jmpine	jmpeq_else.10012
	addi	r2, r0, 1
	jmp	r31
jmpeq_else.10012:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.10011:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.10010:
	addi	r2, r0, 0
	jmp	r31
jmpeq_else.10009:
	addi	r2, r0, 0
	jmp	r31
try_exploit_neighbors.6179:
	ldw	r10, r30, 8
	ldw	r11, r30, 4
	slli	r12, r2, 0
	add	r14, r7, r12
	ldw	r12, r14, 0
	subis	r0, r9, 4
	jmpigt	jmple_else.10013
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
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	get_surface_id.6155
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpilt	jmpge_else.10014
	ldw	r2, r1, -10
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r7, r1, -7
	ldw	r8, r1, -6
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	neighbors_are_available.6159
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.10015
	ldw	r2, r1, -10
	slli	r2, r2, 0
	ldw	r5, r1, -8
	add	r14, r5, r2
	ldw	r2, r14, 0
	ldw	r5, r1, -6
	ldw	r30, r1, -5
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.10015:
	ldw	r2, r1, -4
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	p_calc_diffuse.3977
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r8, r1, -6
	slli	r5, r8, 0
	add	r14, r2, r5
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.10016
	jmpi	jmpeq_cont.10017
jmpeq_else.10016:
	ldw	r2, r1, -10
	ldw	r5, r1, -9
	ldw	r6, r1, -8
	ldw	r7, r1, -7
	ldw	r30, r1, -3
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.10017:
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
jmpge_else.10014:
	jmp	r31
jmple_else.10013:
	jmp	r31
write_ppm_header.6199:
	ldw	r2, r30, 4
	addi	r5, r0, 80
	prt1	r5
	addi	r5, r0, 51
	prt1	r5
	addi	r5, r0, 10
	prt1	r5
	ldw	r5, r2, 0
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	print_int.3007
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 32
	prt1	r2
	ldw	r2, r1, -1
	ldw	r2, r2, 1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	print_int.3007
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 32
	prt1	r2
	addi	r2, r0, 255
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	print_int.3007
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 10
	prt1	r2
	jmp	r31
write_rgb_element.6222:
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	external_int_of_float
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 255
	jmpigt	jmple_else.10020
	subis	r0, r2, 0
	jmpilt	jmpge_else.10022
	jmpi	jmpge_cont.10023
jmpge_else.10022:
	addi	r2, r0, 0
jmpge_cont.10023:
	jmpi	jmple_cont.10021
jmple_else.10020:
	addi	r2, r0, 255
jmple_cont.10021:
	jmpi	print_int.3007
write_rgb.6228:
	ldw	r2, r30, 4
	ldf	f1, r2, 0
	stw	r2, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	write_rgb_element.6222
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 32
	prt1	r2
	ldw	r2, r1, -1
	ldf	f1, r2, 1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	write_rgb_element.6222
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 32
	prt1	r2
	ldw	r2, r1, -1
	ldf	f1, r2, 2
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	write_rgb_element.6222
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 10
	prt1	r2
	jmp	r31
pretrace_diffuse_rays.6244:
	ldw	r6, r30, 12
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	subis	r0, r5, 4
	jmpigt	jmple_else.10024
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r7, r1, -3
	stw	r8, r1, -4
	stw	r5, r1, -5
	stw	r2, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	get_surface_id.6155
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpilt	jmpge_else.10025
	ldw	r2, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	p_calc_diffuse.3977
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.10026
	jmpi	jmpeq_cont.10027
jmpeq_else.10026:
	ldw	r2, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	p_group_id.4007
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -4
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	vecbzero.3399
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	p_nvectors.4030
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	p_intersection_points.3957
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	p_received_ray_20percent.3997
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -5
	slli	r6, r5, 0
	add	r14, r2, r6
	ldw	r2, r14, 0
	ldw	r6, r1, -4
	addi	r5, r6, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.10027:
	ldw	r2, r1, -5
	addi	r5, r2, 1
	ldw	r2, r1, -6
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10025:
	jmp	r31
jmple_else.10024:
	jmp	r31
pretrace_pixels.6266:
	ldw	r7, r30, 36
	ldw	r8, r30, 32
	ldw	r9, r30, 28
	ldw	r10, r30, 24
	ldw	r11, r30, 20
	ldw	r12, r30, 16
	ldw	r13, r30, 12
	ldw	r14, r30, 8
	ldw	r15, r30, 4
	subis	r0, r5, 0
	jmpilt	jmpge_else.10030
	ldf	f4, r11, 0
	ldw	r11, r15, 0
	sub	r11, r5, r11
	stw	r30, r1, -1
	stw	r14, r1, -2
	stw	r6, r1, -3
	stw	r8, r1, -4
	stw	r2, r1, -5
	stw	r5, r1, -6
	stw	r7, r1, -7
	stw	r9, r1, -8
	stw	r12, r1, -9
	stf	f3, r1, -11
	stf	f2, r1, -13
	stw	r13, r1, -15
	stf	f1, r1, -17
	stw	r10, r1, -19
	stf	f4, r1, -21
	addi	r2, r11, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -21
	fmul	f1, f2, f1
	ldw	r2, r1, -19
	ldf	f2, r2, 0
	fmul	f2, f1, f2
	ldf	f3, r1, -17
	fadd	f2, f2, f3
	ldw	r5, r1, -15
	stf	f2, r5, 0
	ldf	f2, r2, 1
	fmul	f2, f1, f2
	ldf	f4, r1, -13
	fadd	f2, f2, f4
	stf	f2, r5, 1
	ldf	f2, r2, 2
	fmul	f1, f1, f2
	ldf	f2, r1, -11
	fadd	f1, f1, f2
	stf	f1, r5, 2
	addi	r2, r0, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	vecunit_sgn.3468
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	vecbzero.3399
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -8
	ldw	r5, r1, -7
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 0
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r5, r1, -6
	slli	r6, r5, 0
	ldw	r7, r1, -5
	add	r14, r7, r6
	ldw	r6, r14, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r8, r1, -15
	ldw	r30, r1, -4
	addi	r5, r8, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	slli	r5, r2, 0
	ldw	r6, r1, -5
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	p_rgb.3947
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -9
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	slli	r5, r2, 0
	ldw	r6, r1, -5
	add	r14, r6, r5
	ldw	r5, r14, 0
	ldw	r7, r1, -3
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	p_set_group_id.4018
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	slli	r5, r2, 0
	ldw	r6, r1, -5
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r7, r0, 0
	ldw	r30, r1, -2
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	subi	r2, r2, 1
	addi	r5, r0, 1
	ldw	r6, r1, -3
	stw	r2, r1, -23
	addi	r2, r6, 0
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	cali	add_mod5.3375
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r6, r2
	ldw	r2, r1, -5
	ldw	r5, r1, -23
	ldf	f1, r1, -17
	ldf	f2, r1, -13
	ldf	f3, r1, -11
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10030:
	jmp	r31
pretrace_line.6320:
	ldw	r7, r30, 24
	ldw	r8, r30, 20
	ldw	r9, r30, 16
	ldw	r10, r30, 12
	ldw	r11, r30, 8
	ldw	r12, r30, 4
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
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	ldw	r9, r30, 24
	ldw	r10, r30, 20
	ldw	r11, r30, 16
	ldw	r12, r30, 12
	ldw	r13, r30, 8
	ldw	r14, r30, 4
	ldw	r13, r13, 0
	subs	r0, r13, r2
	jmpigt	jmple_else.10035
	jmp	r31
jmple_else.10035:
	slli	r13, r2, 0
	add	r14, r7, r13
	ldw	r13, r14, 0
	stw	r30, r1, -1
	stw	r9, r1, -2
	stw	r6, r1, -3
	stw	r10, r1, -4
	stw	r14, r1, -5
	stw	r7, r1, -6
	stw	r8, r1, -7
	stw	r5, r1, -8
	stw	r2, r1, -9
	stw	r12, r1, -10
	stw	r11, r1, -11
	addi	r2, r13, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	p_rgb.3947
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -11
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -9
	ldw	r5, r1, -8
	ldw	r6, r1, -7
	ldw	r30, r1, -10
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.10037
	ldw	r2, r1, -9
	slli	r5, r2, 0
	ldw	r6, r1, -6
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r7, r0, 0
	ldw	r30, r1, -5
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	jmpi	jmpeq_cont.10038
jmpeq_else.10037:
	addi	r9, r0, 0
	ldw	r2, r1, -9
	ldw	r5, r1, -8
	ldw	r6, r1, -3
	ldw	r7, r1, -6
	ldw	r8, r1, -7
	ldw	r30, r1, -4
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmpeq_cont.10038:
	ldw	r30, r1, -2
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	ldw	r9, r30, 12
	ldw	r10, r30, 8
	ldw	r11, r30, 4
	ldw	r12, r11, 1
	subs	r0, r12, r2
	jmpigt	jmple_else.10039
	jmp	r31
jmple_else.10039:
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
	jmpigt	jmple_else.10041
	jmpi	jmple_cont.10042
jmple_else.10041:
	addi	r11, r2, 1
	addi	r6, r8, 0
	addi	r5, r11, 0
	addi	r2, r7, 0
	addi	r30, r10, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
jmple_cont.10042:
	addi	r2, r0, 0
	ldw	r5, r1, -6
	ldw	r6, r1, -5
	ldw	r7, r1, -4
	ldw	r8, r1, -3
	ldw	r30, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -6
	addi	r2, r2, 1
	addi	r5, r0, 2
	ldw	r6, r1, -2
	stw	r2, r1, -8
	addi	r2, r6, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	add_mod5.3375
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	addi	r2, r0, 5
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r5, 1
	addi	r2, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r5, 2
	addi	r2, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r5, 3
	addi	r2, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	stw	r2, r5, 4
	addi	r2, r5, 0
	jmp	r31
create_pixel.6422:
	addi	r2, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r2, r1, -1
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	create_float5x3array.6395
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 5
	addi	r6, r0, 0
	stw	r2, r1, -2
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 5
	addi	r6, r0, 0
	stw	r2, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r2, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	create_float5x3array.6395
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r2, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	create_float5x3array.6395
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -6
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r2, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	create_float5x3array.6395
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 32
	stw	r2, r5, 28
	ldw	r2, r1, -7
	stw	r2, r5, 24
	ldw	r2, r1, -6
	stw	r2, r5, 20
	ldw	r2, r1, -5
	stw	r2, r5, 16
	ldw	r2, r1, -4
	stw	r2, r5, 12
	ldw	r2, r1, -3
	stw	r2, r5, 8
	ldw	r2, r1, -2
	stw	r2, r5, 4
	ldw	r2, r1, -1
	stw	r2, r5, 0
	addi	r2, r5, 0
	jmp	r31
init_line_elements.6444:
	subis	r0, r5, 0
	jmpilt	jmpge_else.10043
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	create_pixel.6422
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -2
	slli	r6, r5, 0
	ldw	r7, r1, -1
	add	r14, r7, r6
	stw	r2, r14, 0
	subi	r5, r5, 1
	addi	r2, r7, 0
	jmpi	init_line_elements.6444
jmpge_else.10043:
	jmp	r31
create_pixelline.6453:
	ldw	r2, r30, 4
	ldw	r5, r2, 0
	stw	r2, r1, -1
	stw	r5, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	create_pixel.6422
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -1
	ldw	r5, r5, 0
	subi	r5, r5, 2
	jmpi	init_line_elements.6444
tan.6464:
	stf	f1, r1, -1
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	sin.3205
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -1
	stf	f1, r1, -3
	fmov	f1, f2
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	cos.3230
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -3
	finv	f31, f1, f0
	fmul	f1, f2, f31
	jmp	r31
adjust_position.6468:
	fmul	f1, f1, f1
	addi	r14, r0, 15820
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f3, r14, r0
	fadd	f1, f1, f3
	stf	f2, r1, -1
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	finv	f31, f1, f0
	fmul	f2, f2, f31
	stf	f1, r1, -3
	fmov	f1, f2
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	atan.3158
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -1
	fmul	f1, f1, f2
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	tan.6464
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -3
	fmul	f1, f1, f2
	jmp	r31
calc_dirvec.6480:
	ldw	r7, r30, 4
	subis	r0, r2, 5
	jmpilt	jmpge_else.10044
	stw	r6, r1, -1
	stw	r7, r1, -2
	stw	r5, r1, -3
	stf	f1, r1, -5
	stf	f2, r1, -7
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	stf	f1, r1, -9
	fmov	f1, f2
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	fsqr.2786
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -9
	fadd	f1, f2, f1
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	fadd	f1, f1, f2
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	external_sqrt
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -5
	finv	f31, f1, f0
	fmul	f2, f2, f31
	ldf	f3, r1, -7
	finv	f31, f1, f0
	fmul	f3, f3, f31
	addi	r14, r0, 16256
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
	stw	r2, r1, -11
	stf	f1, r1, -13
	stf	f3, r1, -15
	stf	f2, r1, -17
	addi	r2, r6, 0
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -17
	ldf	f2, r1, -15
	ldf	f3, r1, -13
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	addi	r5, r2, 40
	slli	r5, r5, 0
	ldw	r6, r1, -11
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -15
	stw	r2, r1, -19
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f3, f1
	ldw	r2, r1, -19
	ldf	f1, r1, -17
	ldf	f2, r1, -13
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	addi	r5, r2, 80
	slli	r5, r5, 0
	ldw	r6, r1, -11
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -17
	stw	r2, r1, -20
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	stf	f1, r1, -21
	fmov	f1, f2
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f3, f1
	ldw	r2, r1, -20
	ldf	f1, r1, -13
	ldf	f2, r1, -21
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	addi	r5, r2, 1
	slli	r5, r5, 0
	ldw	r6, r1, -11
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -17
	stw	r2, r1, -23
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -15
	stf	f1, r1, -25
	fmov	f1, f2
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	stf	f1, r1, -27
	fmov	f1, f2
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f3, f1
	ldw	r2, r1, -23
	ldf	f1, r1, -25
	ldf	f2, r1, -27
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	addi	r5, r2, 41
	slli	r5, r5, 0
	ldw	r6, r1, -11
	add	r14, r6, r5
	ldw	r5, r14, 0
	addi	r2, r5, 0
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -17
	stw	r2, r1, -29
	stw	r1, r1, -34
	addi	r1, r1, -34
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	stf	f1, r1, -31
	fmov	f1, f2
	stw	r1, r1, -37
	addi	r1, r1, -37
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldw	r2, r1, -29
	ldf	f1, r1, -31
	ldf	f3, r1, -15
	stw	r1, r1, -37
	addi	r1, r1, -37
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -1
	addi	r2, r2, 81
	slli	r2, r2, 0
	ldw	r5, r1, -11
	add	r14, r5, r2
	ldw	r2, r14, 0
	stw	r1, r1, -37
	addi	r1, r1, -37
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -13
	stw	r2, r1, -33
	stw	r1, r1, -38
	addi	r1, r1, -38
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -33
	ldf	f2, r1, -17
	ldf	f3, r1, -15
	jmpi	vecset.3381
jmpge_else.10044:
	stf	f3, r1, -35
	stw	r6, r1, -1
	stw	r5, r1, -3
	stw	r30, r1, -37
	stf	f4, r1, -39
	stw	r2, r1, -41
	fmov	f1, f2
	fmov	f2, f3
	stw	r1, r1, -46
	addi	r1, r1, -46
	stw	r31, r1, 1
	cali	adjust_position.6468
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -41
	addi	r2, r2, 1
	ldf	f2, r1, -39
	stf	f1, r1, -43
	stw	r2, r1, -45
	stw	r1, r1, -50
	addi	r1, r1, -50
	stw	r31, r1, 1
	cali	adjust_position.6468
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f2, f1
	ldw	r2, r1, -45
	ldw	r5, r1, -3
	ldw	r6, r1, -1
	ldf	f1, r1, -43
	ldf	f3, r1, -35
	ldf	f4, r1, -39
	ldw	r30, r1, -37
	ldw	r29, r30, 0
	jmp	r29
calc_dirvecs.6540:
	ldw	r7, r30, 4
	subis	r0, r2, 0
	jmpilt	jmpge_else.10052
	stw	r30, r1, -1
	stw	r2, r1, -2
	stf	f1, r1, -3
	stw	r6, r1, -5
	stw	r5, r1, -6
	stw	r7, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 15948
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16230
	slli	r14, r14, 16
	oori	r14, r14, 26214
	mif	f2, r14, r0
	fsub	f3, f1, f2
	addi	r2, r0, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r5, r1, -6
	ldw	r6, r1, -5
	ldf	f4, r1, -3
	ldw	r30, r1, -7
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 15948
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 15820
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	fadd	f3, f1, f2
	addi	r2, r0, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r5, r1, -5
	addi	r6, r5, 2
	ldw	r7, r1, -6
	ldf	f4, r1, -3
	ldw	r30, r1, -7
	addi	r5, r7, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	subi	r2, r2, 1
	addi	r5, r0, 1
	ldw	r6, r1, -6
	stw	r2, r1, -8
	addi	r2, r6, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	add_mod5.3375
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -8
	ldw	r6, r1, -5
	ldf	f1, r1, -3
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10052:
	jmp	r31
calc_dirvec_rows.6570:
	ldw	r7, r30, 4
	subis	r0, r2, 0
	jmpilt	jmpge_else.10054
	stw	r30, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stw	r5, r1, -4
	stw	r7, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 15948
	slli	r14, r14, 16
	oori	r14, r14, 52429
	mif	f2, r14, r0
	fmul	f1, f1, f2
	addi	r14, r0, 16230
	slli	r14, r14, 16
	oori	r14, r14, 26214
	mif	f2, r14, r0
	fsub	f1, f1, f2
	addi	r2, r0, 4
	ldw	r5, r1, -4
	ldw	r6, r1, -3
	ldw	r30, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	subi	r2, r2, 1
	addi	r5, r0, 2
	ldw	r6, r1, -4
	stw	r2, r1, -6
	addi	r2, r6, 0
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	add_mod5.3375
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -3
	addi	r6, r2, 4
	ldw	r2, r1, -6
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10054:
	jmp	r31
create_dirvec.6588:
	ldw	r2, r30, 4
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -1
	addi	r2, r5, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -1
	ldw	r2, r2, 0
	stw	r5, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 8
	stw	r2, r5, 4
	ldw	r2, r1, -2
	stw	r2, r5, 0
	addi	r2, r5, 0
	jmp	r31
create_dirvec_elements.6596:
	ldw	r6, r30, 4
	subis	r0, r5, 0
	jmpilt	jmpge_else.10056
	stw	r30, r1, -1
	stw	r2, r1, -2
	stw	r5, r1, -3
	addi	r30, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
jmpge_else.10056:
	jmp	r31
create_dirvecs.6605:
	ldw	r5, r30, 12
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	subis	r0, r2, 0
	jmpilt	jmpge_else.10058
	addi	r8, r0, 120
	stw	r30, r1, -1
	stw	r6, r1, -2
	stw	r5, r1, -3
	stw	r2, r1, -4
	stw	r8, r1, -5
	addi	r30, r7, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -5
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -4
	subi	r2, r2, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10058:
	jmp	r31
init_dirvec_constants.6618:
	ldw	r6, r30, 4
	subis	r0, r5, 0
	jmpilt	jmpge_else.10060
	slli	r7, r5, 0
	add	r14, r2, r7
	ldw	r7, r14, 0
	stw	r2, r1, -1
	stw	r30, r1, -2
	stw	r5, r1, -3
	addi	r2, r7, 0
	addi	r30, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	subi	r5, r2, 1
	ldw	r2, r1, -1
	ldw	r30, r1, -2
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10060:
	jmp	r31
init_vecset_constants.6626:
	ldw	r5, r30, 8
	ldw	r6, r30, 4
	subis	r0, r2, 0
	jmpilt	jmpge_else.10062
	slli	r7, r2, 0
	add	r14, r6, r7
	ldw	r6, r14, 0
	addi	r7, r0, 119
	stw	r30, r1, -1
	stw	r2, r1, -2
	addi	r2, r6, 0
	addi	r30, r5, 0
	addi	r5, r7, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	subi	r2, r2, 1
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpge_else.10062:
	jmp	r31
init_dirvecs.6634:
	ldw	r2, r30, 12
	ldw	r5, r30, 8
	ldw	r6, r30, 4
	addi	r7, r0, 4
	stw	r2, r1, -1
	stw	r6, r1, -2
	addi	r2, r7, 0
	addi	r30, r5, 0
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 9
	addi	r5, r0, 0
	addi	r6, r0, 0
	ldw	r30, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 4
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
add_reflection.6643:
	ldw	r6, r30, 12
	ldw	r7, r30, 8
	ldw	r30, r30, 4
	stw	r7, r1, -1
	stw	r2, r1, -2
	stw	r5, r1, -3
	stf	f1, r1, -5
	stw	r6, r1, -7
	stf	f4, r1, -9
	stf	f3, r1, -11
	stf	f2, r1, -13
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	stw	r2, r1, -15
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f1, r1, -13
	ldf	f2, r1, -11
	ldf	f3, r1, -9
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	vecset.3381
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -15
	ldw	r30, r1, -7
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r4, 0
	addi	r4, r4, 16
	ldf	f1, r1, -5
	stf	f1, r2, 8
	ldw	r5, r1, -15
	stw	r5, r2, 4
	ldw	r5, r1, -3
	stw	r5, r2, 0
	ldw	r5, r1, -2
	slli	r5, r5, 0
	ldw	r6, r1, -1
	add	r14, r6, r5
	stw	r2, r14, 0
	jmp	r31
setup_rect_reflection.6656:
	ldw	r6, r30, 12
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	addi	r9, r0, 4
	mul	r2, r2, r9
	ldw	r9, r6, 0
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r6, r1, -1
	stw	r9, r1, -2
	stw	r8, r1, -3
	stw	r2, r1, -4
	stw	r7, r1, -5
	stf	f1, r1, -7
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_diffuse.3822
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -5
	ldf	f2, r2, 0
	stf	f1, r1, -9
	fmov	f1, f2
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	ldf	f2, r2, 1
	stf	f1, r1, -11
	fmov	f1, f2
	stw	r1, r1, -17
	addi	r1, r1, -17
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -5
	ldf	f2, r2, 2
	stf	f1, r1, -13
	fmov	f1, f2
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	fneg.2781
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	fmov	f4, f1
	ldw	r2, r1, -4
	addi	r5, r2, 1
	ldw	r6, r1, -5
	ldf	f2, r6, 0
	ldw	r7, r1, -2
	ldf	f1, r1, -9
	ldf	f3, r1, -13
	ldw	r30, r1, -3
	stf	f4, r1, -15
	addi	r2, r7, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	addi	r5, r2, 1
	ldw	r6, r1, -4
	addi	r7, r6, 2
	ldw	r8, r1, -5
	ldf	f3, r8, 1
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f4, r1, -15
	ldw	r30, r1, -3
	addi	r2, r5, 0
	addi	r5, r7, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	addi	r5, r2, 2
	ldw	r6, r1, -4
	addi	r6, r6, 3
	ldw	r7, r1, -5
	ldf	f4, r7, 2
	ldf	f1, r1, -9
	ldf	f2, r1, -11
	ldf	f3, r1, -13
	ldw	r30, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -2
	addi	r2, r2, 3
	ldw	r5, r1, -1
	stw	r2, r5, 0
	jmp	r31
setup_surface_reflection.6697:
	ldw	r6, r30, 12
	ldw	r7, r30, 8
	ldw	r8, r30, 4
	addi	r9, r0, 4
	mul	r2, r2, r9
	addi	r2, r2, 1
	ldw	r9, r6, 0
	addi	r14, r0, 16256
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
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	o_diffuse.3822
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -7
	fsub	f1, f2, f1
	ldw	r2, r1, -6
	stf	f1, r1, -9
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	o_param_abc.3767
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -5
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	veciprod.3503
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16384
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	ldw	r2, r1, -6
	stf	f1, r1, -11
	stf	f2, r1, -13
	stw	r1, r1, -19
	addi	r1, r1, -19
	stw	r31, r1, 1
	cali	o_param_a.3725
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -13
	fmul	f1, f2, f1
	ldf	f2, r1, -11
	fmul	f1, f1, f2
	ldw	r2, r1, -5
	ldf	f3, r2, 0
	fsub	f1, f1, f3
	addi	r14, r0, 16384
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldw	r5, r1, -6
	stf	f1, r1, -15
	stf	f3, r1, -17
	addi	r2, r5, 0
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	o_param_b.3739
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	fmul	f1, f2, f1
	ldf	f2, r1, -11
	fmul	f1, f1, f2
	ldw	r2, r1, -5
	ldf	f3, r2, 1
	fsub	f1, f1, f3
	addi	r14, r0, 16384
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f3, r14, r0
	ldw	r5, r1, -6
	stf	f1, r1, -19
	stf	f3, r1, -21
	addi	r2, r5, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	o_param_c.3753
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -21
	fmul	f1, f2, f1
	ldf	f2, r1, -11
	fmul	f1, f1, f2
	ldw	r2, r1, -5
	ldf	f2, r2, 2
	fsub	f4, f1, f2
	ldw	r2, r1, -3
	ldw	r5, r1, -2
	ldf	f1, r1, -9
	ldf	f2, r1, -15
	ldf	f3, r1, -19
	ldw	r30, r1, -4
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -3
	addi	r2, r2, 1
	ldw	r5, r1, -1
	stw	r2, r5, 0
	jmp	r31
setup_reflections.6736:
	ldw	r5, r30, 12
	ldw	r6, r30, 8
	ldw	r7, r30, 4
	subis	r0, r2, 0
	jmpilt	jmpge_else.10070
	slli	r8, r2, 0
	add	r14, r7, r8
	ldw	r7, r14, 0
	stw	r5, r1, -1
	stw	r2, r1, -2
	stw	r6, r1, -3
	stw	r7, r1, -4
	addi	r2, r7, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_reflectiontype.3686
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 2
	jmpine	jmpeq_else.10071
	ldw	r2, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_diffuse.3822
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r14, r0, 16256
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f2, r14, r0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	fless.2764
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 0
	jmpine	jmpeq_else.10072
	jmp	r31
jmpeq_else.10072:
	ldw	r2, r1, -4
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	o_form.3673
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	subis	r0, r2, 1
	jmpine	jmpeq_else.10074
	ldw	r2, r1, -2
	ldw	r5, r1, -4
	ldw	r30, r1, -3
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.10074:
	subis	r0, r2, 2
	jmpine	jmpeq_else.10075
	ldw	r2, r1, -2
	ldw	r5, r1, -4
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
jmpeq_else.10075:
	jmp	r31
jmpeq_else.10071:
	jmp	r31
jmpge_else.10070:
	jmp	r31
rt.6749:
	ldw	r6, r30, 56
	ldw	r7, r30, 52
	ldw	r8, r30, 48
	ldw	r9, r30, 44
	ldw	r10, r30, 40
	ldw	r11, r30, 36
	ldw	r12, r30, 32
	ldw	r13, r30, 28
	ldw	r14, r30, 24
	ldw	r15, r30, 20
	ldw	r16, r30, 16
	ldw	r17, r30, 12
	ldw	r18, r30, 8
	ldw	r19, r30, 4
	stw	r2, r17, 0
	stw	r5, r17, 1
	addi	r17, r0, 2
	stw	r10, r1, -1
	stw	r12, r1, -2
	stw	r7, r1, -3
	stw	r13, r1, -4
	stw	r8, r1, -5
	stw	r15, r1, -6
	stw	r14, r1, -7
	stw	r16, r1, -8
	stw	r6, r1, -9
	stw	r11, r1, -10
	stw	r19, r1, -11
	stw	r9, r1, -12
	stw	r2, r1, -13
	stw	r5, r1, -14
	stw	r18, r1, -15
	addi	r5, r17, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	div.2995
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -15
	stw	r2, r5, 0
	addi	r2, r0, 2
	ldw	r6, r1, -14
	addi	r5, r2, 0
	addi	r2, r6, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	div.2995
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -15
	stw	r2, r5, 1
	addi	r14, r0, 17152
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	ldw	r2, r1, -13
	stf	f1, r1, -17
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	external_float_of_int
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldf	f2, r1, -17
	finv	f31, f1, f0
	fmul	f1, f2, f31
	ldw	r2, r1, -12
	stf	f1, r2, 0
	ldw	r30, r1, -11
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -11
	stw	r2, r1, -19
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -11
	stw	r2, r1, -20
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -10
	stw	r2, r1, -21
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -9
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r30, r1, -8
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -7
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	cali	d_vec.4040
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r5, r1, -6
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	cali	veccpy.3402
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -7
	ldw	r30, r1, -5
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	ldw	r2, r1, -4
	ldw	r2, r2, 0
	subi	r2, r2, 1
	ldw	r30, r1, -3
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 0
	addi	r6, r0, 0
	ldw	r2, r1, -20
	ldw	r30, r1, -2
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r2, r0, 0
	addi	r8, r0, 2
	ldw	r5, r1, -19
	ldw	r6, r1, -20
	ldw	r7, r1, -21
	ldw	r30, r1, -1
	ldw	r29, r30, 0
	jmp	r29
_min_caml_start: # main entry point
	addi	r1,r0,1
	slli	r1,r1,20
	addi	r4,r0,0
   # main program start
	addi	r2, r0, 1
	addi	r5, r0, 0
	stw	r1, r1, -5
	addi	r1, r1, -5
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -1
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -6
	addi	r1, r1, -6
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 16
	addi	r6, r0, h16(read_int_token.2800)
	slli	r6, r6, 16
	addi	r6, r6, l16(read_int_token.2800)
	stw	r6, r5, 0
	stw	r2, r5, 8
	ldw	r6, r1, -1
	stw	r6, r5, 4
	addi	r7, r4, 0
	addi	r4, r4, 16
	addi	r8, r0, h16(read_int.2836)
	slli	r8, r8, 16
	addi	r8, r8, l16(read_int.2836)
	stw	r8, r7, 0
	stw	r5, r7, 12
	stw	r2, r7, 8
	stw	r6, r7, 4
	addi	r2, r0, 1
	addi	r5, r0, 0
	stw	r7, r1, -2
	stw	r1, r1, -7
	addi	r1, r1, -7
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -3
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 1
	stw	r2, r1, -4
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -9
	addi	r1, r1, -9
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -5
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -10
	addi	r1, r1, -10
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 16
	addi	r6, r0, h16(read_float_token1.2858)
	slli	r6, r6, 16
	addi	r6, r6, l16(read_float_token1.2858)
	stw	r6, r5, 0
	stw	r2, r5, 8
	ldw	r6, r1, -3
	stw	r6, r5, 4
	addi	r7, r4, 0
	addi	r4, r4, 16
	addi	r8, r0, h16(read_float_token2.2888)
	slli	r8, r8, 16
	addi	r8, r8, l16(read_float_token2.2888)
	stw	r8, r7, 0
	ldw	r8, r1, -4
	stw	r8, r7, 8
	ldw	r9, r1, -5
	stw	r9, r7, 4
	addi	r10, r4, 0
	addi	r4, r4, 32
	addi	r11, r0, h16(read_float.2912)
	slli	r11, r11, 16
	addi	r11, r11, l16(read_float.2912)
	stw	r11, r10, 0
	stw	r7, r10, 24
	stw	r5, r10, 20
	stw	r2, r10, 16
	stw	r6, r10, 12
	stw	r8, r10, 8
	stw	r9, r10, 4
	addi	r2, r0, 1
	addi	r5, r0, 0
	stw	r10, r1, -6
	stw	r1, r1, -11
	addi	r1, r1, -11
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -7
	addi	r2, r5, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 60
	addi	r6, r0, 0
	addi	r7, r0, 0
	addi	r8, r0, 0
	addi	r9, r0, 0
	addi	r10, r0, 0
	addi	r11, r4, 0
	addi	r4, r4, 48
	stw	r2, r11, 40
	stw	r2, r11, 36
	stw	r2, r11, 32
	stw	r2, r11, 28
	stw	r10, r11, 24
	stw	r2, r11, 20
	stw	r2, r11, 16
	stw	r9, r11, 12
	stw	r8, r11, 8
	stw	r7, r11, 4
	stw	r6, r11, 0
	addi	r2, r11, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r1, r1, -8
	addi	r1, r1, -8
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -8
	addi	r2, r5, 0
	stw	r1, r1, -13
	addi	r1, r1, -13
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -9
	addi	r2, r5, 0
	stw	r1, r1, -14
	addi	r1, r1, -14
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -10
	addi	r2, r5, 0
	stw	r1, r1, -15
	addi	r1, r1, -15
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r14, r0, 17279
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -11
	addi	r2, r5, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 50
	addi	r6, r0, 1
	addi	r7, r0, -1
	stw	r2, r1, -12
	stw	r5, r1, -13
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -13
	stw	r1, r1, -18
	addi	r1, r1, -18
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 1
	ldw	r7, r2, 0
	stw	r2, r1, -14
	stw	r5, r1, -15
	addi	r5, r7, 0
	addi	r2, r6, 0
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	ldw	r2, r1, -15
	stw	r1, r1, -16
	addi	r1, r1, -16
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -16
	addi	r2, r5, 0
	stw	r1, r1, -21
	addi	r1, r1, -21
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -17
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -22
	addi	r1, r1, -22
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r14, r0, 20078
	slli	r14, r14, 16
	oori	r14, r14, 27432
	mif	f1, r14, r0
	stw	r2, r1, -18
	addi	r2, r5, 0
	stw	r1, r1, -23
	addi	r1, r1, -23
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -19
	addi	r2, r5, 0
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -20
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -25
	addi	r1, r1, -25
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -21
	addi	r2, r5, 0
	stw	r1, r1, -26
	addi	r1, r1, -26
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -22
	addi	r2, r5, 0
	stw	r1, r1, -27
	addi	r1, r1, -27
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -23
	addi	r2, r5, 0
	stw	r1, r1, -24
	addi	r1, r1, -24
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -24
	addi	r2, r5, 0
	stw	r1, r1, -29
	addi	r1, r1, -29
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 2
	addi	r6, r0, 0
	stw	r2, r1, -25
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -30
	addi	r1, r1, -30
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 2
	addi	r6, r0, 0
	stw	r2, r1, -26
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -31
	addi	r1, r1, -31
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -27
	addi	r2, r5, 0
	stw	r1, r1, -32
	addi	r1, r1, -32
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -28
	addi	r2, r5, 0
	stw	r1, r1, -33
	addi	r1, r1, -33
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -29
	addi	r2, r5, 0
	stw	r1, r1, -34
	addi	r1, r1, -34
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -30
	addi	r2, r5, 0
	stw	r1, r1, -35
	addi	r1, r1, -35
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -31
	addi	r2, r5, 0
	stw	r1, r1, -32
	addi	r1, r1, -32
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -32
	addi	r2, r5, 0
	stw	r1, r1, -37
	addi	r1, r1, -37
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -33
	addi	r2, r5, 0
	stw	r1, r1, -38
	addi	r1, r1, -38
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -34
	addi	r2, r5, 0
	stw	r1, r1, -39
	addi	r1, r1, -39
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	addi	r2, r0, 0
	stw	r5, r1, -35
	stw	r1, r1, -40
	addi	r1, r1, -40
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 0
	addi	r6, r4, 0
	addi	r4, r4, 8
	stw	r2, r6, 4
	ldw	r2, r1, -35
	stw	r2, r6, 0
	addi	r2, r6, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r1, r1, -40
	addi	r1, r1, -40
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	addi	r2, r0, 5
	stw	r1, r1, -40
	addi	r1, r1, -40
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -36
	addi	r2, r5, 0
	stw	r1, r1, -41
	addi	r1, r1, -41
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 3
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -37
	addi	r2, r5, 0
	stw	r1, r1, -42
	addi	r1, r1, -42
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 60
	ldw	r6, r1, -37
	stw	r2, r1, -38
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -43
	addi	r1, r1, -43
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 8
	stw	r2, r5, 4
	ldw	r2, r1, -38
	stw	r2, r5, 0
	addi	r2, r5, 0
	addi	r5, r0, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	stw	r2, r1, -39
	addi	r2, r5, 0
	stw	r1, r1, -40
	addi	r1, r1, -40
	stw	r31, r1, 1
	cali	external_create_float_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	mov	r5, r2
	addi	r2, r0, 0
	stw	r5, r1, -40
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 8
	stw	r2, r5, 4
	ldw	r2, r1, -40
	stw	r2, r5, 0
	addi	r2, r5, 0
	addi	r5, r0, 180
	addi	r6, r0, 0
	addi	r14, r0, 0
	slli	r14, r14, 16
	oori	r14, r14, 0
	mif	f1, r14, r0
	addi	r7, r4, 0
	addi	r4, r4, 16
	stf	f1, r7, 8
	stw	r2, r7, 4
	stw	r6, r7, 0
	addi	r2, r7, 0
	addi	r29, r5, 0
	addi	r5, r2, 0
	addi	r2, r29, 0
	stw	r1, r1, -45
	addi	r1, r1, -45
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r0, 1
	addi	r6, r0, 0
	stw	r2, r1, -41
	addi	r2, r5, 0
	addi	r5, r6, 0
	stw	r1, r1, -46
	addi	r1, r1, -46
	stw	r31, r1, 1
	cali	external_create_array
	ldw	r31, r1, 1
	ldw	r1, r1, 0
	addi	r5, r4, 0
	addi	r4, r4, 32
	addi	r6, r0, h16(read_screen_settings.4066)
	slli	r6, r6, 16
	addi	r6, r6, l16(read_screen_settings.4066)
	stw	r6, r5, 0
	ldw	r6, r1, -10
	stw	r6, r5, 24
	ldw	r7, r1, -33
	stw	r7, r5, 20
	ldw	r8, r1, -32
	stw	r8, r5, 16
	ldw	r9, r1, -31
	stw	r9, r5, 12
	ldw	r10, r1, -9
	stw	r10, r5, 8
	ldw	r10, r1, -6
	stw	r10, r5, 4
	addi	r11, r4, 0
	addi	r4, r4, 24
	addi	r12, r0, h16(read_light.4143)
	slli	r12, r12, 16
	addi	r12, r12, l16(read_light.4143)
	stw	r12, r11, 0
	ldw	r12, r1, -2
	stw	r12, r11, 16
	stw	r10, r11, 12
	ldw	r13, r1, -11
	stw	r13, r11, 8
	ldw	r14, r1, -12
	stw	r14, r11, 4
	addi	r15, r4, 0
	addi	r4, r4, 16
	addi	r16, r0, h16(read_nth_object.4282)
	slli	r16, r16, 16
	addi	r16, r16, l16(read_nth_object.4282)
	stw	r16, r15, 0
	stw	r12, r15, 12
	stw	r10, r15, 8
	ldw	r10, r1, -8
	stw	r10, r15, 4
	addi	r16, r4, 0
	addi	r4, r4, 16
	addi	r17, r0, h16(read_object.4412)
	slli	r17, r17, 16
	addi	r17, r17, l16(read_object.4412)
	stw	r17, r16, 0
	stw	r15, r16, 8
	ldw	r15, r1, -7
	stw	r15, r16, 4
	addi	r17, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(read_all_object.4420)
	slli	r18, r18, 16
	addi	r18, r18, l16(read_all_object.4420)
	stw	r18, r17, 0
	stw	r16, r17, 4
	addi	r16, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(read_net_item.4423)
	slli	r18, r18, 16
	addi	r18, r18, l16(read_net_item.4423)
	stw	r18, r16, 0
	stw	r12, r16, 4
	addi	r12, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(read_or_network.4437)
	slli	r18, r18, 16
	addi	r18, r18, l16(read_or_network.4437)
	stw	r18, r12, 0
	stw	r16, r12, 4
	addi	r18, r4, 0
	addi	r4, r4, 16
	addi	r19, r0, h16(read_and_network.4451)
	slli	r19, r19, 16
	addi	r19, r19, l16(read_and_network.4451)
	stw	r19, r18, 0
	stw	r16, r18, 8
	ldw	r16, r1, -14
	stw	r16, r18, 4
	addi	r19, r4, 0
	addi	r4, r4, 32
	addi	r20, r0, h16(read_parameter.4462)
	slli	r20, r20, 16
	addi	r20, r20, l16(read_parameter.4462)
	stw	r20, r19, 0
	stw	r5, r19, 24
	stw	r12, r19, 20
	stw	r11, r19, 16
	stw	r18, r19, 12
	stw	r17, r19, 8
	ldw	r5, r1, -16
	stw	r5, r19, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r12, r0, h16(solver_rect_surface.4475)
	slli	r12, r12, 16
	addi	r12, r12, l16(solver_rect_surface.4475)
	stw	r12, r11, 0
	ldw	r12, r1, -17
	stw	r12, r11, 4
	addi	r17, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(solver_rect.4513)
	slli	r18, r18, 16
	addi	r18, r18, l16(solver_rect.4513)
	stw	r18, r17, 0
	stw	r11, r17, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(solver_surface.4534)
	slli	r18, r18, 16
	addi	r18, r18, l16(solver_surface.4534)
	stw	r18, r11, 0
	stw	r12, r11, 4
	addi	r18, r4, 0
	addi	r4, r4, 8
	addi	r20, r0, h16(solver_second.4617)
	slli	r20, r20, 16
	addi	r20, r20, l16(solver_second.4617)
	stw	r20, r18, 0
	stw	r12, r18, 4
	addi	r20, r4, 0
	addi	r4, r4, 24
	addi	r21, r0, h16(solver.4657)
	slli	r21, r21, 16
	addi	r21, r21, l16(solver.4657)
	stw	r21, r20, 0
	stw	r11, r20, 16
	stw	r18, r20, 12
	stw	r17, r20, 8
	stw	r10, r20, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r17, r0, h16(solver_rect_fast.4677)
	slli	r17, r17, 16
	addi	r17, r17, l16(solver_rect_fast.4677)
	stw	r17, r11, 0
	stw	r12, r11, 4
	addi	r17, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(solver_surface_fast.4774)
	slli	r18, r18, 16
	addi	r18, r18, l16(solver_surface_fast.4774)
	stw	r18, r17, 0
	stw	r12, r17, 4
	addi	r18, r4, 0
	addi	r4, r4, 8
	addi	r21, r0, h16(solver_second_fast.4797)
	slli	r21, r21, 16
	addi	r21, r21, l16(solver_second_fast.4797)
	stw	r21, r18, 0
	stw	r12, r18, 4
	addi	r21, r4, 0
	addi	r4, r4, 24
	addi	r22, r0, h16(solver_fast.4843)
	slli	r22, r22, 16
	addi	r22, r22, l16(solver_fast.4843)
	stw	r22, r21, 0
	stw	r17, r21, 16
	stw	r18, r21, 12
	stw	r11, r21, 8
	stw	r10, r21, 4
	addi	r17, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(solver_surface_fast2.4866)
	slli	r18, r18, 16
	addi	r18, r18, l16(solver_surface_fast2.4866)
	stw	r18, r17, 0
	stw	r12, r17, 4
	addi	r18, r4, 0
	addi	r4, r4, 8
	addi	r22, r0, h16(solver_second_fast2.4884)
	slli	r22, r22, 16
	addi	r22, r22, l16(solver_second_fast2.4884)
	stw	r22, r18, 0
	stw	r12, r18, 4
	addi	r22, r4, 0
	addi	r4, r4, 24
	addi	r23, r0, h16(solver_fast2.4928)
	slli	r23, r23, 16
	addi	r23, r23, l16(solver_fast2.4928)
	stw	r23, r22, 0
	stw	r17, r22, 16
	stw	r18, r22, 12
	stw	r11, r22, 8
	stw	r10, r22, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r17, r0, h16(iter_setup_dirvec_constants.5139)
	slli	r17, r17, 16
	addi	r17, r17, l16(iter_setup_dirvec_constants.5139)
	stw	r17, r11, 0
	stw	r10, r11, 4
	addi	r17, r4, 0
	addi	r4, r4, 16
	addi	r18, r0, h16(setup_dirvec_constants.5155)
	slli	r18, r18, 16
	addi	r18, r18, l16(setup_dirvec_constants.5155)
	stw	r18, r17, 0
	stw	r15, r17, 8
	stw	r11, r17, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(setup_startp_constants.5161)
	slli	r18, r18, 16
	addi	r18, r18, l16(setup_startp_constants.5161)
	stw	r18, r11, 0
	stw	r10, r11, 4
	addi	r18, r4, 0
	addi	r4, r4, 16
	addi	r23, r0, h16(setup_startp.5211)
	slli	r23, r23, 16
	addi	r23, r23, l16(setup_startp.5211)
	stw	r23, r18, 0
	ldw	r23, r1, -30
	stw	r23, r18, 12
	stw	r11, r18, 8
	stw	r15, r18, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r24, r0, h16(check_all_inside.5276)
	slli	r24, r24, 16
	addi	r24, r24, l16(check_all_inside.5276)
	stw	r24, r11, 0
	stw	r10, r11, 4
	addi	r24, r4, 0
	addi	r4, r4, 32
	addi	r25, r0, h16(shadow_check_and_group.5290)
	slli	r25, r25, 16
	addi	r25, r25, l16(shadow_check_and_group.5290)
	stw	r25, r24, 0
	stw	r21, r24, 28
	stw	r12, r24, 24
	stw	r10, r24, 20
	ldw	r25, r1, -39
	stw	r25, r24, 16
	stw	r13, r24, 12
	ldw	r26, r1, -20
	stw	r26, r24, 8
	stw	r11, r24, 4
	addi	r27, r4, 0
	addi	r4, r4, 16
	addi	r28, r0, h16(shadow_check_one_or_group.5334)
	slli	r28, r28, 16
	addi	r28, r28, l16(shadow_check_one_or_group.5334)
	stw	r28, r27, 0
	stw	r24, r27, 8
	stw	r16, r27, 4
	addi	r24, r4, 0
	addi	r4, r4, 24
	addi	r28, r0, h16(shadow_check_one_or_matrix.5346)
	slli	r28, r28, 16
	addi	r28, r28, l16(shadow_check_one_or_matrix.5346)
	stw	r28, r24, 0
	stw	r21, r24, 20
	stw	r12, r24, 16
	stw	r27, r24, 12
	stw	r25, r24, 8
	stw	r26, r24, 4
	addi	r21, r4, 0
	addi	r4, r4, 40
	addi	r27, r0, h16(solve_each_element.5374)
	slli	r27, r27, 16
	addi	r27, r27, l16(solve_each_element.5374)
	stw	r27, r21, 0
	ldw	r27, r1, -19
	stw	r27, r21, 36
	ldw	r28, r1, -29
	stw	r28, r21, 32
	stw	r12, r21, 28
	stw	r20, r21, 24
	stw	r10, r21, 20
	ldw	r29, r1, -18
	stw	r29, r21, 16
	stw	r26, r21, 12
	ldw	r30, r1, -21
	stw	r30, r21, 8
	stw	r11, r21, 4
	addi	r25, r4, 0
	addi	r4, r4, 16
	stw	r19, r1, -42
	addi	r19, r0, h16(solve_one_or_network.5429)
	slli	r19, r19, 16
	addi	r19, r19, l16(solve_one_or_network.5429)
	stw	r19, r25, 0
	stw	r21, r25, 8
	stw	r16, r25, 4
	addi	r19, r4, 0
	addi	r4, r4, 24
	addi	r21, r0, h16(trace_or_matrix.5441)
	slli	r21, r21, 16
	addi	r21, r21, l16(trace_or_matrix.5441)
	stw	r21, r19, 0
	stw	r27, r19, 20
	stw	r28, r19, 16
	stw	r12, r19, 12
	stw	r20, r19, 8
	stw	r25, r19, 4
	addi	r20, r4, 0
	addi	r4, r4, 16
	addi	r21, r0, h16(judge_intersection.5464)
	slli	r21, r21, 16
	addi	r21, r21, l16(judge_intersection.5464)
	stw	r21, r20, 0
	stw	r19, r20, 12
	stw	r27, r20, 8
	stw	r5, r20, 4
	addi	r19, r4, 0
	addi	r4, r4, 40
	addi	r21, r0, h16(solve_each_element_fast.5479)
	slli	r21, r21, 16
	addi	r21, r21, l16(solve_each_element_fast.5479)
	stw	r21, r19, 0
	stw	r27, r19, 36
	stw	r23, r19, 32
	stw	r22, r19, 28
	stw	r12, r19, 24
	stw	r10, r19, 20
	stw	r29, r19, 16
	stw	r26, r19, 12
	stw	r30, r19, 8
	stw	r11, r19, 4
	addi	r11, r4, 0
	addi	r4, r4, 16
	addi	r21, r0, h16(solve_one_or_network_fast.5535)
	slli	r21, r21, 16
	addi	r21, r21, l16(solve_one_or_network_fast.5535)
	stw	r21, r11, 0
	stw	r19, r11, 8
	stw	r16, r11, 4
	addi	r16, r4, 0
	addi	r4, r4, 24
	addi	r19, r0, h16(trace_or_matrix_fast.5547)
	slli	r19, r19, 16
	addi	r19, r19, l16(trace_or_matrix_fast.5547)
	stw	r19, r16, 0
	stw	r27, r16, 16
	stw	r22, r16, 12
	stw	r12, r16, 8
	stw	r11, r16, 4
	addi	r11, r4, 0
	addi	r4, r4, 16
	addi	r12, r0, h16(judge_intersection_fast.5570)
	slli	r12, r12, 16
	addi	r12, r12, l16(judge_intersection_fast.5570)
	stw	r12, r11, 0
	stw	r16, r11, 12
	stw	r27, r11, 8
	stw	r5, r11, 4
	addi	r12, r4, 0
	addi	r4, r4, 16
	addi	r16, r0, h16(get_nvector_rect.5585)
	slli	r16, r16, 16
	addi	r16, r16, l16(get_nvector_rect.5585)
	stw	r16, r12, 0
	ldw	r16, r1, -22
	stw	r16, r12, 8
	stw	r29, r12, 4
	addi	r19, r4, 0
	addi	r4, r4, 8
	addi	r21, r0, h16(get_nvector_plane.5597)
	slli	r21, r21, 16
	addi	r21, r21, l16(get_nvector_plane.5597)
	stw	r21, r19, 0
	stw	r16, r19, 4
	addi	r21, r4, 0
	addi	r4, r4, 16
	addi	r22, r0, h16(get_nvector_second.5610)
	slli	r22, r22, 16
	addi	r22, r22, l16(get_nvector_second.5610)
	stw	r22, r21, 0
	stw	r16, r21, 8
	stw	r26, r21, 4
	addi	r22, r4, 0
	addi	r4, r4, 16
	addi	r23, r0, h16(get_nvector.5665)
	slli	r23, r23, 16
	addi	r23, r23, l16(get_nvector.5665)
	stw	r23, r22, 0
	stw	r21, r22, 12
	stw	r12, r22, 8
	stw	r19, r22, 4
	addi	r12, r4, 0
	addi	r4, r4, 8
	addi	r19, r0, h16(utexture.5671)
	slli	r19, r19, 16
	addi	r19, r19, l16(utexture.5671)
	stw	r19, r12, 0
	ldw	r19, r1, -23
	stw	r19, r12, 4
	addi	r21, r4, 0
	addi	r4, r4, 16
	addi	r23, r0, h16(add_light.5828)
	slli	r23, r23, 16
	addi	r23, r23, l16(add_light.5828)
	stw	r23, r21, 0
	stw	r19, r21, 8
	ldw	r23, r1, -25
	stw	r23, r21, 4
	addi	r25, r4, 0
	addi	r4, r4, 40
	stw	r17, r1, -43
	addi	r17, r0, h16(trace_reflections.5854)
	slli	r17, r17, 16
	addi	r17, r17, l16(trace_reflections.5854)
	stw	r17, r25, 0
	stw	r24, r25, 32
	ldw	r17, r1, -41
	stw	r17, r25, 28
	stw	r5, r25, 24
	stw	r16, r25, 20
	stw	r11, r25, 16
	stw	r29, r25, 12
	stw	r30, r25, 8
	stw	r21, r25, 4
	addi	r17, r4, 0
	addi	r4, r4, 88
	addi	r15, r0, h16(trace_ray.5888)
	slli	r15, r15, 16
	addi	r15, r15, l16(trace_ray.5888)
	stw	r15, r17, 0
	stw	r12, r17, 80
	stw	r25, r17, 76
	stw	r27, r17, 72
	stw	r19, r17, 68
	stw	r28, r17, 64
	stw	r24, r17, 60
	stw	r18, r17, 56
	stw	r23, r17, 52
	stw	r5, r17, 48
	stw	r10, r17, 44
	stw	r16, r17, 40
	stw	r2, r17, 36
	stw	r13, r17, 32
	stw	r20, r17, 28
	stw	r29, r17, 24
	stw	r26, r17, 20
	stw	r30, r17, 16
	stw	r22, r17, 12
	stw	r14, r17, 8
	stw	r21, r17, 4
	addi	r14, r4, 0
	addi	r4, r4, 56
	addi	r15, r0, h16(trace_diffuse_ray.6006)
	slli	r15, r15, 16
	addi	r15, r15, l16(trace_diffuse_ray.6006)
	stw	r15, r14, 0
	stw	r12, r14, 48
	stw	r19, r14, 44
	stw	r24, r14, 40
	stw	r5, r14, 36
	stw	r10, r14, 32
	stw	r16, r14, 28
	stw	r13, r14, 24
	stw	r11, r14, 20
	stw	r26, r14, 16
	stw	r30, r14, 12
	stw	r22, r14, 8
	ldw	r5, r1, -24
	stw	r5, r14, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r12, r0, h16(iter_trace_diffuse_rays.6030)
	slli	r12, r12, 16
	addi	r12, r12, l16(iter_trace_diffuse_rays.6030)
	stw	r12, r11, 0
	stw	r14, r11, 4
	addi	r12, r4, 0
	addi	r4, r4, 16
	addi	r14, r0, h16(trace_diffuse_rays.6052)
	slli	r14, r14, 16
	addi	r14, r14, l16(trace_diffuse_rays.6052)
	stw	r14, r12, 0
	stw	r18, r12, 8
	stw	r11, r12, 4
	addi	r11, r4, 0
	addi	r4, r4, 16
	addi	r14, r0, h16(trace_diffuse_ray_80percent.6058)
	slli	r14, r14, 16
	addi	r14, r14, l16(trace_diffuse_ray_80percent.6058)
	stw	r14, r11, 0
	stw	r12, r11, 8
	ldw	r14, r1, -36
	stw	r14, r11, 4
	addi	r15, r4, 0
	addi	r4, r4, 16
	addi	r16, r0, h16(calc_diffuse_using_1point.6081)
	slli	r16, r16, 16
	addi	r16, r16, l16(calc_diffuse_using_1point.6081)
	stw	r16, r15, 0
	stw	r11, r15, 12
	stw	r23, r15, 8
	stw	r5, r15, 4
	addi	r11, r4, 0
	addi	r4, r4, 16
	addi	r16, r0, h16(calc_diffuse_using_5points.6095)
	slli	r16, r16, 16
	addi	r16, r16, l16(calc_diffuse_using_5points.6095)
	stw	r16, r11, 0
	stw	r23, r11, 8
	stw	r5, r11, 4
	addi	r16, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(do_without_neighbors.6128)
	slli	r18, r18, 16
	addi	r18, r18, l16(do_without_neighbors.6128)
	stw	r18, r16, 0
	stw	r15, r16, 4
	addi	r15, r4, 0
	addi	r4, r4, 8
	addi	r18, r0, h16(neighbors_exist.6141)
	slli	r18, r18, 16
	addi	r18, r18, l16(neighbors_exist.6141)
	stw	r18, r15, 0
	ldw	r18, r1, -26
	stw	r18, r15, 4
	addi	r19, r4, 0
	addi	r4, r4, 16
	addi	r20, r0, h16(try_exploit_neighbors.6179)
	slli	r20, r20, 16
	addi	r20, r20, l16(try_exploit_neighbors.6179)
	stw	r20, r19, 0
	stw	r16, r19, 8
	stw	r11, r19, 4
	addi	r11, r4, 0
	addi	r4, r4, 8
	addi	r20, r0, h16(write_ppm_header.6199)
	slli	r20, r20, 16
	addi	r20, r20, l16(write_ppm_header.6199)
	stw	r20, r11, 0
	stw	r18, r11, 4
	addi	r20, r4, 0
	addi	r4, r4, 8
	addi	r21, r0, h16(write_rgb.6228)
	slli	r21, r21, 16
	addi	r21, r21, l16(write_rgb.6228)
	stw	r21, r20, 0
	stw	r23, r20, 4
	addi	r21, r4, 0
	addi	r4, r4, 16
	addi	r22, r0, h16(pretrace_diffuse_rays.6244)
	slli	r22, r22, 16
	addi	r22, r22, l16(pretrace_diffuse_rays.6244)
	stw	r22, r21, 0
	stw	r12, r21, 12
	stw	r14, r21, 8
	stw	r5, r21, 4
	addi	r5, r4, 0
	addi	r4, r4, 40
	addi	r12, r0, h16(pretrace_pixels.6266)
	slli	r12, r12, 16
	addi	r12, r12, l16(pretrace_pixels.6266)
	stw	r12, r5, 0
	stw	r6, r5, 36
	stw	r17, r5, 32
	stw	r28, r5, 28
	stw	r9, r5, 24
	ldw	r6, r1, -28
	stw	r6, r5, 20
	stw	r23, r5, 16
	ldw	r9, r1, -34
	stw	r9, r5, 12
	stw	r21, r5, 8
	ldw	r9, r1, -27
	stw	r9, r5, 4
	addi	r12, r4, 0
	addi	r4, r4, 32
	addi	r17, r0, h16(pretrace_line.6320)
	slli	r17, r17, 16
	addi	r17, r17, l16(pretrace_line.6320)
	stw	r17, r12, 0
	stw	r7, r12, 24
	stw	r8, r12, 20
	stw	r6, r12, 16
	stw	r5, r12, 12
	stw	r18, r12, 8
	stw	r9, r12, 4
	addi	r5, r4, 0
	addi	r4, r4, 32
	addi	r7, r0, h16(scan_pixel.6353)
	slli	r7, r7, 16
	addi	r7, r7, l16(scan_pixel.6353)
	stw	r7, r5, 0
	stw	r20, r5, 24
	stw	r19, r5, 20
	stw	r23, r5, 16
	stw	r15, r5, 12
	stw	r18, r5, 8
	stw	r16, r5, 4
	addi	r7, r4, 0
	addi	r4, r4, 16
	addi	r8, r0, h16(scan_line.6374)
	slli	r8, r8, 16
	addi	r8, r8, l16(scan_line.6374)
	stw	r8, r7, 0
	stw	r5, r7, 12
	stw	r12, r7, 8
	stw	r18, r7, 4
	addi	r5, r4, 0
	addi	r4, r4, 8
	addi	r8, r0, h16(create_pixelline.6453)
	slli	r8, r8, 16
	addi	r8, r8, l16(create_pixelline.6453)
	stw	r8, r5, 0
	stw	r18, r5, 4
	addi	r8, r4, 0
	addi	r4, r4, 8
	addi	r15, r0, h16(calc_dirvec.6480)
	slli	r15, r15, 16
	addi	r15, r15, l16(calc_dirvec.6480)
	stw	r15, r8, 0
	stw	r14, r8, 4
	addi	r15, r4, 0
	addi	r4, r4, 8
	addi	r16, r0, h16(calc_dirvecs.6540)
	slli	r16, r16, 16
	addi	r16, r16, l16(calc_dirvecs.6540)
	stw	r16, r15, 0
	stw	r8, r15, 4
	addi	r8, r4, 0
	addi	r4, r4, 8
	addi	r16, r0, h16(calc_dirvec_rows.6570)
	slli	r16, r16, 16
	addi	r16, r16, l16(calc_dirvec_rows.6570)
	stw	r16, r8, 0
	stw	r15, r8, 4
	addi	r15, r4, 0
	addi	r4, r4, 8
	addi	r16, r0, h16(create_dirvec.6588)
	slli	r16, r16, 16
	addi	r16, r16, l16(create_dirvec.6588)
	stw	r16, r15, 0
	ldw	r16, r1, -7
	stw	r16, r15, 4
	addi	r17, r4, 0
	addi	r4, r4, 8
	addi	r19, r0, h16(create_dirvec_elements.6596)
	slli	r19, r19, 16
	addi	r19, r19, l16(create_dirvec_elements.6596)
	stw	r19, r17, 0
	stw	r15, r17, 4
	addi	r19, r4, 0
	addi	r4, r4, 16
	addi	r20, r0, h16(create_dirvecs.6605)
	slli	r20, r20, 16
	addi	r20, r20, l16(create_dirvecs.6605)
	stw	r20, r19, 0
	stw	r14, r19, 12
	stw	r17, r19, 8
	stw	r15, r19, 4
	addi	r17, r4, 0
	addi	r4, r4, 8
	addi	r20, r0, h16(init_dirvec_constants.6618)
	slli	r20, r20, 16
	addi	r20, r20, l16(init_dirvec_constants.6618)
	stw	r20, r17, 0
	ldw	r20, r1, -43
	stw	r20, r17, 4
	addi	r21, r4, 0
	addi	r4, r4, 16
	addi	r22, r0, h16(init_vecset_constants.6626)
	slli	r22, r22, 16
	addi	r22, r22, l16(init_vecset_constants.6626)
	stw	r22, r21, 0
	stw	r17, r21, 8
	stw	r14, r21, 4
	addi	r14, r4, 0
	addi	r4, r4, 16
	addi	r17, r0, h16(init_dirvecs.6634)
	slli	r17, r17, 16
	addi	r17, r17, l16(init_dirvecs.6634)
	stw	r17, r14, 0
	stw	r21, r14, 12
	stw	r19, r14, 8
	stw	r8, r14, 4
	addi	r8, r4, 0
	addi	r4, r4, 16
	addi	r17, r0, h16(add_reflection.6643)
	slli	r17, r17, 16
	addi	r17, r17, l16(add_reflection.6643)
	stw	r17, r8, 0
	stw	r20, r8, 12
	ldw	r17, r1, -41
	stw	r17, r8, 8
	stw	r15, r8, 4
	addi	r15, r4, 0
	addi	r4, r4, 16
	addi	r17, r0, h16(setup_rect_reflection.6656)
	slli	r17, r17, 16
	addi	r17, r17, l16(setup_rect_reflection.6656)
	stw	r17, r15, 0
	stw	r2, r15, 12
	stw	r13, r15, 8
	stw	r8, r15, 4
	addi	r17, r4, 0
	addi	r4, r4, 16
	addi	r19, r0, h16(setup_surface_reflection.6697)
	slli	r19, r19, 16
	addi	r19, r19, l16(setup_surface_reflection.6697)
	stw	r19, r17, 0
	stw	r2, r17, 12
	stw	r13, r17, 8
	stw	r8, r17, 4
	addi	r2, r4, 0
	addi	r4, r4, 16
	addi	r8, r0, h16(setup_reflections.6736)
	slli	r8, r8, 16
	addi	r8, r8, l16(setup_reflections.6736)
	stw	r8, r2, 0
	stw	r17, r2, 12
	stw	r15, r2, 8
	stw	r10, r2, 4
	addi	r30, r4, 0
	addi	r4, r4, 64
	addi	r8, r0, h16(rt.6749)
	slli	r8, r8, 16
	addi	r8, r8, l16(rt.6749)
	stw	r8, r30, 0
	stw	r11, r30, 56
	stw	r2, r30, 52
	stw	r20, r30, 48
	stw	r6, r30, 44
	stw	r7, r30, 40
	ldw	r2, r1, -42
	stw	r2, r30, 36
	stw	r12, r30, 32
	stw	r16, r30, 28
	ldw	r2, r1, -39
	stw	r2, r30, 24
	stw	r13, r30, 20
	stw	r14, r30, 16
	stw	r18, r30, 12
	stw	r9, r30, 8
	stw	r5, r30, 4
	addi	r2, r0, 128
	addi	r5, r0, 128
	stw	r1, r1, -48
	addi	r1, r1, -48
	stw	r31, r1, 1
	ldw	r14, r30, 0
	cal	r14
	ldw	r31, r1, 1
	ldw	r1, r1, 0
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
	cali	external_float_of_int
	fadd	f1, f1, f3
	jmp	r31
float_of_int.1:
	muli	r2, r2, -1
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
	cali	external_float_of_int
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
	addi	r5, r0, -1
int_of_float.21:
	addi	r5, r5, 1
	fsubs	f1, f1, f2
	jmpigt	int_of_float.21
	fadd	f1, f1, f2
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	addi	r7, r0, 0
int_of_float.22:
	add	r7, r7, r6
	subis	r5, r5, 1
	jmpigt	int_of_float.22
	cali	external_float_of_int
	add	r2, r2, r7
	jmp	r31
int_of_float.1:
	fneg	f1, f1
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	mif	f2, r5		# f2 = 8388608.0
	fsubs	f0, f1, f2
	jmpige	int_of_float.2	#large
	fadd	f1, f1, f2
	mfi	r2, f1
	sub	r2, r2, r5
	muli	r2, r2, -1
	jmp	r31
int_of_float.2:
	addi	r5, r0, -1
int_of_float.21:
	addi	r5, r5, 1
	fsubs	f1, f1, f2
	jmpigt	int_of_float.21
	fadd	f1, f1, f2
	addi	r6, r0, 128
	slli	r6, r6, 16	# r6 = 8388608
	addi	r7, r0, 0
int_of_float.22:
	add	r7, r7, r6
	subis	r5, r5, 1
	jmpigt	int_of_float.22
	cali	external_float_of_int
	add	r2, r2, r7
	muli	r2, r2, -1
	jmp	r31
external_sqrt:
	sqr	f1, f1
	jmp	r31
external_floor:
	fsubs	f0, f1, f0
	addi	r5, r0, 75
	slli	r5, r5, 24	# r5 = 0x4B000000
	mif	f2, r5		# f2 = 8388608.0
	jmpilt	floor.1 	#minus
	fadd	f1, f1, f2
	fsub	f1, f1, f2
	jmpi	floor.2
floor.1:
	fneg	f1, f1
	fadd	f1, f1, f2
	fsub	f1, f1, f2
	fneg	f1, f1
floor.2:
	jmp	r31
