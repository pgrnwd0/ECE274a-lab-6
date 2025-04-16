`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 09:53:36 AM
// Design Name: 
// Module Name: VendingMachine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VendingMachine_tb;

reg clk, reset, five, ten, twentyfive;
wire [5:0] total;
wire candy;

VendingMachine uut (
.clk(clk),
.reset(reset),
.nickle(five),
.dime(ten),
.quarter(twentyfive),
.num(total),
.candy(candy));

// set clock to 100ns period
always #50 clk = ~clk;

initial begin
clk = 0;
reset = 0;
five = 0;
ten = 0;
twentyfive = 0;
#100;
// reset
reset = 1;#100; reset = 0;#100;
// test nickle
five = 1;#100; five=0;#100;
// test dime
ten = 1;#100; ten = 0;#100;
// test candy
ten = 1;#100; ten = 0;#200; // candy should be 1
reset = 1;#100; reset = 0;#100;
// test 30
five = 1;#100; five=0;#100;
twentyfive = 1;#100;twentyfive = 0;#100; // change should be 5
reset = 1;#100; reset = 0;#100;
// test 35
ten = 1;#100; ten=0;#100;
twentyfive = 1;#100;twentyfive = 0;#100; // change should be 10
reset = 1;#100; reset = 0;#100;
// test 40
five = 1;#100; five=0;#100;
ten = 1;#100; ten=0;#100;
twentyfive = 1;#100;twentyfive = 0;#100; // change should be 15
reset = 1;#100; reset = 0;#100;
// test 45
ten = 1;#100; ten=0;#100;
ten = 1;#100; ten=0;#100;
twentyfive = 1;#100;twentyfive = 0;#100; // change should be 20
reset = 1;#100; reset = 0;#100;
// test multipule coins at once
five = 1;#100; five=0;#100;
five = 1; ten = 1;#100;five = 0; ten = 0;#100; // should stay at 5
reset = 1;#100; reset = 0;#100;
$finish;
end



endmodule
