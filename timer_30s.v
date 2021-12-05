`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 01:57:21 PM
// Design Name: 
// Module Name: timer_30s
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


module timer_30s(
    input clk,
    input reset,
    input timer_30_start,
    output[4:0] out
    );
    
    reg[4:0] out = 5'b11110;
    parameter max = 5'b11110;
    reg count =0;
    
    always@(posedge clk)begin
        if(timer_30_start==1)begin 
            if(reset == 0) begin
                out <= max;
            end else if (out == 0) begin
                out<=out;
            end else begin
                out <= out-1;
            end
            count<=count+1;
        end else begin
            out<=max;
        end
    end//always
endmodule
