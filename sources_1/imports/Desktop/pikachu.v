`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 12:37:05 AM
// Design Name: 
// Module Name: pikachu
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

//Change some && to || !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
module pikachu_welcome(input [12:0] pixel_index,output reg [15:0] pixel_data_out, input clock);
    wire [12:0] x;
    wire [12:0] y;
    x_axies(pixel_index, x, clock); // formula convert 12 bit to x value
    y_axies(pixel_index, y, clock);
    always@(posedge clock)
    begin
        if (((x>=34 && x<=35) || (x>=60 && x<=61))&&(y==7))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000}; //black
            end
        else if (((x>=34 && x<=37)||(x>=58 && x<=61))&&(y==8))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000}; //black
            end
        else if (((x>=34 && x<=36)||(x==38)||(x==57)||(x>=59&&x<=61))&&(y==9))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x==37) || (x==58)) && (y==9))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x>=34 && x<=36) || (x>=59 && x<=61) || (x>=39 && x<=40) || (x>=55 && x<=56)) && (y==10))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37&&x<=38) || (x>=57 && x<=58)) &&(y==10))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x>=35&&x<=36)||(x==41) || (x==54) || (x>=59&&x<=60)) &&(y==11))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37 && x<=40) || (x>=55&&x<=58)) && (y==11))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x>=35 && x<=36) || (x>=42 && x<=43) || (x>=46 && x<=49) || (x>=52&&x<=53) || (x>=59&&x<=60)) && (y==12))    
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37 && x<=41) || (x>=54 && x<=58)) && (y==12))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==36)||(x>=44 && x<=45)||(x>=50&&x<=51)||(x==59))&&(y==13))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if (((x>=37 && x<=43)||(x>=46&&x<=49)||(x>=52&&x<=58))&&(y==13))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==36)||(x==59))&&(y==14))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if ((x>=37 && x<=58)&&(y==14))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==37)||(x==58))&&(y==15))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if ((x>=38 && x<=57)&&(y==15))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if (((x==38)||(x==40)||(x==55)||(x==57))&&(y==16))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x==39)||(x==56)||(x>=41&&x<=54))&&(y==16))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==39)||(x==56))&&(y==17))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if((x>=40 && x<=55)&&(y==17))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==39)||(x==56))&&(y==18))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if((x>=40 && x<=55)&&(y==18))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x>=42&&x<=43)||(x>=52&&x<=53)||(x==57))&&(y==19))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=41)||(x>=44&&x<=51)||(x>=54&&x<=56))&&(y==19))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x==41)||(x>=43&&x<=44)||(x>=51&&x<=52)||(x==54)||(x==57))&&(y==20))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=40)||(x>=45&&x<=50)||(x>=55&&x<=56))&&(y==20))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x>=41&&x<=44)||(x>=51&&x<=54)||(x==57))&&(y==21))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=40)||(x>=45&&x<=50)||(x>=55&&x<=56))&&(y==21))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==38)||(x>=42&&x<=43)||(x>=47&&x<=48)||(x>=52&&x<=53)||(x==57))&&(y==22))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=39&&x<=41)||(x>=44&&x<=46)||(x>=49&&x<=51)||(x>=54&&x<=56))&&(y==22))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x==37)||(x==58))&&(y==23))
            begin
               pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black 
            end
        else if(((x>=38&&x<=39)||(x>=42&&x<=53)||(x>=56&&x<=57))&&(y==23))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=40&&x<=41)||(x>=54&&x<=55))&&(y==23))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if(((x==37)||(x==45)||(x>=47&&x<=48)||(x==50)||(x==58))&&(y==24))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black 
            end
        else if(((x==38)||(x>=43&&x<=44)||(x==46)||(x==49)||(x>=51&&x<=52)||(x==57))&&(y==24))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=39&&x<=42)||(x>=53&&x<=56))&&(y==24))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if(((x==37)||(x>=46&&x<=49)||(x==58))&&(y==25))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black 
            end
        else if(((x==38)||(x>=43&&x<=45)||(x>=50&&x<=52)||(x==57))&&(y==25))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=39&&x<=42)||(x>=53&&x<=56))&&(y==25))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if(((x==38)||(x==46)||(x==49)||(x==57))&&(y==26))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x==39)||(x>=42&&x<=45)||(x>=50&&x<=53)||(x==56))&&(y==26))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=40&&x<=41)||(x>=47&&x<=48)||(x>=54&&x<=55))&&(y==26))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if(((x==39)||(x==46)||(x==49)||(x==56))&&(y==27))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=40&&x<=45)||(x>=50&&x<=55))&&(y==27))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if((x>=47&&x<=48)&&(y==27))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if(((x>=40&&x<=41)||(x>=47&&x<=48)||(x>=54&&x<=55))&&(y==28))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if(((x>=42&&x<=46)||(x>=49&&x<=53))&&(y==28))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if(((x>=42&&x<=44)||(x>=51&&x<=53))&&(y==29))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
        else if((x>=45&&x<=50)&&(y==29))
            begin
                pixel_data_out={5'b11111, 6'b111111, 5'b00000};//yellow
            end
        else if((x>=45&&x<=50)&&(y==30))
            begin
                pixel_data_out={5'b00000, 6'b000000, 5'b00000};//black
            end
            
        //I    
        else if ((x>=30&&x<=36)&&(y==43))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end
        else if ((x==33)&&(y==44))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};
            end
        else if ((x==33)&&(y==45))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};
            end
        else if ((x==33)&&(y==46))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};
            end
        else if ((x==33)&&(y==47))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};
            end
        else if ((x==33)&&(y==48))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};
            end
        else if ((x==33)&&(y==49))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};
            end
        else if ((x==33)&&(y==50))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};
           end
        else if ((x>=30&&x<=36)&&(y==51))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end
        //heart shape
        else if (((x>=43&&x<=45)||(x>=48&&x<=51))&&(y==43))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if (((x>=42&&x<=46)||(x>=48&&x<=52))&&(y==44))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if ((x>=41 && x<=53)&&(y==45))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end      
        else if ((x>=41 && x<=53)&&(y==46))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end 
        else if ((x>=42 && x<=52)&&(y==47))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if ((x>=43 && x<=51)&&(y==48))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if ((x>=44 && x<=50)&&(y==49))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if ((x>=45 && x<=49)&&(y==50))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if ((x>=46 && x<=48)&&(y==51))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
        else if ((x==47)&&(y==52))
            begin
                pixel_data_out={5'b11111, 6'b000000, 5'b00000};//red
            end
 
        //E
        else if ((x>=58&&x<=64)&&(y==43))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end           
        else if ((x==58)&&(y==44))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end   
        else if ((x==58)&&(y==45))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end 
        else if ((x==58)&&(y==46))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end 
        else if ((x>=58&&x<=64)&&(y==47))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end 
        else if ((x==58)&&(y==48))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end
        else if ((x==58)&&(y==49))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end 
        else if ((x==58)&&(y==50))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end 
        else if ((x>=58&&x<=64)&&(y==51))
            begin
                pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
            end
        else if ((x>=69&&x<=75)&&(y==43))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end           
            else if ((x==69)&&(y==44))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end   
            else if ((x==69)&&(y==45))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end 
            else if ((x==69)&&(y==46))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end 
            else if ((x>=69&&x<=75)&&(y==47))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end 
            else if ((x==69)&&(y==48))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end
            else if ((x==69)&&(y==49))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end 
            else if ((x==69)&&(y==50))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end 
            else if ((x>=69&&x<=75)&&(y==51))
                begin
                    pixel_data_out={5'b01000, 6'b111101, 5'b11111};//sky blue
                end
            else 
                begin
                    pixel_data_out=16'hFB2C;//blush red
                end
    end
endmodule
