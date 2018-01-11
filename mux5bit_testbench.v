module mux5bit_testbench();

reg[4:0] in1;
reg[4:0] in2;
reg select;
wire [4:0] out;


mux_for_destination_register test(out, select, in1, in2);


initial begin
in1 = 32'b01010; 
in2 = 32'b11111;
select = 1'b0; #50;

in1 = 32'b01010; 
in2 = 32'b11111;
select = 1'b1;

end

initial begin
$monitor("İn1 = %5b--in2 = %5b\nout = %5b--select = %1b", in1, in2, out, select);
end


endmodule
