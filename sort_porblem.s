.data
	str1:	.asciiz "Array["
	str2:	.asciiz "]"
.text

	li	$t0,1
	
	la	$a0,str1
	li	$v0,4
	syscall
	
	move	$a0,$t0
	li		$v0,1
	syscall
	
	la		$a0,str2
	li		$v0,4
	syscall
	
	li		$v0,10
	syscall
	
	
	


					
			
					
			
				
				
			