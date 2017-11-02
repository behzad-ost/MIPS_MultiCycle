module Memory #(parameter width=12, size=4096, addrSize=12)
  (input clk,
   input read,
   input write,
   input [addrSize-1:0]addr,
   output reg [width-1:0]rdData,
   input [width-1:0]wrData
  );
  reg [width-1:0] Mem [0:size-1];
  
  initial begin 
	Mem[0]={12'b111010000000};
	// Mem[1]={};
	Mem[1]={12'b111101000000};
	Mem[2]={12'b111000000001};
	Mem[3]={12'b111000000001};
	//Mem[4]={5'b10100 , 7'd45};
	Mem[4]={5'b01000 , 7'd64};
	//Mem[45]={12'b111010000000};
	//Mem[3]={12'b111000001000};
	//Mem[4]={12'b111000001000};
	Mem[123] = {12'd64};
	Mem[64] = {12'd16};
	
  end
  
  always @(posedge clk) begin
    if(write)	
      Mem[addr] <= wrData;	
//    else
//      rdData <= Mem[addr];
  end
  always @(addr, read)
   if(read) rdData <= Mem[addr];
endmodule
  
  
   