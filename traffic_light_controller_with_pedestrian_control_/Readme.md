# FSM-Based Traffic Light Controller (Verilog HDL)

## Overview
This project implements a **Finite State Machine (FSM)–based traffic light controller** with **pedestrian crossing support** using **Verilog HDL**. The design is fully synchronous, parameterized for easy timing changes, and verified using a self-checking testbench. The project targets FPGA implementation and includes simulation waveforms, synthesized schematic, timing, and utilization reports generated using **Xilinx Vivado**.

The controller manages vehicle signals (**RED, YELLOW, GREEN**) and a pedestrian **WALK** signal based on fixed time intervals and a pedestrian request button.

---

## Key Features
- FSM-based control logic (Moore-style behavior)
- Pedestrian request handling via `ped_button`
- Parameterized timing values (easy scalability)
- Synchronous design with asynchronous reset
- Clean separation of:
  - State register
  - Timer logic
  - Next-state logic
  - Output logic
- Fully simulated and synthesized design

---

## FSM Description

### State Transition Diagram (Conceptual)

```
                 +----------------+
                 |                |
                 |     RESET      |
                 |                |
                 +--------+-------+
                          |
                          v
                       +------+        ped_button=1
                       | RED  |----------------------+
                       +--+---+                      |
                          |                          v
             timer expiry |                    +-------------+
                          v                    | PED_GREEN   |
                      +-------+                | (ped_walk)  |
                      | GREEN |                +------+------+ 
                      +---+---+                       |
                          |                           | timer expiry
             timer expiry |                           v
                          v                        +------+
                       +-------+                   | RED  |
                       | YELLOW|                   +------+
                       +---+---+
                           |
              timer expiry |
                           v
                        +------+
                        | RED  |
                        +------+
```

**Legend:**
- Solid arrows indicate normal FSM transitions
- `timer expiry` means the programmed state time has elapsed
- `ped_button=1` triggers pedestrian crossing from RED state only

---


### States
| State Name   | Description |
|-------------|-------------|
| `RED`        | Vehicles stopped |
| `GREEN`      | Vehicles allowed to move |
| `YELLOW`     | Transition state before RED |
| `PED_GREEN`  | Pedestrian crossing enabled |

### State Transitions
- **RED → GREEN** after timer expiry
- **GREEN → YELLOW** after `GREEN_TIME`
- **YELLOW → RED** after `YELLOW_TIME`
- **RED → PED_GREEN** if `ped_button` is asserted
- **PED_GREEN → RED** after `PED_TIME`

> This design models a **single-road intersection** with a pedestrian crossing, making it ideal for learning FSM-based control systems.

---

## Timing Parameters
The design uses a clock-based counter for timing control. These parameters can be easily modified in the RTL:

```verilog
parameter GREEN_TIME  = 10;
parameter YELLOW_TIME = 3;
parameter PED_TIME    = 5;
```

> Each value represents the number of **clock cycles** the system remains in that state.

---

## File Structure
```
├── traffic_light_controller.v      # RTL design (FSM + timer)
├── tb_traffic_light_controller.v   # Testbench for simulation
├── traffic_light_controller.xdc    # FPGA constraints file
├── waveform.png                    # Simulation waveform snapshot
├── final_lut_schematic.png         # Synthesized RTL schematic
├── timing_summary.rpt              # Timing analysis report
├── utilization.rpt                 # FPGA resource utilization
└── README.md                       # Project documentation
```

---

## Simulation
- Tool: **Vivado Simulator (xsim)**
- Clock-driven testbench
- Pedestrian button asserted at specific time windows
- Outputs verified against expected FSM behavior

### Observed Signals
- `red`, `yellow`, `green` switch according to FSM rules
- `ped_walk` asserted only during `PED_GREEN` state
- Timer-driven transitions verified in waveform

Refer to **`waveform.png`** for detailed timing behavior.

---

## Synthesis & Implementation
- Target FPGA: **Xilinx Artix-7 (7a35t-cpg236)**
- Design Style: Fully synchronous
- No latches inferred
- Efficient LUT and FF utilization

Refer to:
- **`final_lut_schematic.png`** for RTL schematic
- **`utilization.rpt`** for resource usage details

---

## Timing Analysis
- Timing constraints met successfully
- No setup or hold violations
- Suitable for further frequency scaling

See **`timing_summary.rpt`** for detailed timing results.

---

## How to Run
### Simulation
1. Open Vivado
2. Add RTL and testbench files
3. Set `tb_traffic_light_controller.v` as top
4. Run behavioral simulation

### Synthesis
1. Set `traffic_light_controller.v` as top module
2. Add `traffic_light_controller.xdc`
3. Run synthesis and implementation

---

## Applications
- Academic FSM and RTL design projects
- FPGA-based control systems
- Resume-ready RTL/FPGA demonstration project
- Base model for multi-road traffic controllers

---

## Future Enhancements
- Multi-road / 4-way intersection support
- Emergency vehicle priority handling
- Debounced pedestrian button logic
- Real-time clock scaling using clock dividers

---

## Author
**Chinmaya Ganapathi K**  
Electronics & Communication Engineering  
RTL Design | FPGA | Verilog HDL

---

## License
This project is intended for **educational and academic use**. You are free to modify and extend it for learning and research purposes.

