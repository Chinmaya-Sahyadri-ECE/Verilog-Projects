`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2026 21:58:09
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller (
    input  clk,
    input  reset,
    input  ped_button,

    output reg red,
    output reg yellow,
    output reg green,
    output reg ped_walk
);

    reg [1:0] state, next_state;

    parameter RED        = 2'b00;
    parameter GREEN      = 2'b01;
    parameter YELLOW     = 2'b10;
    parameter PED_GREEN  = 2'b11;

    parameter GREEN_TIME  = 10;
    parameter YELLOW_TIME = 3;
    parameter PED_TIME    = 5;

    reg [3:0] timer;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= RED;
        else
            state <= next_state;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            timer <= 0;
        else if (state != next_state)
            timer <= 0;
        else
            timer <= timer + 1;
    end

    always @(*) begin
        next_state = state;

        case (state)

            RED: begin
                next_state = GREEN;
            end

            GREEN: begin
                if (ped_button || timer >= GREEN_TIME-1)
                    next_state = YELLOW;
            end

            YELLOW: begin
                if (timer >= YELLOW_TIME-1)
                    next_state = PED_GREEN;
            end

            PED_GREEN: begin
                if (timer >= PED_TIME-1)
                    next_state = RED;
            end

            default: next_state = RED;
        endcase
    end

    always @(*) begin
        red      = 0;
        yellow   = 0;
        green    = 0;
        ped_walk = 0;

        case (state)
            RED:        red = 1;
            GREEN:      green = 1;
            YELLOW:     yellow = 1;
            PED_GREEN:  ped_walk = 1;
        endcase
    end

endmodule

