library verilog;
use verilog.vl_types.all;
entity sev_seg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        value           : in     vl_logic_vector(3 downto 0);
        seg             : out    vl_logic_vector(6 downto 0);
        dp              : out    vl_logic
    );
end sev_seg;
