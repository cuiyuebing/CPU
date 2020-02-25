`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 14:18:36
// Design Name: 
// Module Name: ALUDecoder
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


module ALUDecoder(
    input [2:0] ALUOp,
    input [5:0] funct,
    output reg [3:0] ALUcontrol
    );
   always@(*)
   begin
   ALUcontrol[3]=~ALUOp[2]&ALUOp[0]&funct[5]&~funct[4]&funct[3]&~funct[2]&funct[1]&~funct[0];
   ALUcontrol[2]=~ALUOp[2]&ALUOp[0]|~ALUOp[2] & ALUOp[1]&funct[5]&~funct[4]&~funct[3]&~funct[2]&funct[1]&~funct[0];
   ALUcontrol[1]=~ALUOp[2]&ALUOp[0]|~ALUOp[2] & ALUOp[1]&funct[5]&~funct[4]&~funct[2]&~funct[0]&~funct[3];
   ALUcontrol[0]=ALUOp[2]&~ALUOp[1]&ALUOp[0]|~ALUOp[2] & ALUOp[1]&funct[5]&~funct[4]&~funct[3]&funct[2]&~funct[1]&funct[0];
   end
endmodule
