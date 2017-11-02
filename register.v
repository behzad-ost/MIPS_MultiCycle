module Register #(parameter size=8) (input clk, ld, rst, input [size-1:0]data, output reg [size-1:0]O);
  always @(posedge clk) begin
    if(rst)
      O <= 0;
    else if(ld)
      O <= data;
  end
endmodule