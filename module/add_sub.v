module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire c16;
    add16 a1(.a(a[15:0]), .b(b[15:0]^{32{sub}}), .cin(sub), .sum(sum[15:0]), .cout(c16));
    add16 a2(.a(a[31:16]), .b(b[31:16]^{32{sub}}), .cin(c16), .sum(sum[31:16]), .cout());

endmodule
