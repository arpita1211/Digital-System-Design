`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 02:12:32 PM
// Design Name: 
// Module Name: shift_register_tb
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


module shift_register_tb;
  // Parameters
  parameter N = 8;

  // Inputs
  reg clk;
  reg rst;
  reg load;
  reg shift;
  reg dir;
  reg [N-1:0] data_in;

  // Output
  wire [N-1:0] q;

  // Instantiate the shift register module
  shift_register #(N) uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .shift(shift),
    .dir(dir),
    .data_in(data_in),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock with 10ns period
  end

  // Test procedure
  initial begin
    // Initialize inputs
    rst = 1; load = 0; shift = 0; dir = 0; data_in = 8'b11101010;
    #10 rst = 0;  // Release reset

    // Load data into the shift register
    #10 load = 1;
    #10 load = 0;

    // Shift left (dir = 0)
    #20 shift = 1; dir = 0;  // Shift left
    #40 shift = 0;           // Hold

    // Shift right (dir = 1)
    #10 shift = 1; dir = 1;  // Shift right
    #40 shift = 0;           // Hold

    // Finish simulation
    #100 $stop;
  end

  // Monitor outputs
  initial begin
    $monitor("Time = %0d, rst = %b, load = %b, shift = %b, dir = %b, data_in = %b, q = %b", 
              $time, rst, load, shift, dir, data_in, q);
  end
endmodule
