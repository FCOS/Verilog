`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:06:16 02/02/2017 
// Design Name: 
// Module Name:    barrel8 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module barrel8(
input wire [7:0] start,
input wire [2:0] shift,
input wire right, //if right is high, rotate right, else rotate left
output reg [7:0] result
    );
	 
always @*

	case(right) //csae statement, concerning the input wire 'right'
		1'b1: //rotate right
		case(shift)
			2'd01: result = {start[0], start[7:1]}; //if decimal value for shift is 1
			2'd02: result = {start[1:0], start[7:2]};//Rotate works by taking 'shift' elements
			2'd03: result = {start[2:0], start[7:3]};//off the end of the end of the 8 bit input,
			2'd04: result = {start[3:0], start[7:4]};//and replaces them at the start, eg [543210] -> [105432]
			2'd05: result = {start[4:0], start[7:5]};
			2'd06: result = {start[5:0], start[7:6]};//do this manually for each possibility
			2'd07: result = {start[6:0], start[7]};
			default: result = start;
		endcase
		1'b0: //rotate left
		case(shift)
			2'd01: result = {start[6:0], start[7]};
			2'd02: result = {start[5:0], start[7:6]};
			2'd03: result = {start[4:0], start[7:5]};
			2'd04: result = {start[3:0], start[7:4]};
			2'd05: result = {start[2:0], start[7:3]};
			2'd06: result = {start[1:0], start[7:2]};
			2'd07: result = {start[0], start[7:1]};
			default: result = start;
		endcase
	endcase

endmodule
