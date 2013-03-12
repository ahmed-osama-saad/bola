module opcode_decoder(Di,opcode);

	output [7:0] Di;
	reg [7:0] Di;

	input [2:0] opcode;

	always @ (opcode)
		
		case(opcode)
		
		3'b000 : Di = 8'b0000_0001;
		3'b001 : Di = 8'b0000_0010;
		3'b010 : Di = 8'b0000_0100;
		3'b011 : Di = 8'b0000_1000;
		3'b100 : Di = 8'b0001_0000;
		3'b101 : Di = 8'b0010_0000;
		3'b110 : Di = 8'b0100_0000;
		3'b111 : Di = 8'b1000_0000;

		default : Di = 8'b0000_0000;
		endcase

endmodule
