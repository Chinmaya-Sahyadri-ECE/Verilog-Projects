`timescale 1ns / 1ps

module tb_up_counter_4bit;

    reg clk;
    reg reset;
    wire [3:0] count;

    up_counter_4bit dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;

        #10 reset = 0;
        #200 $stop;
    end

endmodule

