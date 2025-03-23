`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2024 03:34:56 PM
// Design Name: 
// Module Name: non_overlap_seq_detector
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


//FOR SEQUENCE 10110
module non_overlap_seq_detector (
    input wire clk,
    input wire rst,
    input wire din,
    output reg dout
);
    parameter S0 = 3'b000; //A
    parameter S1 = 3'b001; //B
    parameter S2 = 3'b010; //C
    parameter S3 = 3'b011; //D
    parameter S4 = 3'b100; //E
    parameter S5 = 3'b101; //output

    reg [2:0] current_state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            S0: begin
                if (din)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (!din)
                    next_state = S2;
                else
                    next_state = S1;
            end

            S2: begin
                if (din)
                    next_state = S3;
                else
                    next_state = S0;
            end

            S3: begin
                if (din)
                    next_state = S4;
                else
                    next_state = S2;
            end

            S4: begin
                if (!din)
                    next_state = S5;
                else
                    next_state = S1;
            end
            
            S5: begin
                next_state = S0;
            end

            default: next_state = S0;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            dout <= 1'b0;
        else if (current_state == S5)
            dout <= 1'b1;
        else
            dout <= 1'b0;
    end

endmodule
