module decoder #(
    parameter N = 2
)(
    input  wire [N-1:0] in,
    output reg  [(2**N)-1:0] out
);

always @(*) begin
    out = 0;
    out[in] = 1'b1;
end

endmodule