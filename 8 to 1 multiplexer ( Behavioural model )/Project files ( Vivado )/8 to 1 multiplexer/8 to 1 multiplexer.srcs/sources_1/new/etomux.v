`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2024 20:07:07
// Design Name: 
// Module Name: etomux
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


module etomux(a,s,q);
input [7:0]a;
input [2:0]s;
output q;
reg q;
always@(s)
begin
case(s)
3'b000 : q=a[0];
3'b001 : q=a[1];
3'b010 : q=a[2];
3'b011 : q=a[3];
3'b100 : q=a[4];
3'b101 : q=a[5];
3'b110 : q=a[6];
3'b111 : q=a[7];
endcase
end
endmodule
