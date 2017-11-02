module controller(input clk, rst, input [11:0]Inst, input CY, zero,
	output reg ldPC,
	output reg ldIR,
	output reg ldACC,
	output reg ldMDR,
	output reg ldCY,
	output reg ldEA,
	output reg rstACC,
	output reg rstCY,
	output reg [1:0]shiftRL,
	output reg [1:0]shiftAmount,
	output reg memread , memwrite,
	output reg [2:0]ALUfunc,
	output reg PCMuxSel,
	output reg [1:0]ALUin1Sel,
	output reg [1:0]ALUin2Sel,
	output reg [1:0]EAMuxSel,
	output reg ACCinSel,
	output reg [1:0]memWriteDataSel,
	output reg [1:0]memAddrSel,
	output reg [1:0]CYinSel);
	
localparam[4:0] IF = 5'd0, ID = 5'd1, EA1 = 5'd2, EA2 = 5'd3, AddAnd1 = 5'd4, AddAnd2 = 5'd5, ISZ1 = 5'd6, ISZ2 = 5'd7,
				DCA = 5'd8, JMP = 5'd9, JMS = 5'd10, CLA = 5'd11, CLC = 5'd12 , CMA = 5'd13, CMC = 5'd14, RARRAL1 = 5'd15,
				RARRAL2 = 5'd16, IAC = 5'd17, SMA = 5'd18, SZA = 5'd19, SNC = 5'd20 , Skip = 5'd21;

	reg [4:0] ps , ns;
	
	always @(ps, Inst, CY, zero) begin : transaction
	
	case (ps)
		IF : ns <= ID; 
		ID : ns <= ((Inst[11:9]>=3'b000) && (Inst[11:9]<3'b110)) ? EA1 :
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b0) && Inst[7]) ? CLA : 
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b0) && Inst[6]) ? CLC : 
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b0) && Inst[5]) ? CMA: 
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b0) && Inst[4]) ? CMC: 
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b0) && Inst[3]) ? RARRAL1: 
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b0) && Inst[2]) ? RARRAL1: 
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b0) && Inst[0]) ? IAC :
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b1) && Inst[7]) ? SMA :
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b1) && Inst[6]) ? SZA :
				   ((Inst[11:9]==3'b111) && (Inst[8]==1'b1) && Inst[5]) ? SNC :
				   5'bxxxxx ;

		EA1: ns <= (Inst[8]) ? EA2 : 
				   ((Inst[11:9]==3'b000) || (Inst[11:9]==3'b001)) ? AddAnd1 :
				   (Inst[11:9]==3'b010) ? ISZ1 :
				   (Inst[11:9]==3'b011) ? DCA :
				   (Inst[11:9]==3'b100) ? JMP :
				   (Inst[11:9]==3'b101) ? JMS : 5'bxxxxx;
				    
		EA2: ns<=  ((Inst[11:9]==3'b000) || (Inst[11:9]==3'b001)) ? AddAnd1 :
				   (Inst[11:9]==3'b010) ? ISZ1 :
				   (Inst[11:9]==3'b011) ? DCA :
				   (Inst[11:9]==3'b100) ? JMP :
				   (Inst[11:9]==3'b101) ? JMS : 5'bxxxxx;
				   
		AddAnd1 : ns<=AddAnd2; 
		AddAnd2 : ns<=IF; 	
		ISZ1 : ns<= ISZ2;
		ISZ2 : ns<= zero ? Skip : IF ;
		DCA : ns<=IF;
		JMP : ns<=IF;
		JMS : ns<=IF; //Skip
		
		CLA : ns <= IF;
		CLC : ns <= IF;
		CMA : ns <= IF;
		CMC : ns <= IF;
		RARRAL1 : ns <= RARRAL2 ;
		RARRAL2 : ns <= IF;
		IAC : ns <= IF;
		
		SMA : ns <= zero ? Skip : IF;
		SZA : ns <= zero ? Skip : IF;
		SNC : ns <= zero ? Skip : IF;
		
		Skip : ns <=IF;
		
	endcase 
	end
	
	always@(ps) begin : outputing
		ldPC=1'b0;
		ldACC=1'b0;
		ldMDR=1'b0;
		ldCY=1'b0;
		ldEA=1'b0;
		rstACC=1'b0;
		rstCY=1'b0;
		shiftRL=2'b0;
		shiftAmount=2'b0;
		memread=1'b0; memwrite=1'b0;
		ALUfunc=3'b0;
		PCMuxSel=1'b0;
		ALUin1Sel=2'b0;
		ALUin2Sel=2'b0;
		EAMuxSel=2'b0;
		ACCinSel=1'b0;
		memWriteDataSel=2'b0;
		memAddrSel=2'b0;
		CYinSel=2'b0;
		ldIR=1'b0;
	
	case(ps)
	IF:
		begin 
			ldPC=1;
			ldIR=1;
        end

	ID: begin end
			
		
	EA1: 
		begin 
			EAMuxSel = Inst[7] ? 2 : 1 ;
			ldEA=1;
		end
			
	EA2:
		begin 
			memAddrSel=1;
			EAMuxSel = 0;
			ldEA=1;
		end
		
	AddAnd1: 
		begin 
			memAddrSel=1;
			ldMDR=1;
		end
		
	AddAnd2:
		begin 
			ALUin1Sel = 1;
			ALUin2Sel = 1;
			ALUfunc=(Inst[11:9]==3'd0) ?  3'd001 : 3'b000; 	//ADD //AND
			ldACC=1;
			ldCY=(Inst[11:9]==3'b001) ? 1 : 0;
		end
	
	ISZ1: 
		begin 
			memAddrSel=1;
			ldMDR=1;
		end
	ISZ2:
		begin 
			ALUin1Sel = 2;
			ALUin2Sel = 1;
			memAddrSel=1;
			memWriteDataSel = 1;
			memwrite = 1;
		end
	DCA:
		begin
			memWriteDataSel=0;
			memAddrSel=1;
			memwrite=1;
			rstACC=1;
		end
	
	JMP:
		begin
			PCMuxSel=1;
			ldPC=1;
		end
	JMS:
		begin
			memAddrSel = 2;
			memWriteDataSel = 2;
			memwrite=1;
			PCMuxSel=1;
			ldPC=1;
		end				
	
	CLA:
		rstACC=1;
	CLC:
		rstCY=1;
	
	CMA:
		begin
			ALUin1Sel=1;
			ALUfunc=3'b100; ///Complement ACC
			ldACC=1;
		end
	CMC:
		begin 
			CYinSel=2;
			ldCY=1;
		end
	RARRAL1:
		begin
			shiftRL=Inst[3] ? 2'b01 : 2'b10 ;
			shiftAmount = Inst[1] ? 2 : 1 ;
		end
	RARRAL2:
		begin
			ACCinSel=1;
			CYinSel=1;
			ldACC=1;
			ldCY=1;
		end
	
	IAC:
		begin
			ALUin1Sel = 1;
			ALUin2Sel = 2;
			ALUfunc=3'b000; //ADD
			ldACC=1;
		end
	SMA:
		begin 
			ALUin1Sel=1;
			ALUfunc=3'b101;	//Minus ACC : zero =1;
		end
	SZA:
		begin 
			ALUin1Sel=1;
			ALUfunc=3'b110; // ZERO ACC: zero =1;
		end
	SNC:
		begin
		end
	
	Skip:
		begin 
			ldPC=1;
		end
	
	default: 
		begin
			ldPC=1'b0;
			ldACC=1'b0;
			ldMDR=1'b0;
			ldCY=1'b0;
			ldEA=1'b0;
			rstACC=1'b0;
			rstCY=1'b0;
			shiftRL=2'b0;
			shiftAmount=2'b0;
			memread=1'b0; memwrite=1'b0;
			ALUfunc=3'b0;
			PCMuxSel=1'b0;
			ALUin1Sel=2'b0;
			ALUin2Sel=2'b0;
			EAMuxSel=2'b0;
			ACCinSel=1'b0;
			memWriteDataSel=2'b0;
			memAddrSel=2'b0;
			CYinSel=2'b0;
		end		
	endcase
end
	
	always@(posedge clk , posedge rst) begin : sequential
		if(rst) ps <= IF;
			else ps <= ns;
		end
endmodule
	
