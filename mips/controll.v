module controll(AC,S,s0,s1,s2,s3,LD1,LD2,Ti);
/*
7 segment code should be here with inputs as above */

/*
must connect output AC to 7 segment displays too however not all instructions manipulate AC and must remember location
of every variable in mem. Lastly, memory by default starts storing instructions places on seven segment displays in M[0] 
then M[1], M[2] .... therefore should not be too hard to guess locs */


output [15:0] AC;
reg [15:0] AC;

input S,LD1,LD2;
input [15:0]Ti;
input [3:0] s0,s1,s2,s3;
wire [7:0] Di;

reg I;

//reg INC,CLR;
//wire [15:0] Ti;

//seq_counter(Ti,INC,CLR,clk);

reg [11:0] AR,PC;
reg [15:0] IR,DR;
reg [15:0] M[0:20]; 

/*initial
begin
M [0] = 16'b0001_0000_0000_0001;
M [1] = 16'b0000_0000_0000_0001;
PC = 12'b0000_0000_0000;
AC = 16'b0000_0000_0000_0001;
IR = 0;
AR = 0;
DR = 0;
end*/




parameter T0 = 0000_0000_0001;
parameter T1 = 0000_0000_0010;
parameter T2 = 0000_0000_0100;
parameter T3 = 0000_0000_1000;
parameter T4 = 0000_0001_0000;
parameter T5 = 0000_0010_0000;


parameter D0 = 0000_0001;
parameter D1 = 0000_0010;
parameter D2 = 0000_0100;
parameter D3 = 0000_1000;
parameter D4 = 0001_0000;
parameter D5 = 0010_0000;
parameter D6 = 0100_0000;



/*
  regs and memory ? may need 2 always blocks one for execution and one for reading
  may have no need for seq_counter just counter could be enough,
  if every thing is handled in this module problem might not be big else we will have to have a seperate module for taking instructions
  and writing them to mem then this module will access that mem in this case disregard first line ..output makes sense to be the ac
  as it can show intermediate steps and final result can just be a binary value eg. add 1 2 AC = 0000_0000_0011 as the final result of
  this computation .. something like STA can have AC = 1111_1111_1111 or 0000_0000_0000_0000 i.e success, fail

  might need to alter the micro instructions in Basic Computer, rabena yestor....
*/

reg [15:0] i1;
reg [15:0] i2;

initial 
begin 

i1 <= 16'b0000_0000_0000_0000;
i2 <= 16'b0000_0000_0000_1010;
PC <= 12'b0000_0000_0000;
DR <= 16'b0000_0000_0000_0000;
AC <= 16'b0000_0000_0000_0000;
IR <= 16'b0000_0000_0000_0000;
I <= 1'b0;
M[3] <= 16'b0000_0000_0000_0001;
M[0] <= 16'b0010_0000_0000_0011;
M[1] <= 16'b0001_0000_0000_0011;
end


	
always@(Ti or S or LD1 or LD2 or s0 or s1 or s2 or s3)         // above is controlled by CLK however this controlled By Ti which is controlled by CLK 
							    // 2 signals driving 2 always blocks might not be correct ?? 
	
		if(LD1)
		begin
		M[i1] <= {s3,s2,s1,s0};
		i1 <= i1 + 1'b1; // ?? not completely sure what will happen
		AC <= 16'bx;
		end
		else
		if(LD2)
		begin
		M[i2] <= {s3,s2,s1,s0};
		i2 <= i2 + 1'b1;
		AC <= 16'bx;
		end
		else 
		if(S)	
		begin
		case(Ti)

	Ti == T0 : begin  AR <= PC;  AC <= 	AC; end	
	
	Ti == T1 : begin IR <= M[AR]; PC <= PC + 1; AC <= AC; end

	Ti == T2 : begin AR <= IR[11:0]; I<= IR[15]; AC <= AC; end  

	Ti == T3 : 
			   
			   if(I) begin AR <= M[AR]; AC <= AC; end//to be completed -->	
				else
				begin 
				AR <= AR;AC <= AC;
				end
			   

	Ti == T4 : case(IR[14:12])
			   
			   3'b000: begin AC <= AC; DR <= M[AR]; end
			   3'b001: begin DR <= M[AR]; AC <= AC; end
			   3'b010: begin DR <= M[AR]; AC <= AC; end
			   3'b011: begin M[AR] <= AC; AC <= AC; end 
			   3'b100: begin PC <= AR;  AC <= AC;end 
			   3'b101: begin DR <= M[AR]; AC <= AC; end
			   
			   default : AC <= 16'bx;
				endcase
	Ti == T5 : case(IR[14:12])	
				 
			    3'b000: begin AC <= AC & DR; end 
			    3'b001: begin AC <= AC + DR; end 
				 3'b010: begin AC <= AC <= DR; end 
				 3'b101: begin AC <= AC - DR; end 
				 default : AC <= 16'bx;
				 endcase
				 
	default : AC <= 16'b1111_1111_1111_1111;

	endcase
	end

endmodule


