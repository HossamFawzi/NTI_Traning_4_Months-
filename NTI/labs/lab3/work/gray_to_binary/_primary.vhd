library verilog;
use verilog.vl_types.all;
entity gray_to_binary is
    generic(
        N               : integer := 4
    );
    port(
        G               : in     vl_logic_vector;
        B               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end gray_to_binary;
