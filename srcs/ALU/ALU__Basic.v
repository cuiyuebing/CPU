`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 21:33:32
// Design Name: 
// Module Name: ALU__Basic
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


module ALU_Basic(    
    input [3:0] F,
    input [31:0] A,
    input [31:0] B,
    output [31:0] Y
    );
    wire Cin;
    wire [31:0] W, Z;
    LE uut1 (.F(F), .A(A), .B(B), .X(W));
    AE uut2 (.F(F), .A(A), .B(B), .Y(Z));
    CE uut3 (.F(F), .Cin(Cin));
    FA uut4 (.x(W), .y(Z), .c0(Cin), .s(Y));
endmodule
