`timescale 1ns/1ps
module clk_divider_tb;
reg clk_in;
reg rst;
wire clk;
 clk_divider #(
    .COUNT_LIMIT(6249)
    ) dut(
    .clk_in(clk_in),
    .rst(rst),
    .clk(clk)
);
initial begin
clk_in = 0;
forever #10 clk_in =~clk_in ;
end
initial begin
rst = 0;
#200 rst = 1 ;
#125000;
$finish;
end
endmodule