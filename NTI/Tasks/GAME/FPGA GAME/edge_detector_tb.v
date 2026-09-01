`timescale 1ns/1ps
module edge_detector_tb;
reg  clk;
reg  rst;
reg  in;
wire press;
edge_detector dut (
    .clk   (clk),
    .rst   (rst),
    .in    (in),
    .press (press)
);
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end
initial begin
    $monitor("t=%0t rst=%b in=%b press=%b", $time, rst, in, press);
    rst = 0;
    in  = 0;
    #25 rst = 1;
    #20 in = 1;
    #20 in = 0;
    #20 in = 1;
    #60;
    in = 0;
    #40 $finish;
end
endmodule
