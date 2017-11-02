library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        clk             : in     vl_logic;
        PCInSel         : in     vl_logic;
        PCLd            : in     vl_logic;
        PCRst           : in     vl_logic;
        EALd            : in     vl_logic;
        EARst           : in     vl_logic;
        MDRLd           : in     vl_logic;
        MDRRst          : in     vl_logic;
        ACCInSel        : in     vl_logic;
        ACCLd           : in     vl_logic;
        ACCRst          : in     vl_logic;
        CYLd            : in     vl_logic;
        CYRst           : in     vl_logic;
        IRLd            : in     vl_logic;
        IRRst           : in     vl_logic;
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        memAddrSel      : in     vl_logic_vector(1 downto 0);
        memWriteSel     : in     vl_logic_vector(1 downto 0);
        shRst           : in     vl_logic;
        shR             : in     vl_logic;
        shL             : in     vl_logic;
        shiftTwo        : in     vl_logic_vector(1 downto 0);
        EAInSel         : in     vl_logic_vector(1 downto 0);
        ALUInSel1       : in     vl_logic_vector(1 downto 0);
        ALUInSel2       : in     vl_logic_vector(1 downto 0);
        CYInSel         : in     vl_logic_vector(1 downto 0);
        ALUSel          : in     vl_logic_vector(2 downto 0);
        Inst            : out    vl_logic_vector(11 downto 0);
        zero            : out    vl_logic;
        CY              : out    vl_logic
    );
end DataPath;
