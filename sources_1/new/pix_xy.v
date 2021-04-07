`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2019 04:18:17 PM
// Design Name: 
// Module Name: pix_xy
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


module pix_xy(input [12:0] pixel_index, output[7:0] pos_x, [6:0] pos_y );

    assign pos_x = pixel_index % 96;
    assign pos_y = pixel_index / 96;
    


endmodule
