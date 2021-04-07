`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2019 07:56:11 PM
// Design Name: 
// Module Name: raindrop
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


module raindrop(input clk12p5mhz_clk,input rain_f1,rain_f2,rain_f3,rain_f4,rain_f5,input clk_bucket_move,raindrop_check_clk, input [7:0] coordinate_x, input [6:0] coordinate_y, input [5:0] volume_level,input menu_switch, input SW_2, pause_switch, left_pb, right_pb, down_pb, output reg [15:0] rain_color = 0);

reg [6:0] rain [95:0];

//reg [5:0] rain_drop_one = 15;
reg [5:0] rain_drop_1 = 15;
reg [5:0] rain_drop_2 = 15;
reg [5:0] rain_drop_3 = 15;
reg [5:0] rain_drop_4 = 15;
reg [5:0] rain_drop_5 = 15;
reg [5:0] rain_drop_6 = 15;
reg [5:0] rain_drop_7 = 15;
reg [5:0] rain_drop_8 = 15;
reg [5:0] rain_drop_9 = 15;
reg [5:0] rain_drop_10 = 15;
reg [5:0] rain_drop_11 = 15;
reg [5:0] rain_drop_12 = 15;


//Bucket Drawing

//reg [6:0] bucket_top_y = 50;
//reg [6:0] bucket_bottom_y = 60;
reg [7:0] bucket_x = 40;
reg [6:0] bucket_fill = 0;


always@(posedge clk_bucket_move)
begin
    if (left_pb == 1 && bucket_x >= 2)
        bucket_x <= bucket_x - 1;
    if (right_pb == 1 && bucket_x <= 75)
        bucket_x <= bucket_x + 1;    
end 


always @ (posedge raindrop_check_clk)
begin
     // caatching water
   if ( (rain_drop_1 >= 56 && bucket_x >= 5 && bucket_x <= (6+18))  ||
        (rain_drop_2 >= 56 && bucket_x >= 13 && bucket_x <= (14+18))  ||
        (rain_drop_3 >= 56 && bucket_x >= 19 && bucket_x <= (20+18))  ||
        (rain_drop_4 >= 56 && bucket_x >= 31 && bucket_x <= (33+18))  ||
        (rain_drop_5 >= 56 && bucket_x >= 42 && bucket_x <= (43+18))  ||
        (rain_drop_6 >= 56 && bucket_x >= 49 && bucket_x <= (50+18))  ||
        (rain_drop_7 >= 56 && bucket_x >= 55 && bucket_x <= (56+18))  ||
        (rain_drop_8 >= 56 && bucket_x >= 68 && bucket_x <= (69+18))  ||
        (rain_drop_9 >= 56 && bucket_x >= 77 && bucket_x <= (78+18))  ||
        (rain_drop_10 >= 56 && bucket_x >= 83 && bucket_x <= (84+18)) ||
        (rain_drop_11 >= 56 && bucket_x >= 88 && bucket_x <= (89+18)) ||
        (rain_drop_12 >= 56 && bucket_x >= 93 && bucket_x <= (94+18))
      )
       bucket_fill <= (bucket_fill <= 4) ? (bucket_fill + 1) : bucket_fill;

        if (down_pb == 1)
            bucket_fill <= 0; // reset water level


end



always @ (posedge clk12p5mhz_clk)
begin
        rain[5] <= rain_drop_1;
        rain[6] <= rain_drop_1;
        
        rain[13] <= rain_drop_2;
        rain[14] <= rain_drop_2;
        
        rain[19] <= rain_drop_3;
        rain[20] <= rain_drop_3;
        
        rain[31] <= rain_drop_4;
        rain[32] <= rain_drop_4;
        
        rain[42] <= rain_drop_5;
        rain[43] <= rain_drop_5;
        
        rain[49] <= rain_drop_6;
        rain[50] <= rain_drop_6;
        
        rain[55] <= rain_drop_7;
        rain[56] <= rain_drop_7;
        
        rain[68] <= rain_drop_8;
        rain[69] <= rain_drop_8;
        
        rain[77] <= rain_drop_9;
        rain[78] <= rain_drop_9;
        
        rain[83] <= rain_drop_10;
        rain[84] <= rain_drop_10;
        
        rain[88] <= rain_drop_11;
        rain[89] <= rain_drop_11;
        
        rain[93] <= rain_drop_12;
        rain[94] <= rain_drop_12;
    
   
        if ((coordinate_y >= 56) && (coordinate_y <= 63) && (coordinate_x >= bucket_x) && (coordinate_x <= (bucket_x + 2)))
            rain_color <= 16'b11111_000000_00000; // left corner
        else if ((coordinate_y >= 56) && (coordinate_y <= 63) && (coordinate_x >= bucket_x + 15) && (coordinate_x <= bucket_x + 17))
            rain_color <= 16'b11111_000000_00000; // right corner
        else if ((coordinate_y >= 61 && coordinate_y <= 63) && (coordinate_x >= (bucket_x +3)) && (coordinate_x <= (bucket_x + 14)))
            rain_color <= 16'b11111_000000_00000; //Bottom bucket
        else if (((coordinate_y >= rain[coordinate_x]) && coordinate_y <= rain[coordinate_x] + 2))  // read value very fast
                rain_color <= 16'hAEDF; // rain drops            
        else if (coordinate_y <= 61 && coordinate_y >= (61 - bucket_fill) && (coordinate_x >= (bucket_x +3)) && (coordinate_x <= (bucket_x + 14))) 
                rain_color <= 16'hAEDF;  // bucket fill
        else 
        rain_color <= 0;
end

    always @(posedge rain_f1)  // update slow
    begin
        if(pause_switch == 0 )
        begin
            rain_drop_1 <= rain_drop_1 + 1;
            rain_drop_8 <= rain_drop_8 + 1;
        end
    end
    
     always @(posedge rain_f2)
     begin
           if(pause_switch == 0 )
           begin
               rain_drop_2 <= rain_drop_2 + 1;
               rain_drop_5 <= rain_drop_5 + 1;
               rain_drop_12 <= rain_drop_12 + 1;
           end
     end
       
       
          always @(posedge rain_f3)
          begin
              if(pause_switch == 0)
              begin
                  rain_drop_3 <= rain_drop_3 + 1;
                  rain_drop_9 <= rain_drop_9 + 1;
              end
          end
          
          
          always @(posedge rain_f4)
          begin
                 if(pause_switch == 0)
                 begin
                     rain_drop_6 <= rain_drop_6 + 1;
                     rain_drop_11 <= rain_drop_11 + 1;
                 end
          end
             
          always @(posedge rain_f5)
          begin
              if(pause_switch == 0)
              begin
                  rain_drop_4 <= rain_drop_4 + 1;
                  rain_drop_7 <= rain_drop_7 + 1;
                  rain_drop_10 <= rain_drop_10 + 1;
              end             
          end

endmodule
