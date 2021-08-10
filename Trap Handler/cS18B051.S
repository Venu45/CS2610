_start:	
lui sp, 0x10011 
la t0, trap_entry 
csrw mtvec,t0 


la x28, _data1
lw x18,0(x28)
lw x19,4(x28)
lw x20,8(x28)

lw x21,16(x28)

addi x8,x0,0
ld x8,0(x18)

addi x9,x0,-8
addi x12,x0,0
ld x12,0(x9)

addi x14,x0,7
sd x9,0(x14)

addi x21,x0,-8
addi x22,x0,4
sd x22,0(x21)

addi x23,x0,8
addi x24,x0,6
add x26,x23,x24
j     _start-100
add x26,x26,x26



ebreak


.p2align 0x4
.section .data
_data1:
.word 	7
.word 	1
.word 	5
.word   3



trap_handler:
csrr t1,mepc
addi t1,t1,4
sd t1,32*8(sp)
csrw mepc,t1
csrr t2,mcause
sd t2,33*8(sp)
ret



trap_entry:
addi sp, sp, -34*8
sd x1, 1*8(sp)
sd x2, 2*8(sp)
sd x3, 3*8(sp)
sd x4, 4*8(sp)
sd x5, 5*8(sp)
sd x6, 6*8(sp)
sd x7, 7*8(sp)
sd x8, 8*8(sp)
sd x9, 9*8(sp)
sd x10, 10*8(sp)
sd x11, 11*8(sp)
sd x12, 12*8(sp)
sd x13, 13*8(sp)
sd x14, 14*8(sp)
sd x15, 15*8(sp)
sd x16, 16*8(sp)
sd x17, 17*8(sp)
sd x18, 18*8(sp)
sd x19, 19*8(sp)
sd x20, 20*8(sp)
sd x21, 21*8(sp)
sd x22, 22*8(sp)
sd x23, 23*8(sp)
sd x24, 24*8(sp)
sd x25, 25*8(sp)
sd x26, 26*8(sp)
sd x27, 27*8(sp)
sd x28, 28*8(sp)
sd x29, 29*8(sp)
sd x30, 30*8(sp)
sd x31, 31*8(sp)



jal trap_handler


ld x1, 1*8(sp)
ld x2, 2*8(sp)
ld x3, 3*8(sp)
ld x4, 4*8(sp)
ld x5, 5*8(sp)
ld x6, 6*8(sp)
ld x7, 7*8(sp)
ld x8, 8*8(sp)
ld x9, 9*8(sp)
ld x10, 10*8(sp)
ld x11, 11*8(sp)
ld x12, 12*8(sp)
ld x13, 13*8(sp)
ld x14, 14*8(sp)
ld x15, 15*8(sp)
ld x16, 16*8(sp)
ld x17, 17*8(sp)
ld x18, 18*8(sp)
ld x19, 19*8(sp)
ld x20, 20*8(sp)
ld x21, 21*8(sp)
ld x22, 22*8(sp)
ld x23, 23*8(sp)
ld x24, 24*8(sp)
ld x25, 25*8(sp)
ld x26, 26*8(sp)
ld x27, 27*8(sp)
ld x28, 28*8(sp)
ld x29, 29*8(sp)
ld x30, 30*8(sp)
ld x31, 32*8(sp)
csrw mepc,x31
ld x31, 33*8(sp)
csrw mcause,x31
ld x31, 31*8(sp)

addi sp,sp,34*8
mret














