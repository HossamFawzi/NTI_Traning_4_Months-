module game_controller #(
    parameter BOSS_AFTER = 2,
    parameter LOSE_AFTER = 2
)(
    input  wire clk,
    input  wire rst,
    input  wire [9:0] switch,
    input  wire [9:0] led,
    output reg start,
    output reg [1:0] game_state
);

reg [1:0] game_state;
localparam IDLE = 2'b00;
localparam PLAY = 2'b01;
localparam BOSS = 2'b10;
localparam LOSE = 2'b11;
reg [3:0] correct_counter;
reg [3:0] wrong_counter;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        game_state <= IDLE;
        correct_counter <= 0;
        wrong_counter <= 0;
    end
    else begin
        if (game_state == IDLE) begin

            if (led == switch) begin
                game_state <= PLAY;
            end
            else begin
                game_state <= IDLE;
            end

        end
        else if (game_state == PLAY) begin
            if (led == switch) begin
                correct_counter <= correct_counter + 1;
                if (correct_counter + 1 >= BOSS_AFTER) begin
                    game_state <= BOSS;
                end
                else begin
                    game_state <= PLAY;
                end
            end
            else begin
                wrong_counter <= wrong_counter + 1;
                if (wrong_counter + 1 >= LOSE_AFTER) begin
                    game_state <= LOSE;
                end
                else begin
                    game_state <= PLAY;
                end
            end
        end
        else if (game_state == BOSS) begin
            game_state <= BOSS;
        end
        else if (game_state == LOSE) begin
            game_state <= LOSE;
        end
        else begin
            game_state <= IDLE;
        end
    end
end

// Output Logic
always @(*) begin

    case (game_state)
        IDLE: start = 0;
        PLAY: start = 1;
        BOSS: start = 0;
        LOSE: start = 0;
        default: start = 0;
    endcase

end
endmodule