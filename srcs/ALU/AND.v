`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/17 19:33:37
// Design Name: 
// Module Name: AND
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

module AND_f(
input [31:0] a,
input [31:0] b,
output co
    );
    wire [31:0] c;
    wire [31:0] c_;
    
    xor(c_[0],a[0],b[0]);
    xor(c_[1],a[1],b[1]);
    xor(c_[2],a[2],b[2]);
    xor(c_[3],a[3],b[3]);
    xor(c_[4],a[4],b[4]);
    xor(c_[5],a[5],b[5]);
    xor(c_[6],a[6],b[6]);
    xor(c_[7],a[7],b[7]);
    xor(c_[8],a[8],b[8]);
    xor(c_[9],a[9],b[9]);
    xor(c_[10],a[10],b[10]);
    xor(c_[11],a[11],b[11]);
    xor(c_[12],a[12],b[12]);
    xor(c_[13],a[13],b[13]);
    xor(c_[14],a[14],b[14]);
    xor(c_[15],a[15],b[15]);
    xor(c_[16],a[16],b[16]);
    xor(c_[17],a[17],b[17]);
    xor(c_[18],a[18],b[18]);
    xor(c_[19],a[19],b[19]);
    xor(c_[20],a[20],b[20]);
    xor(c_[21],a[21],b[21]);
    xor(c_[22],a[22],b[22]);
    xor(c_[23],a[23],b[23]);
    xor(c_[24],a[24],b[24]);
    xor(c_[25],a[25],b[25]);
    xor(c_[26],a[26],b[26]);
    xor(c_[27],a[27],b[27]);
    xor(c_[28],a[28],b[28]);
    xor(c_[29],a[29],b[29]);
    xor(c_[30],a[30],b[30]);
    xor(c_[31],a[31],b[31]);
    
    not(c[0],c_[0]);
    not(c[1],c_[1]);
    not(c[2],c_[2]);
    not(c[3],c_[3]);
    not(c[4],c_[4]);
    not(c[5],c_[5]);
    not(c[6],c_[6]);
    not(c[7],c_[7]);
    not(c[8],c_[8]);
    not(c[9],c_[9]);
    not(c[10],c_[10]);
    not(c[11],c_[11]);
    not(c[12],c_[12]);
    not(c[13],c_[13]);
    not(c[14],c_[14]);
    not(c[15],c_[15]);
    not(c[16],c_[16]);
    not(c[17],c_[17]);
    not(c[18],c_[18]);
    not(c[19],c_[19]);
    not(c[20],c_[20]);
    not(c[21],c_[21]);
    not(c[22],c_[22]);
    not(c[23],c_[23]);
    not(c[24],c_[24]);
    not(c[25],c_[25]);
    not(c[26],c_[26]);
    not(c[27],c_[27]);
    not(c[28],c_[28]);
    not(c[29],c_[29]);
    not(c[30],c_[30]);
    not(c[31],c_[31]);
    
    and (co,c[0],c[1],c[2],c[3],c[4],c[5],c[6],c[7],c[8],c[9],c[10],c[11],c[12],c[13],c[14],c[15],c[16],c[17],c[18],c[19],c[20],c[21],c[22],c[23],c[24],c[25],c[26],c[27],c[28],c[29],c[30],c[31]);

endmodule

