library verilog;
use verilog.vl_types.all;
entity clk_divider is
    port(
        clk_in          : in     vl_logic;
        rst             : in     vl_logic;
        clk             : out    vl_logic
    );
end clk_divider;
