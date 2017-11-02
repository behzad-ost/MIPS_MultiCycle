library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Inst            : in     vl_logic_vector(11 downto 0);
        CY              : in     vl_logic;
        zero            : in     vl_logic;
        ldPC            : out    vl_logic;
        ldIR            : out    vl_logic;
        ldACC           : out    vl_logic;
        ldMDR           : out    vl_logic;
        ldCY            : out    vl_logic;
        ldEA            : out    vl_logic;
        rstACC          : out    vl_logic;
        rstCY           : out    vl_logic;
        shiftRL         : out    vl_logic_vector(1 downto 0);
        shiftAmount     : out    vl_logic_vector(1 downto 0);
        memread         : out    vl_logic;
        memwrite        : out    vl_logic;
        ALUfunc         : out    vl_logic_vector(2 downto 0);
        PCMuxSel        : out    vl_logic;
        ALUin1Sel       : out    vl_logic_vector(1 downto 0);
        ALUin2Sel       : out    vl_logic_vector(1 downto 0);
        EAMuxSel        : out    vl_logic_vector(1 downto 0);
        ACCinSel        : out    vl_logic;
        memWriteDataSel : out    vl_logic_vector(1 downto 0);
        memAddrSel      : out    vl_logic_vector(1 downto 0);
        CYinSel         : out    vl_logic_vector(1 downto 0)
    );
end controller;
