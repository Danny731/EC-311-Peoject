`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 02:08:19 PM
// Design Name: 
// Module Name: TOP
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


module TOP(
    input in_clk,
    input reset,
    input miss,
    input hit,
    output [1:0] level,
    output [1:0] life,
    output [1:0] game_end,
    output [6:0]seven,
    output [7:0] digit_select
    );
    
    assign digit_select = 8'b11111110;
    wire timer_5_start, timer_30_start;
    wire clk;
    wire[2:0] timer_5_out;
    wire[4:0] timer_30_out;
    
    clock_divider_1Hz(in_clk, clk);
    timer_5s timer_5(clk,reset,timer_5_start,timer_5_out);
    timer_30s timer_30(clk,reset,timer_30_start,timer_30_out);
    Game_FSM game(clk,reset,miss,hit,timer_30_out,timer_5_out,level,life,game_end,timer_5_start,timer_30_start);
    seven_segment_decoder seven1(timer_5_out,seven);
endmodule
