// File: alu.v
// Generated by MyHDL 0.11
// Date: Sat Oct  2 01:19:21 2021


`timescale 1ns/10ps

module alu (
    a,
    b,
    sel,
    out
);


input [2:0] a;
input [2:0] b;
input [2:0] sel;
output [2:0] out;
reg [2:0] out;




always @(b, sel, a) begin: ALU_ALU
    case (sel)
        'h0: begin
            out = (a + b);
        end
        'h1: begin
            out = (a - b);
        end
        'h2: begin
            out = (a & b);
        end
        'h3: begin
            out = (a | b);
        end
        default: begin
            out = (a ^ b);
        end
    endcase
end

endmodule
