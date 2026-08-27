library verilog;
use verilog.vl_types.all;
entity edge_detector is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        \in\            : in     vl_logic;
        tick_moore      : out    vl_logic;
        tick_meely      : out    vl_logic
    );
end edge_detector;
