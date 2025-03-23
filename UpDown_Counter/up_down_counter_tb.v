`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2024 12:26:10 PM
// Design Name: 
// Module Name: up_down_counter_tb
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


module up_down_counter_tb;
// Testbench parameters
    parameter N = 4;
    
    // Testbench signals
    reg clk;
    reg reset;
    reg enable;
    reg pause;
    reg up_down;
    wire [N-1:0] count;

    // Instantiate the counter
    up_down_counter #(N) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .pause(pause),
        .up_down(up_down),
        .count(count)
    );

    always #10 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize all signals
        clk = 0;
        reset = 0;
        enable = 0;
        pause = 0;
        up_down = 0;

        // Reset the counter
        reset = 1; #20;
        reset = 0; #20;
        
        // Start counting up
        enable = 1;
        up_down = 1; // Set to count up
        #100; // Wait for some clock cycles
        
        // Pause the counter
        pause = 1; #40;
        pause = 0; #40;
        
        // Start counting down
        up_down = 0; // Set to count down
        #100;
        
        // Reset the counter again
        reset = 1; #20;
        reset = 0; #20;

        // Disable the counter
        enable = 0; #20;

        // End the simulation
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time=%0t | Reset=%b | Enable=%b | Pause=%b | Up_Down=%b | Count=%d", 
                 $time, reset, enable, pause, up_down, count);
    end
endmodule
