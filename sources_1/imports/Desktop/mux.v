`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 10:33:05 PM
// Design Name: 
// Module Name: led_mux
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


module led_mux(input clock, SW_15, SW_14, SW_13, input [12:0] pixel_index, output reg [15:0] pixel_data, input [15:0] led_light, input SW_12, SW_11);
wire [15:0] border_one;
wire [15:0] border_three;
wire [15:0] pixel_data_out;
border_mod_one(border_one, pixel_index, clock, led_light, SW_12, SW_11);
OLED_setting(pixel_index,pixel_data_out,clock, led_light, SW_12, SW_11);
border_mod_three(clock, border_three, pixel_index, led_light, SW_12, SW_11);
always @ (SW_15 or SW_14 or SW_13) // switch the border , close the whole color bar
begin
    if (SW_15==1)  // thin border
        begin
            pixel_data=border_one;
        end
    else if (SW_14==1) // thicker border
        begin
            pixel_data=border_three;
        end
    else if (SW_13==1) // close the color bar
        begin
            pixel_data={5'b00000, 6'b000000, 5'b00000};
        end
    else 
        begin
            pixel_data=pixel_data_out;
        end
end    
endmodule
