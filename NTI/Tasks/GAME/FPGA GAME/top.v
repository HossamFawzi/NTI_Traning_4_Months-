module top #(
    parameter CLK_DIV_COUNT = 6249999, 
    parameter BOSS_AFTER    = 5,
    parameter LOSE_AFTER    = 3
)(
    input  wire       clk,           
    input  wire       key_rst_n,     
    input  wire       key_restart_n, 
    input  wire [9:0] switch,        
    output wire [9:0] led,           
    output wire [6:0] seg0,
    output wire [6:0] seg1,
    output wire [6:0] seg2,
    output wire [6:0] seg3
    //output wire       dp0,
    //output wire       dp1,
    //output wire       dp2,
    //output wire       dp3
);
wire       slow_clk;
wire       start;
wire [1:0] game_state;
wire       restart_pulse;
wire [3:0] score;
wire [3:0] wrong_counter;
wire [9:0] led_int;
localparam CH_BLANK = 4'd15;
localparam CH_B     = 4'd10;
localparam CH_O     = 4'd11;
localparam CH_S     = 4'd12;
localparam CH_L     = 4'd13;
localparam CH_E     = 4'd14;
reg [3:0] disp3, disp2, disp1, disp0;
always @(*) begin
    case (game_state)
        2'b10: begin
            disp3 = CH_B; disp2 = CH_O; disp1 = CH_S; disp0 = CH_S;
        end
        2'b11: begin
            disp3 = CH_L; disp2 = CH_O; disp1 = CH_S; disp0 = CH_E;
        end
        default: begin
            disp3 = CH_BLANK; disp2 = wrong_counter; disp1 = CH_BLANK; disp0 = score;
        end
    endcase
end
localparam BLINK_DIV = 4;
reg [3:0] blink_cnt;
reg       blink_state;
always @(posedge slow_clk or negedge key_rst_n) begin
    if (!key_rst_n) begin
        blink_cnt   <= 4'd0;
        blink_state <= 1'b0;
    end
    else if (blink_cnt == BLINK_DIV - 1) begin
        blink_cnt   <= 4'd0;
        blink_state <= ~blink_state;
    end
    else begin
        blink_cnt <= blink_cnt + 1'b1;
    end
end
assign led = (game_state == 2'b10) ? (blink_state ? 10'b1111111111 : 10'b0000000000) :
             (game_state == 2'b11) ? 10'b1111111111 :
             led_int;
clk_divider #(
    .COUNT_LIMIT(CLK_DIV_COUNT)
) u_clk_divider (
    .clk_in (clk),
    .rst    (key_rst_n),
    .clk    (slow_clk)
);
edge_detector u_restart_edge (
    .clk   (slow_clk),
    .rst   (key_rst_n),
    .in    (~key_restart_n),
    .press (restart_pulse)
);
one_hot u_one_hot (
    .clk   (slow_clk),
    .rst   (key_rst_n),
    .start (start),
    .led   (led_int)
);
game_controller #(
    .BOSS_AFTER(BOSS_AFTER),
    .LOSE_AFTER(LOSE_AFTER)
) u_game_controller (
    .clk           (slow_clk),
    .rst           (key_rst_n),
    .restart       (restart_pulse),
    .switch        (switch),
    .led           (led_int),
    .start         (start),
    .game_state    (game_state),
    .score         (score),
    .wrong_counter (wrong_counter)
);
sev_seg u_sev_seg0 (
    .clk   (clk),
    .rst   (key_rst_n),
    .value (disp0),
    .seg   (seg0)
);
sev_seg u_sev_seg1 (
    .clk   (clk),
    .rst   (key_rst_n),
    .value (disp1),
    .seg   (seg1)
);
sev_seg u_sev_seg2 (
    .clk   (clk),
    .rst   (key_rst_n),
    .value (disp2),
    .seg   (seg2)
);
sev_seg u_sev_seg3 (
    .clk   (clk),
    .rst   (key_rst_n),
    .value (disp3),
    .seg   (seg3)
    
);
endmodule
