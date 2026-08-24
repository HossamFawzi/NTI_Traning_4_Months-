library verilog;
use verilog.vl_types.all;
entity orgate is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : out    vl_logic
    );
end orgate;
