# 4-to-1 Multiplexer in Verilog (Gate-Level Model)

This project contains a 4-to-1 multiplexer (MUX) designed in Verilog
HDL. The circuit is described using a gate-level (structural) model,
built from basic logic gates. A testbench is also included for
functional simulation.

## 📂 Files

-   `muxf.v`: The synthesizable Verilog module for the 4-to-1 MUX.\
-   `muxf_test.v`: A Verilog testbench to verify the functionality of
    the MUX.

## 📝 Design Description

The `muxf` module implements the multiplexer using **gate-level
modeling**. This means the circuit is described as a collection of
primitive logic gates (`not`, `and`, `or`) and their interconnections,
much like a circuit schematic.

It selects one of the four single-bit inputs (`a`, `b`, `c`, `d`) based
on the value of the 2-bit select signal (`s1`, `s0`) and directs it to
the output `y`.

## 📈 Simulation

To verify the design, I used a **Vivado Simulator**.

## ✅ Expected Output

In my testbench, I set the data inputs to the following values: -
`a = 0` - `b = 1` - `c = 0` - `d = 1`

I then made the select lines (`s1s0`) cycle through all four possible
combinations (`00`, `01`, `10`, `11`).

As my simulation runs, the output `y` should match the input selected by
`s1` and `s0`.\
The output sequence I expect for `y` is: **0, 1, 0, 1**.
