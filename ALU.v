module ALU
   (input [11:0]dataA,
    input [11:0]dataB,
    input [2:0]sel,
    output reg [11:0]O,
    output reg zero, CY);
		
    always @(sel, dataA, dataB) begin
      case (sel)
        0: {CY,O} <= dataA + dataB;
        1: O <= dataA & dataB;
		4: O <= ~dataA + 1 ;
		5: zero = (dataA[11]==1) ? 1: zero;
		6: zero = (dataA==0) ? 1 : zero ;
		default : O<=32'b0;
      endcase
    end
endmodule
