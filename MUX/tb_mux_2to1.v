module tb_mux_2to1;

reg [0:0] i0;
reg [0:0] i1;
reg [0:0] sel;
wire [0:0] output;

initial begin
    $from_myhdl(
        i0,
        i1,
        sel
    );
    $to_myhdl(
        output
    );
end

mux_2to1 dut(
    i0,
    i1,
    sel,
    output
);

endmodule
