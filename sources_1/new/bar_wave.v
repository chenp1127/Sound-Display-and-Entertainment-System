`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2019 06:22:44 PM
// Design Name: 
// Module Name: bar_wave
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


module bar_wave(input faster_clk,input clk_20khz, input clk_50hz, input [7:0] coordinate_x, input [6:0] coordinate_y, input [5:0] volume_level , input pb_left, pb_centre, pb_right, pb_down, pb_up,input menu_switch, input SW_2, pause_switch, output reg [15:0] volume_color = 0, input [19:0] selected_count );

reg [5:0] volume_history[120:0]; // to be safe because volume_history of 105 that index exist
reg [7:0] volume_index = 0; // 8 bits is required to store until 95
reg [7:0] bar_space = 1; // bar_space = 1 means no spacing between the bars
reg [3:0] bar_thickness = 1; 

reg[15:0] sample_count = 0;
reg[1:0] current_color_bar = 0;  

reg pb_clear_history = 0;

always @(posedge clk_20khz) // every 50us save the volumelevel to the array 
begin
    if(pause_switch == 0)
    begin
        if(pb_up == 1)
        pb_clear_history <= 1;   
        
        if (SW_2 == 0)
        begin
            if (menu_switch == 0) // controlling the bar only when the SW0 is off
            begin
                if (pb_right == 1 && bar_space <= 4)
                begin    
                    bar_space <= bar_space << 1;
                    pb_clear_history <= 1; 
                    volume_index <= 0;
                end
                
                else if (pb_left == 1 && bar_space >=2)
                begin
                    bar_space <= bar_space >> 1;
                    pb_clear_history <= 1; 
                    volume_index <= 0;
                end
            end // for the menu_switch
        end
        
        if (pb_clear_history == 1)  // clearing whole screen/history
        begin
            sample_count <= 0;
            volume_history[volume_index] <= 0;
            
            if (volume_index >= 95) // clearing history completed
            begin
                volume_index <= 0;  
                pb_clear_history <= 0;      
            end
            else
            begin
                volume_index <= volume_index + 1;
            end
        end
        
        else    // not clearing history, decide bar thickness
        begin
            sample_count <= sample_count + 1;
            if (sample_count >= selected_count)
            begin
                sample_count <= 0;
                volume_history[volume_index] <= volume_level;
                
                if (bar_thickness ==2)
                    volume_history[volume_index+1] <= volume_level;
                    
                if (bar_thickness ==4)
                begin
                    volume_history[volume_index+1] <= volume_level;
                    volume_history[volume_index+2] <= volume_level;
                    //volume_history[volume_index+3] <= volume_level;
                end
                
                if (bar_thickness ==8)
                begin
                    volume_history[volume_index+1] <= volume_level;
                    volume_history[volume_index+2] <= volume_level;
                    volume_history[volume_index+3] <= volume_level;
                    volume_history[volume_index+4] <= volume_level;
                    volume_history[volume_index+5] <= volume_level;
                    volume_history[volume_index+6] <= volume_level;
                    //volume_history[volume_index+7] <= volume_level;
                end
                volume_index <= (volume_index >= 95) ? 0 : volume_index + bar_space; // store volume_level to the 2d array
            end
        end
     end // for SW_8 Pausing
end

always@(posedge faster_clk)// checks very often >> volume
begin
    if(coordinate_y >= 64-(volume_history[coordinate_x])*3)  // x and y coordinate keep moving!!!!!!!
    begin
        if (volume_index >= (current_color_bar * bar_space) && coordinate_x >= (volume_index - (current_color_bar* bar_space)) && coordinate_x <= (volume_index + ((current_color_bar * bar_space)-1)))
            volume_color <= 16'hD9E7;
        else
            volume_color <= 16'h10F2;  // normal color
    end
    else
       volume_color <= 0;
    
end
    
always@(posedge clk_50hz)
begin
   // current_color_bar <= 3; 
    if(pb_down == 1)
    current_color_bar <= current_color_bar + 1;
    
    if(pb_up == 1)
    case(bar_thickness)
        4'b0001 : bar_thickness <= 4'b0010;
        4'b0010 : bar_thickness <= 4'b0100;
        4'b0100 : bar_thickness <= 4'b1000;
        default : bar_thickness <= 4'b0001;  // 8 doesnt exitst goes back to default
    endcase
    
//    if(bar_thickness > 1)   // if the user change bar thickness, disable green color
//        current_color_bar <= 0;   
        
    
    
end



endmodule
