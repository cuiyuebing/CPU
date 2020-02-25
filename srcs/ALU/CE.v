`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 22:15:36
// Design Name: 
// Module Name: CE
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


module CE(
    input [3:0] F,
    output Cin
    );

wire [3:0] NF;
// get ~F
genvar i;
generate
  for (i=0;i<4;i=i+1)
    begin
      not(NF[i], F[i]);
    end
endgenerate

// get Cin    
and(Cin, NF[3], F[2], F[1], NF[0]);

endmodule
