module mips (z0,z1,z2,z3,y0,y1,y2,y3,x0,x1,x2,x3,CLK,LD1,LD2,S); 
//top level entity that calls other modules

input  x0,x1,x2,x3,LD1,LD2,CLK,S; //takes a 4 inputs for the instruction + load 1, load 2 and a clock
output [6:0] y0,y1,y2,y3,z1,z2,z3,z0; //writes the result as hex in the 7-segment display
wire [3:0] s0,s1,s2,s3;
wire [15:0] ac;
wire [15:0]Ti;

hexins(s0,s1,s2,s3,x0,x1,x2,x3); //takes the four input from the buttons and returns a number to be writteen on the displays
seven_segment_decoder(s0,y0); // encode the first 4 bits as hex
seven_segment_decoder(s1,y1); // encode the second 4 bits as hex
seven_segment_decoder(s2,y2); // encode the third 4 bits as hex
seven_segment_decoder(s3,y3); // encode the fourth 4 bits as hex

seq_counter(Ti,CLK); // module gives out timing signal Ti
controll(ac,s,s0,s1,s2,s3,LD1,LD2,Ti); // module that executes the instructions and outputs the result
hexout(z0,ac[3:0]); // encode the first 4 bits of the output as hex
hexout(z1,ac[7:4]); // encode the second 4 bits of the output as hex
hexout(z2,ac[11:8]); // encode the third 4 bits of the output as hex
hexout(z3,ac[15:12]); // encode the fourth 4 bits of the output as hex

endmodule 







