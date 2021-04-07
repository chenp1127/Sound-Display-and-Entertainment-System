`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2019 10:34:00 AM
// Design Name: 
// Module Name: audio_volume
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


module audio_volume(input [11:0] microphone_input,input refresh_clock,input clk_50hz,input sp_left, sp_right, switch_sample, input selected_switch, output reg [15:0] led_out = 0, output reg[4:0]volume_level = 0, output reg[19:0] selected_count = 4000 );
   
    reg[15:0] sample_count = 0;
    
    reg[11:0] max_value = 0;  // must be same size as mic_in from the fpga
    reg[11:0] selected_function = 0;
   
    
    always@(posedge clk_50hz) // if switch2 is on and pb left is 1, can change the sampling
    begin
        if (switch_sample == 1 )    // switch 2
        begin
            if (sp_right == 1)
            begin
                case(selected_count)
                10000   : selected_count <= 4000;     // 0.50 -> 0.20 second
                4000    : selected_count <= 1000;     // 0.20 -> 0.10 second 
                1000    : selected_count <= 1000;     // 0.10 -> 0.05 second

                default : selected_count <= 4000; 
                endcase
            end
            
            if (sp_left == 1)
            begin
                case(selected_count)
                10000  : selected_count <= 10000;
                4000   : selected_count <= 10000;   // 0.20 -> 0.50 second
                1000   : selected_count <= 4000;    // 0.10 -> 0.20 second 
                default : selected_count <= 4000; 
                endcase
            end
        end
    end
    
    
    
    always@(posedge refresh_clock)
    begin 
        if (microphone_input > max_value)
           max_value <= microphone_input; 
        
        sample_count <= sample_count + 1;
        if (sample_count >= selected_count) // after 0.2sec
          begin
            sample_count <= 0;
            max_value <= 0;  // non blocking to update max_value ONLY AFTER the if statement below.
            
            selected_function <= selected_switch ? max_value : microphone_input;
            if (selected_function <= 2175)
                begin led_out <= 16'b0000_0000_0000_0000; volume_level <= 0; end // all led off
            else if ((selected_function <= 2295) && (selected_function > 2175))
                begin led_out <= 16'b0000_0000_0000_0001; volume_level <= 1; end  // 1 led
            else if ((selected_function <= 2415) && (selected_function > 2295))
                begin led_out <= 16'b0000_0000_0000_0011; volume_level <= 2; end  // 2 led
            else if ((selected_function <= 2535) && (selected_function > 2415))
                begin led_out <= 16'b0000_0000_0000_0111; volume_level <= 3; end  // 3 led
            else if ((selected_function <= 2655) && (selected_function > 2535))
                begin led_out <= 16'b0000_0000_0000_1111; volume_level <= 4; end  // 4 led       
            else if ((selected_function <= 2775) && (selected_function > 2655))
                begin led_out <= 16'b0000_0000_0001_1111; volume_level <= 5; end  // 5 led 
            else if ((selected_function <= 2895) && (selected_function > 2775))
                begin led_out <= 16'b0000_0000_0011_1111; volume_level <= 6; end  // 6 led         
            else if ((selected_function <= 3015) && (selected_function > 2895))
                begin led_out <= 16'b0000_0000_0111_1111; volume_level <= 7; end  // 7 led
            else if ((selected_function <= 3135) && (selected_function > 3015))
                begin led_out <= 16'b0000_0000_1111_1111; volume_level <= 8; end  // 8 led           
            else if ((selected_function <= 3255) && (selected_function > 3135))
                begin led_out <= 16'b0000_0001_1111_1111; volume_level <= 9; end  // 9 led             
            else if ((selected_function <= 3375) && (selected_function > 3255))
                begin led_out <= 16'b0000_0011_1111_1111; volume_level <= 10; end  // 10 led
            else if ((selected_function <= 3495) && (selected_function > 3375))
                begin led_out <= 16'b0000_0111_1111_1111; volume_level <= 11; end  // 11 led                             
            else if ((selected_function <= 3615) && (selected_function > 3495))
                begin led_out <= 16'b0000_1111_1111_1111; volume_level <= 12; end  // 12 led
            else if ((selected_function <= 3735) && (selected_function > 3615))
                begin led_out <= 16'b0001_1111_1111_1111; volume_level <= 13; end  // 13 led             
            else if ((selected_function <= 3855) && (selected_function > 3735))
                begin led_out <= 16'b0011_1111_1111_1111; volume_level <= 14; end  // 14 led
            else if ((selected_function <= 3975) && (selected_function > 3855))
                begin led_out <= 16'b0111_1111_1111_1111; volume_level <= 15; end  // 15 led       
            else 
                begin led_out <= 16'b1111_1111_1111_1111; volume_level <= 16; end  // 16 led   
        end           
    end



endmodule
