module debouncing_circuit (
    input wire clk,
    input wire rst,
    input wire sw,
    input wire m_tick,
    output reg out
);

parameter clk_in = 50_000;
parameter TICK   = 100;
parameter N      = clk_in / TICK;
parameter counter_w = $clog2(N);

reg unsigned [counter_w-1:0] counter;
reg [2:0] current_state, next_state;

localparam ZERO    = 3'b000,
           WAIT1_1 = 3'b001,
           WAIT1_2 = 3'b010,
           WAIT1_3 = 3'b011,
           WAIT0_3 = 3'b100,
           WAIT0_2 = 3'b101,
           WAIT0_1 = 3'b110,
           ONE     = 3'b111;

// State register
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        current_state <= ZERO;
        counter <= 0;
    end else if (counter == N-1) begin
        counter <= 0;
        current_state <= next_state;
    end else begin
        counter <= counter + 1;
    end
end

// Next-state logic
always @(*) begin
    case (current_state)
        ZERO   : next_state = sw ? WAIT1_1 : ZERO;
        WAIT1_1: next_state = sw ? WAIT1_2 : ZERO;
        WAIT1_2: next_state = sw ? WAIT1_3 : ZERO;
        WAIT1_3: next_state = sw ? ONE     : ZERO;
        ONE    : next_state = sw ? ONE     : WAIT0_1;
        WAIT0_1: next_state = sw ? ONE     : WAIT0_2;
        WAIT0_2: next_state = sw ? ONE     : WAIT0_3;
        WAIT0_3: next_state = sw ? ONE     : ZERO;
        default: next_state = ZERO;
    endcase
end

// Output logic
always @(*) begin
    case (current_state)
        ZERO:    out = 0;
        ONE:     out = 1;
        default: out = out; 
    endcase
end

endmodule
