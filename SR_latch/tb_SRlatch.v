`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 02:22:59 PM
// Design Name: 
// Module Name: tb_SRlatch
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


module tb_SRlatch;
    reg S, R;
    wire Q, Qn;
    
    SRlatch uut (S,R,Q,Qn);

    initial begin
        
        S = 0; R = 0; #10;
        S = 0; R = 1; #10;
        S = 1; R = 0; #10;
        S = 1; R = 1; #10;
        
        #50 $finish;
    end
endmodule

