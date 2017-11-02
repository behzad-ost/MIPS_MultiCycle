library verilog;
use verilog.vl_types.all;
entity Memory is
    generic(
        width           : integer := 12;
        size            : integer := 4096;
        addrSize        : integer := 12
    );
    port(
        clk             : in     vl_logic;
        read            : in     vl_logic;
        write           : in     vl_logic;
        addr            : in     vl_logic_vector;
        rdData          : out    vl_logic_vector;
        wrData          : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of size : constant is 1;
    attribute mti_svvh_generic_type of addrSize : constant is 1;
end Memory;
