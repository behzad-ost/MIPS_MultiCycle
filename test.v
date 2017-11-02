module CPU_test();

reg clk=0,  rst=1;
CPU cpu(clk, rst);

initial begin repeat(100) #50 clk=~clk; end

initial begin 
	#100 
	rst=0;
end

endmodule