module sign_extender_testbench();



reg [15:0] inp;
wire [31:0] outp;

sign_extender signextend(inp,outp);

initial begin
inp = 16'b1000101001111100; #10;
inp = 16'b0101111110000110;
end



initial begin

$monitor("time = %2d\ninput = %16b\noutput = %32b\n\n", $time, inp, outp);

end




endmodule
