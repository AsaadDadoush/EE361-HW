// File: register.v
// Generated by MyHDL 0.11
// Date: Mon Oct  4 01:19:18 2021


`timescale 1ns/10ps

module register (
    load_in,
    load_out,
    enable,
    clock,
    reset
);


input [31:0] load_in;
output [31:0] load_out;
reg [31:0] load_out;
input enable;
input clock;
input reset;




always @(posedge clock, negedge reset) begin: REGISTER_REG_1
    if (reset == 0) begin
        load_out <= 0;
    end
    else begin
        if (enable) begin
            load_out <= load_in;
        end
    end
end

endmodule
