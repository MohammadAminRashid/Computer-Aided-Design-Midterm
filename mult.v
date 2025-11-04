module mult(
    input [15:0] W0,
    input [2:0] y,
    output [15:0] P
    );

assign P = W0 << y;

endmodule