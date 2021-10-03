// File: mux_2to1.v
// Generated by MyHDL 0.11
// Date: Sun Oct  3 04:54:56 2021


`timescale 1ns/10ps

module mux_2to1 (
    i0,
    i1,
    sel,
    output
);


input [0:0] i0;
input [0:0] i1;
input [0:0] sel;
output [0:0] output;
reg [0:0] output;




always @(sel, i0, i1) begin: MUX_2TO1_MUX2TO1
    if ((sel == 0)) begin
        output = i0;
    end
    else begin
        output = i1;
    end
end

endmodule
