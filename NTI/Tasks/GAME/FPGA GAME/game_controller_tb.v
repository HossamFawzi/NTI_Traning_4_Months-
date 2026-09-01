`timescale 1ns/1ps
module game_controller_tb;
reg        clk;
reg        rst;
reg        restart;
reg  [9:0] switch;
reg  [9:0] led;
wire       start;
wire [1:0] game_state;
wire [3:0] score;
wire [3:0] wrong_counter;
game_controller #(
    .BOSS_AFTER(3),
    .LOSE_AFTER(2)
) dut (
    .clk           (clk),
    .rst           (rst),
    .restart       (restart),
    .switch        (switch),
    .led           (led),
    .start         (start),
    .game_state    (game_state),
    .score         (score),
    .wrong_counter (wrong_counter)
);
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end
initial begin
    $monitor("t=%0t rst=%b restart=%b led=%b switch=%b state=%b start=%b score=%0d wrong=%0d",
              $time, rst, restart, led, switch, game_state, start, score, wrong_counter);
    rst     = 0;
    restart = 0;
    switch  = 10'b0;
    led     = 10'b0000010000;
    #25 rst = 1;
    #20 switch = 10'b0000010000;
    #20;
    led = 10'b0000001000; switch = 10'b0000001000; #20;
    led = 10'b0000000100; switch = 10'b0000000100; #20;
    led = 10'b0000000010; switch = 10'b0000000010; #20;
    restart = 1; #20; restart = 0;
    led = 10'b0000010000; switch = 10'b0000010000; #20;
    led = 10'b0000001000; switch = 10'b1111111111; #20;
    led = 10'b0000000100; switch = 10'b1111111111; #20;
    restart = 1; #20; restart = 0;
    #40;
    $finish;
end
endmodule
