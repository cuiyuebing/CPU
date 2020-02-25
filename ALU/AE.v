`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 22:10:23
// Design Name: 
// Module Name: AE
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


module AE(
    input [3:0] F,
    input [31:0] A,
    input [31:0] B,
    output [31:0] Y
    );
genvar i;
    generate
      for (i=0;i<32;i=i+1)
        begin
          AE_basic uut_AE_basic(.F(F), .a(A[i]), .b(B[i]), .y(Y[i]));
        end
    endgenerate
endmodule
