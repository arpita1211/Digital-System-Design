`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 12:35:10 PM
// Design Name: 
// Module Name: tb_freq_divider_n_not_eq_2m
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


module tb_freq_divider_n_not_eq_2m;
    reg clk;
    reg rst;
    wire out;

    freq_divider_n_not_eq_2m #(.n(5)) uut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;

        #10 rst = 0;

        #500 $finish;
    end

    initial begin
        $monitor("At time %t, out = %b", $time, out);
    end
endmodule
