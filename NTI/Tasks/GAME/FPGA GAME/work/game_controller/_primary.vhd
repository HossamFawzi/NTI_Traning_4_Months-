library verilog;
use verilog.vl_types.all;
entity game_controller is
    generic(
        BOSS_AFTER      : integer := 5;
        LOSE_AFTER      : integer := 3
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        restart         : in     vl_logic;
        switch          : in     vl_logic_vector(9 downto 0);
        led             : in     vl_logic_vector(9 downto 0);
        start           : out    vl_logic;
        game_state      : out    vl_logic_vector(1 downto 0);
        score           : out    vl_logic_vector(3 downto 0);
        wrong_counter   : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BOSS_AFTER : constant is 1;
    attribute mti_svvh_generic_type of LOSE_AFTER : constant is 1;
end game_controller;
