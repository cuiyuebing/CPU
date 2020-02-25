`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/21 11:38:54
// Design Name: 
// Module Name: ALUSrcB
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


module ALUSrcB_mux(
    input [1:0] s,
    input [31:0] i1,
    input [31:0] i2,
    input [31:0] i3,
    input [31:0] i4,
    output reg [31:0] o
    );
    always@(*)
      begin
        case (s)
          2'b00: o = i1;
          2'b01: o = i2;
          2'b10: o = i3;
          2'b11: o = i4;
        endcase
      end
endmodule
