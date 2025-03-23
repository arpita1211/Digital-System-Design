`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 12:34:44 PM
// Design Name: 
// Module Name: freq_divider_n_not_eq_2m
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


module freq_divider_n_not_eq_2m #(parameter n = 5) (
    input clk,    // Clock input
    input rst,    // Reset input
    output reg out // Divided clock output
);
    reg [31:0] count;  // Counter register

    always @(posedge clk or negedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;   // Reset the counter
            out <= 0;     // Reset the output clock
        end
        else begin
            if (count == (n-1)) begin
                count <= 0;   // Reset counter when it reaches n-1
                out <= ~out;  // Toggle the output clock
            end
            else
                count <= count + 1;  // Increment the counter
        end
    end
endmodule

