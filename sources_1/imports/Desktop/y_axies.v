`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2019 12:15:32 PM
// Design Name: 
// Module Name: y_axies
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


module y_axies(input [12:0] pixel_index, output reg [12:0]y, input clock);
always @ (posedge clock)
    begin
        y=pixel_index/96;
    end
endmodule
