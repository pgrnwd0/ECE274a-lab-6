`timescale 1ns / 1ps

module SevenSegment(SW,CA,CB,CC,CD,CE,CF,CG);
	// 4-bit input using switches 3 - 0
    input [3:0] SW;     
	//each segment of seven-segment display
    output reg CA,CB,CC,CD,CE,CF,CG; 
 


	//write your code using case statement here
	always @(SW)
	case({SW})
	       // 0
	       4'b0000:
	       begin
	           CA <= 0; CB <= 0; CC <= 0; CD <= 0; CE <= 0; CF <= 0; CG <= 1;
	       end
	       // 1
	       4'B0001:
	       begin
	           CA <= 1; CB <= 0; CC <= 0; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end	
	       // 2           
	       4'B0010:
	       begin
	           CA <= 0; CB <= 0; CC <= 1; CD <= 0; CE <= 0; CF <= 1; CG <= 0;
	       end	
	       // 3
	       4'B0011:
	       begin
	           CA <= 0; CB <= 0; CC <= 0; CD <= 0; CE <= 1; CF <= 1; CG <= 0;
	       end	
	       // 4
	       4'B0100:
	       begin
	           CA <= 1; CB <= 0; CC <= 0; CD <= 1; CE <= 1; CF <= 0; CG <= 0;
	       end	
	       // 5
	       4'B0101:
	       begin
	           CA <= 0; CB <= 1; CC <= 0; CD <= 0; CE <= 1; CF <= 0; CG <= 0;
	       end	
	       // 6
	       4'B0110:
	       begin
	           CA <= 0; CB <= 1; CC <= 0; CD <= 0; CE <= 0; CF <= 0; CG <= 0;
	       end	
	       // 7
	       4'B0111:
	       begin
	           CA <= 0; CB <= 0; CC <= 0; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end	
	       // 8
	        4'b1000:
	       begin
	           CA <= 0; CB <= 0; CC <= 0; CD <= 0; CE <= 0; CF <= 0; CG <= 0;
	       end
	       // 9
	       4'B1001:
	       begin
	           CA <= 0; CB <= 0; CC <= 0; CD <= 0; CE <= 1; CF <= 0; CG <= 0;
	       end
	       // 10	           	
	       4'B1010:
	       begin
	           CA <= 1; CB <= 1; CC <= 1; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end
	       // 11	
	       4'B1011:
	       begin
	           CA <= 1; CB <= 1; CC <= 1; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end	
	       // 12
	       4'B1100:
	       begin
	           CA <= 1; CB <= 1; CC <= 1; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end	
	       // 13
	       4'B1101:
	       begin
	           CA <= 1; CB <= 1; CC <= 1; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end	
	       // 14
	       4'B1110:
	       begin
	           CA <= 1; CB <= 1; CC <= 1; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end	
	       // 15
	       4'B1111:
	       begin
	           CA <= 1; CB <= 1; CC <= 1; CD <= 1; CE <= 1; CF <= 1; CG <= 1;
	       end	
    endcase

    
endmodule
