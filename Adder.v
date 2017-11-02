module Adder #(parameter size=16) (input [size-1:0] I1, I2, output [size-1:0] w, output cout);
    assign {cout, w} = I1 + I2;
endmodule