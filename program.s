
.data
	N:	.word 5
	array:	.space 20
	str:	.asciiz "Enter 5 integers: "
	my_space: .ascii " "
	newline:	.asciiz "\n"
	display_str:	.asciiz " Array of integers: "
	sort_str:		.asciiz " Sorting array..."



.text
	li	$t2,0
	la	$a1,array
	
	jal readArray
	
	jal	displayArray
	
	la	$a0,newline
	li	$v0,4
	syscall
	
	la	$a1,array
	
	jal sortArray
	
	
	jal displayArray
	
	
	li	$v0,10
	syscall
	


readArray:
	lw	$t0,N
	
	la		$a0,str
	li		$v0,4
	syscall
	
	read_loop:	
	
		beq	  $t0,0,exit
	
		li		$v0,5
		syscall
		sw		$v0,($a1)
		sub		$t0,$t0,1
		add		$a1,$a1,4
		j		read_loop
	
	
	
	
	
	


displayArray:
	
	la	$a0,display_str
	li	$v0,4
	syscall
	
	
	
	lw	$t0,N
	la	$t1,array
	
	display_loop:
		beq	$t0,0,exit
		lw	$a0,($t1)
		li		$v0,1
		syscall
		
		sub $t0,$t0,1
		
		
		
		add	$t1,$t1,4
		
		
		li	$a0,32
		li	$v0,11
		syscall
		
		j	display_loop
		
	


sortArray:
	la	$a0,sort_str
	li	$v0,4
	syscall
	
	lw	$t0,N
	sub $t0,$t0,1
	lw	$t3,N
	add	$t2,$t0,0
	
	first_loop:
		beq $t0,0,exit
		sub $t0,$t0,1
		li	$t1,0
		
		second_loop:
			beq $t1,$t2,first_loop
			la	$a1,array
			move $a2,$t1
			jal	swap
			j	second_loop
			

	
swap:
	move	$s2,$a2
	add		$s3,$s2,1
	mul		$s2,$s2,4
	add		$s3,$s2,4
	lw		$t5,array($s2)
	lw		$t6,array($s3)
	ble		$t5,$t6,exit
	move	$t7,$t5
	move	$t5,$t6
	move	$t6,$t7
	
	
		
	
	

	
	
			
	
	
	
	

exit:
	
	
	
	
	jr	$ra