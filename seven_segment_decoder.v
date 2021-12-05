`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 02:12:44 PM
// Design Name: 
// Module Name: seven_segment_decoder
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

module seven_segment_decoder(in, segment);
    input[3:0] in;
    output[6:0] segment;
    reg[6:0] segment; 
    
    always@(*)begin
        case(in)
            4'b0000: segment =7'b0000001; //0
            4'b0001: segment = 7'b1001111;//1
            4'b0010: segment = 7'b0010010;//2
            4'b0011: segment = 7'b0000110;//3
            4'b0100: segment = 7'b1001100;//4
            4'b0101: segment = 7'b0100100;//5
            4'b0110: segment = 7'b0100000;//6
            4'b0111: segment = 7'b0001111;//7
            4'b1000: segment = 7'b0000000;//8
            4'b1001: segment = 7'b0001100;//9
            4'b1010: segment = 7'b0001000;//A
            4'b1011: segment = 7'b1100000;//b
            4'b1100: segment = 7'b0110001;//c
            4'b1101: segment = 7'b1000010;//d
            4'b1110: segment = 7'b0110000;//e
            4'b1111: segment = 7'b0111000;//f
        endcase
     end//always
 
endmodule
