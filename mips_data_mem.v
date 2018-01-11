module mips_data_mem (read_data, mem_address, write_data, sig_mem_read, sig_mem_write);
output [31:0] read_data;
input [31:0] mem_address;
input [31:0] write_data;
input sig_mem_read;
input sig_mem_write;

reg [31:0] data_mem  [255:0];
reg [31:0] read_data;

initial begin
	$readmemb(".\\data.mem", data_mem);
end

always @(mem_address or write_data or sig_mem_read or sig_mem_write) begin
	if (sig_mem_read) begin
		read_data <= data_mem[mem_address >> 2];
	end
	
	if (sig_mem_write) begin
		data_mem[mem_address >> 2] <= write_data[31:0];
		$writememb("res_data.mem", data_mem);
	end
end

endmodule