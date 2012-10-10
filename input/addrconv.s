	jmpi	adder.7
adder.7:
	addi	r6, r0, h16(adder.7)
	slli	r6, r6, 16
	addi	r6, r6, l16(adder.7)
	prt	r6
	hlt