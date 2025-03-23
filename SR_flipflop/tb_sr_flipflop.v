`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 02:32:36 PM
// Design Name: 
// Module Name: tb_sr_flipflop
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


module tb_sr_flipflop;
    reg S, R, clk;
    wire Q, Qn;
    
    sr_flipflop uut (S,R,clk,Q,Qn);

    initial begin
        // Test different conditions
        S = 1; R = 1; clk = 1; #10;
        S = 0; R = 1; clk = 1; #10;
        S = 1; R = 0; clk = 1; #10;
        S = 0; R = 0; clk = 1; #10;
        S = 0; R = 0; clk = 0; #10;
        S = 0; R = 1; clk = 0; #10;
        S = 1; R = 0; clk = 0; #10;
        S = 1; R = 1; clk = 0; #10;
        
        $finish;
    end
    
endmodule

