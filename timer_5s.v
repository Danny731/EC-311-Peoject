`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 01:47:54 PM
// Design Name: 
// Module Name: timer_5s
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


module timer_5s(
    input clk,
    input reset,
    input  timer_5_start,
    output[2:0] out
    );
    
    reg[2:0] out = 3'b101;
    parameter max = 3'b101;
    reg count =0;
    
    always@(posedge clk)begin
        if(timer_5_start == 1) begin
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
    end
endmodule

