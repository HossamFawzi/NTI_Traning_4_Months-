`timescale 1ns/1ps
module top_tb;
reg        clk;
reg        key_rst_n;
reg        key_restart_n;
reg  [9:0] switch;
wire [9:0] led;
wire [6:0] seg0, seg1, seg2, seg3;
wire       dp0, dp1, dp2, dp3;
reg        make_mistake;
integer    led_change_count;
top #(
    .CLK_DIV_COUNT(20),
    .BOSS_AFTER(12),
    .LOSE_AFTER(5)
) dut (
    .clk           (clk),
    .key_rst_n     (key_rst_n),
    .key_restart_n (key_restart_n),
    .switch        (switch),
    .led           (led),
    .seg0          (seg0),
    .seg1          (seg1),
    .seg2          (seg2),
    .seg3          (seg3),
    .dp0           (dp0),
    .dp1           (dp1),
    .dp2           (dp2),
    .dp3           (dp3)
);
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end
initial begin
    #400000;
    $display("t=%0t -- WATCHDOG TIMEOUT, forcing finish", $time);
    $finish;
end
always @(led) begin
    led_change_count = led_change_count + 1;
    #1;
    if (make_mistake)
        switch <= ~led;
    else
        switch <= led;
end
initial begin
    $monitor("t=%0t led=%b switch=%b state=%b score=%0d wrong=%0d seg3=%b seg2=%b seg1=%b seg0=%b",
              $time, led, switch, dut.game_state, dut.score, dut.wrong_counter, seg3, seg2, seg1, seg0);
    led_change_count = 0;
    make_mistake     = 0;
    key_rst_n     = 0;
    key_restart_n = 1;
    switch        = 10'b0;
    #50 key_rst_n = 1;
    #400 switch = led;
    wait (led_change_count == 5);
    $display("t=%0t -- deliberately missing for a couple of moves", $time);
    make_mistake = 1;
    wait (led_change_count == 7);
    $display("t=%0t -- back to playing correctly, led kept moving throughout",
              $time);
    make_mistake = 0;
    wait (dut.game_state == 2'b10);
    $display("t=%0t -- reached BOSS, score=%0d (misses didn't stop it)",
              $time, dut.score);
    #100  key_restart_n = 0;
    #1000 key_restart_n = 1;
    #100  switch = led;
    #4000;
    $display("t=%0t -- test complete", $time);
    $finish;
end
endmodule