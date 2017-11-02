module RegFile
  (input clk,
   input reset,
   input write,
   input [4:0] wrAddr,
   input [31:0] wrData,
   input [4:0] rdAddrA,
   output [31:0] rdDataA,
   input [4:0] rdAddrB,
   output [31:0] rdDataB);

   reg [31:0] 	 regfile [0:31];

   assign rdDataA = regfile[rdAddrA];
   assign rdDataB = regfile[rdAddrB];

   integer 	 i;
   always @(posedge clk) begin
      if (reset) begin
      	 for (i = 0; i < 31; i = i + 1) begin
    	    regfile[i] <= 0;
      	 end
      end else begin
    	 if (write) regfile[wrAddr] <= wrData;
      end
   end
endmodule
