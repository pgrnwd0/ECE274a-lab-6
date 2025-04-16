`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Preston J Greenwood
// ECE274a LAB5
// 4/2/2025
// 
// Button_ Synchronizer
// This outputs a pulse that lasts one clock cycle
// regardless the duration of the input signal.
//////////////////////////////////////////////////////////////////////////////////
module Button_Synchronizer(in, clk, reset, out);
input in, clk, reset;
output out;

localparam IDLE=0, PRESSED=1,LOCKOUT=2;

reg [1:0] state, nxtState;
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
    end
    else begin state <= nxtState; end
end

always @(*) begin
nxtState = state;
case (state)
IDLE : begin
if(in) begin
    nxtState <= PRESSED;
    end 
    end
PRESSED : begin nxtState <= LOCKOUT;
         end 
LOCKOUT : begin 
            if (~in) begin
                nxtState <= IDLE; end 
            else begin nxtState <= LOCKOUT; end
            end
default: nxtState <= IDLE;
endcase 
end

assign out = (state == PRESSED);
endmodule
