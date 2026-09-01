library verilog;
use verilog.vl_types.all;
entity debouncing_circuit is
    generic(
        clk_in          : integer := 50000;
        TICK            : integer := 100;
        N               : vl_notype;
        counter_w       : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sw              : in     vl_logic;
        m_tick          : in     vl_logic;
        \out\           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of clk_in : constant is 1;
    attribute mti_svvh_generic_type of TICK : constant is 1;
    attribute mti_svvh_generic_type of N : constant is 3;
    attribute mti_svvh_generic_type of counter_w : constant is 3;
end debouncing_circuit;
