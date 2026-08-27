`timescale 1ns / 1ps

module FSM_tb ();

  // Testbench signals
  reg  clk;
  reg  rst;
  reg  a;
  reg  b;
  wire y0;
  wire y1;

  // Instantiate the Device Under Test (DUT)
  FSM dut (
      .rst(rst),
      .clk(clk),
      .a  (a),
      .b  (b),
      .y0 (y0),
      .y1 (y1)
  );

  // Clock generation: 10ns period (100 MHz)
  always #5 clk = ~clk;

  // Stimulus process
  initial begin
    // 1. Initialize Inputs
    clk = 0;
    rst = 0;  // Assert active-low reset
    a   = 0;
    b   = 0;

    // 2. Release reset after a short delay
    #15 rst = 1;

    // 3. Test Transitions
    // Test: S0 -> S0
    @(negedge clk);
    a = 1'b0;
    b = 1'b0;
    // Expected: current_state = S0, y1 = 1, y0 = 0

    // Test: S0 -> S1
    @(negedge clk);
    a = 1'b1;
    b = 1'b0;
    // Expected: current_state = S1, y1 = 1, y0 = 0

    // Test: S1 -> S0
    @(negedge clk);
    a = 1'b1;
    b = 1'b0;
    // Expected: current_state = S0, y1 = 1, y0 = 0

    // Test: S0 -> S2 (Testing Mealy output)
    @(negedge clk);
    a = 1'b1;
    b = 1'b1;
    // Expected: y0 goes to 1 IMMEDIATELY (combinational), 
    // then on next posedge, current_state = S2

    // Test: S2 -> S0 (Unconditional)
    @(negedge clk);
    a = 1'b0;
    b = 1'b0;
    // Expected: current_state = S0, y1 = 1, y0 = 0

    // Run for a few more cycles then stop
    #20;
    $display("Simulation complete.");
    $finish;
  end

  // Optional: Monitor changes in the console
  initial begin
    $monitor("Time=%0t | rst=%b | a=%b b=%b | y1=%b y0=%b", $time, rst, a, b, y1, y0);
  end

endmodule
