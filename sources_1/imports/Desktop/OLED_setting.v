`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2019 10:11:31 AM
// Design Name: 
// Module Name: OLED_setting
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

// Set position of the oled bar and the color of the oled bar. 

module OLED_setting(input [12:0] pixel_index,output reg [15:0] pixel_data_out, input clock, input [15:0] led_light, input SW_12, SW_11);
    wire [12:0] x;
    wire [12:0] y;
    x_axies(pixel_index, x, clock); // formula convert 12 bit to x value
    y_axies(pixel_index, y, clock); //formula convert 12 bit to y value
    always@(posedge clock)
    begin
    if ((x > 40 && x <56) && (y>=8 && y<=9)&& (led_light >= 16'b1111_1111_1111_1111))
        begin
        if (SW_12==1)
            begin
            pixel_data_out={5'b00010, 6'b111101, 5'b10000};//light green
            end
        else if (SW_11==1)
            begin
            pixel_data_out={5'b11111, 6'b110000, 5'b11100};//pink
            end
        else
            begin
            pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        end
    else if ((x > 40 && x <56) && (y>=11 && y<=12)&& (led_light >= 16'b0111_1111_1111_1111))
        begin
            if (SW_12==1)
                    begin
                    pixel_data_out={5'b00010, 6'b111101, 5'b10000};//light green
                    end
                else if (SW_11==1)
                    begin
                    pixel_data_out={5'b11111, 6'b110000, 5'b11100};
                    end
                else
                    begin
                    pixel_data_out={5'b11111, 6'b000000, 5'b00000};
                    end
        end
    else if ((x > 40 && x <56) && (y>=14 && y<=15)&& (led_light>=16'b0011_1111_1111_1111))
        begin
            if (SW_12==1)
                    begin
                    pixel_data_out={5'b00010, 6'b111101, 5'b10000};//light green
                    end
                else if (SW_11==1)
                    begin
                    pixel_data_out={5'b11111, 6'b110000, 5'b11100};
                    end
                else
                    begin
                    pixel_data_out={5'b11111, 6'b000000, 5'b00000};
                    end
        end
    else if ((x > 40 && x <56) && (y>=17 && y<=18)&& (led_light >= 16'b0001_1111_1111_1111))
        begin
            if (SW_12==1)
                    begin
                    pixel_data_out={5'b00010, 6'b111101, 5'b10000};//light green
                    end
                else if (SW_11==1)
                    begin
                    pixel_data_out={5'b11111, 6'b110000, 5'b11100};
                    end
                else
                    begin
                    pixel_data_out={5'b11111, 6'b000000, 5'b00000};
                    end
        end
    else if ((x > 40 && x <56) && (y>=20 && y<=21)&& (led_light >=16'b0000_1111_1111_1111))
        begin
            if (SW_12==1)
                    begin
                    pixel_data_out={5'b00010, 6'b111101, 5'b10000};//light green
                    end
                else if (SW_11==1)
                    begin
                    pixel_data_out={5'b11111, 6'b110000, 5'b11100};//pink
                    end
                else
                    begin
                    pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                    end
        end
    else if ((x > 40 && x <56) && (y>=23 && y<=24)&&(led_light >=16'b0000_0111_1111_1111))
        begin
            if (SW_12==1)
            begin
                pixel_data_out={5'b11110, 6'b011000, 5'b00010};//orange
            end
            else if (SW_11==1)
            begin
                pixel_data_out={5'b00010, 6'b111101, 5'b10101};//light green
            end
            else
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        end
    else if ((x > 40 && x <56) && (y>=26 && y<=27)&& (led_light>=16'b0000_0011_1111_1111))
        begin
            if (SW_12==1)
                    begin
                        pixel_data_out={5'b11110, 6'b011000, 5'b00010};//orange
                    end
                    else if (SW_11==1)
                    begin
                        pixel_data_out={5'b00010, 6'b111101, 5'b10101};//light green
                    end
                    else
                    begin
                        pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                    end
        end
    else if ((x > 40 && x <56) && (y>=29 && y<=30)&&(led_light>=16'b0000_0001_1111_1111))
        begin
            if (SW_12==1)
                    begin
                        pixel_data_out={5'b11110, 6'b011000, 5'b00010};//orange
                    end
                    else if (SW_11==1)
                    begin
                        pixel_data_out={5'b00010, 6'b111101, 5'b10101};//light green
                    end
                    else
                    begin
                        pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                    end
        end
    else if ((x > 40 && x <56) && (y>=32 && y<=33)&&(led_light>=16'b0000_0000_1111_1111))
        begin
            if (SW_12==1)
                    begin
                        pixel_data_out={5'b11110, 6'b011000, 5'b00010};//orange
                    end
                    else if (SW_11==1)
                    begin
                        pixel_data_out={5'b00010, 6'b111101, 5'b10101};//light green
                    end
                    else
                    begin
                        pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                    end
        end
    else if ((x > 40 && x <56) && (y>=35 && y<=36)&&(led_light>=16'b0000_0000_0111_1111))
        begin
            if (SW_12==1)
                    begin
                        pixel_data_out={5'b11110, 6'b011000, 5'b00010};//orange
                    end
                    else if (SW_11==1)
                    begin
                        pixel_data_out={5'b00010, 6'b111101, 5'b10101};//light green
                    end
                    else
                    begin
                        pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                    end
        end
    else if ((x > 40 && x <56) && (y>=38 && y<=39)&&(led_light>=16'b0000_0000_0011_1111))//green
        begin
        if (SW_12==1)
            begin
            pixel_data_out={5'b11110, 6'b000100, 5'b11101};//purple
            end
        else if (SW_11==1)
            begin
            pixel_data_out={5'b11110, 6'b001100, 5'b00000};//light red
            end
        else
            begin
            pixel_data_out={5'b00000, 6'b111111, 5'b00000};//green
            end
        end
    else if ((x > 40 && x <56) && (y>=41 && y<=42)&&(led_light>=16'b0000_0000_0001_1111))
        begin
             if (SW_12==1)
                   begin
                   pixel_data_out={5'b11110, 6'b000100, 5'b11101};//purple
                   end
               else if (SW_11==1)
                   begin
                   pixel_data_out={5'b11110, 6'b001100, 5'b00000};//light red
                   end
               else
                   begin
                   pixel_data_out={5'b00000, 6'b111111, 5'b00000};//green
                   end
        end
    else if ((x > 40 && x <56) && (y>=44 && y<=45)&&(led_light>=16'b0000_0000_0000_1111))
        begin
             if (SW_12==1)
                   begin
                   pixel_data_out={5'b11110, 6'b000100, 5'b11101};//purple
                   end
               else if (SW_11==1)
                   begin
                   pixel_data_out={5'b11110, 6'b001100, 5'b00000};//light red
                   end
               else
                   begin
                   pixel_data_out={5'b00000, 6'b111111, 5'b00000};//green
                   end
        end
    else if ((x > 40 && x <56) && (y>=47 && y<=48)&&(led_light >=16'b0000_0000_0000_0111))
        begin
             if (SW_12==1)
                   begin
                   pixel_data_out={5'b11110, 6'b000100, 5'b11101};//purple
                   end
               else if (SW_11==1)
                   begin
                   pixel_data_out={5'b11110, 6'b001100, 5'b00000};//light red
                   end
               else
                   begin
                   pixel_data_out={5'b00000, 6'b111111, 5'b00000};//green
                   end
        end
    else if ((x > 40 && x <56) && (y>=50 && y<=51)&&(led_light>=16'b0000_0000_0000_0011))
        begin
             if (SW_12==1)
                   begin
                   pixel_data_out={5'b11110, 6'b000100, 5'b11101};//purple
                   end
               else if (SW_11==1)
                   begin
                   pixel_data_out={5'b11110, 6'b001100, 5'b00000};//light red
                   end
               else
                   begin
                   pixel_data_out={5'b00000, 6'b111111, 5'b00000};//green
                   end
        end
    else if ((x > 40 && x <56) && (y>=53 && y<=54) && (led_light>=16'b0000_0000_0000_0001))
        begin
             if (SW_12==1)
                   begin
                   pixel_data_out={5'b11110, 6'b000100, 5'b11101};//purple
                   end
               else if (SW_11==1)
                   begin
                   pixel_data_out={5'b11110, 6'b001100, 5'b00000};//light red
                   end
               else
                   begin
                   pixel_data_out={5'b00000, 6'b111111, 5'b00000};//green
                   end
        end
    else
        begin 
            if (SW_12==1)
            begin
                pixel_data_out={5'b11111, 6'b101100, 5'b11001};//pink
            end
            else if (SW_11==1)
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b11111};//white
            end
            else
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        end      
    end


endmodule
