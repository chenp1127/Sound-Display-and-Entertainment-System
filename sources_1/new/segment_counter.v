`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2019 08:12:58 PM
// Design Name: 
// Module Name: segment_counter
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


module my_segment_counter(input clock, output reg[1:0] my_counter_output = 2'b00);

    always@(posedge clock)
    begin
        my_counter_output <= (my_counter_output == 3) ? 0: my_counter_output + 1;
    end
endmodule
