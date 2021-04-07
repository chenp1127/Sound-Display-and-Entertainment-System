`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2019 10:27:10 AM
// Design Name: 
// Module Name: one_dff
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


module one_dff(input D, DFF_CLOCK, output reg Q = 0);  
 
    always @ (posedge DFF_CLOCK) begin         
    Q <= D;    
    end 
 
endmodule
