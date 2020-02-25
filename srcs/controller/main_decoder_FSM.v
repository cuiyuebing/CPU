`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 16:37:50
// Design Name: 
// Module Name: main_decoder_FSM
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


module main_decoder_FSM(
    input [5:0] Opcode,
    input clr,
    input clk,
    output reg MemtoReg,
           reg RegDst,
           reg IorD,
           reg [1:0] PCSrc,
           reg [1:0] ALUSrcB,
           reg ALUSrcA,
           reg IRWrite,
           reg MemWrite,
           reg PCWrite,
           reg Branch,
           reg RegWrite,
           reg [2:0] ALUOp    
    );
reg [3:0] current_state, next_state;
parameter S0 = 4'b0000, S1=4'b0001, S2=4'b0010, S3=4'b0011,S4=4'b0100, S5=4'b0101, S6=4'b0110, 
            S7=4'b0111, S8=4'b1000, S9=4'b1001, S10=4'b1010, S11=4'b1011, S12=4'b1100, S13=4'b1101;
parameter lw = 6'b100011, sw = 6'b101011, r_type = 6'b000000, beq = 6'b000100, addi = 6'b001000, j = 6'b000010, andi = 6'b001100, ori = 6'b001101; 

always @(posedge clk or posedge clr)
  begin
    if (clr == 1'b1)
      current_state <= S0;
    else
      current_state <= next_state;
  end
  
always @(*)
begin
   case(current_state)
     S0: next_state <= S1;
     S1: case (Opcode)
           lw: next_state <= S2;
           sw: next_state <= S2;
           r_type: next_state <= S6;
           beq: next_state <= S8;
           addi: next_state <= S9;
           j: next_state <= S11;
           andi: next_state <= S12;
           ori: next_state <= S13;
         endcase
     S2: if(Opcode == lw)
           next_state <= S3;
         else if(Opcode == sw)
           next_state <= S5;
     S3: next_state <= S4;
     S4: next_state <= S0;
     S5: next_state <= S0;
     S6: next_state <= S7;
     S7: next_state <= S0;
     S8: next_state <= S0;
     S9: next_state <= S10;
     S10: next_state <= S0;
     S11: next_state <= S0;
     S12: next_state <= S10;
     S13: next_state <= S10;
   endcase
 end    

always @(*)
  begin
    case (current_state)
      S0: begin MemtoReg=0; IorD = 1'b0;MemWrite=1'b0;IRWrite=1'b0;PCWrite=1'b0;Branch=1'b0; RegDst=1'b0;PCSrc=2'b00;ALUOp=3'b000;ALUSrcB=2'b01;ALUSrcA=1'b0;RegWrite=1'b0; end
      S1: ALUSrcB=2'b11;
      S2: begin ALUSrcA=1; ALUSrcB=2'b10; end
      S3: begin IorD=1; ALUSrcA=0; ALUSrcB=2'b00; end
      S4: begin RegDst=0;MemtoReg=1;RegWrite=1; IorD=0; end
      S5: begin IorD=1;MemWrite=1; ALUSrcA=0; ALUSrcB=2'b00; end
      S6: begin ALUSrcA=1;ALUSrcB=2'b00;ALUOp=3'b010; end
      S7: begin RegDst=1;MemtoReg=0;RegWrite=1; ALUSrcA=0;ALUSrcB=2'b00;ALUOp=3'b000; end
      S8: begin ALUSrcA=1;ALUSrcB=2'b00;ALUOp=3'b001;PCSrc=2'b01;Branch=1; end
      S9: begin ALUSrcA=1;ALUSrcB=2'b10;ALUOp=3'b000; end
      S10: begin RegDst=0;MemtoReg=0;RegWrite=1; ALUSrcA=0;ALUSrcB=2'b00;ALUOp=3'b000; end
      S11: begin PCSrc=2'b10;PCWrite=1;ALUSrcB=2'b00; end
      S12: begin ALUSrcA=1;ALUSrcB=2'b10;ALUOp=3'b100; end
      S13: begin ALUSrcA=1;ALUSrcB=2'b10;ALUOp=3'b101; end
    endcase
  end
    
endmodule
