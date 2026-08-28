`timescale 1ns/1ps

module one_hot_tb;

reg clk;
reg rst;
wire [9:0] led;


one_hot dut (
    .clk(clk),
    .rst(rst),
    .led(led)
);

initial begin
clk = 0;
forever #5 clk =~clk ;
end

initial begin
rst = 0;
#50 rst =1 ;
$finish;
end

endmodule
