library verilog;
use verilog.vl_types.all;
entity ShiftRegister is
    generic(
        size            : integer := 12
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        shR             : in     vl_logic;
        shL             : in     vl_logic;
        shiftTwo        : in     vl_logic_vector(1 downto 0);
        I               : in     vl_logic_vector;
        O               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end ShiftRegister;
