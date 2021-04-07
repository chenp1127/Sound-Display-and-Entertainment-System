`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2019 09:44:52 PM
// Design Name: 
// Module Name: pikachu_volume
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


module pikachu_volume(input [12:0] pixel_index,output reg [15:0] pixel_data_out, input clock, input [15:0] led_light);
    wire [12:0] x;
    wire [12:0] y;
    x_axies(pixel_index, x, clock); // formula convert 12 bit to x value
    y_axies(pixel_index, y, clock);
    always@(posedge clock)
    begin
        if (((x>=34 && x<=35) || (x>=60 && x<=61))&&(y==22))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000}; //black
            end
        else if (((x>=34 && x<=37)||(x>=58 && x<=61))&&(y==23))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000}; //black
            end
        else if (((x>=34 && x<=36)||(x==38)||(x==57)||(x>=59&&x<=61))&&(y==24))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x==37) || (x==58)) && (y==24))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x>=34 && x<=36) || (x>=59 && x<=61) || (x>=39 && x<=40) || (x>=55 && x<=56)) && (y==25))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37&&x<=38) || (x>=57 && x<=58)) &&(y==25))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x>=35&&x<=36)||(x==41) || (x==54) || (x>=59&&x<=60)) &&(y==26))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37 && x<=40) || (x>=55&&x<=58)) && (y==26))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x>=35 && x<=36) || (x>=42 && x<=43) || (x>=46 && x<=49) || (x>=52&&x<=53) || (x>=59&&x<=60)) && (y==27))    
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37 && x<=41) || (x>=54 && x<=58)) && (y==27))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==36)||(x>=44 && x<=45)||(x>=50&&x<=51)||(x==59))&&(y==28))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37 && x<=43)||(x>=46&&x<=49)||(x>=52&&x<=58))&&(y==28))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==36)||(x==59))&&(y==29))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if ((x>=37 && x<=58)&&(y==29))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==37)||(x==58))&&(y==30))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if ((x>=38 && x<=57)&&(y==30))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==38)||(x==40)||(x==55)||(x==57))&&(y==31))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x==39)||(x==56)||(x>=41&&x<=54))&&(y==31))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==39)||(x==56))&&(y==32))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if((x>=40 && x<=55)&&(y==32))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==39)||(x==56))&&(y==33))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if((x>=40 && x<=55)&&(y==33))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x>=42&&x<=43)||(x>=52&&x<=53)||(x==57))&&(y==34))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=41)||(x>=44&&x<=51)||(x>=54&&x<=56))&&(y==34))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x==41)||(x>=43&&x<=44)||(x>=51&&x<=52)||(x==54)||(x==57))&&(y==35))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=40)||(x>=45&&x<=50)||(x>=55&&x<=56))&&(y==35))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x>=41&&x<=44)||(x>=51&&x<=54)||(x==57))&&(y==36))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=40)||(x>=45&&x<=50)||(x>=55&&x<=56))&&(y==36))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x>=42&&x<=43)||(x>=47&&x<=48)||(x>=52&&x<=53)||(x==57))&&(y==37))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=41)||(x>=44&&x<=46)||(x>=49&&x<=51)||(x>=54&&x<=56))&&(y==37))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==37)||(x==58))&&(y==38))
            begin
               pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black 
            end
        else if(((x>=38&&x<=39)||(x>=42&&x<=53)||(x>=56&&x<=57))&&(y==38))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=40&&x<=41)||(x>=54&&x<=55))&&(y==38))
            begin
                if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                        begin 
                                            pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                        end
                                        else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                        begin
                                            pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                        end
                else if (led_light>=16'b0000_1111_1111_1111)
                begin
                    pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                end
                else
                begin
                    pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                end
            end
        else if(((x==37)||(x==45)||(x>=47&&x<=48)||(x==50)||(x==58))&&(y==39))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black 
            end
        else if(((x==38)||(x>=43&&x<=44)||(x==46)||(x==49)||(x>=51&&x<=52)||(x==57))&&(y==39))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=39&&x<=42)||(x>=53&&x<=56))&&(y==39))
            begin
                if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                        begin 
                                            pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                        end
                                        else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                        begin
                                            pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                        end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
            end
        else if(((x==37)||(x>=46&&x<=49)||(x==58))&&(y==40))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black 
            end
        else if(((x==38)||(x>=43&&x<=45)||(x>=50&&x<=52)||(x==57))&&(y==40))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=39&&x<=42)||(x>=53&&x<=56))&&(y==40))
            begin
                if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                        begin 
                                            pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                        end
                                        else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                        begin
                                            pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                        end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
            end
        else if(((x==38)||(x==46)||(x==49)||(x==57))&&(y==41))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x==39)||(x>=42&&x<=45)||(x>=50&&x<=53)||(x==56))&&(y==41))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=40&&x<=41)||(x>=47&&x<=48)||(x>=54&&x<=55))&&(y==41))
            begin
                if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                        begin 
                                            pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                        end
                                        else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                        begin
                                            pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                        end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
            end
        else if(((x==39)||(x==46)||(x==49)||(x==56))&&(y==42))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=40&&x<=45)||(x>=50&&x<=55))&&(y==42))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if((x>=47&&x<=48)&&(y==42))
            begin
                if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                            begin 
                                pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                            end
                            else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                            end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
            end
        else if(((x>=40&&x<=41)||(x>=47&&x<=48)||(x>=54&&x<=55))&&(y==43))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=42&&x<=46)||(x>=49&&x<=53))&&(y==43))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=42&&x<=44)||(x>=51&&x<=53))&&(y==44))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if((x>=45&&x<=50)&&(y==44))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if((x>=45&&x<=50)&&(y==45))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
            
            
//top left            
        else if (((x==9)&&(y==20))&&(led_light>=16'b0000_0000_0000_0001))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==8)&&(y==21))&&(led_light>=16'b0000_0000_0000_0001))
                begin
                    pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                end
        else if (((x==7)&&(y==22))&&(led_light>=16'b0000_0000_0000_0001))
                    begin
                        pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                    end
        else if (((x==6)&&(y==23))&&(led_light>=16'b0000_0000_0000_0001))
                        begin
                            pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                        end
        else if (((x>=5&&x<=9)&&(y==24))&&(led_light>=16'b0000_0000_0000_0001))
                            begin
                                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                            end
        else if (((x==8)&&(y==25))&&(led_light>=16'b0000_0000_0000_0001))
                                begin
                                    pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                end
        else if (((x==7)&&(y==26))&&(led_light>=16'b0000_0000_0000_0001))
                                    begin
                                        pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                    end
        else if (((x==6)&&(y==27))&&(led_light>=16'b0000_0000_0000_0001))
             begin
                  pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
             end
        else if (((x==5)&&(y==28))&&(led_light>=16'b0000_0000_0000_0001))
             begin
                  pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
             end
             
//bottom left             
        else if (((x==24)&&(y==40))&&(led_light>=16'b0000_0000_0000_0111))
                 begin
                     pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                 end
             else if (((x==23)&&(y==41))&&(led_light>=16'b0000_0000_0000_0111))
                     begin
                         pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                     end
             else if (((x==22)&&(y==42))&&(led_light>=16'b0000_0000_0000_0111))
                         begin
                             pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                         end
             else if (((x==21)&&(y==43))&&(led_light>=16'b0000_0000_0000_0111))
                             begin
                                 pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                             end
             else if (((x>=20&&x<=24)&&(y==44))&&(led_light>=16'b0000_0000_0000_0111))
                                 begin
                                     pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                 end
             else if (((x==23)&&(y==45))&&(led_light>=16'b0000_0000_0000_0111))
                                     begin
                                         pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                     end
             else if (((x==22)&&(y==46))&&(led_light>=16'b0000_0000_0000_0111))
                                         begin
                                             pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                         end
             else if (((x==21)&&(y==47))&&(led_light>=16'b0000_0000_0000_0111))
                  begin
                       pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                  end
             else if (((x==20)&&(y==48))&&(led_light>=16'b0000_0000_0000_0111))
                  begin
                       pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                  end   
                  
//top right                
        else if (((x==89)&&(y==20))&&(led_light>=16'b0000_0000_0000_1111))
                      begin
                          pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                      end
                  else if (((x==88)&&(y==21))&&(led_light>=16'b0000_0000_0000_1111))
                          begin
                              pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                          end
                  else if (((x==87)&&(y==22))&&(led_light>=16'b0000_0000_0000_1111))
                              begin
                                  pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                              end
                  else if (((x==86)&&(y==23))&&(led_light>=16'b0000_0000_0000_1111))
                                  begin
                                      pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                  end
                  else if (((x>=85&&x<=89)&&(y==24))&&(led_light>=16'b0000_0000_0000_1111))
                                      begin
                                          pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                      end
                  else if (((x==88)&&(y==25))&&(led_light>=16'b0000_0000_0000_1111))
                                          begin
                                              pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                          end
                  else if (((x==87)&&(y==26))&&(led_light>=16'b0000_0000_0000_1111))
                                              begin
                                                  pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                              end
                  else if (((x==86)&&(y==27))&&(led_light>=16'b0000_0000_0000_1111))
                       begin
                            pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                       end
                  else if (((x==85)&&(y==28))&&(led_light>=16'b0000_0000_0000_1111))
                       begin
                            pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                       end 
                       
//bottom right                    
     else if (((x==77)&&(y==40))&&(led_light>=16'b0000_0000_0000_0011))
         begin
             pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
         end
     else if (((x==76)&&(y==41))&&(led_light>=16'b0000_0000_0000_0011))
             begin
                 pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
             end
     else if (((x==75)&&(y==42))&&(led_light>=16'b0000_0000_0000_0011))
                 begin
                     pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                 end
     else if (((x==74)&&(y==43))&&(led_light>=16'b0000_0000_0000_0011))
                     begin
                         pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                     end
     else if (((x>=73&&x<=77)&&(y==44))&&(led_light>=16'b0000_0000_0000_0011))
                         begin
                             pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                         end
     else if (((x==76)&&(y==45))&&(led_light>=16'b0000_0000_0000_0011))
                             begin
                                 pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                             end
     else if (((x==75)&&(y==46))&&(led_light>=16'b0000_0000_0000_0011))
                                 begin
                                     pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
                                 end
     else if (((x==74)&&(y==47))&&(led_light>=16'b0000_0000_0000_0011))
          begin
               pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
          end
     else if (((x==73)&&(y==48))&&(led_light>=16'b0000_0000_0000_0011))
          begin
               pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
          end   
             //heart shape
         else if ((((x>=43&&x<=45)||(x>=49&&x<=51))&&(y==50))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                         if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                 begin 
                                                     pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                 end
                                                 else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                 begin
                                                     pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                 end
                         else if (led_light>=16'b0000_1111_1111_1111)
                         begin
                             pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                         end
                         else
                         begin
                             pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                         end
                     end
          else if ((((x>=42&&x<=46)||(x>=48&&x<=52))&&(y==51))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
          else if (((x>=41 && x<=53)&&(y==52))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end     
          else if (((x>=41 && x<=53)&&(y==53))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
          else if (((x>=42 && x<=52)&&(y==54))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
          else if (((x>=43 && x<=51)&&(y==55))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
          else if (((x>=44 && x<=50)&&(y==56))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
          else if (((x>=45 && x<=49)&&(y==57))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
          else if (((x>=46 && x<=48)&&(y==58))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
          else if (((x==47)&&(y==59))&&(led_light>=16'b0000_0000_0011_1111))
              begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
             //heart shape
          else if ((((x>=12&&x<=14)||(x>=18&&x<=20))&&(y==28))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                          if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                  begin 
                                                      pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                  end
                                                  else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                  begin
                                                      pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                  end
                          else if (led_light>=16'b0000_1111_1111_1111)
                          begin
                              pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                          end
                          else
                          begin
                              pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                          end
                      end
           else if ((((x>=11&&x<=15)||(x>=17&&x<=21))&&(y==29))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
           else if (((x>=10 && x<=22)&&(y==30))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end      
           else if (((x>=10 && x<=22)&&(y==31))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end 
           else if (((x>=11 && x<=21)&&(y==32))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
           else if (((x>=12 && x<=20)&&(y==33))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
           else if (((x>=13 && x<=19)&&(y==34))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
           else if (((x>=14 && x<=18)&&(y==35))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
           else if (((x>=15 && x<=17)&&(y==36))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
           else if (((x==16)&&(y==37))&&(led_light>=16'b0000_0000_0011_1111))
               begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
             //heart shape
           else if ((((x>=73&&x<=75)||(x>=79&&x<=81))&&(y==28))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                           if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                   begin 
                                                       pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                   end
                                                   else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                   begin
                                                       pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                   end
                           else if (led_light>=16'b0000_1111_1111_1111)
                           begin
                               pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                           end
                           else
                           begin
                               pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                           end
                       end
            else if ((((x>=72&&x<=76)||(x>=78&&x<=82))&&(y==29))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end
            else if (((x>=71 && x<=83)&&(y==30))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end      
            else if (((x>=71 && x<=83)&&(y==31))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end 
            else if (((x>=72 && x<=82)&&(y==32))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end
            else if (((x>=73 && x<=81)&&(y==33))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end
            else if (((x>=74 && x<=80)&&(y==34))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end
            else if (((x>=75 && x<=79)&&(y==35))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end
            else if (((x>=76 && x<=78)&&(y==36))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end
            else if (((x==77)&&(y==37))&&(led_light>=16'b0000_0000_0011_1111))
                begin
                            if (led_light>=16'b0000_0000_0011_1111 && led_light<16'b0000_0001_1111_1111)
                                                    begin 
                                                        pixel_data_out={5'b11101, 6'b000001, 5'b01110};//dark pink
                                                    end
                                                    else if (led_light>=16'b0000_0001_1111_1111&&led_light<16'b0000_1111_1111_1111)
                                                    begin
                                                        pixel_data_out={5'b11100, 6'b000001, 5'b11101};//purple
                                                    end
                            else if (led_light>=16'b0000_1111_1111_1111)
                            begin
                                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
                            end
                            else
                            begin
                                pixel_data_out={5'b11111, 6'b110011, 5'b11011};//pink
                            end
                        end                             
     //background                                                                                                                                                                                                                            
        else 
            begin
            if (led_light>=16'b0000_0000_0011_1111)
                pixel_data_out=16'hFF55;
            else
                pixel_data_out=16'hAEDF;
            end
    end
endmodule
