#define mtime  0x200bff8
#define mtimecmp 0x2004000


_start:

addi t2,x1,0	
addi t1,x1,0
li t2,mtimecmp
addi t1,t1,-1
sw t1,0(t2)


lui sp, 0x10011

addi t0,x1,0
addi t3,x1,0
addi t4,x1,0
la t3,vtrap_entry
csrw mtvec,t3
addi t0,x1,1
csrs mtvec,t0


li t2,mtimecmp

addi t5,x1,0
addi t5,t5,12
slli t5,t5,28
addi t5,t5,4

li s1,mtime
ld s2,0(s1)

add s2,s2,t5
sd s2,0(t2)


andi s2,s2,0
sw s2,4(t2)

li      t0, 8
csrrs   zero, mstatus, t0 #enable global interrupt (MIE bit)
li      t0, 0x80
csrrs   zero, mie, t0  # enable machine time interrupt
 

here1: j here1   # infinite loop

here:  j end

end: ebreak

ebreak

.p2align 2
vtrap_entry:     # vtrap_entry has a nop to make sure, handlers are 4 byte aligned 
j u_sw_int_handler
nop
j s_sw_int_handler
nop
j h_sw_int_handler
nop
j m_sw_int_handler
nop
j u_ti_int_handler
nop
j s_ti_int_handler
nop
j h_ti_int_handler
nop
j m_ti_int_handler #machine mode timer interrupt handler. H/W jumps here, if machine timer interrupt happens
nop #nop is added here. so that each handler is at locations that are 4 byte aligned, starting from vtrap_entry
j u_ex_int_handler
nop
j s_ex_int_handler
nop
j h_exint_handler
nop
j m_ex_int_handler
nop


u_sw_int_handler:
j here

s_sw_int_handler:
j here

h_sw_int_handler:
j here

m_sw_int_handler:
j here

u_ti_int_handler:
j here

s_ti_int_handler:
j here

h_ti_int_handler:
j here


m_ti_int_handler:


#clearing mtip bit, so that next timer interrupt comes for processing. mandatory step
li t6,mtimecmp    # t6 has mtimecmp reg location
addi t3,x1,0
addi t3,t3,-1 # writing -1 to reg t3
sd t3, 0(t6) # just increment the mtimecmp + 4 location value by 1.
j here


u_ex_int_handler:
j here

s_ex_int_handler:
j here

h_exint_handler:
j here

m_ex_int_handler:
j here



ebreak

