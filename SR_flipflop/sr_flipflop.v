`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 02:32:06 PM
// Design Name: 
// Module Name: sr_flipflop
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


module sr_flipflop(
    input S,
    input R,
    input clk,
    output Q,
    output Qn
);

    wire Qa, Qb, clkS, clkR;
    
    assign clkR = ~(R&clk);
    assign clkS = ~(S&clk);
    
    // SR Latch using Nand gates
    assign Qa = ~(clkS & Qb);
    assign Qb = ~(clkR & Qa);

    assign Q = Qa;
    assign Qn = Qb;
    
endmodule

