`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2019 10:22:38 AM
// Design Name: 
// Module Name: reset
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


module single_pulse_module(input centre_pb,input my_sp_clock,output my_sp);

wire dff_one_out, dff_two_out;

one_dff unit1(centre_pb, my_sp_clock, dff_one_out);
one_dff unit2(dff_one_out, my_sp_clock, dff_two_out);

assign my_sp = dff_one_out & ~dff_two_out;
endmodule
