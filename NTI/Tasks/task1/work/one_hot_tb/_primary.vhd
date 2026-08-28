library verilog;
use verilog.vl_types.all;
entity one_hot_tb is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        led             : out    vl_logic_vector(9 downto 0)
    );
end one_hot_tb;
