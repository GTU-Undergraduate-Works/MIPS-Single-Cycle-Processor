module mux32bit_testbench();

reg[31:0] in1;
reg[31:0] in2;
reg select;
wire [31:0] out;


mux_2_1_32bit test(out, select, in1, in2);


initial begin
in1 = 32'b01010101010101010101011010101010; 
in2 = 32'b11111111111111111111111111111111;
select = 1'b0; #50;

in1 = 32'b01010101010101010101011010101010; 
in2 = 32'b11111111111111111111111111111111;
select = 1'b1;

end

initial begin
$monitor("İn1 = %5b--in2 = %5b\nout = %5b--select = %1b", in1, in2, out, select);
end


endmodule
