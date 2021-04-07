`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2019 03:38:51 PM
// Design Name: 
// Module Name: white_border
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


module border_mod_one(output reg[15:0] border_one, input [12:0] pixel_index, input clock, input [15:0] led_light, input SW_12, SW_11);
    wire [12:0] x;
    wire [12:0] y;
    wire [15:0] pixel_data_out;

    x_axies(pixel_index, x, clock);
    y_axies(pixel_index, y, clock);
    OLED_setting(pixel_index, pixel_data_out, clock, led_light, SW_12, SW_11);
    
    always@(posedge clock)
    begin
//            if (x==95)
//            begin
            if ((SW_12==1) && (x==95))
                begin
                border_one={5'b11111, 6'b00000, 5'b00000};//red
                end
            else if ((SW_11==1)&&(x==95))
                begin
                border_one={5'b00000, 6'b00000, 5'b11111};
                end
            else if (x==95)
                begin
                border_one={5'b11111, 6'b111111, 5'b11111};
                end
//            end
//            else if (x==94)
//            begin
               else if ((SW_12==1)&&(x==94))
                            begin
                            border_one={5'b11111, 6'b00000, 5'b00000};//red
                            end
                        else if ((SW_11==1)&&(x==94))
                            begin
                            border_one={5'b00000, 6'b00000, 5'b11111};
                            end
                        else if (x==94)
                            begin
                            border_one={5'b11111, 6'b111111, 5'b11111};
                            end
//            end
//            else if (y==0)
//            begin
                else if ((SW_12==1)&&(y==0))
                            begin
                            border_one={5'b11111, 6'b00000, 5'b00000};//red
                            end
                        else if ((SW_11==1)&&(y==0))
                            begin
                            border_one={5'b00000, 6'b00000, 5'b11111};
                            end
                        else if (y==0)
                            begin
                            border_one={5'b11111, 6'b111111, 5'b11111};
                            end
//            end
//            else if (y==63)
//            begin
                else if ((SW_12==1)&&(y==63))
                            begin
                            border_one={5'b11111, 6'b00000, 5'b00000};//red
                            end
                        else if ((SW_11==1)&&(y==63))
                            begin
                            border_one={5'b00000, 6'b00000, 5'b11111};
                            end
                        else if (y==63)
                            begin
                            border_one={5'b11111, 6'b111111, 5'b11111};
                            end
//            end
            else 
            begin
                border_one=pixel_data_out;
            end
           
     end
endmodule
