`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Preston J Greenwood
// ECE274a Lab 6
// 4/16/2025
// 
// TopModule
// This acts as a top module for a Vending Machine controller
// It instantiates level-to-pulse converters for buttons,
// a clock module, and a two digit display
//////////////////////////////////////////////////////////////////////////////////


module TopModule(CLK100MHZ, BTNU, BTNL, BTNC, BTNR, LED, CA, CB, CC, CD, CE, CF, CG,AN);
input CLK100MHZ, BTNU, BTNL, BTNC, BTNR;
output LED, CA, CB, CC, CD, CE, CF, CG;
output [7:0] AN;

// Clock
wire ClkOut;
ClkDiv a1(CLK100MHZ, BTNU, ClkOut);

// buttons
wire nickleOut, dimeOut, quarterOut, dispense;
Button_Synchronizer b1 (BTNL, ClkOut, BTNU, nickleOut );
Button_Synchronizer b2 (BTNC, ClkOut, BTNU, dimeOut );
Button_Synchronizer b3 (BTNR, ClkOut, BTNU, quarterOut );

// controller
wire [5:0] total;
VendingMachine a2 (ClkOut, BTNU, nickleOut, dimeOut, quarterOut, total,LED); 

// display
TwoDigitDisplay d1(ClkOut,total, CA, CB, CC, CD, CE, CF, CG,AN);

endmodule
