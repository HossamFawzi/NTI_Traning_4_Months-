library verilog;
use verilog.vl_types.all;
entity top_gray_to_sev is
    port(
        grey_in         : in     vl_logic_vector(3 downto 0);
        H               : out    vl_logic_vector(6 downto 0)
    );
end top_gray_to_sev;
