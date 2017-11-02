library verilog;
use verilog.vl_types.all;
entity MUX2 is
    generic(
        selSize         : integer := 2;
        busSize         : integer := 8
    );
    port(
        I               : in     vl_logic;
        sel             : in     vl_logic_vector;
        O               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of selSize : constant is 1;
    attribute mti_svvh_generic_type of busSize : constant is 1;
end MUX2;
