`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2019 04:12:52 PM
// Design Name: 
// Module Name: wave_one
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


module wave_one(input [11:0] mic_in, input clk, input clk_choice,clk_50h, sp_up, sp_down,pause_switch, input [12:0] pixel_index, output reg [15:0] color = 0);
    
    wire [7:0]coordinate_x; 
    wire [6:0]coordinate_y;
    
    reg [6:0] position_y;
    reg [11:0] mic_in_history[95:0];
    reg [7:0] mic_in_index = 0;
    
    reg [2:0] rainbow_counter = 0;
    
    always@(posedge clk_choice) //20khz // updating the array
    begin
        if(pause_switch == 0)
        begin
            mic_in_history[mic_in_index] <= mic_in;
            mic_in_index <= (mic_in_index == 95) ? 0 : mic_in_index + 1;
        end
    end
    
    pix_xy unit_convertxy (pixel_index, coordinate_x, coordinate_y);
    
    always@(posedge clk)  //12.5mhz , decidcing where to place the rainbow and display color
        begin 
            position_y <= 64 - 15 - ((mic_in_history[coordinate_x] / 128)) ; 
            
                  if ((coordinate_y == position_y) && rainbow_counter >= 0) // coordinate_y : indicates the pixel being focused on.
                    color <= 16'b11111_000000_00000; //red
                  else if ((coordinate_y == (position_y + 1)) && rainbow_counter >= 1)
                    color <= 16'b11111_000000_00000;  //red
                  else if ((coordinate_y == (position_y + 4)) && rainbow_counter >= 2)
                    color <= 16'hFC40; //orange
                  else if ((coordinate_y == (position_y + 7)) && rainbow_counter >= 3)
                    color <= 16'hFFC0; //yellow
                  else if ((coordinate_y == (position_y + 10)) && rainbow_counter >= 4)
                    color <= 16'h17E0; //green
                  else if ((coordinate_y == (position_y + 13)) && rainbow_counter >= 5)
                    color <= 16'h019F; //blue
                  else if ((coordinate_y == (position_y + 16)) && rainbow_counter >= 6)
                    color <= 16'hC47E; //indigo
                  else if ((coordinate_y == (position_y + 19)) && rainbow_counter >= 7)
                    color <= 16'hA83F; //violet
                  else
                    color <= 0; 
      
        end
        
    always@(posedge clk_50h) // show more waveform orange , yellow,,...
    begin
        if(sp_down == 1)
        rainbow_counter <= rainbow_counter + 1;
        
        if(sp_up == 1)
        rainbow_counter <= rainbow_counter - 1;
    end
       

endmodule
