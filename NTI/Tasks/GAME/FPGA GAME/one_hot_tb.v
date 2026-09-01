`timescale 1ns/1ps
module one_hot_tb;
reg clk;
reg rst;
reg start;
wire [9:0] led;
one_hot dut (
    .clk(clk),
    .rst(rst),
	.start(start),
    .led(led)
);
initial begin
clk = 0;
forever #10 clk =~clk ;
end
initial begin
$monitor("time=%0t rst=%b led=%b start=%b", $time, rst, led, start);
start = 0;
rst = 0;
#50 rst =1 ;
start =1;
#5000
$finish;
end
endmodule
