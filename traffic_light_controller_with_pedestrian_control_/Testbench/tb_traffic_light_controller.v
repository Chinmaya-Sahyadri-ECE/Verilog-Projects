`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 21:58:32
// Design Name: 
// Module Name: tb_traffic_light_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_traffic_light;

    reg clk;
    reg reset;
    reg ped_button;
    wire red, yellow, green, ped_walk;

    traffic_light_controller dut (
        .clk(clk),
        .reset(reset),
        .ped_button(ped_button),
        .red(red),
        .yellow(yellow),
        .green(green),
        .ped_walk(ped_walk)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        ped_button = 0;

        #10 reset = 0;

        #40 ped_button = 1;
        #10 ped_button = 0;
        
        #120 ped_button = 1;
        #10  ped_button = 0;

        #100 $stop;
    end

endmodule
