
module my_nios1 (
	clk_clk,
	fifoed_avalon_uart_0_external_connection_rxd,
	fifoed_avalon_uart_0_external_connection_txd,
	leds_export,
	reset_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	sdram_clk_clk,
	switches_export,
	mm_read_write_dataout_0,
	mm_read_write_dataout_1,
	mm_read_write_dataout_2,
	mm_read_write_dataout_3,
	mm_read_write_dataout_4,
	mm_read_write_dataout_5,
	mm_read_write_dataout_6,
	mm_read_write_dataout_7,
	mm_read_write_dataout_8,
	mm_read_write_dataout_9,
	mm_read_write_dataout_10,
	mm_read_write_dataout_11,
	mm_read_write_dataout_12,
	mm_read_write_dataout_13,
	mm_read_write_dataout_14,
	mm_read_write_dataout_15,
	mm_read_write_datain_0,
	mm_read_write_datain_1,
	mm_read_write_datain_2,
	mm_read_write_datain_3,
	mm_read_write_datain_4,
	mm_read_write_datain_5,
	mm_read_write_datain_6,
	mm_read_write_datain_7,
	mm_read_write_datain_8,
	mm_read_write_datain_9,
	mm_read_write_datain_10,
	mm_read_write_datain_11,
	mm_read_write_datain_12,
	mm_read_write_datain_13,
	mm_read_write_datain_14,
	mm_read_write_datain_15,
	mm_read_only_0,
	mm_read_only_1,
	mm_read_only_2,
	mm_read_only_3,
	mm_read_only_4,
	mm_read_only_5,
	mm_read_only_6,
	mm_read_only_7,
	mm_read_only_8,
	mm_read_only_9,
	mm_read_only_10,
	mm_read_only_11,
	mm_read_only_12,
	mm_read_only_13,
	mm_read_only_14,
	mm_read_only_15);	

	input		clk_clk;
	input		fifoed_avalon_uart_0_external_connection_rxd;
	output		fifoed_avalon_uart_0_external_connection_txd;
	output	[7:0]	leds_export;
	input		reset_reset_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	output		sdram_clk_clk;
	input	[7:0]	switches_export;
	output	[31:0]	mm_read_write_dataout_0;
	output	[31:0]	mm_read_write_dataout_1;
	output	[31:0]	mm_read_write_dataout_2;
	output	[31:0]	mm_read_write_dataout_3;
	output	[31:0]	mm_read_write_dataout_4;
	output	[31:0]	mm_read_write_dataout_5;
	output	[31:0]	mm_read_write_dataout_6;
	output	[31:0]	mm_read_write_dataout_7;
	output	[31:0]	mm_read_write_dataout_8;
	output	[31:0]	mm_read_write_dataout_9;
	output	[31:0]	mm_read_write_dataout_10;
	output	[31:0]	mm_read_write_dataout_11;
	output	[31:0]	mm_read_write_dataout_12;
	output	[31:0]	mm_read_write_dataout_13;
	output	[31:0]	mm_read_write_dataout_14;
	output	[31:0]	mm_read_write_dataout_15;
	input	[31:0]	mm_read_write_datain_0;
	input	[31:0]	mm_read_write_datain_1;
	input	[31:0]	mm_read_write_datain_2;
	input	[31:0]	mm_read_write_datain_3;
	input	[31:0]	mm_read_write_datain_4;
	input	[31:0]	mm_read_write_datain_5;
	input	[31:0]	mm_read_write_datain_6;
	input	[31:0]	mm_read_write_datain_7;
	input	[31:0]	mm_read_write_datain_8;
	input	[31:0]	mm_read_write_datain_9;
	input	[31:0]	mm_read_write_datain_10;
	input	[31:0]	mm_read_write_datain_11;
	input	[31:0]	mm_read_write_datain_12;
	input	[31:0]	mm_read_write_datain_13;
	input	[31:0]	mm_read_write_datain_14;
	input	[31:0]	mm_read_write_datain_15;
	input	[31:0]	mm_read_only_0;
	input	[31:0]	mm_read_only_1;
	input	[31:0]	mm_read_only_2;
	input	[31:0]	mm_read_only_3;
	input	[31:0]	mm_read_only_4;
	input	[31:0]	mm_read_only_5;
	input	[31:0]	mm_read_only_6;
	input	[31:0]	mm_read_only_7;
	input	[31:0]	mm_read_only_8;
	input	[31:0]	mm_read_only_9;
	input	[31:0]	mm_read_only_10;
	input	[31:0]	mm_read_only_11;
	input	[31:0]	mm_read_only_12;
	input	[31:0]	mm_read_only_13;
	input	[31:0]	mm_read_only_14;
	input	[31:0]	mm_read_only_15;
endmodule
