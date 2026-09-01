library verilog;
use verilog.vl_types.all;
entity edge_detector is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        \in\            : in     vl_logic;
        press           : out    vl_logic
    );
end edge_detector;
