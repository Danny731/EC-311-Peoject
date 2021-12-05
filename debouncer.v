`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 02:14:44 PM
// Design Name: 
// Module Name: debouncer
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

module debouncer( 
global_clock, 
reset,
button_in,
button_out );
    input global_clock,reset, button_in;
    output reg button_out = 1'b0;
    
    reg[9:0] deb_count =10'b0;
    reg deb_count_start, output_exist;
    wire [9:0] max= 10'b1111111111;
   
   initial begin
        button_out = 1'b0;
        deb_count  = 10'b0;
        deb_count_start = 1'b0;
        output_exist =1'b0;
    end
        
   always@(posedge global_clock)begin
        if(reset == 1) begin
            if (button_in == 1) begin
                if (output_exist ==0) begin
                    if(deb_count_start==0) begin
                        deb_count_start <=1'b1;
                        deb_count<=deb_count+1'b1;
                    end else begin
                        deb_count <= deb_count+1'b1;
                    end
                    if(deb_count == max) begin
                        button_out <= 1'b1;
                        deb_count_start <=1'b0;
                        deb_count <=1'b0;
                        output_exist <=1'b1;
                    end
                end else begin
                    button_out <= 1'b0;
                end
            end else begin
                button_out <= 1'b0;
                deb_count_start <=1'b0;
                deb_count <= 1'b0;
                output_exist <=1'b0;
            end
        end else begin
            deb_count<=1'b0;
            deb_count_start <=1'b0;
            output_exist <= 1'b0;
            button_out<= 1'b0;
        end
    end//always
                    
endmodule
