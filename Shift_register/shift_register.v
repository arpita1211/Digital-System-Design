`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 02:12:06 PM
// Design Name: 
// Module Name: shift_register
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


module shift_register #(parameter N = 8) (
    input clk,           // Clock signal
    input rst,           // Reset signal (active high)
    input load,          // Load signal (active high) to load data
    input shift,         // Shift signal: 1 for shift, 0 for hold
    input dir,           // Direction control: 1 for right shift, 0 for left shift
    input [N-1:0] data_in,  // Data to be loaded into the register
    output reg [N-1:0] q      // Shift register output
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      q <= 0;  // Reset the register to 0
    end else if (load) begin
      q <= data_in;  // Load the input data into the shift register
    end else if (shift) begin
      if (dir) begin
        // Right shift
        q <= {1'b0, q[N-1:1]};  // Shift right and pad with 0 on the left
      end else begin
        // Left shift
        q <= {q[N-2:0], 1'b0};  // Shift left and pad with 0 on the right
      end
    end
  end

endmodule
