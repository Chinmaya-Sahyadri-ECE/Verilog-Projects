`timescale 1ns / 1ps

module alu_test();
reg En;
reg [2:0]opcode;
reg [31:0]A,B;
wire [31:0]result;
alu uut(En,opcode,A,B,result);
initial 
begin
A=32'd6; B=32'd5;
end
initial
begin
En = 1'b0;
#10 En=1'b1; opcode=3'b000;
#10 En=1'b1; opcode=3'b001;
#10 En=1'b1; opcode=3'b010;
#10 En=1'b1; opcode=3'b011;
#10 En=1'b1; opcode=3'b100;
#10 En=1'b1; opcode=3'b101;
#10 En=1'b1; opcode=3'b110;
#10 En=1'b1; opcode=3'b111;
#10 $finish;
end
endmodule
