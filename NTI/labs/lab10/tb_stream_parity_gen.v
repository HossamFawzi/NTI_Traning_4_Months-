`timescale 1ns/1ps

module tb_stream_parity_gen;

    reg clk;
    reg reset;
    reg serial_in;
    wire parity_out;

    // DUT instantiation
    stream_parity_gen uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parity_out(parity_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Task لإرسال بايت كامل
    task send_byte;
        input [7:0] data;
        integer i;
        begin
            for (i = 7; i >= 0; i = i - 1) begin
                serial_in = data[i];
                @(posedge clk);
            end
        end
    endtask

    // Function لحساب الـ expected parity
    function expected_parity;
        input [7:0] data;
        begin
            expected_parity = ^data;
        end
    endfunction

    initial begin
        // Init
        clk = 0; reset = 1; serial_in = 0;
        #12 reset = 0;

        // Test 1
        send_byte(8'b10101010);
        #10;
        if (parity_out !== expected_parity(8'b10101010))
            $display("FAIL: Data=10101010, DUT=%b, Expected=%b", parity_out, expected_parity(8'b10101010));
        else
            $display("PASS: Data=10101010, Parity=%b", parity_out);

        // Test 2
        send_byte(8'b11110000);
        #10;
        if (parity_out !== expected_parity(8'b11110000))
            $display("FAIL: Data=11110000, DUT=%b, Expected=%b", parity_out, expected_parity(8'b11110000));
        else
            $display("PASS: Data=11110000, Parity=%b", parity_out);

        // Test 3
        send_byte(8'b00000000);
        #10;
        if (parity_out !== expected_parity(8'b00000000))
            $display("FAIL: Data=00000000, DUT=%b, Expected=%b", parity_out, expected_parity(8'b00000000));
        else
            $display("PASS: Data=00000000, Parity=%b", parity_out);

        $stop;
    end

endmodule
