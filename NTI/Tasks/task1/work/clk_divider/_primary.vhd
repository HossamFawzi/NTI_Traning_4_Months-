library verilog;
use verilog.vl_types.all;
entity clk_divider is
    generic(
        COUNT_LIMIT     : integer := 6249999
    );
    port(
        clk_in          : in     vl_logic;
        rst             : in     vl_logic;
        clk             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of COUNT_LIMIT : constant is 1;
end clk_divider;
