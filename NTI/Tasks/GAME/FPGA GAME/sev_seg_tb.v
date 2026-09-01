`timescale 1ns/1ps
module sev_seg_tb;
reg        clk;
reg        rst;
reg  [3:0] value;
wire [6:0] seg;
wire       dp;
sev_seg dut (
    .clk   (clk),
    .rst   (rst),
    .value (value),
    .seg   (seg),
    .dp    (dp)
);
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end
integer i;
initial begin
    $monitor("t=%0t value=%0d seg=%b dp=%b", $time, value, seg, dp);
    rst   = 0;
    value = 0;
    #25 rst = 1;
    for (i = 0; i <= 9; i = i + 1) begin
        value = i;
        #20;
    end
    for (i = 10; i <= 14; i = i + 1) begin
        value = i;
        #20;
    end
    value = 4'd15; #20;
    $finish;
end
endmodule
