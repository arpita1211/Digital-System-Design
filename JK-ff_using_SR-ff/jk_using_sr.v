`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024
// Design Name: JK Flip-Flop using SR Flip-Flop
// Module Name: JK_to_SR_flipflop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: JK flip-flop implemented using SR flip-flop
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jk_using_sr(
    input J,K,clk,
    output reg Q,
    output Qn
);
    wire S, R;
    
    assign S = J & Qb;
    assign R = K & Qa;
    
    wire Qa,Qb,clkS,clkR;
    
    assign clkS = ~(S&clk);
    assign clkR = ~(R&clk);
    assign Qa = ~(clkS&Qb);
    assign Qb = ~(clkR&Qa);
    
//    assign Q = Qa;
//    assign Qn = Qb;
    
    always @(posedge clk) begin
        Q <= Qa; // Register to hold output state at clock edge
    end
    
    assign Qn = ~Q; // Complement of Q
    
endmodule
