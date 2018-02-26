module control_unit
(
	input [5:0] opcode, func,
	output reg branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest, jump, jal, bneq,
	output reg [3:0] ALUOp
);
	
	always @ (*) begin
	
		// R-type 
		if (opcode == 6'b000000) begin
				jump = 1'b0;
				branch = 1'b0;
				MemRead = 1'b0;
				MemtoReg = 1'b0;
				MemWrite = 1'b0;
				ALUSrc = 1'b0;
				RegWrite = 1'b1;
				RegDest = 1'b1;
				bneq = 1'b0;
				jal = 1'b0;
				
				if (func == 6'b100000)
					ALUOp = 4'b0001; 
					// add 
				else if (func == 6'b100001) 
					ALUOp = 4'b0010; 
					// addu
				else if (func == 6'b100100)
					ALUOp = 4'b0011; 
					// and
				else if (func == 6'b001000) 
					ALUOp = 4'b00000; 
					// jr	
				else if (func == 6'b100111) 
					ALUOp = 4'b0101; 
					// nor 
				else if (func == 6'b100101) 
					ALUOp = 4'b0100; 
					// or
				else if (func == 6'b101010) 
					ALUOp = 4'b0111; 
					// slt
				else if (func == 6'b101011) 
					ALUOp = 4'b0110; 
					// sltu
				else if (func == 6'b000000)
					ALUOp = 4'b1000;  
					// sll
				else if (func == 6'b000010) 
					ALUOp = 4'b1001;  
					// srl	
				else if (func == 6'b100010)
					ALUOp = 4'b1010; 
					// sub 
				else if (func == 6'b100011) 
					ALUOp = 4'b1011;
					// subu
				else if (func == 6'b000011)
					ALUOp = 4'b1100;
					// sra
		end
		// jump(J-type)
		else if (opcode == 6'b000010) begin
			jump = 1'b1;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b0;
			RegDest = 1'b0;
			ALUOp = 4'b0000;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// jal (J-type)
		else if (opcode == 6'b000011) begin
			jump = 1'b1;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b0;
			RegDest = 1'b0;
			ALUOp = 4'b0000;
			bneq = 1'b0;
			jal = 1'b1;
		end
		
		// I-Type Instructions
		
		// addi 
		else if (opcode == 6'b001000) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b0001;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// addiu 
		else if (opcode == 6'b001001) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b0010;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// andi 
		else if (opcode == 6'b001100) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b0011;
			bneq = 1'b0;
			jal = 1'b0;
			
		end
		// beq tamam
		else if (opcode == 6'b000100) begin
			jump = 1'b0;
			branch = 1'b1;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b0;
			RegDest = 1'b0;
			ALUOp = 4'b1010;
			bneq = 1'b0;
			jal = 1'b0;
			
		end
		// bneq 
		else if (opcode == 6'b000101) begin
			jump = 1'b0;
			branch = 1'b1;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b0;
			RegDest = 1'b0;
			ALUOp = 4'b1010;
			bneq = 1'b1;
			jal = 1'b0;
		end
		// ll
		else if (opcode == 6'b110000) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b1001;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// lui
		else if (opcode == 6'b001111) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b1101;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// lw tamam
		else if (opcode == 6'b100011) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b1;
			MemtoReg = 1'b1;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b0001;
			bneq = 1'b0;
			jal = 1'b0;
		end
		
		// ori 
		else if (opcode == 6'b001101) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b0100;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// slti 
		else if (opcode == 6'b001010) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b0111;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// sltui 
		else if (opcode == 6'b001011) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			RegDest = 1'b0;
			ALUOp = 4'b0110;
			bneq = 1'b0;
			jal = 1'b0;
		end
		// sw
		else if (opcode == 6'b101011) begin
			jump = 1'b0;
			branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b1;
			ALUSrc = 1'b1;
			RegWrite = 1'b0;
			RegDest = 1'b0;
			ALUOp = 4'b0001;
			bneq = 1'b0;
			jal = 1'b0;
		end
	end
endmodule
