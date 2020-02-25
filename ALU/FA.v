`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 21:12:46
// Design Name: 
// Module Name: FA
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


module FA(input [31:0] x,
                [31:0] y,
                       c0,
          output [31:0] s 
    );
    wire [31:0] c;
   FA_basic uut(
             .Xi(x[0]),
             .Yi(y[0]),
             .Cin(c0),
             .Cout(c[1]),
             .Si(s[0]));
    genvar i;
    generate
      for (i=1;i<32;i=i+1)
        begin
        FA_basic uut(
          .Xi(x[i]),
          .Yi(y[i]),
          .Cin(c[i]),
          .Cout(c[i+1]),
          .Si(s[i]));
        end
      endgenerate
endmodule

