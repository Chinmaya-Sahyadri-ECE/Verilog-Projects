`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2024 20:12:48
// Design Name: 
// Module Name: etomux_test
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


module etomux_test();
reg [7:0]a;
reg [2:0]s;
wire q;
etomux uut(a,s,q);
initial
a=8'b01101111;
initial
begin
s = 3'b000; #10
s = 3'b001; #10
s = 3'b010; #10
s = 3'b011; #10
s = 3'b100; #10
s = 3'b101; #10
s = 3'b110; #10
s = 3'b111; #10
$finish;
end
endmodule
