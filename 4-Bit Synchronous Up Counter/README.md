# 🔢 4-Bit Up Counter in Verilog

This project features a **4-Bit Synchronous Up Counter** designed in Verilog HDL. It demonstrates the use of sequential logic and non-blocking assignments for hardware synthesis.

## 📂 Files
* `up_counter_4bit.v`: The synthesizable RTL module for the 4-bit counter.
* `tb_up_counter_4bit.v`: A testbench designed to verify the counting sequence and reset behavior.

## 📝 Design Description
The `up_counter_4bit` module increments a 4-bit register on every positive edge of the clock. 



### Design Details:
* **Sequential Logic**: Uses an `always @(posedge clk)` block for edge-triggered behavior.
* **Asynchronous Reset**: A dedicated reset signal forces the counter to `4'b0000` immediately, regardless of the clock.
* **Non-Blocking Assignments (`<=`)**: Used to ensure the design maps correctly to flip-flops during synthesis, preventing race conditions.

## 📈 Simulation
The design was verified using the **Vivado Simulator**. The testbench initializes the system and allows the counter to run through a full 16-state cycle.

### ✅ Expected Output
Upon releasing the reset, the output `count` increments as follows:
`0000` → `0001` → `0010` → ... → `1110` → `1111` → `0000` (Roll-over)
`0` → `1` → `2` → ... → `14` → `15` → `0` (Roll-over)

The counter continues this cyclic behavior as long as the clock is toggling and reset is de-asserted.