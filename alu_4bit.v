`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2026 16:20:10
// Design Name: 
// Module Name: alu_4bit
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

module alu_4bit (
    input [3:0] A,
    input [3:0] B,
    input [2:0] Opcode,
    output reg [3:0] Result,
    output reg CarryOut,
    output Zero
);

    reg [4:0] temp_result;

    assign Zero = (Result == 4'b0000);

    always @(*) begin
        CarryOut = 0; 
        temp_result = 0;
        
        case(Opcode)
            3'b000:
            begin
                temp_result = A + B;
                Result = temp_result[3:0];
                CarryOut = temp_result[4];
            end
            
            3'b001:
            begin
                temp_result = A - B;
                Result = temp_result[3:0];
                CarryOut = temp_result[4];
            end
            
            3'b010: Result = A & B;
            3'b011: Result = A | B;
            3'b100: Result = A ^ B;
            3'b101: Result = ~A;
            3'b110: Result = A << 1;
            3'b111: Result = A >> 1;
            
            default: Result = 4'b0000;
        endcase
    end

endmodule
