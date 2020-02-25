`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/21 11:31:03
// Design Name: 
// Module Name: RegDst_mux
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


module RegDst_mux(
    input s,
    input [4:0] i1,
    input [4:0] i2,
    output reg [4:0] o
    );
    always@(*)
      begin
        case (s)
          1'b0: o = i1;
          1'b1: o = i2;
        endcase
      end
endmodule
