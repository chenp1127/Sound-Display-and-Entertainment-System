`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): WEDNESDAY A.M
//
//  STUDENT A NAME: JESSLYN
//  STUDENT A MATRICULATION NUMBER: A0202403A 
//
//  STUDENT B NAME: CHENG PENG
//  STUDENT B MATRICULATION NUMBER: A0202361X
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    input basys_clock,
    
    input centre_pb,left_pb,right_pb,up_pb,down_pb,
    input mux_switch,menu_switch, 
    input SW_15, SW_14, SW_13,SW_12,SW_11,SW_7, SW_8, SW_10,SW_2, //SW2 for changing refreshing leds in menu system 
                                                                  // SW8: OLED all off
    output reg[15:0]led = 0,
    output rgb_cs,rgb_sdin,rgb_sclk,rgb_d_cn,rgb_resn,rgb_vccen,rgb_pmoden,
    
    output [3:0] an, 
    output [7:0] seg
    );
    
    // For OLED
    wire clk_6p25m, clk_12p5m, clk_50h, pbc_reset;   //left side
    wire frame_begin,sending_pixels,sample_pixel,test_state; wire [12:0] pixel_index;
    reg [15:0] pixel_data = 0;
    wire [15:0] pixel_data_out;
    
    //OLED improvement Torture - ChenPeng
    wire [15:0] pixeldata_pikachu_volume;
    wire [15:0] pixeldata_pikachu_screensaver;
    
    // For Audio - Jess
    wire clk_20khz, clk_3hz, clk_10hz, clk_700hz, clk_200hz, clk_1hz;
    wire clk_5hz,clk_7hz, clk_12hz, clk_14hz, clk_15hz, clk_18hz, clk_20hz, clk_23hz, clk_25hz, clk_30hz, clk_35hz;  // CLOCK FOR RAIN
    wire [11:0] mic_in;
    wire [15:0] audio_wire;
    wire [4:0] volume_level;
    wire [1:0] counter_output_segment;
    
    // Audio Improvement Torture - Jess
    wire [15:0] pixel_data_wave1; // output of wave_one module
    wire [15:0] pixel_data_wave2;
    wire [15:0] pixel_data_bar1; // output of bar_wave module
    wire [15:0] pixel_data_menu_color;
    wire [15:0] pixel_data_screensaver;
    wire [15:0] pixel_data_rain;
    
    wire [7:0]coordinate_x; 
    wire [6:0]coordinate_y;
    
    wire sp_left,sp_right,sp_centre, sp_up, sp_down;
    wire sp_left_menu,sp_right_menu,sp_centre_menu, sp_up_menu, sp_down_menu;
    wire [2:0] menu_selection; // output from menu jess module
    wire [19:0] selected_count; // output from audio_volume to be sent to 7segment to display the sampling level
    
    reg rain_f1=0, rain_f2 =0,rain_f3=0,rain_f4=0,rain_f5=0;
    
    wire pause_clock;
    assign pause_clock=(SW_10==1)?1:basys_clock;
    
    // Clock
    clk_divider unit_1hz(basys_clock, 49999999, clk_1hz);
    clk_divider unit_3hz(basys_clock, 16666665, clk_3hz);
    clk_divider unit_50hz(basys_clock, 999999 ,clk_50h);
    clk_divider unit_200hz(basys_clock, 249999 ,clk_200hz);
    clk_divider unit_700hz(basys_clock, 71428, clk_700hz); // refresh clock for 7 segment
    clk_divider unit_12p5m(basys_clock,3, clk_12p5m); //12.5mhz
    clk_divider unit_6p25m(pause_clock,7, clk_6p25m); //6.25Mhz ClK
    clk_divider unit_20kh(basys_clock, 2499, clk_20khz ); //20khz to be send to audio capture
    
    // CLock for my rain
    clk_divider unit_5hz(basys_clock,  9999999, clk_5hz);
    clk_divider unit_7hz(basys_clock,  7142856, clk_7hz);
    clk_divider unit_10hz(basys_clock, 4999999, clk_10hz);
    clk_divider unit_12hz(basys_clock, 4166665, clk_12hz);
    clk_divider unit_14hz(basys_clock, 3571427, clk_14hz);
    clk_divider unit_15hz(basys_clock, 3333332, clk_15hz);
    clk_divider unit_18hz(basys_clock, 2777776, clk_18hz);
    clk_divider unit_20hz(basys_clock, 2499999, clk_20hz);
    clk_divider unit_23hz(basys_clock, 2173912, clk_23hz);
    clk_divider unit_25hz(basys_clock, 1999999, clk_25hz);
    clk_divider unit_30hz(basys_clock, 1666665, clk_30hz);
    clk_divider unit_35hz(basys_clock, 1428570, clk_35hz);
       
    // Chen Peng
    single_pulse_module unit_reset(centre_pb,clk_50h,pbc_reset);   // single pulse 
    Oled_Display unit_oled (.clk(clk_6p25m),.reset(pbc_reset),.frame_begin(frame_begin), 
                            .sending_pixels(sending_pixels),.sample_pixel(sample_pixel),.pixel_index(pixel_index), 
                            .pixel_data(pixel_data),.cs(rgb_cs),.sdin(rgb_sdin),.sclk(rgb_sclk),.d_cn(rgb_d_cn),.resn(rgb_resn), 
                            .vccen(rgb_vccen),.pmoden(rgb_pmoden),.teststate(test_state));
    led_mux unit_oled_volume(clk_6p25m, SW_15, SW_14, SW_13,pixel_index, pixel_data_out, audio_wire, SW_12,SW_11); 
    
    // Chen-Peng NightMare 
    pikachu_volume unit_pikachu_volume(pixel_index,pixeldata_pikachu_volume,clk_6p25m,audio_wire);
    pikachu_welcome unit_pikachu_screensaver(pixel_index,pixeldata_pikachu_screensaver,clk_6p25m);
    
    // Jess Basic Requirement
    Audio_Capture unit_audio(basys_clock, clk_20khz, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    audio_volume unit_volume(mic_in, clk_20khz, clk_50h,sp_left_menu,sp_right_menu,SW_2,mux_switch, audio_wire, volume_level, selected_count); // volume level goes to 7 segment, as well as OLED when needed
    my_segment_counter unit_counter_seg(clk_700hz, counter_output_segment);
    seven_segment_control unit_segment(basys_clock, clk_10hz, clk_700hz, counter_output_segment,volume_level,selected_count,an,seg, mic_in, mux_switch);
    
    // Jess Nightmare 
    single_pulse_module unit_pbleft(left_pb, clk_20khz,sp_left);   // single pulse 
    single_pulse_module unit_pbright(right_pb, clk_20khz,sp_right);   // single pulse
    single_pulse_module unit_pbcentre(centre_pb, clk_20khz,sp_centre);   // single pulse 
    single_pulse_module unit_pbup(centre_pb, clk_20khz,sp_up);
    single_pulse_module unit_pbdown(centre_pb, clk_20khz,sp_down);
    
    single_pulse_module unit_pbleft_menu(left_pb, clk_50h,sp_left_menu);   // single pulse 
    single_pulse_module unit_pbright_menu(right_pb, clk_50h,sp_right_menu);   // single pulse
    single_pulse_module unit_pbcentre_menu(centre_pb, clk_50h,sp_centre_menu);   // single pulse 
    single_pulse_module unit_pbup_menu(up_pb, clk_50h,sp_up_menu);
    single_pulse_module unit_pbdown_menu(down_pb, clk_50h,sp_down_menu);
    
    pix_xy unit_convertxy (pixel_index, coordinate_x, coordinate_y);
    wave_one unit_wave_notshaded(mic_in, clk_12p5m, clk_20khz,clk_50h, sp_up_menu,sp_down_menu,SW_10,pixel_index,pixel_data_wave1);
    wave_two unit_wave_shaded(mic_in, clk_12p5m, clk_20khz,SW_10,pixel_index,pixel_data_wave2);
    bar_wave unit_bar_wave(clk_12p5m, clk_20khz, clk_50h, coordinate_x, coordinate_y, volume_level, sp_left, sp_centre, sp_right, sp_down_menu, sp_up_menu, menu_switch, SW_2,SW_10, pixel_data_bar1,selected_count);
    me_n_u_jess unit_menu(clk_12p5m, clk_50h,clk_5hz,coordinate_x, coordinate_y, 
                          pixel_data_wave1,pixel_data_wave2,pixel_data_bar1,pixeldata_pikachu_volume, pixeldata_pikachu_screensaver,pixel_data_screensaver,pixel_data_rain,
                          SW_2,
                          sp_left_menu, sp_up_menu, sp_right_menu, sp_down_menu, sp_centre_menu,menu_switch,
                          pixel_data_menu_color,menu_selection); 
    
    screensaver unit_screensaver(clk_12p5m,clk_1hz,coordinate_x,coordinate_y,volume_level,menu_switch,SW_2,pixel_data_screensaver);
    raindrop unit_rain(clk_12p5m,rain_f1,rain_f2,rain_f3,rain_f4,rain_f5,clk_20hz,clk_3hz, coordinate_x,coordinate_y,volume_level,menu_switch,SW_2,SW_10,left_pb,right_pb,down_pb,pixel_data_rain);
    
    reg [1:0] screensaverMode = 0;
    reg [10:0] screen_counter =0;
    reg startup = 1;
    reg [10:0] startup_counter = 0;
   
    
    always@(posedge clk_5hz)
    begin
        startup_counter <= (startup_counter >= 25) ? 0: startup_counter +1;
        
        
        if (startup_counter >= 25)
        begin    
            startup <= 0;
            screen_counter <= 0;
        end
        
        // For screensaver
        if (volume_level <= 5) // if volume less than 5 for (50 * 0.2 = 10 s)
        begin
            screen_counter <= (screen_counter >= 75) ? 75 : screen_counter + 1;              
        end
        else
        begin
            screen_counter <= 0;
        end
    end

   always@(posedge clk_12p5m) // every 12.5mhz it will keep changing the register value
   begin
   if (SW_8 == 1) pixel_data <= 0;
   else
   begin
        if (startup == 1) begin pixel_data <= pixeldata_pikachu_screensaver; end
        else // startup picture already shown for some seconds
        begin
            led <= audio_wire;  // Both JC and CP part
            
        if (screen_counter >= 75)
        begin
            pixel_data <= pixel_data_screensaver;                    
        end    
        else
        begin    
            if (SW_7 == 1)      // CP part
            begin
                pixel_data <= pixel_data_out;
            end
            else    // JC part
            begin
                pixel_data <= pixel_data_menu_color;
            end // else: do JC part
        end // else: no screensaver
            
        end // else: startup phase over
    end // else: screen not off    

    // for rain
    if (volume_level >= 0 && volume_level <=5)
    begin
        rain_f1 <= clk_14hz;
        rain_f2 <= clk_7hz;
        rain_f3 <= clk_12hz;
        rain_f4 <= clk_10hz;
        rain_f5 <= clk_5hz;
    end

    else if (volume_level >= 6 && volume_level <=10)
    begin
        rain_f1 <= clk_15hz;
        rain_f2 <= clk_20hz;
        rain_f3 <= clk_12hz;
        rain_f4 <= clk_18hz;
        rain_f5 <= clk_14hz;
    end
    
    else if (volume_level >= 11 && volume_level <=16)
    begin
        rain_f1 <= clk_35hz;
        rain_f2 <= clk_25hz;
        rain_f3 <= clk_20hz;
        rain_f4 <= clk_23hz;
        rain_f5 <= clk_30hz;
    end

    end // always block
endmodule