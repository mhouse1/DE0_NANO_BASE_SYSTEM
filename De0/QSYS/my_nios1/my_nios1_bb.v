
module my_nios1 (
	clk_clk,
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
	fifoed_avalon_uart_0_external_connection_rxd,
	fifoed_avalon_uart_0_external_connection_txd);	

	input		clk_clk;
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
	input		fifoed_avalon_uart_0_external_connection_rxd;
	output		fifoed_avalon_uart_0_external_connection_txd;
endmodule
