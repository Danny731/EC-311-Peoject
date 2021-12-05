`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 11:19:00 AM
// Design Name: 
// Module Name: position
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


module position(
    input up,
    input down,
    input left,
    input right,
    input clk,
    input reset,
    input cp_x,
    input cp_y,
    output np_x,
    output np_y
    );
   
    reg np_x, np_y;
    parameter max_x = 640, max_y = 480, min = 1;
    
    
    always@(posedge clk)begin
        if (reset == 0)begin
           // np_x <= ;
            //np_u <= ;
        end else begin
            if (cp_y == max_y) begin
                if(down == 1) begin
                    np_y <= cp_y;
                    np_x<=cp_x;
                end
            end else if (cp_y == min) begin
                if (up == 1) begin
                    np_y <= cp_y;
                    np_x<=cp_x;
                end
            end else if (cp_x == max_x) begin
                if(right == 1) begin
                    np_y <= cp_y;
                    np_x<=cp_x;
                end
            end else if(cp_x == min) begin
                if (left == 1) begin
                    np_y <= cp_y;
                    np_x<=cp_x;
                end
            end else begin
                case({up, down,left, right})
                    4'b1000: begin
                        np_y <= cp_y-1;
                        np_x <= cp_x;
                    end
                    4'b0100: begin
                         np_y <= cp_y+1;
                         np_x <= cp_x;
                    end
                    4'b0010: begin 
                        np_y <= cp_y;
                        np_x <= cp_x-1;
                    end
                    4'b0001: begin
                        np_y <= cp_y;
                        np_x <= cp_x+1;
                    end
                    default: begin
                        np_y <= cp_y;
                        np_x <= cp_x;
                    end
                endcase
            end
        end
                
    end
    
endmodule
