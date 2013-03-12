//-----------------------------------------------------
// Design Name : Sequence Counter
// File Name   : counter.v
// Function    : 4 bit up counter
// Coder       : mods
//-----------------------------------------------------
module counter (CLK, SC);
input CLK;
output [3:0] SC;
reg [3:0] SC;                                   

always @ (posedge CLK)
	
	
		if (SC == 4'b1111)
			SC = 0;
	else
		SC = SC + 1;	
	

endmodule  

