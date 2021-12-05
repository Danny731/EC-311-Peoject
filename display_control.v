`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 02:14:01 PM
// Design Name: 
// Module Name: display_control
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


module display_control(clk_1k,count,digit_select,binary_num,select);
    input clk_1k;
    input[15:0] count;
    output[3:0] digit_select,binary_num;
    output [1:0] select;
    
    reg [1:0] internal_count;
    wire[1:0] select;
    parameter[3:0] an0 = 4'b1110, an1=4'b1101,an2 = 4'b1011, an3=4'b0111;
    
    initial begin 
        internal_count=2'b0;
    end
    always@(posedge clk_1k) begin
        if(clk_1k == 1) begin
            internal_count <=internal_count+1'b1;
        end
    end//always
    
    assign select = internal_count;
    
    mux m1(an0,an1,an2,an3,select,digit_select);
    mux m2(count[3:0],count[7:4],count[11:8],count[15:12],select, binary_num);
    
endmodule


module mux(i0,i1,i2,i3,select,out);
    input[3:0] i0,i1,i2,i3;
    input[1:0] select;
    output[3:0] out;
    
    reg[3:0] out;
    
    always@(*) begin
        case(select)
            2'b00: out<=i0;
            2'b01: out<=i1;
            2'b10: out<=i2;
            2'b11: out<=i3;
        endcase
   end//always
endmodule
