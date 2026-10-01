# Ex5: GCD using Euclid's Algorithm

## What the program does
Computes the greatest common divisor (GCD) of two integers (48 and 18) using Euclid's algorithm with repeated subtraction, then prints the result (6).

## Register Usage
| Register | Purpose |
|----------|---------|
| `a0`     | Argument: a (in), Result: GCD (out) |
| `a1`     | Argument: b (in) |
| `ra`     | Return address from gcd procedure |
| `sp`     | Stack pointer |
| `t0`     | Temporary for loading addresses |
| `a7`     | Syscall code (1 for print, 10 for exit) |

## What was harder than expected
Euclid's algorithm normally uses `%` (remainder), but Ripes' default processor doesn't support `rem`. I used repeated subtraction instead. Since gcd is a leaf procedure, I don't strictly need to save `ra` on the stack.

## Stretch: Recursive Version
If gcd were recursive, it would no longer be a leaf procedure. That means I would need to save `ra` on the stack before each recursive call, because the recursive call would overwrite it. Each recursive call would push its own `ra` and arguments onto the stack, and the stack would grow with each call until the base case is reached.