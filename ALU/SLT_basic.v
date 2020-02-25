`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/17 19:46:50
// Design Name: 
// Module Name: SLT_basic
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


module one_bit_comparator(
    input gin,
    input ein,
    input xin,
    input yin,
    output gout,
    output eout
    );
    wire l1,l2,l3,l4,l5,l6;
    not (l1,xin);
    not (l2,yin);
    and (l3,ein,xin,l2);
    or (gout,gin,l3);
    xnor (l4,xin,yin);
    and(l5,ein,l4);
    and(l6,gin,ein);
    or(eout,l6,l5);
endmodule