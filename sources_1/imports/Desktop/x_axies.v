`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2019 12:14:45 PM
// Design Name: 
// Module Name: x_axies
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


module x_axies(input [12:0] pixel_index, output reg [12:0] x, input clock); // actually u only need 7 bits for x 
always @ (posedge clock)
    begin
        x=pixel_index%96;
    end
endmodule
