// File: mux_3to1.v
// Generated by MyHDL 0.11
// Date: Sat Sep 25 04:37:43 2021


`timescale 1ns/10ps

module mux_3to1 (
    i0,
    i1,
    i2,
    sel0,
    sel1,
    out
);


input i0;
input i1;
input i2;
input sel0;
input sel1;
output out;
reg out;




always @(i1, sel1, sel0, i0, i2) begin: MUX_3TO1_MUX3TO1
    if (((sel0 == 0) && (sel1 == 0))) begin
        out = i0;
    end
    else if (((sel0 == 0) && (sel1 == 1))) begin
        out = i1;
    end
    else begin
        out = i2;
    end
end

endmodule