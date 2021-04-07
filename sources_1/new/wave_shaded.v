`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2019 10:20:26 PM
// Design Name: 
// Module Name: wave_shaded
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


module wave_two(input [11:0] mic_in, input clk, input clk_choice,pause_switch,input [12:0] pixel_index, output reg [15:0] color = 0);
    
    wire [7:0]coordinate_x; 
    wire [6:0]coordinate_y;
    
    reg [6:0] position_y;
    reg [11:0] mic_in_history[95:0];
    reg [7:0] mic_in_index = 0;
    
    reg [15:0] colour_at_x = 0;
    
    always@(posedge clk_choice) //20khz save to the array 
    begin
        if (pause_switch == 0)
        begin
            mic_in_history[mic_in_index] <= mic_in;
            mic_in_index <= (mic_in_index == 95) ? 0 : mic_in_index + 1;
        end 
    end
    
    pix_xy unit_convertxy (pixel_index, coordinate_x, coordinate_y);
    
    always@(posedge clk)
        begin 
            //position_y <=(127-((mic_in_history[coordinate_x] - 0)*64)/2048) ; // get value between 0 to 63 , 63 - () is to invert
            position_y <= 64 - ((mic_in_history[coordinate_x] / 96)) ; 
            if (coordinate_y >= position_y) // coordinate_y : indicates the pixel being focused on.
              color <= colour_at_x; 
            
            else
              color <= 0;
 
        case (coordinate_x)
        0: colour_at_x <= 16'hF800;
        1: colour_at_x <= 16'hF860;
        2: colour_at_x <= 16'hF8C0;
        3: colour_at_x <= 16'hF900;
        4: colour_at_x <= 16'hF960;
        5: colour_at_x <= 16'hF9C0;
        6: colour_at_x <= 16'hFA20;
        7: colour_at_x <= 16'hFAC0;
        8: colour_at_x <= 16'hFB20;
        9: colour_at_x <= 16'hFB80;
        10: colour_at_x <= 16'hFBE0;
        11: colour_at_x <= 16'hFC40;
        12: colour_at_x <= 16'hFC80;
        13: colour_at_x <= 16'hFCE0;
        14: colour_at_x <= 16'hFD40;
        15: colour_at_x <= 16'hFDA0;
        16: colour_at_x <= 16'hFE00;
        17: colour_at_x <= 16'hFE60;
        18: colour_at_x <= 16'hFEA0;
        19: colour_at_x <= 16'hFF00;
        20: colour_at_x <= 16'hFF60;
        21: colour_at_x <= 16'hFFC0;
        22: colour_at_x <= 16'hFFE0;
        23: colour_at_x <= 16'hEFE0;
        24: colour_at_x <= 16'hE7E0;
        25: colour_at_x <= 16'hDFE0;
        26: colour_at_x <= 16'hCFE0;
        27: colour_at_x <= 16'hC7E0;
        28: colour_at_x <= 16'hB7E0;
        29: colour_at_x <= 16'hAFE0;
        30: colour_at_x <= 16'hA7E0;
        31: colour_at_x <= 16'h97E0;
        32: colour_at_x <= 16'h8FE0;
        33: colour_at_x <= 16'h7FE0;
        34: colour_at_x <= 16'h77E0;
        35: colour_at_x <= 16'h6FE0;
        36: colour_at_x <= 16'h5FE0;
        37: colour_at_x <= 16'h57E0;
        38: colour_at_x <= 16'h47E0;
        39: colour_at_x <= 16'h3FE0;
        40: colour_at_x <= 16'h37E0;
        41: colour_at_x <= 16'h27E0;
        42: colour_at_x <= 16'h1FE0;
        43: colour_at_x <= 16'h0FE0;
        44: colour_at_x <= 16'h07E1;
        45: colour_at_x <= 16'h07E2;
        46: colour_at_x <= 16'h07E3;
        47: colour_at_x <= 16'h07E5;
        48: colour_at_x <= 16'h07E6;
        49: colour_at_x <= 16'h07E8;
        50: colour_at_x <= 16'h07EA;
        51: colour_at_x <= 16'h07ED;
        52: colour_at_x <= 16'h07EF;
        53: colour_at_x <= 16'h07F0;
        54: colour_at_x <= 16'h07F2;
        55: colour_at_x <= 16'h07F3;
        56: colour_at_x <= 16'h07F4;
        57: colour_at_x <= 16'h07F7;
        58: colour_at_x <= 16'h07F9;
        59: colour_at_x <= 16'h07FB;
        60: colour_at_x <= 16'h07FD;
        61: colour_at_x <= 16'h07FE;
        62: colour_at_x <= 16'h07FF;
        63: colour_at_x <= 16'h079F;
        64: colour_at_x <= 16'h073F;
        65: colour_at_x <= 16'h06FF;
        66: colour_at_x <= 16'h069F;
        67: colour_at_x <= 16'h063F;
        68: colour_at_x <= 16'h05DF;
        69: colour_at_x <= 16'h053F;
        70: colour_at_x <= 16'h04DF;
        71: colour_at_x <= 16'h041F;
        72: colour_at_x <= 16'h037F;
        73: colour_at_x <= 16'h02BF;
        74: colour_at_x <= 16'h01FF;
        75: colour_at_x <= 16'h015F;
        76: colour_at_x <= 16'h009F;
        77: colour_at_x <= 16'h001F;
        78: colour_at_x <= 16'h101F;
        79: colour_at_x <= 16'h181F;
        80: colour_at_x <= 16'h201F;
        81: colour_at_x <= 16'h301F;
        82: colour_at_x <= 16'h481F;
        83: colour_at_x <= 16'h581F;
        84: colour_at_x <= 16'h681F;
        85: colour_at_x <= 16'h881F;
        86: colour_at_x <= 16'hA01F;
        87: colour_at_x <= 16'hB81F;
        88: colour_at_x <= 16'hC01F;
        89: colour_at_x <= 16'hD81F;
        90: colour_at_x <= 16'hF01F;
        91: colour_at_x <= 16'hF81C;
        92: colour_at_x <= 16'hF818;
        93: colour_at_x <= 16'hF812;
        94: colour_at_x <= 16'hF810;
        95: colour_at_x <= 16'hF805;
 
        default: colour_at_x <= 16'b11111_111111_11111;    
        endcase

        end
       

endmodule

