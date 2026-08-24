library verilog;
use verilog.vl_types.all;
entity invgate is
    port(
        a               : in     vl_logic;
        c               : out    vl_logic
    );
end invgate;
