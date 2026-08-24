module full_adder_gate (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

wire X1;
wire C1;
wire C2;

xor (X1, A, B);
xor (Sum, X1, Cin);

and (C1, A, B);
and (C2, X1, Cin);

or  (Cout, C1, C2);

endmodule