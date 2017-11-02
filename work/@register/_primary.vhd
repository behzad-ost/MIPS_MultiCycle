library verilog;
use verilog.vl_types.all;
entity \Register\ is
    generic(
        size            : integer := 8
    );
    port(
        clk             : in     vl_logic;
        ld              : in     vl_logic;
        rst             : in     vl_logic;
        data            : in     vl_logic_vector;
        O               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end \Register\;
