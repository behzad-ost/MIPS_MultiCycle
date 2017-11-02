module SignExtend #(parameter inSize=16, outSize=32)
  (input [inSize-1:0]I,
   input zero,
   output [outSize-1:0]W);
   assign W = (zero) ? {{(outSize-inSize){1'b0}}, I[inSize-1:0]} :
                            {{(outSize-inSize){I[inSize-1]}}, I};
endmodule