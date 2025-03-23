`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 12:21:29 PM
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter #(parameter N = 4)( // N is the number of bits (counter width)
    input wire clk,         // Clock signal
    input wire reset,       // Synchronous reset signal
    input wire enable,      // Enable signal for counting
    input wire pause,       // Pause signal to halt the counter
    input wire up_down,     // 1 for counting up, 0 for counting down
    output reg [N-1:0] count // Output count
    
);

always @(posedge clk) begin
        if (reset) begin
            count <= 0; // Reset the counter to 0
        end
        else if (enable && !pause) begin // If enabled and not paused
            if (up_down) begin
                count <= count + 1; // Count up
            end else begin
                count <= count - 1; // Count down
            end
        end
    end
endmodule
