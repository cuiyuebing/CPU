`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 21:26:59
// Design Name: 
// Module Name: LE
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


module LE(
    input [3:0] F,
    input [31:0] A,
    input [31:0] B,
    output [31:0] X
    );

genvar i;
generate
  for (i=0;i<32;i=i+1)
    begin
      LE_basic uut_LE_basic(.F(F), .a(A[i]), .b(B[i]), .x(X[i]));
    end
endgenerate
endmodule
