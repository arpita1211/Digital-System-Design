`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 02:22:39 PM
// Design Name: 
// Module Name: SRlatch
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


module SRlatch(
    input wire S, R,
    output wire Q, Qn
    );
    wire Qa,Qb;
    
    assign Qa = ~(S & Qb);
    assign Qb = ~(R & Qa);
    
    assign Q = Qa;
    assign Qn = Qb;

endmodule
