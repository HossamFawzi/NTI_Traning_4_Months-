module full_adder_tb;

    reg A, B, Cin;

    wire Cout_behavioral, Sum_behavioral;
    wire Cout_structural, Sum_structural;
    wire Cout_gate, Sum_gate;
    wire Cout_dataflow, Sum_dataflow;

    full_adder_behavioral DUT1 (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout_behavioral),
        .Sum(Sum_behavioral)
    );

    full_adder_structural DUT2 (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout_structural),
        .Sum(Sum_structural)
    );

    full_adder_gate DUT3 (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout_gate),
        .Sum(Sum_gate)
    );

    full_adder_dataflow DUT4 (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout_dataflow),
        .Sum(Sum_dataflow)
    );
    
    initial begin
        A = 0; B = 0; Cin = 0;
        #10;
        A = 0; B = 0; Cin = 1;
        #10;
        A = 0; B = 1; Cin = 0;
        #10;
        A = 0; B = 1; Cin = 1;
        #10;
        A = 1; B = 0; Cin = 0;
        #10;
        A = 1; B = 0; Cin = 1;
        #10;
        A = 1; B = 1; Cin = 0;
        #10;
        A = 1; B = 1; Cin = 1;
        #10;
        $finish;
    end
endmodule