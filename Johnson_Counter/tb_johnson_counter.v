`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 02:54:28 PM
// Design Name: 
// Module Name: tb_johnson_counter
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


module tb_johnson_counter;
  reg clk,reset;
  wire [7:0] out;
  
  johnson_counter dut (.out(out), .reset(reset), .clk(clk));
  
  always 
    #5 clk =~clk;
  
  initial begin
    reset=1'b1; clk=1'b0;
   #20 reset= 1'b0;
  end
  
  initial 
    begin 
   	 $monitor( $time, " clk=%b, out= %b, reset=%b", clk,out,reset);
  	 #150  $stop;  
    end

endmodule
