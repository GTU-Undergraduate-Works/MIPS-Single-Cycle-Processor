# MIPS-Single-Cycle-Processor

README!!!
- Instructions that is implemented: add, addu, and, jr, nor, or, slt, sltu, srl, sra, sub, subu
									jump, jal
									addi, addiu, andi, beq, bneq, ll, lui, lw, ori, slti, sltui, sw

- Top Level Design File: mips_core

- Testbench File: mips_testbench

- mips_registers.v is register module
- registers.mem for initialization of registers

- mips_instr_mem.v is instruction memory module
- instruction.mem for instruction memory initialization

- mips_data_mem.v is data memory module
- data.mem for data memory initialization

- Programı modelsimde çalıştırmadan önce data.mem, registers.mem ve instruction.mem dosyalarını simulaiton/modelsim klasörü altında koymanız gerkmektedir.
- Programı modelsimde çalıştırdıktan sonra res_registers.mem ve res_data.mem isimli iki tane dosya simulaiton/modelsim klasörü altında oluşmaktadır.
- res_registers.mem dosyasında program çalıştıktan sonra regiterların güncel hali bulunmaktadır.
- res_data.mem dosyasında program çalıştıktan sonra memory'nin güncel hali bulunmaktadır.

