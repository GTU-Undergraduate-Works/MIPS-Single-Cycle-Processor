module mux_2_1_32bit
(
	output reg [31:0] out,
	input select,
	input [31:0] in1,
	input [31:0] in2
);

always @ (in1 or in2 or select) begin

if (select == 1'b0)
	out = in1;
else	
	out = in2;
	
end
endmodule
