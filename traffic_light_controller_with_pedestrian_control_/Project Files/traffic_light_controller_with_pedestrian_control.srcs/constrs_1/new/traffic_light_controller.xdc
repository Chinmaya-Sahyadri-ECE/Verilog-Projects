# Clock constraint (100 MHz)
create_clock -name clk -period 10.000 [get_ports clk]

# Input constraints
set_input_delay 2.0 -clock clk [get_ports ped_button]
set_false_path -from [get_ports reset]

# Output constraints
set_output_delay 2.0 -clock clk [get_ports {red yellow green ped_walk}]