# 🚦 Traffic Light Controller using Verilog (FSM)

This repository contains a **Traffic Light Controller** designed using Finite State Machine (FSM) concepts in Verilog HDL. The project includes the synthesizable RTL code and a functional testbench for verification.

## 📂 Files
* `traffic_light_controller.v`: The synthesizable Verilog module implementing the FSM logic.
* `tb_traffic_light_controller.v`: A comprehensive testbench to verify state transitions and timing.

## 📝 Design Description
The `traffic_light_controller` is implemented using a **Moore Finite State Machine** approach. The design cycles through three distinct states:
1.  **RED**: Initial state upon reset.
2.  **GREEN**: Transitioned to after a clock cycle in RED.
3.  **YELLOW**: Transitioned to after a clock cycle in GREEN.



### Key Features:
* **Synchronous State Transitions**: All transitions occur on the rising edge of the clock.
* **Active-High Reset**: Ensures the system always starts in a safe (RED) state.
* **Moore Architecture**: Outputs depend solely on the current state, preventing combinational glitches in the output signals.

## 📈 Simulation
Functional verification was performed using **Vivado Simulator**. The testbench generates the master clock and monitors the `red`, `yellow`, and `green` output bits.

### ✅ Expected Output
1.  **Reset Phase**: All outputs are cleared, then `red` is asserted.
2.  **Cycle 1**: `red` → `green`
3.  **Cycle 2**: `green` → `yellow`
4.  **Cycle 3**: `yellow` → `red` (Cycle repeats)

This sequence simulates a standard cyclic traffic control system.