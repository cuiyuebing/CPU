`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/11 14:50:07
// Design Name: 
// Module Name: Top
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


module Top(
    input [31:0] A,
    input [31:0] B,
    input [3:0] F,
    input [2:0] Shifter_F,
    output [31:0] Y
    );
    wire [31:0] Y0, Y1, Y2, Y3, Y4;
    wire [4:0] H;   //one-hot 
    wire [3:0] NH;
    wire [3:0] NF;
    wire [31:0] t [4:0];
    
    // get NF
    genvar i;
    generate
      for (i=0;i<4;i=i+1)
        begin
          not(NF[i], F[i]);
        end
    
    // get H
    and(H[0], NF[3], F[2], F[1], F[0]);
    and(H[1], F[3], NF[2], NF[1], NF[0]);
    and(H[2], F[3], NF[2], NF[1], F[0]);
    and(H[3], F[3], NF[2], F[1], NF[0]);
    not(NH[0], H[0]);
    not(NH[1], H[1]);
    not(NH[2], H[2]);
    not(NH[3], H[3]);
    and(H[4], NH[0], NH[1], NH[2], NH[3]);    
          
    /*
    generate
        case(F)
        
          4'b0000: ALU_AND uut(.A(A), .B(B), .Y(Y));
          4'b0001: ALU_OR uut(.A(A), .B(B), .Y(Y));
          4'b0010: ALU_Adder uut(.A(A), .B(B), .Y(Y));
          4'b0011: ALU_Multiplier uut(.A(A), .B(B), .Y(Y));
          4'b0100: ALU_NAND uut(.A(A), .B(B), .Y(Y));
          4'b0101: ALU_NOR uut(.A(A), .B(B), .Y(Y));
          4'b0110: ALU_Subtractor uut(.A(A), .B(B), .Y(Y));
          4'b0111: ALU_SLT uut(.A(A), .B(B), .Y(Y));
          4'b1000: ALU_LSL uut(.A(A), .B(B), .Y(Y));
          4'b1001: ALU_LSR uut(.A(A), .B(B), .Y(Y));
          4'b1010: ALU_ASR uut(.A(A), .B(B), .Y(Y));
          4'b1011: ALU_PrefixAdder uut(.A(A), .B(B), .Y(Y));
          4'b1100: ALU_AND uut(.A(A), .B(B), .Y(Y));
          4'b1101: ALU_AND uut(.A(A), .B(B), .Y(Y));
          4'b1110: ALU_AND uut(.A(A), .B(B), .Y(Y));
          4'b1111: ALU_AND uut(.A(A), .B(B), .Y(Y));
          */
       ALU_Multiplier uut1(.A(A[15:0]), .B(B[15:0]), .Y(Y0));
       ALU_SLT uut2(.a(A), .b(B), .Y(Y1));
       //ALU_PrefixAdder uut3(.A(A), .B(B), .Y(Y2));
       
       ALU_Shifter uut5(.F(Shifter_F), .A(A), .B(B), .C(Y3));
       ALU_Basic uu4(.F(F), .A(A), .B(B), .Y(Y4));
           
// sure output


  assign Y2 = 32'b0;
  for(i=0;i<32;i=i+1)
    begin
      and(t[0][i], Y0[i], H[0]);
      and(t[1][i], Y1[i], H[1]);
      and(t[2][i], Y2[i], H[2]);
      and(t[3][i], Y3[i], H[3]);
      and(t[4][i], Y4[i], H[4]);
      or(Y[i], t[0][i], t[1][i], t[2][i], t[3][i], t[4][i]);
    end
endgenerate
endmodule
