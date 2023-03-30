## Compute 13*x
##
## 
## $7 = x
## $8 = x for shifting (4x and 8x)
## $9 = holds results for shifting
## $10 = result (13x)
## 
.text
.globl main

main:
 ori $7, $0, 5      #puts x into register $7
 addu $8, $0, $7    #adds the x into $8
 addu $10, $0, $7   #adds x into $10
 sll $9, $8, 2      #shifts x over 2 and puts 4x into $9 
 addu $10, $10, $9  #adds 4x to $10
 sll $9, $8, 3      #shifts the x over 3 puts 8x into $9
 addu $10, $10, $9  #adds 8x to $10
 

