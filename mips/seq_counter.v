module seq_counter(Ti,CLK);

output [15:0] Ti;
input CLK;
wire [3:0] SC;
counter c0(CLK,SC);
sc_decoder s0(SC,Ti);

endmodule



