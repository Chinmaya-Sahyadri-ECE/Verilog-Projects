# 32-bit Arithmetic Logic Unit (ALU) in Verilog

This project is a Verilog implementation of a 32-bit Arithmetic Logic
Unit (ALU). The ALU can perform eight different arithmetic and logical
operations. A testbench is included to simulate and verify its
functionality.

## 📂 Files

-   **alu.v**: The synthesizable Verilog module for the 32-bit ALU.\
-   **alu_test.v**: A Verilog testbench to verify the ALU's operations.

## 📝 Design Description

The `alu` module is a 32-bit ALU designed using behavioral Verilog. It
takes two 32-bit inputs, **A** and **B**, and performs an operation
based on a 3-bit `opcode`. The entire unit can be enabled or disabled
using the **En** signal.

## 🖥️ Simulation

To verify the design, I used a Verilog simulator to run the `alu_test`
module.

## ✅ Expected Output

In my testbench, I set the data inputs to fixed values: - **A = 6** -
**B = 5**

I then toggled the `opcode` through all 8 possible operations. The
simulation first checks the disabled state (**En=0**) and then the
enabled state (**En=1**) for all operations.
