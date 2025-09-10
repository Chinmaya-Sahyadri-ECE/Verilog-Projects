`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 16:12:42
// Design Name: 
// Module Name: muxf_test
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


module muxf_test();
reg a,b,c,d,s1,s0;
wire y;
muxf uut(a,b,c,d,s1,s0,y);
initial
begin
a=1'b0; b=1'b1; c=1'b0; d=1'b1;
end
 
initial
begin
s1=1'b0; s0=1'b0; #10
s1=1'b0; s0=1'b1; #10
s1=1'b1; s0=1'b0; #10
s1=1'b1; s0=1'b1; #10
$finish;
end 
endmodule
