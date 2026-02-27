# GCF & LCM Calculator (8086 Assembly)

An 8086 assembly language program that calculates the **Greatest Common Factor (GCF)** and **Least Common Multiple (LCM)** of two user-provided numbers.

## Features

- Accepts two numbers (1-2 digits each) as input
- Computes the GCF using an iterative divisibility approach
- Computes the LCM using the formula: `LCM(a, b) = (a * b) / GCF(a, b)`
- Handles edge cases such as zero values, both inputs being 1, and invalid (non-numeric) input

## How to Run

1. Open the project in **emu8086** or any compatible 8086 emulator.
2. Load `Project.asm`.
3. Assemble and run the program.
4. Enter two numbers when prompted and view the results.

## Example

```
Enter First Number: 12
Enter Second Number: 8
GCF=4  LCM=24
```
