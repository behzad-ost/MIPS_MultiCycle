module ShiftRegister #(parameter size = 12) (
  input clk, 
  rst,
  shR, 
  shL, 
  input [1:0]shiftTwo, 
  input [size-1:0]I, 
  output reg [size-1:0]O);
  
  always @(posedge clk, rst) begin
    if(rst)
      O <= 0;
    else if(shR) begin
      if(shiftTwo == 2'd2)
        O <= {I[1:0], I[size-1: 2]};
      else
        O <= {I[0:0], I[size-1: 1]};
    end 
    else begin
      if(shiftTwo == 2'd2)
        O <= {I[size-3:0], I[1:0]};
      else
        O <= {I[size-2:0], I[0:0]};
    end
  end
  
endmodule