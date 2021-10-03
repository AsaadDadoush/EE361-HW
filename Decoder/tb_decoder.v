module tb_decoder;

reg [0:0] i0;
reg [0:0] i1;
reg [0:0] i2;
reg [0:0] i3;
wire [0:0] d0;
wire [0:0] d1;
wire [0:0] d2;
wire [0:0] d3;
wire [0:0] d4;
wire [0:0] d5;
wire [0:0] d6;
wire [0:0] d7;
wire [0:0] d8;
wire [0:0] d9;
wire [0:0] d10;
wire [0:0] d11;
wire [0:0] d12;
wire [0:0] d13;
wire [0:0] d14;
wire [0:0] d15;

initial begin
    $from_myhdl(
        i0,
        i1,
        i2,
        i3
    );
    $to_myhdl(
        d0,
        d1,
        d2,
        d3,
        d4,
        d5,
        d6,
        d7,
        d8,
        d9,
        d10,
        d11,
        d12,
        d13,
        d14,
        d15
    );
end

decoder dut(
    i0,
    i1,
    i2,
    i3,
    d0,
    d1,
    d2,
    d3,
    d4,
    d5,
    d6,
    d7,
    d8,
    d9,
    d10,
    d11,
    d12,
    d13,
    d14,
    d15
);

endmodule
