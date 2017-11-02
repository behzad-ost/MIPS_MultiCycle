library verilog;
use verilog.vl_types.all;
entity SignExtend is
    generic(
        inSize          : integer := 16;
        outSize         : integer := 32
    );
    port(
        I               : in     vl_logic_vector;
        zero            : in     vl_logic;
        W               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of inSize : constant is 1;
    attribute mti_svvh_generic_type of outSize : constant is 1;
end SignExtend;
