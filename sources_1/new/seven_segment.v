`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2019 07:12:16 PM
// Design Name: 
// Module Name: seven_segment_control
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
// coming from outside : input, reg can only be output

module seven_segment_control(input clk, clk_50hz, clk_700hz, [1:0] my_count_input,[4:0] volume_signal,input[19:0]selected_count,output reg[3:0]final_AN, reg [7:0]final_SEG, input [11:0] raw_mic_in, input mux_switch);

    parameter character_0 = 8'b1100_0000;
    parameter character_1 = 8'b1111_1001;
    parameter character_2 = 8'b1010_0100;
    parameter character_3 = 8'b1011_0000;
    parameter character_4 = 8'b1001_1001;
    parameter character_5 = 8'b1001_0010;
    parameter character_6 = 8'b1000_0010;
    parameter character_7 = 8'b1111_1000;
    parameter character_8 = 8'b1000_0000;
    parameter character_9 = 8'b1001_0000;
    parameter character_L = 8'b1100_0111;
    parameter character_H = 8'b1000_1001;
    parameter character_space = 8'b1111_1111;

    reg[3:0]AN = 0; 
    reg [7:0]SEG = 0;



    reg [7:0] character_AN3 = character_space; 
    reg [7:0] character_AN2 = character_space; 
    reg [7:0] character_AN1 = character_1; 
    reg [7:0] character_AN0 = character_0; 
    
    reg [11:0] slow_mic_in = 0;
    
    reg [3:0] selected_anode = 4'b0000;
    reg [3:0] mic_in_character = 0;
    reg [7:0] mic_in_led = 8'b1111_1111;
    
    reg [7:0] sample_level = 0;  // 0 is slowest 10.000
    
    
    always @ (posedge clk_50hz)
    begin
        slow_mic_in <= raw_mic_in;
    end
    
    
    
  
    always @ (posedge clk ) // How often its perform the case statement, basically every pos edge of that clock, this clock is not for the counter
    begin
        case(selected_count)
        10000: sample_level <= 8'b1111_0111;
        4000 : sample_level <= 8'b1011_0111;
        1000 : sample_level <= 8'b1011_0110;
        default : sample_level <= 8'b1111_1111;
        endcase
        
        if (mux_switch == 1) 
        begin
            case(volume_signal) // volume signal refresh every 0.2 second
                5'd0: begin character_AN3 <= sample_level; character_AN2 <= character_L; character_AN1 <= character_0; character_AN0 <= character_0; end
                5'd1: begin character_AN3 <= sample_level; character_AN2 <= character_L; character_AN1 <= character_0; character_AN0 <= character_1; end
                5'd2: begin character_AN3 <= sample_level; character_AN2 <= character_L; character_AN1 <= character_0; character_AN0 <= character_2; end
                5'd3: begin character_AN3 <= sample_level; character_AN2 <= character_L; character_AN1 <= character_0; character_AN0 <= character_3; end
                5'd4: begin character_AN3 <= sample_level; character_AN2 <= character_L; character_AN1 <= character_0; character_AN0 <= character_4; end
                5'd5: begin character_AN3 <= sample_level; character_AN2 <= character_L; character_AN1 <= character_0; character_AN0 <= character_5; end
                5'd6: begin character_AN3 <= sample_level; character_AN2 <= character_space; character_AN1 <= character_0; character_AN0 <= character_6; end
                5'd7: begin character_AN3 <= sample_level; character_AN2 <= character_space; character_AN1 <= character_0; character_AN0 <= character_7; end
                5'd8: begin character_AN3 <= sample_level; character_AN2 <= character_space; character_AN1 <= character_0; character_AN0 <= character_8; end
                5'd9: begin character_AN3 <= sample_level; character_AN2 <= character_space; character_AN1 <= character_0; character_AN0 <= character_9; end
                5'd10: begin character_AN3 <= sample_level; character_AN2 <= character_space; character_AN1 <= character_1; character_AN0 <= character_0; end
                5'd11: begin character_AN3 <= sample_level; character_AN2 <= character_H; character_AN1 <= character_1; character_AN0 <= character_1; end
                5'd12: begin character_AN3 <= sample_level; character_AN2 <= character_H; character_AN1 <= character_1; character_AN0 <= character_2; end
                5'd13: begin character_AN3 <= sample_level; character_AN2 <= character_H; character_AN1 <= character_1; character_AN0 <= character_3; end
                5'd14: begin character_AN3 <= sample_level; character_AN2 <= character_H; character_AN1 <= character_1; character_AN0 <= character_4; end
                5'd15: begin character_AN3 <= sample_level; character_AN2 <= character_H; character_AN1 <= character_1; character_AN0 <= character_5; end
                default :begin character_AN3 <= sample_level; character_AN2 <= character_H; character_AN1 <= character_1; character_AN0 <= character_6; end
            endcase 
        end
   
        case (my_count_input) // coutner is from somewhere from outside, value is updated elsewhere by a different clock,, counter is updated by another clock. 
            2'b00: begin SEG[7:0] <= character_AN3; AN[3:0] <= 4'b0111; end
            2'b01: begin SEG[7:0] <= character_AN2; AN[3:0] <= 4'b1011; end
            2'b10: begin SEG[7:0] <= character_AN1; AN[3:0] <= 4'b1101; end             
            2'b11: begin SEG[7:0] <= character_AN0; AN[3:0] <= 4'b1110; end            
            default : SEG[7:0] <= 8'b1111_1111;           
        endcase            
        

        if (mux_switch == 1)
        begin
            final_AN <= AN;
            final_SEG <= SEG;
        end
        else
        begin 
            final_AN <= selected_anode;
            final_SEG <= mic_in_led;
        end             
    end // for the always block  

always @ (posedge clk_700hz)
begin

case (selected_anode)
    4'b1011: begin selected_anode <= 4'b0111; mic_in_character <= (slow_mic_in/1000)%10; end
    4'b1101: begin selected_anode <= 4'b1011; mic_in_character <= (slow_mic_in/100)%10; end
    4'b1110: begin selected_anode <= 4'b1101; mic_in_character <= (slow_mic_in/10)%10; end 
    4'b0111: begin selected_anode <= 4'b1110; mic_in_character <= (slow_mic_in/1)%10; end
    default: begin selected_anode <= 4'b1110; mic_in_character <= (slow_mic_in/1)%10; end
endcase

end

always @ (*)
begin
    case (mic_in_character)
        4'd0 : mic_in_led <= character_0;
        4'd1 : mic_in_led <= character_1;
        4'd2 : mic_in_led <= character_2;
        4'd3 : mic_in_led <= character_3;
        4'd4 : mic_in_led <= character_4;
        4'd5 : mic_in_led <= character_5;
        4'd6 : mic_in_led <= character_6;
        4'd7 : mic_in_led <= character_7;
        4'd8 : mic_in_led <= character_8;
        4'd9 : mic_in_led <= character_9;
        default: mic_in_led <= 8'b01111111;
    endcase
end


endmodule
