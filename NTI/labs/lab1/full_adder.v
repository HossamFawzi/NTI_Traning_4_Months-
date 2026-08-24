module full_adder_behavioral (
    input A,
    input B,
    input Cin,
    output reg Sum,
    output reg Cout
);

always @(*) begin
    {Cout, Sum} = A + B + Cin;
end

endmodule
