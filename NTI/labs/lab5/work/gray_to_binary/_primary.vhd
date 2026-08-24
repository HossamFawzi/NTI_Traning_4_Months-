library verilog;
use verilog.vl_types.all;
entity gray_to_binary is
    port(
        gray_in         : in     vl_logic_vector(3 downto 0);
        binary          : out    vl_logic_vector(3 downto 0)
    );
end gray_to_binary;
