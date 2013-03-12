module hexout(segments,num);
input[3:0]num;
output[6:0]segments;
reg [6:0] segments;
always@(num)
begin
case (num)
4'b0000: segments <= ~7'b0111111; // "6 5 4 3 2 1 0"
4'b0001: segments <= ~7'b0000110;
4'b0010: segments <= ~7'b1011011; // --0--
4'b0011: segments <= ~7'b1001111; // | |
4'b0100: segments <= ~7'b1100110; // 5 1
4'b0101: segments <= ~7'b1101101; // | |
4'b0110: segments <= ~7'b1111101; // --6--
4'b0111: segments <= ~7'b0000111; // | |
4'b1000: segments <= ~7'b1111111; // 4 2
4'b1001: segments <= ~7'b1101111; // | |
4'b1010:segments <= ~7'b1110111;
4'b1011:segments <= ~7'b0011111;
4'b1100:segments <= ~7'b1001110;
4'b1101:segments <= ~7'b0111101;
4'b1110:segments <= ~7'b1001111;
4'b1111:segments <= ~7'b1000111;
default: segments <= 7'bx; // --3--
endcase
end
endmodule 