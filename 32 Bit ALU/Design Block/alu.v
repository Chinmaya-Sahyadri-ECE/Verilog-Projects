`timescale 1ns / 1ps

module alu(En,opcode,A,B,result);
input En;
input [2:0]opcode;
input [31:0]A,B;
output reg[31:0]result;
always@(opcode)
begin 
if (En==0)
result = 32'd0;
else
case(opcode)
3'b000:result=A+B;
3'b001:result=A-B; 
3'b010:result=A+1;
3'b011:result=A-1;
3'b100:result=A;
3'b101:result=~A;
3'b110:result=A||B;
3'b111:result=A&&B;
endcase
end
endmodule
