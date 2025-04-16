`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Preston J Greenwood
// ECE274a Lab 6
// 4/16/2025
//
// VendingMachine
// This accepts inputs of 5, 10, or 25 cents. When the
// total is 25 or higher, candy outputs 1. Once the total
// is greater than 25, it should store how much change is owed
//  
//////////////////////////////////////////////////////////////////////////////////


module VendingMachine(clk, reset, nickle, dime, quarter, num, candy);

input clk, reset, nickle, dime, quarter;
output reg candy;
output reg [5:0] num;

localparam IDLE=0,FIVE=1,TEN=2,FIFTEEN=3,
TWENTY=4,TWENTYFIVE=5,THIRTY=6,THIRTYFIVE=7,
FOURTY=8,FOURTYFIVE=9;

reg [3:0] state, nxtState;

// State register update (sequential logic)
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
    end
    else begin
        state <= nxtState;
    end
end

always @(*) begin
nxtState = state;
case (state)
IDLE :  begin 
    candy <= 0;
    num <= 0;
    if (nickle && ~dime && ~quarter) begin nxtState <=FIVE; end
    if (dime && ~nickle && ~quarter) begin nxtState <=TEN; end
    if (quarter && ~nickle && ~dime) begin nxtState<=TWENTYFIVE; end
end
FIVE : begin 
    num <= 5;
    if (nickle && ~dime && ~quarter) begin nxtState <=TEN; end
    if (dime && ~nickle && ~quarter) begin nxtState <=FIFTEEN; end
    if (quarter && ~nickle && ~dime) begin nxtState<=THIRTY; end
end 
TEN : begin 
    num <= 10;
    if (nickle && ~dime && ~quarter) begin nxtState <=FIFTEEN; end
    if (dime && ~nickle && ~quarter) begin nxtState <=TWENTY; end
    if (quarter && ~nickle && ~dime) begin nxtState<=THIRTYFIVE; end
end
FIFTEEN :  begin
    num <= 15; 
    if (nickle && ~dime && ~quarter) begin nxtState <=TWENTY; end
    if (dime && ~nickle && ~quarter) begin nxtState <=TWENTYFIVE; end
    if (quarter && ~nickle && ~dime) begin nxtState<=FOURTY; end
end
TWENTY : begin 
    num <= 20;
    if (nickle && ~dime && ~quarter) begin nxtState <=TWENTYFIVE; end
    if (dime && ~nickle && ~quarter) begin nxtState <=THIRTY; end
    if (quarter && ~nickle && ~dime) begin nxtState<=FOURTYFIVE; end
end 
TWENTYFIVE : begin 
    candy <= 1;
    num <= 0;
end
THIRTY :  begin 
    candy <= 1;
    num <= 5;
end
THIRTYFIVE : begin
    candy <= 1;
    num <= 10; 
end 
FOURTY : begin
    candy <= 1; 
    num <= 15;
end
FOURTYFIVE :  begin
    candy <= 1;
    num <= 20; 
end
endcase
end            

endmodule
