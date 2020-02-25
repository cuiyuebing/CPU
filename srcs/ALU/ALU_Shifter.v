`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/17 19:24:20
// Design Name: 
// Module Name: ALU_Shifter
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


module ALU_Shifter(
        input [31:0] A,
        input [31:0] B,
        input [2:0] F,
        output [31:0] C
        );
        
        wire [31:0] C1;//????℅車??????
        wire [31:0] A2;//????﹞?℅??車??A
        wire [31:0] C2_i;//A2??????℅車??????
        wire [31:0] C2;//??C2_i??﹞?℅??車??????????????
        wire [31:0] s;//??????㊣那
        wire [31:0] ci;//????﹞?????????
        wire [31:0] C3_i;//??﹞?????????C2_i?車??????
        wire [31:0] C3;//????????????
        
        //????℅車
        left_shift U0(
            .A(A),
            .B(B),
            .C(C1)
            );
       //??????     
        genvar i;
        generate
        for(i=0;i<32;i=i+1)
        begin
            assign A2[i]=A[31-i];
        end
        endgenerate
        left_shift U1(
            .A(A2),
            .B(B),
            .C(C2_i),
            .s(s)
            );
    
         generate
         for(i=0;i<32;i=i+1)
           begin
              assign C2[i]=C2_i[31-i];
           end
         endgenerate
        //??℅???
        
        generate
        for(i=0;i<32;i=i+1)
        begin
            and(ci[i],A2[0],s[i]);      
        end
        endgenerate  
    
        or (C3_i[31],C2_i[31]);
        or (C3_i[30],C2_i[30],ci[31]);
        or (C3_i[29],C2_i[29],ci[31],ci[30]);
        or (C3_i[28],C2_i[28],ci[31],ci[30],ci[29]);
        or (C3_i[27],C2_i[27],ci[31],ci[30],ci[29],ci[28]);
        or (C3_i[26],C2_i[26],ci[31],ci[30],ci[29],ci[28],ci[27]);
        or (C3_i[25],C2_i[25],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26]);
        or (C3_i[24],C2_i[24],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25]);
        or (C3_i[23],C2_i[23],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24]);
        or (C3_i[22],C2_i[22],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23]);
        or (C3_i[21],C2_i[21],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22]);
        or (C3_i[20],C2_i[20],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21]);
        or (C3_i[19],C2_i[19],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20]);
        or (C3_i[18],C2_i[18],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19]);
        or (C3_i[17],C2_i[17],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18]);
        or (C3_i[16],C2_i[16],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17]);
        or (C3_i[15],C2_i[15],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16]);
        or (C3_i[14],C2_i[14],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15]);
        or (C3_i[13],C2_i[13],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14]);
        or (C3_i[12],C2_i[12],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13]);
        or (C3_i[11],C2_i[11],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12]);
        or (C3_i[10],C2_i[10],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11]);
        or (C3_i[9],C2_i[9],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10]);
        or (C3_i[8],C2_i[8],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9]);
        or (C3_i[7],C2_i[7],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8]);
        or (C3_i[6],C2_i[6],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8],ci[7]);
        or (C3_i[5],C2_i[5],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8],ci[7],ci[6]);
        or (C3_i[4],C2_i[4],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8],ci[7],ci[6],ci[5]);
        or (C3_i[3],C2_i[3],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8],ci[7],ci[6],ci[5],ci[4]);
        or (C3_i[2],C2_i[2],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8],ci[7],ci[6],ci[5],ci[4],ci[3]);
        or (C3_i[1],C2_i[1],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8],ci[7],ci[6],ci[5],ci[4],ci[3],ci[2]);
        or (C3_i[0],C2_i[0],ci[31],ci[30],ci[29],ci[28],ci[27],ci[26],ci[25],ci[24],ci[23],ci[22],ci[21],ci[20],ci[19],ci[18],ci[17],ci[16],ci[15],ci[14],ci[13],ci[12],ci[11],ci[10],ci[9],ci[8],ci[7],ci[6],ci[5],ci[4],ci[3],ci[2],ci[1]);
        
        generate
        for(i=0;i<32;i=i+1)
          begin
             assign C3[i]=C3_i[31-i];
          end
        endgenerate
        
        //?車?? ?﹞?“C 
        wire [31:0] C3C;
        wire [31:0] C2C;
        wire [31:0] C1C;
        generate
        for(i=0;i<32;i=i+1)
          begin
             and(C1C[i],F[0],C1[i]);
             and(C2C[i],F[1],C2[i]);
             and(C3C[i],F[2],C3[i]);
             or(C[i],C1C[i],C2C[i],C3C[i]);
          end
        endgenerate
 
    
    
endmodule
