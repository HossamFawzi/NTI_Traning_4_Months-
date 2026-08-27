module FSM (
    input wire rst,
    input wire clk,

    input wire a,
    input wire b,

    output reg y0,
    output reg y1
);

  // State Encoding explicitly sized
  localparam S0 = 2'b00;
  localparam S1 = 2'b01;
  localparam S2 = 2'b10;

  reg [1:0] Current_state, next_state;

  // --------------------------------------------------------
  // 1. Sequential Logic: State Register
  // --------------------------------------------------------
  always @(posedge clk or negedge rst) begin
    if (!rst) Current_state <= S0;
    else Current_state <= next_state;
  end

  // --------------------------------------------------------
  // 2. Combinational Logic: Next State Logic
  // --------------------------------------------------------
  always @(*) begin
    next_state = Current_state;

    case (Current_state)
      S0: begin
        if (~a) begin
          next_state = S0;
        end else if (a && b) begin
          next_state = S2;
        end else if (a && ~b) begin
          next_state = S1;
        end
      end

      S1: begin
        if (~a) begin
          next_state = S1;
        end else if (a) begin
          next_state = S0;
        end
      end

      S2: begin
        // Unconditional transition back to S0
        next_state = S0;
      end

      default: begin
        next_state = S0;
      end
    endcase
  end

  // --------------------------------------------------------
  // 3. Combinational Logic: Output Logic
  // --------------------------------------------------------
  always @(*) begin
    // Default output values to prevent latches
    y1 = 1'b0;
    y0 = 1'b0;

    case (Current_state)  // Fixed: Case sensitivity
      S0: begin
        // Moore output
        y1 = 1'b1;

        // Mealy output
        if (a && b) begin
          y0 = 1'b1;
        end
      end

      S1: begin
        // Moore output
        y1 = 1'b1;
      end

      S2: begin
        // Outputs default to 0
      end

      default: begin
        y1 = 1'b0;
        y0 = 1'b0;
      end
    endcase
  end

endmodule
