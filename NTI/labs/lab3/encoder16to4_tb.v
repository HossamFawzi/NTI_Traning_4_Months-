`timescale 1ns/1ps

module encoder16to4_tb;

    reg  [15:0] in;
    wire [3:0] out;

    encoder16to4 #(.N(16)) DUT (
        .in(in),
        .out(out)
    );

    integer i;

    initial begin

        for (i = 0; i < 20; i = i + 1) begin

            in = $urandom_range(0,15);
            #10;
                $display("PASS: in=%b out=%b", in, out);

        end

        $finish;
    end

endmodule

