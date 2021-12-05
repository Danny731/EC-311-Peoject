`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 01:26:44 PM
// Design Name: 
// Module Name: Game_FSM
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


module Game_FSM(
    input clk,
    input reset,
    input miss, //get crashed 
    input hit, //hit the final line
    input[4:0] timer_30_in,
    input[2:0] timer_5_in,
    output [1:0] level,
    output [1:0] life,
    output [1:0] game_end,
    output timer_5_start,
    output timer_30_start
);

    parameter start_life = 2'b11;
    parameter end_life = 2'b00;
    parameter start_level = 2'b00;
    parameter end_level = 2'b11;
    parameter [1:0] s0 = 2'b00, s1=2'b01, s2 = 2'b10; //00 => still going  01 => game over   10 => YAY!Comgratz!
    
    reg [1:0] level;
    reg [1:0] life;
    reg [1:0] game_end;
    reg timer_5_start;
    reg timer_30_start;
    
    initial begin
        level = start_level;
        life = start_life;
        game_end = s0;
        timer_5_start = 1;
    end
    
    always@(posedge clk) begin
        if(reset==0)begin
            life<=start_life;
            level<=start_level;
            game_end<= s0;
            timer_5_start <= 1;
        end else begin
            if(timer_5_in == 0) begin
                timer_5_start <= 0;
                timer_30_start <=1;
            end else if(timer_30_in != 0)begin
                    if(hit==1)begin // if frog arrives the destination
                        if(level==end_level)begin
                            game_end <= s2;
                        end else begin
                            game_end <= s0;
                            level<=level+1;
                            timer_5_start <= 1;
                            timer_30_start <=0;
                        end
                    end else if(miss == 1) begin //if frog hits the car
                            if(life == 2'b01)begin
                                game_end<=s1;
                            end else begin
                                life<=life-1;
                                game_end<=s0;
                            end
                    end else begin //if frog doesn't hit the car
                            game_end <= s1;
                    end
                    
            end else begin
                timer_30_start <=0;
                if(life == 2'b01)begin
                        game_end<=s1;
                end else begin
                         life<=life-1;
                end
            end
        end
        
    end//always
endmodule