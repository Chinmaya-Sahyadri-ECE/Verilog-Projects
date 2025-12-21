`timescale 1ns / 1ps

module tb_traffic_light_controller;

    reg clk;
    reg reset;
    wire red, yellow, green;

    traffic_light_controller dut(
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #10 reset = 0;
        #100 $stop;
    end

endmodule

