`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 22:32:18
// Design Name: 
// Module Name: FA_basic
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


module FA_basic (
    input Cin, Xi, Yi,
    output Cout, Si
    );
    wire Pi, Ni, Gi, Mi;
    xor(Pi,Xi,Yi);
    xor(Si,Cin,Pi);
    and(Ni,Pi,Cin);
    and(Mi,Xi,Yi);
    or(Cout,Mi,Ni);
endmodule
