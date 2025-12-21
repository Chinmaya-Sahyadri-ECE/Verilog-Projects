`timescale 1ns / 1ps

module muxf(a,b,c,d,s1,s0,y);
input a,b,c,d,s1,s0;
output y;
 
wire s1b,s0b;
wire w1,w2,w3,w4;
 
not a1(s1b, s1);
not a2(s0b, s0);
 
and a3(w1, s1b, s0b, a);
and a4(w2, s1b, s0, b);
and a5(w3, s1, s0b, c);
and a6(w4, s1, s0, d);
 
or a7(y, w1, w2, w3, w4);
 
endmodule
