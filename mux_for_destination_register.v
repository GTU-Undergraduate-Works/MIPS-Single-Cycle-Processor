module mux_for_destination_register
(
	output reg [4:0] out,
	input select,
	input [4:0] in1, 
	input [4:0] in2
);

always @ (in1 or in2 or select) begin
	if (select == 1'b0)
		out = in1;
	else	
		out = in2;
end


endmodule
