`timescale 1ns/1ps

module decoder_tb;

    reg  [1:0] in;
    wire [3:0] out;

    decoder #(.N(2)) DUT (
        .in(in),
        .out(out)
    );

    integer i;

    initial begin

        for (i = 0; i < 20; i = i + 1) begin

            in = $urandom_range(0, 3);
            #10;

            if (out !== (4'b0001 << in))
                $display("FAIL: in=%b out=%b", in, out);
            else
                $display("PASS: in=%b out=%b", in, out);

        end

        $finish;
    end

endmodule