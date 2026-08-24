library verilog;
use verilog.vl_types.all;
entity encoder16to4 is
    generic(
        N               : integer := 16
    );
    port(
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end encoder16to4;
