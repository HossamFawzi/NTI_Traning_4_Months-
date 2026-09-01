module game_controller #(
    parameter BOSS_AFTER = 5,
    parameter LOSE_AFTER = 3
)(
    input  wire       clk,
    input  wire       rst,
    input  wire       restart,
    input  wire [9:0] switch,
    input  wire [9:0] led,
    output reg        start,
    output reg  [1:0] game_state,
    output reg  [3:0] score,
    output reg  [3:0] wrong_counter
);
localparam IDLE = 2'b00;
localparam PLAY = 2'b01;
localparam BOSS = 2'b10;
localparam LOSE = 2'b11;
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        game_state    <= IDLE;
        score         <= 4'd0;
        wrong_counter <= 4'd0;
    end
    else begin
        case (game_state)
            IDLE: begin
                if (led == switch)
                    game_state <= PLAY;
            end
            PLAY: begin
                if (led == switch) begin
                    score <= score + 1'b1;
                    if (score + 1'b1 >= BOSS_AFTER)
                        game_state <= BOSS;
                end
                else begin
                    wrong_counter <= wrong_counter + 1'b1;
                    if (wrong_counter + 1'b1 >= LOSE_AFTER)
                        game_state <= LOSE;
                end
            end
            BOSS: begin
                if (restart) begin
                    game_state    <= IDLE;
                    score         <= 4'd0;
                    wrong_counter <= 4'd0;
                end
            end
            LOSE: begin
                if (restart) begin
                    game_state    <= IDLE;
                    score         <= 4'd0;
                    wrong_counter <= 4'd0;
                end
            end
            default: game_state <= IDLE;
        endcase
    end
end
always @(*) begin
    case (game_state)
        IDLE: start = 1'b0;
        PLAY: start = 1'b1;
        BOSS: start = 1'b0;
        LOSE: start = 1'b0;
        default: start = 1'b0;
    endcase
end
endmodule
