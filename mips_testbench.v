module mips_testbench ();
reg clock;
wire result;

mips_core test(clock);

initial clock = 0;

always
	#50 clock=~clock;

initial begin
	#3200 $finish;

end


always @ (*) begin
	$writememb("res_registers.mem", test.registers.registers);
end

endmodule
