## Compute a + b + c + d

.text
.globl main
	
main:
	
ori $8,$0,1 # puts 1 into register 8
ori $9,$0,2 # puts 2 into register 9
ori $10,$0,3 # puts 3 into register 10
ori $11,$0,2 # puts 2 into register 11
		
addu $12,$9,$8 # adds register 9 and 8 then puts into register 12
addu $13,$11,$10 # adds register 11 and 10 and puts into register 13
addu $14,$13,$12 # adds last two sums in register 13 and 12 then puts final sum into register 14