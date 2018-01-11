module sign_extender_26_to_32
(
	input [25:0] in,
	output reg [31:0] out
);


always @ (in) begin

	out[25:0] = in[25:0];
	if (in[15] == 1'b1)
		out[31:26] = 16'b111111;
	else
		out[31:26] = 16'b000000;

end 

endmodule
