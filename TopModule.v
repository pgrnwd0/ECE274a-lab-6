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
input CLK100MHZ;
input BTNU;//BTNUisReset
input BTNL,BTNC,BTNR;//BTNLisNickel,BTNCisDime,BTNRisQuarter
output[0:0]LED;//LED[0] isCandy
output CA,CB,CC,CD,CE,CF,CG;//segmenta,b, ... g
output[7:0]AN;//enableeachdigitof the8digits


// Clock
wire ClkOut;
ClkDiv a1(CLK100MHZ, BTNU, ClkOut);

// buttons
wire nickleOut, dimeOut, quarterOut, dispense;
Button_Synchronizer b1 (BTNL,ClkOut, BTNU, nickleOut );
Button_Synchronizer b2 (BTNC,ClkOut, BTNU, dimeOut );
Button_Synchronizer b3 (BTNR,ClkOut, BTNU, quarterOut );

// controller
wire [6:0] total;
VendingMachine a2 (ClkOut, BTNU, nickleOut, dimeOut, quarterOut, total,LED[0]); 

// display
TwoDigitDisplay d1(CLK100MHZ,total, CA, CB, CC, CD, CE, CF, CG,AN);

endmodule
