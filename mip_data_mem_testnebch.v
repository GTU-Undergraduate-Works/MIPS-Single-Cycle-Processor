module mip_data_mem_testnebch();

wire [31:0] read_data;
reg [31:0] mem_address, write_data;
reg mem_read, mem_write;

mips_data_mem test(read_data, mem_address, write_data, mem_read, mem_write);


initial begin
mem_address = 32'b00000000000000000000000000010101;
write_data  = 32'b11111101111111111111111111111111;
mem_read = 1'b0;
mem_write = 1'b1; #50;

mem_address = 32'b00000000000000000000000000010101;
write_data  = 32'b11111101111111111111111111111111;
mem_read = 1'b1;
mem_write = 1'b0; #50;

mem_address = 32'b00000000000000000000000000010101;
write_data  = 32'b11111101111111111111111111111111;
mem_read = 1'b1;
mem_write = 1'b1; #50

mem_address = 32'b00000000000000000000000000010101;
write_data  = 32'b11111101111111111111111111111111;
mem_read = 1'b0;
mem_write = 1'b0; 
 
end

initial begin 

$monitor("MEMADRESS: %32b----WRITEDATA: %32b\nMEMREAD: %1b--MEMWRITE: %1b------READDATA: %32b\n\n",mem_address,write_data,mem_read,mem_write,read_data);

end

endmodule
