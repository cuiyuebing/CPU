`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 22:12:13
// Design Name: 
// Module Name: AE_basic
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


module AE_basic(
    input [3:0] F,
    input a,
    input b,
    output y
    );
wire [3:0] NF;
wire Na, Nb, a_or_b, a_or_Nb;

// get ~F, ~a, ~b , a+b, a+~b
not(Na, a);
not(Nb, b);
or(a_or_b, a, b);
or(a_or_Nb, a, Nb);

genvar i;
generate
  for (i=0;i<4;i=i+1)
    begin
      not(NF[i], F[i]);
    end
endgenerate

// Intermediate variable t
wire [1:0] t;
and(t[0], NF[3], NF[2], F[1], NF[0], b);
and(t[1], NF[3], F[2], F[1], NF[0], Nb);

// get y
or(y, t[0], t[1]);    
    
endmodule
