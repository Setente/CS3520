# Lab 2 — Step 2 Discussion Answers

## 1. The C++ loop says `i < n`, but the assembly branches on `bge` (`i >= n`). Why must the test be inverted?

RISC-V conditional branches jump when their condition is **true**. The loop needs to keep running while `i < n` and exit when `i >= n`. So the assembly branches **out of the loop** (to the exit label) when `i >= n` is true. This is the inversion — C++ says "continue while `i < n`", assembly says "jump out when `i >= n`". Both describe the same loop, just from opposite angles.

## 2. Compare `li`, `mv`, `la`, and `ble` with the machine code Ripes generates

These are **pseudo-instructions** — they aren't real RISC-V instructions, but the assembler expands each into one or more real ones:

| Pseudo | Real instruction(s) | Why |
|---|---|---|
| `li rd, imm` | `addi rd, x0, imm` (small) or `lui` + `addi` (large) | Load an immediate value into a register |
| `mv rd, rs` | `addi rd, rs, 0` | Copy one register to another |
| `la rd, symbol` | `auipc` + `addi` | Load a 32-bit address using PC-relative addressing |
| `ble rs, rt, label` | `bge rt, rs, label` | Branch if less-or-equal (swap the operands) |

The assembler provides them because they make the code **easier to read and write** for humans. The CPU only ever executes the real instructions.

## 3. `find_max` saves `s1` on the stack but does not save `ra`. Explain why both decisions are correct.

- **`s1` is saved** because it is a **callee-saved** register. `find_max` modifies it (it uses `s1` to hold the current maximum). The calling convention says a function must restore callee-saved registers before returning, so it saves the caller's original `s1` on the stack and restores it at the end.
- **`ra` is not saved** because `find_max` is a **leaf procedure** — it doesn't call any other function. Since nothing overwrites `ra`, it still holds the correct return address when `find_max` finishes. If it did call another function, it would have to save `ra` on the stack too.