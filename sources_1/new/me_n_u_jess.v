`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2019 07:12:44 PM
// Design Name: 
// Module Name: me_n_u_jess
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

module me_n_u_jess(input clk_menu, clk_50h, clk_5hz, input [7:0] coordinate_x, input [6:0] coordinate_y, 
                   input [15:0] data_wave_notshaded,data_wave_shaded, data_bar_input ,data_pikachu_volume, data_pikachu_screensaver,pixel_data_screensaver,pixel_data_rain,
                   input switch_control_2, // to be sent to all the menu systems so that when SW is on, it is reserved for the sampling
                   input pb_left, pb_up, pb_right, pb_down, pb_centre,menu_switch, 
                   output reg [15:0] menu_color = 0, output reg [2:0] box_counter = 0);

reg [15:0] menu_selector [0:4];

   always@(posedge clk_50h) // clock same as single pulse clock
   begin
        if(switch_control_2 == 0)
            if(menu_switch == 1)
            begin
                if(pb_right == 1 && box_counter <=3) box_counter <= box_counter + 1;
                if(pb_left == 1 && box_counter >=1) box_counter <= box_counter - 1;
            end
   end
   
    always @(posedge clk_menu)
    begin
    menu_selector[0] <= 16'hAEDF;
    menu_selector[1] <= 16'hAEDF;
    menu_selector[2] <= 16'hAEDF;
    menu_selector[3] <= 16'hAEDF;
    menu_selector[4] <= 16'hAEDF;
    
   // menu_selector[box_counter] <= 16'b11111_000000_00000;
    if(clk_5hz == 1)
        menu_selector[box_counter] <= 16'hFAAE;
    else
        menu_selector[box_counter] <= 16'hAEDF;
   
    if(coordinate_y >=3 && coordinate_y <= 7) // square boxes
    begin
            if (coordinate_x >= 7 && coordinate_x <= 16) menu_color <= menu_selector[0];
            else if (coordinate_x >= 25 && coordinate_x <= 34) menu_color <= menu_selector[1];
            else if (coordinate_x >= 43 && coordinate_x <= 52) menu_color <= menu_selector[2];
            else if (coordinate_x >= 61 && coordinate_x <= 70) menu_color <= menu_selector[3];
            else if (coordinate_x >= 79 && coordinate_x <= 88) menu_color <= menu_selector[4];
            else 
                begin
                    menu_color <= 16'h10F2; //Dark Blue
                end         
    end
    
        else if(coordinate_y == 0 ||coordinate_y == 1 ||coordinate_y == 2 ||coordinate_y == 8 ||coordinate_y == 9 || coordinate_y == 10) menu_color <= 16'h10F2;
        // else if(coordinate_y == 11 || coordinate_y == 13) menu_color <= 16'b11100_000000_11100; menu bottom border
        
        else
        case(box_counter)
            3'b000 : menu_color <= data_wave_notshaded;
            3'b001 : menu_color <= data_wave_shaded;
            3'b010 : menu_color <= data_bar_input;
            3'b011 : menu_color <= pixel_data_rain;
            3'b100 : menu_color <= data_pikachu_volume;
            default: menu_color <= 0;
        endcase
    end
endmodule
