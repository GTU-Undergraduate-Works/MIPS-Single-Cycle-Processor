module sign_extender_16_to_32
(
	input [15:0] in,
	output reg [31:0] out
);


always @ (*) begin

	out[15:0] = in[15:0];
	if (in[15] == 1'b1)
		out[31:16] = 16'b1111111111111111;
	else
		out[31:16] = 16'b0000000000000000;

end 

endmodule