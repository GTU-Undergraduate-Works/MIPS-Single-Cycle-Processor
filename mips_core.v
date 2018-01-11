module mips_core(clock);
input clock;

wire [31:0] instruction;
wire [31:0] write_data,read_data_1,read_data_2, writeToReg;
wire [31:0] read_data_from_memory;
wire [31:0] pcWriteAdress;
wire [4:0] write_reg, read_reg_1, read_reg_2,shamt;
wire [4:0] destReg;
wire [5:0] func;
wire [15:0] immed;
wire [25:0] address;
wire branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest, jump, jal, bneq;
wire [5:0] opcode;
wire [3:0] ALUOp;
wire [31:0] extendValue, ALUInput, ALUResult;
wire zero;
wire overflow = 1'b0;



assign opcode = instruction[31:26];
assign read_reg_1 = instruction[25:21]; // rs
assign read_reg_2 = instruction[20:16]; //rt
assign write_reg = instruction[15:11];  //rd
assign shamt = instruction[10:6];
assign func = instruction[5:0];
assign address = instruction[25:0];
assign immed = instruction[15:0];



reg[31:0] PC = 32'b0;



// specify the control signal in control_unit module
control_unit controlunit(opcode, func, branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest, jump, jal, bneq, ALUOp);


// instruction fetch
mips_instr_mem instructionmem(instruction, PC); 


// selects destination register
mux_for_destination_register  selectDestReg(destReg, RegDest, read_reg_2, write_reg); // tamam


// sign extension for immediate value
sign_extender_16_to_32 signextend(immed, extendValue); 


// register module for read and write
mips_registers registers(read_data_1,read_data_2,writeToReg,read_reg_1,read_reg_2,destReg,RegWrite,jal,clock,PC);


// selects source of ALU
mux_2_1_32bit selectALUsrc(ALUInput, ALUSrc, read_data_1, extendValue); 


// calculate operation
ALU aluresult(read_data_2, ALUInput, ALUOp, shamt, ALUResult, zero, overflow);


// read memory or write memory
mips_data_mem readwritememory(read_data_from_memory, ALUResult, read_data_2, MemRead, MemWrite);



// selects data to write register
mux_2_1_32bit selectregisterwritedata(writeToReg, MemtoReg, ALUResult, read_data_from_memory);



// sign extension for jump adress
sign_extender_26_to_32 extendjumpadress(address, pcWriteAdress);


always @(posedge clock)
begin
	
	// decide branc or not
	if (branch && zero && ~bneq)
		PC = PC + extendValue + 1;
	
	// jr instruction
	else if (jump && opcode == 6'b000000)
		PC = read_data_1;
			
	// jump instruction
	else if (jump) 
		PC = pcWriteAdress;
		
	else 
		PC = PC+1;
end 

initial begin
$monitor("Instruction: %32b, opcode: %6b, PC: %32b",instruction, opcode, PC);
end

endmodule
