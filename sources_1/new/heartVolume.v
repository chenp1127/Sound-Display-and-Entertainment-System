`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2019 06:20:18 PM
// Design Name: 
// Module Name: heartVolume
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


module screensaver(input clk12p5mhz_clk, clk_1hz, input [7:0] coordinate_x, input [6:0] coordinate_y, input [5:0] volume_level,input menu_switch, input SW_2, output reg [15:0] volume_color = 0);

reg [6:0] lower_one [95:0];
reg [6:0] upper_one [95:0];
reg [6:0] lower_two [95:0];
reg [6:0] upper_two [95:0];

reg startup = 1;

reg colour_count = 0; 
reg [15:0] colour_section_one = 16'b11111_000000_00000; 
reg [15:0] colour_section_two = 16'b00000_111111_00000;
reg [15:0] colour_section_three = 16'b00000_000000_11111;


always @ (posedge clk12p5mhz_clk)
begin
    if (startup == 1 )  // initialize 2D array with some pixel
    begin
 lower_one[0] <= 0;
    lower_one[1] <= 0;
    lower_one[2] <= 0;
    lower_one[3] <= 0;
    lower_one[4] <= 0;
    lower_one[5] <= 0;
    lower_one[6] <= 0;
    lower_one[7] <= 0;
    lower_one[8] <= 0;
    lower_one[9] <= 0;
    lower_one[10] <= 0;
    lower_one[11] <= 0;
    lower_one[12] <= 0;
    lower_one[13] <= 0;
    lower_one[14] <= 0;
    lower_one[15] <= 0;
    lower_one[16] <= 0;
    lower_one[17] <= 0;
    lower_one[18] <= 0;
    lower_one[19] <= 0;
    lower_one[20] <= 37;
    lower_one[21] <= 37;
    lower_one[22] <= 37;
    lower_one[23] <= 0;
    lower_one[24] <= 43;
    lower_one[25] <= 0;
    lower_one[26] <= 37;
    lower_one[27] <= 37;
    lower_one[28] <= 37;
    lower_one[29] <= 0;
    lower_one[30] <= 43;
    lower_one[31] <= 0;
    lower_one[32] <= 0;
    lower_one[33] <= 0;
    lower_one[34] <= 0;
    
    
    lower_one[48] <= 0;
    lower_one[49] <= 0;
    lower_one[50] <= 0;
    lower_one[51] <= 0;
    lower_one[52] <= 0;
    lower_one[53] <= 0;
    lower_one[54] <= 0;
    lower_one[55] <= 0;
    lower_one[56] <= 0;
    lower_one[57] <= 0;
    lower_one[58] <= 0;
    lower_one[59] <= 0;
    lower_one[60] <= 0;
    
    
    lower_one[35] <= 24;
    lower_one[36] <= 24;
    lower_one[37] <= 24;
    lower_one[38] <= 24;
    lower_one[39] <= 24;
    lower_one[40] <= 23;
    lower_one[41] <= 23;
    lower_one[42] <= 23;
    lower_one[43] <= 23;
    lower_one[44] <= 22;
    lower_one[45] <= 22;
    lower_one[46] <= 22;
    lower_one[47] <= 22;
    
    
    lower_one[61] <= 0;
    lower_one[62] <= 0;
    lower_one[63] <= 0;
    lower_one[64] <= 0;
    lower_one[65] <= 0;
    lower_one[66] <= 0;
    lower_one[67] <= 0;
    lower_one[68] <= 0;
    lower_one[69] <= 0;
    lower_one[70] <= 37;
    lower_one[71] <= 38;
    lower_one[72] <= 39;
    lower_one[73] <= 0;
    lower_one[74] <= 41;
    lower_one[75] <= 43;
    lower_one[76] <= 43;
    lower_one[77] <= 41;
    lower_one[78] <= 0;
    lower_one[79] <= 39;
    lower_one[80] <= 38;
    lower_one[81] <= 37;
    lower_one[82] <= 0;
    lower_one[83] <= 0;
    lower_one[84] <= 0;
    lower_one[85] <= 0;
    lower_one[86] <= 0;
    lower_one[87] <= 0;
    lower_one[88] <= 0;
    lower_one[89] <= 0;
    lower_one[90] <= 0;
    lower_one[91] <= 0;
    lower_one[92] <= 0;
    lower_one[93] <= 0;
    lower_one[94] <= 0;
    lower_one[95] <= 0;
    
    
    
    
    upper_one[0] <= 0;
    upper_one[1] <= 0;
    upper_one[2] <= 0;
    upper_one[3] <= 0;
    upper_one[4] <= 0;
    upper_one[5] <= 0;
    upper_one[6] <= 0;
    upper_one[7] <= 0;
    upper_one[8] <= 0;
    upper_one[9] <= 0;
    upper_one[10] <= 0;
    upper_one[11] <= 0;
    upper_one[12] <= 0;
    upper_one[13] <= 0;
    upper_one[14] <= 0;
    upper_one[15] <= 0;
    upper_one[16] <= 0;
    upper_one[17] <= 0;
    upper_one[18] <= 0;
    upper_one[19] <= 0;
    upper_one[20] <= 37;
    upper_one[21] <= 37;
    upper_one[22] <= 43;
    upper_one[23] <= 0;
    upper_one[24] <= 43;
    upper_one[25] <= 0;
    upper_one[26] <= 43;
    upper_one[27] <= 37;
    upper_one[28] <= 37;
    upper_one[29] <= 0;
    upper_one[30] <= 43;
    upper_one[31] <= 0;
    upper_one[32] <= 0;
    upper_one[33] <= 0;
    upper_one[34] <= 0;
    
    
    upper_one[48] <= 0;
    upper_one[49] <= 0;
    upper_one[50] <= 0;
    upper_one[51] <= 0;
    upper_one[52] <= 0;
    upper_one[53] <= 0;
    upper_one[54] <= 0;
    upper_one[55] <= 0;
    upper_one[56] <= 0;
    upper_one[57] <= 0;
    upper_one[58] <= 0;
    upper_one[59] <= 0;
    upper_one[60] <= 0;
    
    
    upper_one[35] <= 26;
    upper_one[36] <= 26;
    upper_one[37] <= 26;
    upper_one[38] <= 26;
    upper_one[39] <= 26;
    upper_one[40] <= 25;
    upper_one[41] <= 25;
    upper_one[42] <= 25;
    upper_one[43] <= 25;
    upper_one[44] <= 24;
    upper_one[45] <= 24;
    upper_one[46] <= 24;
    upper_one[47] <= 56;
    
    
    upper_one[61] <= 0;
    upper_one[62] <= 0;
    upper_one[63] <= 0;
    upper_one[64] <= 0;
    upper_one[65] <= 0;
    upper_one[66] <= 0;
    upper_one[67] <= 0;
    upper_one[68] <= 0;
    upper_one[69] <= 0;
    upper_one[70] <= 37;
    upper_one[71] <= 38;
    upper_one[72] <= 39;
    upper_one[73] <= 0;
    upper_one[74] <= 42;
    upper_one[75] <= 43;
    upper_one[76] <= 43;
    upper_one[77] <= 42;
    upper_one[78] <= 0;
    upper_one[79] <= 39;
    upper_one[80] <= 38;
    upper_one[81] <= 37;
    upper_one[82] <= 0;
    upper_one[83] <= 0;
    upper_one[84] <= 0;
    upper_one[85] <= 0;
    upper_one[86] <= 0;
    upper_one[87] <= 0;
    upper_one[88] <= 0;
    upper_one[89] <= 0;
    upper_one[90] <= 0;
    upper_one[91] <= 0;
    upper_one[92] <= 0;
    upper_one[93] <= 0;
    upper_one[94] <= 0;
    upper_one[95] <= 0;
    
    
    
    lower_two[0] <= 0;
    lower_two[1] <= 0;
    lower_two[2] <= 0;
    lower_two[3] <= 0;
    lower_two[4] <= 0;
    lower_two[5] <= 0;
    lower_two[6] <= 0;
    lower_two[7] <= 0;
    lower_two[8] <= 0;
    lower_two[9] <= 0;
    lower_two[10] <= 0;
    lower_two[11] <= 0;
    lower_two[12] <= 0;
    lower_two[13] <= 0;
    lower_two[14] <= 0;
    lower_two[15] <= 0;
    lower_two[16] <= 0;
    lower_two[17] <= 0;
    lower_two[18] <= 0;
    lower_two[19] <= 0;
    lower_two[20] <= 42;
    lower_two[21] <= 43;
    lower_two[22] <= 37;
    lower_two[23] <= 0;
    lower_two[24] <= 0;
    lower_two[25] <= 0;
    lower_two[26] <= 37;
    lower_two[27] <= 43;
    lower_two[28] <= 43;
    lower_two[29] <= 0;
    lower_two[30] <= 0;
    lower_two[31] <= 0;
    lower_two[32] <= 0;
    lower_two[33] <= 0;
    lower_two[34] <= 0;
    
    
    lower_two[48] <= 0;
    lower_two[49] <= 0;
    lower_two[50] <= 0;
    lower_two[51] <= 0;
    lower_two[52] <= 0;
    lower_two[53] <= 0;
    lower_two[54] <= 0;
    lower_two[55] <= 0;
    lower_two[56] <= 0;
    lower_two[57] <= 0;
    lower_two[58] <= 0;
    lower_two[59] <= 0;
    lower_two[60] <= 0;
    
    
    lower_two[35] <= 0;
    lower_two[36] <= 0;
    lower_two[37] <= 0;
    lower_two[38] <= 51;
    lower_two[39] <= 50;
    lower_two[40] <= 49;
    lower_two[41] <= 48;
    lower_two[42] <= 48;
    lower_two[43] <= 48;
    lower_two[44] <= 48;
    lower_two[45] <= 48;
    lower_two[46] <= 49;
    lower_two[47] <= 0;
    
    
    lower_two[61] <= 0;
    lower_two[62] <= 0;
    lower_two[63] <= 0;
    lower_two[64] <= 0;
    lower_two[65] <= 0;
    lower_two[66] <= 0;
    lower_two[67] <= 0;
    lower_two[68] <= 0;
    lower_two[69] <= 0;
    lower_two[70] <= 41;
    lower_two[71] <= 40;
    lower_two[72] <= 0;
    lower_two[73] <= 0;
    lower_two[74] <= 0;
    lower_two[75] <= 0;
    lower_two[76] <= 0;
    lower_two[77] <= 0;
    lower_two[78] <= 0;
    lower_two[79] <= 0;
    lower_two[80] <= 40;
    lower_two[81] <= 41;
    lower_two[82] <= 0;
    lower_two[83] <= 0;
    lower_two[84] <= 0;
    lower_two[85] <= 0;
    lower_two[86] <= 0;
    lower_two[87] <= 0;
    lower_two[88] <= 0;
    lower_two[89] <= 0;
    lower_two[90] <= 0;
    lower_two[91] <= 0;
    lower_two[92] <= 0;
    lower_two[93] <= 0;
    lower_two[94] <= 0;
    lower_two[95] <= 0;
    
    
    
    upper_two[0] <= 0;
    upper_two[1] <= 0;
    upper_two[2] <= 0;
    upper_two[3] <= 0;
    upper_two[4] <= 0;
    upper_two[5] <= 0;
    upper_two[6] <= 0;
    upper_two[7] <= 0;
    upper_two[8] <= 0;
    upper_two[9] <= 0;
    upper_two[10] <= 0;
    upper_two[11] <= 0;
    upper_two[12] <= 0;
    upper_two[13] <= 0;
    upper_two[14] <= 0;
    upper_two[15] <= 0;
    upper_two[16] <= 0;
    upper_two[17] <= 0;
    upper_two[18] <= 0;
    upper_two[19] <= 0;
    upper_two[20] <= 43;
    upper_two[21] <= 43;
    upper_two[22] <= 43;
    upper_two[23] <= 0;
    upper_two[24] <= 0;
    upper_two[25] <= 0;
    upper_two[26] <= 43;
    upper_two[27] <= 43;
    upper_two[28] <= 43;
    upper_two[29] <= 0;
    upper_two[30] <= 0;
    upper_two[31] <= 0;
    upper_two[32] <= 0;
    upper_two[33] <= 0;
    upper_two[34] <= 0;
    
    
    upper_two[48] <= 0;
    upper_two[49] <= 0;
    upper_two[50] <= 0;
    upper_two[51] <= 0;
    upper_two[52] <= 0;
    upper_two[53] <= 0;
    upper_two[54] <= 0;
    upper_two[55] <= 0;
    upper_two[56] <= 0;
    upper_two[57] <= 0;
    upper_two[58] <= 0;
    upper_two[59] <= 0;
    upper_two[60] <= 0;
    
    //48 TO 60
    upper_two[35] <= 0;
    upper_two[36] <= 0;
    upper_two[37] <= 0;
    upper_two[38] <= 55;
    upper_two[39] <= 56;
    upper_two[40] <= 57;
    upper_two[41] <= 58;
    upper_two[42] <= 58;
    upper_two[43] <= 58;
    upper_two[44] <= 58;
    upper_two[45] <= 58;
    upper_two[46] <= 57;
    upper_two[47] <= 0;
    
    
    upper_two[61] <= 0;
    upper_two[62] <= 0;
    upper_two[63] <= 0;
    upper_two[64] <= 0;
    upper_two[65] <= 0;
    upper_two[66] <= 0;
    upper_two[67] <= 0;
    upper_two[68] <= 0;
    upper_two[69] <= 0;
    upper_two[70] <= 41;
    upper_two[71] <= 40;
    upper_two[72] <= 0;
    upper_two[73] <= 0;
    upper_two[74] <= 0;
    upper_two[75] <= 0;
    upper_two[76] <= 0;
    upper_two[77] <= 0;
    upper_two[78] <= 0;
    upper_two[79] <= 0;
    upper_two[80] <= 40;
    upper_two[81] <= 41;
    upper_two[82] <= 0;
    upper_two[83] <= 0;
    upper_two[84] <= 0;
    upper_two[85] <= 0;
    upper_two[86] <= 0;
    upper_two[87] <= 0;
    upper_two[88] <= 0;
    upper_two[89] <= 0;
    upper_two[90] <= 0;
    upper_two[91] <= 0;
    upper_two[92] <= 0;
    upper_two[93] <= 0;
    upper_two[94] <= 0;
    upper_two[95] <= 0;

      
        startup <= 0;
    end
    
    else // Look at 2D arra
        begin
        
        if (coordinate_y == 0 || coordinate_y == 1 || coordinate_y == 62 || coordinate_y == 63)
            volume_color <= 16'b00000_000000_00000;
        else if (  coordinate_x >= 0 && coordinate_x <= 30 &&  ( ((coordinate_y >= lower_one[coordinate_x] && coordinate_y <= upper_one[coordinate_x]) || (coordinate_y >= lower_two[coordinate_x] && coordinate_y<= upper_two[coordinate_x])))) 
            volume_color <= colour_section_one; 
        else if (  coordinate_x >= 31 && coordinate_x <= 65 &&  ( ((coordinate_y >= lower_one[coordinate_x] && coordinate_y <= upper_one[coordinate_x]) || (coordinate_y >= lower_two[coordinate_x] && coordinate_y<= upper_two[coordinate_x]))))
                volume_color <= colour_section_two; 
        else if (  coordinate_x >= 66 && coordinate_x <=94 &&  ( ((coordinate_y >= lower_one[coordinate_x] && coordinate_y <= upper_one[coordinate_x]) || (coordinate_y >= lower_two[coordinate_x] && coordinate_y<= upper_two[coordinate_x]))))
                    volume_color <= colour_section_three;                             
        else  
            volume_color <= 16'b00000_000000_00000;

    end
end


always @ (posedge clk_1hz)
begin
    colour_count <= colour_count +1;
    if (colour_count == 0)
    begin
        colour_section_one <= 16'b11111_000000_00000; 
        colour_section_two <= 16'b00000_111111_00000;
        colour_section_three <= 16'b00000_000000_11111;
    end

    if (colour_count == 1)
    begin
        colour_section_one <= 16'b11111_000000_11111; 
        colour_section_two <= 16'b00000_111111_11111;
        colour_section_three <= 16'b11111_111111_11111;
    end



end



endmodule
