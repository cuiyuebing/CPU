`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/17 19:43:17
// Design Name: 
// Module Name: ALU_SLT
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


module ALU_SLT(
    input [31:0] a,
    input [31:0] b,
    output [31:0] Y
    );
    wire equal, greater;
    wire nequal, ngreater;
    wire m;
    wire [31:0] g,e;
    not(m,a[31]);
    and(g[31],a[31],m);
    xnor(e[31],a[31],b[31]);
    genvar i;
    generate
        for (i=30;i>-1;i=i-1)
            begin
                one_bit_comparator uut(
                .gin(g[i+1]),
                .ein(e[i+1]),
                .xin(a[i]),
                .yin(b[i]),
                .gout(g[i]),
                .eout(e[i]));
            end
    endgenerate
    assign equal=e[0];
    assign greater=g[0];
    for (i=3; i<32; i=i+1)
      begin
        assign Y[i] = 1'b0;
      end
    not(nequal, equal);
    not(ngreater, greater);
    and(Y[0], equal, ngreater);
    and(Y[1], nequal, greater);
    and(Y[2], nequal, ngreater);
endmodule