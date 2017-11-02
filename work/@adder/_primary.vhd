library verilog;
use verilog.vl_types.all;
entity Adder is
    generic(
        size            : integer := 16
    );
    port(
        I1              : in     vl_logic_vector;
        I2              : in     vl_logic_vector;
        w               : out    vl_logic_vector;
        cout            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end Adder;
