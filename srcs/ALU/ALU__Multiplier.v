`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/14 19:28:03
// Design Name: 
// Module Name: ALU_Multiplier
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


module ALU_Multiplier(
    input [15:0] A,
    input [15:0] B,
    output [31:0] Y
    );
wire [15:0] t1 [15:0];
wire [16:0] t2 [16:0];
wire [16:0] Cin [15:0];   

genvar i, j;
generate
  for (i=0;i<17;i=i+1)
  begin
    assign t2[0][i] = 1'b0;
  end
  for (i=0;i<16;i=i+1)
  begin
    assign Cin[i][0] = 1'b0;
    for (j=0;j<16;j=j+1)
      begin
        and(t1[i][j], A[j], B[i]);
        FA_basic uut(.Xi(t1[i][j]), .Yi(t2[i][j+1]), 
                     .Cin(Cin[i][j]), .Cout(Cin[i][j+1]), .Si(t2[i+1][j]));             
      end
    assign Y[i] = t2[i+1][0];
    assign t2[i+1][16] = Cin[i][16];
  end
  for (i=16;i<32;i=i+1)
    begin
      assign Y[i] = t2[16][i-15]; 
    end
endgenerate

endmodule
