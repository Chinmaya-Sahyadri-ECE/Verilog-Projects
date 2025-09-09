# 8-to-1 Multiplexer in Verilog

This project contains a simple 8-to-1 multiplexer (MUX) designed in Verilog HDL, along with a basic testbench for functional simulation.

## 📂 Files
- `etomux.v`: The synthesizable Verilog module for the 8-to-1 MUX.
- `etomux_test.v`: A Verilog testbench to verify the functionality of the MUX.

## 📝 Design Description
The `etomux` module implements the multiplexer using a `behavioral modeling` style. It uses a `case` statement within an `always` block to select one of the 8 input bits from port `a` based on the value of the 3-bit select line `s`. The selected bit is then directed to the single-bit output `q`.

## 📈 Simulation
To verify the design, I used Vivado Simulator.

## ✅ Expected Output
In my testbench, I set the data input `a` to the value `8'b01011111`. I then made the select line `s` cycle through all possible values from `3'b000` to `3'b111`.

As my simulation runs, the output `q` should match the bit from `a` that is selected by `s`. The output sequence I expect for `q` is: **1, 1, 1, 1, 0, 1, 1, 0**.
