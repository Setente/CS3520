# Ex4: Factorial with a Procedure

## What the program does
Calls a procedure `factorial` that computes N! (where N = 5), then prints the result (120).
E
## Register Usage
| Register | Purpose |
|----------|---------|
| `a0`     | Argument: N (in), Result: N! (out) |
| `ra`     | Return address for the procedure call |
| `s0`     | Result accumulator inside factorial |
| `s1`     | Loop counter (i) inside factorial |
| `sp`     | Stack pointer — used to save `s0` and `s1` |
| `a7`     | Syscall code (1 for print, 10 for exit) |

## What was harder than expected
Understanding the calling convention — `a0` is both the input argument AND the return value. Also, having to save `s0` and `s1` on the stack because they are callee-saved registers. Since `factorial` is a **leaf procedure** (it doesn't call anything else), it does NOT need to save `ra`. 