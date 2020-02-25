`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 21:43:37
// Design Name: 
// Module Name: LE_basic
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


module LE_basic(
    input [3:0] F,
    input a,
    input b,
    output x
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
wire [6:0] t;
and(t[0], NF[3], NF[2], NF[1], NF[0], a, b);
and(t[1], NF[3], NF[2], NF[1], F[0], a_or_b);
and(t[2], NF[3], NF[2], F[1], NF[0], a);
and(t[3], NF[3], NF[2], F[1], F[0], Na);
and(t[4], NF[3], F[2], NF[1], NF[0], a, Nb);
and(t[5], NF[3], F[2], NF[1], F[0], a_or_Nb);
and(t[6], NF[3], F[2], F[1], NF[0], a);

// get x
or(x, t[0], t[1], t[2], t[3], t[4], t[5], t[6]);

endmodule
