`define ADD 4'b0001
`define ADDU 4'b0010
`define AND 4'b0011
`define OR 4'b0100
`define NOR 4'b0101
`define SLTU 4'b0110
`define SLT 4'b0111
`define SLL 4'b1000
`define SRL 4'b1001
`define SUB 4'b1010
`define SUBU 4'b1011
`define SRA 4'b1100
`define LUI 4'b1101

 module ALU
(
	input [31:0] data1, data2,
	input [3:0] ALUOp,
	input [4:0] shamt,
	output reg [31:0] result,
	output reg zero,
	output reg overflow
);

always @ (*) begin

	case (ALUOp)
		`ADD:		
				begin
				result = $signed(data1) + $signed(data2);
				overflow = (data1[31] && data2[31] && ~result[31]) || (~data1[31] && ~data2[31] && result[31]);
				end
					
		`ADDU:		begin
				result = $unsigned(data1) + $unsigned(data2);
				end
		`AND:		result = data1 & data2;
		`NOR:		result = ~(data1 | data2);
		`OR:		result = data1 | data2;
		`SLL:		result = data2 << shamt;
		`SRL:		result = data2 >> shamt;
		`SLT: 		result = (data1 < data2);
		`SLTU:		result = (data1 < data2);
		
		`SUB:		begin
				result = $signed(data1) - $signed(data2);
				overflow = (data1[31] && data2[31] && ~result[31]) || (~data1[31] && ~data2[31] && result[31]);
				end
		`SUBU:		result = $unsigned(data1) - $unsigned(data2);
		`SRA:		result = data2 >>> shamt;
		
		`LUI:		begin
				result[31:16] = data1[15:0];
				result[15:0] = 16'b0000000000000000;
				end
	
	endcase
	zero = (result == 32'b0) && (~overflow);
end

endmodule
