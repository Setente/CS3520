# Instruction Encoding Analysis

## B-Type: Branch Instruction

**Example instruction:** `beq a0, a1, gcd_done`

**32-bit encoding (hex):** 0x00B50463

**32-bit encoding (binary):**
0000 0000 1011 0101 0000 0100 0110 0011

**Field breakdown (B-type):**

| Field     | Bits  | Value       | Meaning                       |
|-----------|-------|-------------|-------------------------------|
| imm[12]   | 31    | 0           | Immediate bit 12              |
| imm[10:5] | 30–25 | 000000      | Immediate bits 10–5           |
| rs2       | 24–20 | 01011 (x11) | Second source register (a1)   |
| rs1       | 19–15 | 01010 (x10) | First source register (a0)    |
| funct3    | 14–12 | 000         | Branch condition (000 = beq)  |
| imm[4:1]  | 11–8  | 0100        | Immediate bits 4–1            |
| imm[11]   | 7     | 0           | Immediate bit 11              |
| opcode    | 6–0   | 1100011     | Opcode for branch (0x63)      |

## J-Type: Jump Instruction

**Example instruction:** `jal ra, factorial`

**32-bit encoding (hex):** 0x008000EF

**32-bit encoding (binary):**
0000 0000 1000 0000 0000 0000 1110 1111

**Field breakdown (J-type):**

| Field      | Bits  | Value       | Meaning                       |
|------------|-------|-------------|-------------------------------|
| imm[20]    | 31    | 0           | Immediate bit 20              |
| imm[10:1]  | 30–21 | 0000000100  | Immediate bits 10–1           |
| imm[11]    | 20    | 0           | Immediate bit 11              |
| imm[19:12] | 19–12 | 00000000    | Immediate bits 19–12          |
| rd         | 11–7  | 00001 (x1)  | Destination register (ra)     |
| opcode     | 6–0   | 1101111     | Opcode for jal (0x6F)         |

## Why is the immediate scattered?

RISC-V instructions are all exactly 32 bits wide. The branch and jump formats need to encode two register operands, a destination register, an immediate offset, and the opcode. If the immediate were one contiguous field, the instruction would need more than 32 bits. To keep every instruction exactly 32 bits, the immediate bits are scattered into the unused spaces left by the register fields. This lets B-type hold a 13-bit offset and J-type hold a 21-bit offset without increasing the instruction size.