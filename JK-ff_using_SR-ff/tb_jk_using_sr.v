`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2024 14:55:10
// Design Name: 
// Module Name: JK_flipflop_tb
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


module tb_jk_using_sr;
    reg J,K,clk;
    wire Q,Qn;
    
    jk_using_sr uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q),
        .Qn(Qn)
    );
    
    initial begin
        
        // Test Case 1: Set the latch (S=1, R=0)
        J = 1; K = 0; clk = 1;
        #10;
        J = 1; K = 0; clk = 0;
        #10;
        
        // Test Case 2: Reset the latch (S=0, R=1)
        J = 0; K = 1; clk = 1;
        #10;
        J = 0; K = 1; clk = 0;
        #10;
        
        // Test Case 3: No change (S=0, R=0)
        J = 0; K = 0; clk = 1;
        #10;
        J = 0; K = 0; clk = 0;
        #10;
        
        // Test Case 4: Invalid state (S=1, R=1)
        J = 1; K = 1; clk = 1;
        #10;
        J = 1; K = 1; clk = 0;
        #10;
        
        $finish;
    end
endmodule

