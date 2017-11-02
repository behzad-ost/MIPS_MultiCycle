module MUX2 #(parameter selSize=2, busSize=8)
  (input [busSize-1:0] I [0: 2**selSize-1],
   input [selSize-1:0] sel,
   output reg [busSize-1:0] O);
   
   always @(I[0], sel) begin
     O <= I[sel];
   end
 endmodule