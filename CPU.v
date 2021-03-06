module CPU(input clk, input rst);
  
  wire [11:0]Inst;
  wire CY;
  wire zero;
  
  wire ldPC;
	wire ldIR;
	wire ldACC;
	wire ldMDR;
	wire ldCY;
	wire ldEA;
	wire rstACC;
	wire rstCY;
	wire [1:0]shiftRL;
	wire [1:0]shiftAmount;
	wire memread, memwrite;
	wire [2:0]ALUfunc;
	wire PCMuxSel;
	wire [1:0]ALUin1Sel;
	wire [1:0]ALUin2Sel;
	wire [1:0]EAMuxSel;
	wire ACCinSel;
	wire [1:0]memWriteDataSel;
	wire [1:0]memAddrSel;
	wire [1:0]CYinSel;
	 
  controller c(clk, rst, Inst, CY, zero,
  	ldPC,
  	ldIR,
  	ldACC,
  	ldMDR,
  	ldCY,
  	ldEA,
  	rstACC,
  	rstCY,
  	shiftRL,
  	shiftAmount,
  	memread , memwrite,
  	ALUfunc,
  	PCMuxSel,
  	ALUin1Sel,
  	ALUin2Sel,
  	EAMuxSel,
  	ACCinSel,
  	memWriteDataSel,
  	memAddrSel,
  	CYinSel);
	
	
	DataPath dp(clk,
       PCMuxSel,
       
       ldPC,
       rst,
       
       ldEA,
       rst,
       
       ldMDR,
       rstMDR,
       
       ACCinSel,
       ldACC,
       rstACC,
       
       ldCY,
       rstCY,
       
       ldIR,
       rst,
       
       memread,
       memwrite,
       memAddrSel,
       memWriteDataSel,
       
       rst,
       shiftRL[0],
       shiftRL[1],
      	shiftAmount,
       
       EAMuxSel,
       ALUin1Sel,
       ALUin2Sel,
       CYinSel,
   
   ALUfunc,
        Inst,
        zero,
        CY
  );
	
endmodule