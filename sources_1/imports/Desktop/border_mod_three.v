`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 10:39:26 PM
// Design Name: 
// Module Name: border_mod_three
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


module border_mod_three(input clock, output reg[15:0] border_three, input [12:0] pixel_index, input[15:0] led_light, input SW_12, SW_11);
    wire [12:0] x;
    wire [12:0] y;
    wire [15:0] pixel_data_out;
    x_axies(pixel_index, x, clock);
    y_axies(pixel_index, y, clock);
    OLED_setting(pixel_index, pixel_data_out, clock, led_light, SW_12, SW_11);
    always@(posedge clock)
    begin
                if (x>=0&&x<2)
                begin
                    if (SW_12==1)
                                begin
                                border_three={5'b11111, 6'b00000, 5'b00000};//red
                                end
                            else if (SW_11==1)
                                begin
                                border_three={5'b00000, 6'b00000, 5'b11111};//blue
                                end
                            else
                                begin
                                border_three={5'b11111, 6'b111111, 5'b11111};//white
                                end
                end
                else if (x==95)
                begin
                    if (SW_12==1)
                        begin
                            border_three={5'b11111, 6'b00000, 5'b00000};//red
                        end
                    else if (SW_11==1)
                        begin
                            border_three={5'b00000, 6'b00000, 5'b11111};//blue
                        end
                    else
                        begin
                            border_three={5'b11111, 6'b111111, 5'b11111};//white
                        end
                    end
                else if (x>=92 && x<95)
                begin
                    if (SW_12==1)
                        begin
                            border_three={5'b11111, 6'b00000, 5'b00000};//red
                        end
                    else if (SW_11==1)
                        begin
                            border_three={5'b00000, 6'b00000, 5'b11111};//blue
                        end
                    else
                        begin
                            border_three={5'b11111, 6'b111111, 5'b11111};//white
                        end
                end
                else if (y>=0 && y<=2)
                begin
                    if (SW_12==1)
                        begin
                            border_three={5'b11111, 6'b00000, 5'b00000};//red
                        end
                    else if (SW_11==1)
                        begin
                            border_three={5'b00000, 6'b00000, 5'b11111};//blue
                        end
                    else
                        begin
                            border_three={5'b11111, 6'b111111, 5'b11111};//white
                        end
                end
                else if (y>=61 && y<=63)
                begin
                    if (SW_12==1)
                        begin
                            border_three={5'b11111, 6'b00000, 5'b00000};//red
                        end
                    else if (SW_11==1)
                        begin
                            border_three={5'b00000, 6'b00000, 5'b11111};//blue
                        end
                    else
                        begin
                            border_three={5'b11111, 6'b111111, 5'b11111};//white
                        end
                end
                else
                begin
                    border_three=pixel_data_out;
                end
    end

endmodule
