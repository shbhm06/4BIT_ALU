`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2026 16:22:42
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] Opcode;

    wire [3:0] Result;
    wire CarryOut;
    wire Zero;

    alu_4bit uut (
        .A(A), 
        .B(B), 
        .Opcode(Opcode), 
        .Result(Result), 
        .CarryOut(CarryOut), 
        .Zero(Zero)
    );

    initial begin
        A = 0; B = 0; Opcode = 0;

        $monitor("Time=%0t | Op=%b | A=%d B=%d | Res=%d | Carry=%b Zero=%b", 
                 $time, Opcode, A, B, Result, CarryOut, Zero);

        #10 A = 4'd10; B = 4'd5; Opcode = 3'b000;
        
        #10 A = 4'd10; B = 4'd10; Opcode = 3'b000;

        #10 A = 4'd10; B = 4'd5; Opcode = 3'b001;

        #10 A = 4'b1100; B = 4'b1010; Opcode = 3'b010;

        #10 A = 4'b1100; B = 4'b1010; Opcode = 3'b011;

        #10 A = 4'b1100; B = 4'b1010; Opcode = 3'b100;
        
        #10 A = 4'b0011; Opcode = 3'b110;

        #10 A = 4'd5; B = 4'd5; Opcode = 3'b001;

        #10 $finish;
    end
      
endmodule
