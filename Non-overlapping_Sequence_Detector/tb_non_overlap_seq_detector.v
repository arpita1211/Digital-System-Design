`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 03:35:16 PM
// Design Name: 
// Module Name: tb_non_overlap_seq_detector
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


module tb_non_overlap_seq_detector;

    reg clk;
    reg rst;
    reg din;
    wire dout;

    non_overlap_seq_detector uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;
    initial begin
     
        clk = 0;
        rst = 1;
        din = 0;

        #15;
        rst = 0;

        #10 din = 1; 
        #10 din = 0; 
        #10 din = 0;
        #10 din = 1; 
        #10 din = 0; 
        #10 din = 1;
        #10 din = 1; 
        #10 din = 0; 
        #10 din = 0; 
        #10 din = 1; 
        #10 din = 0; 
        #10 din = 1;
        #10 din = 1;
        #10 din = 1; 
        #10 din = 0; 
        #10 din = 1;
        #10 din = 1;  
        #10 din = 0;
        #10 din = 0; 
        #10 din = 1;
        #10 din = 0; 
        #10 din = 0; 
        #10 din = 1;
        #10 din = 1; 
        #10 din = 0; 
        #10 din = 1;
        #10 din = 1; 
        #10 din = 0;
        #10 din = 0; 
        #10 din = 1;
        #20 $finish;
  end

endmodule
