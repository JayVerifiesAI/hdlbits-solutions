module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c16;
    wire [15:0] sum0, sum1;

    add16 lo  (.a(a[15:0]),  .b(b[15:0]),  .cin(1'b0), .sum(sum[15:0]), .cout(c16));
    add16 hi0 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(sum0),      .cout());
    add16 hi1 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(sum1),      .cout());

    mux2_16 m (.d0(sum0), .d1(sum1), .sel(c16), .y(sum[31:16]));
endmodule

module mux2_16 (
    input  [15:0] d0,
    input  [15:0] d1,
    input         sel,
    output [15:0] y
);
    assign y = sel ? d1 : d0;
endmodule
