`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2019 09:58:41 AM
// Design Name: 
// Module Name: clk_oled
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


module clk_divider(input CLOCK ,[31:0] my_m_value, output reg clk_output=0);
  reg[31:0] count=0;
  always @ (posedge CLOCK)
  begin
     count<=(count == my_m_value)? 0 :count + 1;
     clk_output <= (count==0)?~clk_output:clk_output;
  end
endmodule
