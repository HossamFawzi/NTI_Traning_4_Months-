library verilog;
use verilog.vl_types.all;
entity top is
    generic(
        CLK_DIV_COUNT   : integer := 6249999;
        BOSS_AFTER      : integer := 5;
        LOSE_AFTER      : integer := 3
    );
    port(
        clk             : in     vl_logic;
        key_rst_n       : in     vl_logic;
        key_restart_n   : in     vl_logic;
        switch          : in     vl_logic_vector(9 downto 0);
        led             : out    vl_logic_vector(9 downto 0);
        seg0            : out    vl_logic_vector(6 downto 0);
        seg1            : out    vl_logic_vector(6 downto 0);
        seg2            : out    vl_logic_vector(6 downto 0);
        seg3            : out    vl_logic_vector(6 downto 0);
        dp0             : out    vl_logic;
        dp1             : out    vl_logic;
        dp2             : out    vl_logic;
        dp3             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_DIV_COUNT : constant is 1;
    attribute mti_svvh_generic_type of BOSS_AFTER : constant is 1;
    attribute mti_svvh_generic_type of LOSE_AFTER : constant is 1;
end top;
