/*module hexins (y0,y1,y2,y3,x);
input [3:0] x;
output [3:0] y0, y1, y2, y3;
reg  [3:0] y0, y1, y2, y3;
initial
begin
 y0 = 4'b0000;
 y1 = 4'b0000;
 y2 = 4'b0000;
 y3 = 4'b0000;
end
always @(x)
begin
	case(x)
	4'b1110 : begin if(y0 == 4'b1111)y0 <= 4'b0000; else  y0 <= y0+1'b1; end
	4'b1101 : begin if(y1 == 4'b1111)y1 <= 4'b0000; else  y1 <= y1+1'b1; end
	4'b1011 : begin if(y2 == 4'b1111)y2 <= 4'b0000; else  y2 <= y2+1'b1; end
	4'b0111 : begin if(y3 == 4'b1111)y3 <= 4'b0000; else  y3 <= y3+1'b1; end
	default begin y0 <= y0; y1 <= y1; y2 <= y2; y3 <= y3; end
	endcase
	
 end
 
endmodule */

module hexins (y0,y1,y2,y3,x0,x1,x2,x3);
input x0, x1, x2, x3;
output [3:0] y0, y1, y2, y3;
reg [3:0] y0, y1, y2, y3;
initial
begin
 y0 <= 4'b0000;
 y1 <= 4'b0000;
 y2 <= 4'b0000;
 y3 <= 4'b0000;
end
/*always @ (negedge reset)
 begin
 y0 <= 4'b0000;
 y1 <= 4'b0000;
 y2 <= 4'b0000;
 y3 <= 4'b0000;
 end*/
 
always @(negedge x0 )
 begin
 if(y0 == 4'b1111)y0 <= 4'b0000; 
 else y0 <= y0+1;
 end
always @(negedge x1)
begin
 if(y1 == 4'b1111)y1 <= 4'b0000; 
 else y1 <= y1+1;
 end
always @(negedge x2)
begin
 if(y2 == 4'b1111)y2 <= 4'b0000; 
 else y2 <= y2+1;
 end 
 always @(negedge x3)
begin
 if(y3 == 4'b1111)y3 <= 4'b0000; 
 else y3 <= y3+1;
 end
endmodule 