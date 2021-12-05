`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 05:23:00 PM
// Design Name: 
// Module Name: clk_divider
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


module clock_divider_1Hz(clk,out_clk_1Hz);
    input clk;
    output out_clk_1Hz;
    
    parameter [25:0] max = 26'b10111110101111000010000000;
    reg [25:0] count; 
    reg out_clk_1Hz;
    
    initial count = 26'b0;
    initial out_clk_1Hz = 1'b0;
    
    always@(posedge clk) begin
        
        count<=count+1'b1;
        if(count == max) begin
            out_clk_1Hz<=~out_clk_1Hz;
            count <= 26'b0;
        end
    end//always
    
    
endmodule
