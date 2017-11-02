library verilog;
use verilog.vl_types.all;
entity BusMUX is
    generic(
        busSize         : integer := 32
    );
    port(
        I1              : in     vl_logic_vector;
        I2              : in     vl_logic_vector;
        I3              : in     vl_logic_vector;
        I4              : in     vl_logic_vector;
        sel             : in     vl_logic_vector(1 downto 0);
        O               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of busSize : constant is 1;
end BusMUX;
