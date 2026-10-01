.data
A: .word 48
B: .word 18

.text
main:
    la t0, A
    lw a0, 0(t0)
    la t0, B
    lw a1, 0(t0)

    jal ra, gcd

    li a7, 1
    ecall

    li a7, 10
    ecall

gcd:
    addi sp, sp, -4
    sw s0, 0(sp)

gcd_loop:
    beq a0, a1, gcd_done
    blt a0, a1, b_larger
    sub a0, a0, a1
    j gcd_loop

b_larger:
    sub a1, a1, a0
    j gcd_loop

gcd_done:
    lw s0, 0(sp)
    addi sp, sp, 4
    ret