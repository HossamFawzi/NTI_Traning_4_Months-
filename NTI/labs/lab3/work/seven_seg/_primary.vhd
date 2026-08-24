library verilog;
use verilog.vl_types.all;
entity seven_seg is
    port(
        B               : in     vl_logic_vector(3 downto 0);
        H               : out    vl_logic_vector(6 downto 0)
    );
end seven_seg;
