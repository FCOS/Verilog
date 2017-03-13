`timescale 1ns / 1ps

module ALU(
    input wire [3:0] sel,
	 input [5:0] A,
	 input [5:0] B,
    output wire [5:0] X
    );
	
	//create internal wires. These will carry outputs of their respective modules.
	wire [5:0] xor_result;
	wire [5:0] set_const_result;
	wire [5:0] reg_opperation_result;
	wire [5:0] shift_result;
	wire [5:0] sum_result;
	wire [5:0] GTE;
	
	//output of 'output logic' block. Takes on value of one of the above
	reg [5:0] result;
	
	//Instansiate all modules
	
	
	XOR_6bit xor_6bit (.A(A), .B(B), .X(xor_result));	//XOR
	set_const set_const (.sel(sel[0]), .X(set_const_result));	//Set_const - outputs all 0's or 1's
	reg_opperator reg_opperator (.sel(sel), .A(A), .B(B), .X(reg_opperation_result));	//reg_opperator - outputs A, ~A or -A (and B)
	shifter_3bit_right shifter_3bit_right (.sel(sel), .A(A), .B(B), .X(shift_result));	//shifter - shifts number 3 bits to the right
	Carry_adder Carry_adder (.sel(sel), .A(A), .B(B), .X(sum_result));	//carry_adder - adds and subtracts
	GTE_6bit GTE_6bit (.A(A), .B(B), .X(GTE));	//GTE - checks if A is greater than B (unsigned)
	
	
	//otuput logic block - chooses which value to output from instanciated modules
	always @*
		case (sel)
			4'b0000 : result = set_const_result;				//all zeroes
			4'b0001 : result = reg_opperation_result;			//A
			4'b0010 : result = reg_opperation_result;			//B
			4'b0011 : result = GTE;									//A >= B
			4'b0100 : result = reg_opperation_result;			//-A
			4'b0101 : result = reg_opperation_result;			//-B
			4'b0110 : result = shift_result;						//A rotate
			4'b0111 : result = shift_result;						//B rotate
			4'b1000 : result = xor_result;						//A XOR B
			4'b1001 : result = reg_opperation_result;			//not A
			4'b1010 : result = reg_opperation_result;			//not B
			4'b1011 : result = sum_result;						//A-B
			4'b1100 : result = sum_result;						//A+B
			4'b1111 : result = set_const_result;				//all ones
		endcase
	
	//assign output
	assign X = result;

endmodule
