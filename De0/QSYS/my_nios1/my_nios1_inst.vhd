	component my_nios1 is
		port (
			clk_clk                                      : in    std_logic                     := 'X';             -- clk
			fifoed_avalon_uart_0_external_connection_rxd : in    std_logic                     := 'X';             -- rxd
			fifoed_avalon_uart_0_external_connection_txd : out   std_logic;                                        -- txd
			leds_export                                  : out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n                                : in    std_logic                     := 'X';             -- reset_n
			sdram_addr                                   : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba                                     : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n                                  : out   std_logic;                                        -- cas_n
			sdram_cke                                    : out   std_logic;                                        -- cke
			sdram_cs_n                                   : out   std_logic;                                        -- cs_n
			sdram_dq                                     : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm                                    : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n                                  : out   std_logic;                                        -- ras_n
			sdram_we_n                                   : out   std_logic;                                        -- we_n
			sdram_clk_clk                                : out   std_logic;                                        -- clk
			switches_export                              : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			mm_read_write_dataout_0                      : out   std_logic_vector(31 downto 0);                    -- dataout_0
			mm_read_write_dataout_1                      : out   std_logic_vector(31 downto 0);                    -- dataout_1
			mm_read_write_dataout_2                      : out   std_logic_vector(31 downto 0);                    -- dataout_2
			mm_read_write_dataout_3                      : out   std_logic_vector(31 downto 0);                    -- dataout_3
			mm_read_write_dataout_4                      : out   std_logic_vector(31 downto 0);                    -- dataout_4
			mm_read_write_dataout_5                      : out   std_logic_vector(31 downto 0);                    -- dataout_5
			mm_read_write_dataout_6                      : out   std_logic_vector(31 downto 0);                    -- dataout_6
			mm_read_write_dataout_7                      : out   std_logic_vector(31 downto 0);                    -- dataout_7
			mm_read_write_dataout_8                      : out   std_logic_vector(31 downto 0);                    -- dataout_8
			mm_read_write_dataout_9                      : out   std_logic_vector(31 downto 0);                    -- dataout_9
			mm_read_write_dataout_10                     : out   std_logic_vector(31 downto 0);                    -- dataout_10
			mm_read_write_dataout_11                     : out   std_logic_vector(31 downto 0);                    -- dataout_11
			mm_read_write_dataout_12                     : out   std_logic_vector(31 downto 0);                    -- dataout_12
			mm_read_write_dataout_13                     : out   std_logic_vector(31 downto 0);                    -- dataout_13
			mm_read_write_dataout_14                     : out   std_logic_vector(31 downto 0);                    -- dataout_14
			mm_read_write_dataout_15                     : out   std_logic_vector(31 downto 0);                    -- dataout_15
			mm_read_write_datain_0                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_0
			mm_read_write_datain_1                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_1
			mm_read_write_datain_2                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_2
			mm_read_write_datain_3                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_3
			mm_read_write_datain_4                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_4
			mm_read_write_datain_5                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_5
			mm_read_write_datain_6                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_6
			mm_read_write_datain_7                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_7
			mm_read_write_datain_8                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_8
			mm_read_write_datain_9                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_9
			mm_read_write_datain_10                      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_10
			mm_read_write_datain_11                      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_11
			mm_read_write_datain_12                      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_12
			mm_read_write_datain_13                      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_13
			mm_read_write_datain_14                      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_14
			mm_read_write_datain_15                      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- datain_15
			mm_read_only_0                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 0
			mm_read_only_1                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 1
			mm_read_only_2                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 2
			mm_read_only_3                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 3
			mm_read_only_4                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 4
			mm_read_only_5                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 5
			mm_read_only_6                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 6
			mm_read_only_7                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 7
			mm_read_only_8                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 8
			mm_read_only_9                               : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 9
			mm_read_only_10                              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 10
			mm_read_only_11                              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 11
			mm_read_only_12                              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 12
			mm_read_only_13                              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 13
			mm_read_only_14                              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- 14
			mm_read_only_15                              : in    std_logic_vector(31 downto 0) := (others => 'X')  -- 15
		);
	end component my_nios1;

	u0 : component my_nios1
		port map (
			clk_clk                                      => CONNECTED_TO_clk_clk,                                      --                                      clk.clk
			fifoed_avalon_uart_0_external_connection_rxd => CONNECTED_TO_fifoed_avalon_uart_0_external_connection_rxd, -- fifoed_avalon_uart_0_external_connection.rxd
			fifoed_avalon_uart_0_external_connection_txd => CONNECTED_TO_fifoed_avalon_uart_0_external_connection_txd, --                                         .txd
			leds_export                                  => CONNECTED_TO_leds_export,                                  --                                     leds.export
			reset_reset_n                                => CONNECTED_TO_reset_reset_n,                                --                                    reset.reset_n
			sdram_addr                                   => CONNECTED_TO_sdram_addr,                                   --                                    sdram.addr
			sdram_ba                                     => CONNECTED_TO_sdram_ba,                                     --                                         .ba
			sdram_cas_n                                  => CONNECTED_TO_sdram_cas_n,                                  --                                         .cas_n
			sdram_cke                                    => CONNECTED_TO_sdram_cke,                                    --                                         .cke
			sdram_cs_n                                   => CONNECTED_TO_sdram_cs_n,                                   --                                         .cs_n
			sdram_dq                                     => CONNECTED_TO_sdram_dq,                                     --                                         .dq
			sdram_dqm                                    => CONNECTED_TO_sdram_dqm,                                    --                                         .dqm
			sdram_ras_n                                  => CONNECTED_TO_sdram_ras_n,                                  --                                         .ras_n
			sdram_we_n                                   => CONNECTED_TO_sdram_we_n,                                   --                                         .we_n
			sdram_clk_clk                                => CONNECTED_TO_sdram_clk_clk,                                --                                sdram_clk.clk
			switches_export                              => CONNECTED_TO_switches_export,                              --                                 switches.export
			mm_read_write_dataout_0                      => CONNECTED_TO_mm_read_write_dataout_0,                      --                            mm_read_write.dataout_0
			mm_read_write_dataout_1                      => CONNECTED_TO_mm_read_write_dataout_1,                      --                                         .dataout_1
			mm_read_write_dataout_2                      => CONNECTED_TO_mm_read_write_dataout_2,                      --                                         .dataout_2
			mm_read_write_dataout_3                      => CONNECTED_TO_mm_read_write_dataout_3,                      --                                         .dataout_3
			mm_read_write_dataout_4                      => CONNECTED_TO_mm_read_write_dataout_4,                      --                                         .dataout_4
			mm_read_write_dataout_5                      => CONNECTED_TO_mm_read_write_dataout_5,                      --                                         .dataout_5
			mm_read_write_dataout_6                      => CONNECTED_TO_mm_read_write_dataout_6,                      --                                         .dataout_6
			mm_read_write_dataout_7                      => CONNECTED_TO_mm_read_write_dataout_7,                      --                                         .dataout_7
			mm_read_write_dataout_8                      => CONNECTED_TO_mm_read_write_dataout_8,                      --                                         .dataout_8
			mm_read_write_dataout_9                      => CONNECTED_TO_mm_read_write_dataout_9,                      --                                         .dataout_9
			mm_read_write_dataout_10                     => CONNECTED_TO_mm_read_write_dataout_10,                     --                                         .dataout_10
			mm_read_write_dataout_11                     => CONNECTED_TO_mm_read_write_dataout_11,                     --                                         .dataout_11
			mm_read_write_dataout_12                     => CONNECTED_TO_mm_read_write_dataout_12,                     --                                         .dataout_12
			mm_read_write_dataout_13                     => CONNECTED_TO_mm_read_write_dataout_13,                     --                                         .dataout_13
			mm_read_write_dataout_14                     => CONNECTED_TO_mm_read_write_dataout_14,                     --                                         .dataout_14
			mm_read_write_dataout_15                     => CONNECTED_TO_mm_read_write_dataout_15,                     --                                         .dataout_15
			mm_read_write_datain_0                       => CONNECTED_TO_mm_read_write_datain_0,                       --                                         .datain_0
			mm_read_write_datain_1                       => CONNECTED_TO_mm_read_write_datain_1,                       --                                         .datain_1
			mm_read_write_datain_2                       => CONNECTED_TO_mm_read_write_datain_2,                       --                                         .datain_2
			mm_read_write_datain_3                       => CONNECTED_TO_mm_read_write_datain_3,                       --                                         .datain_3
			mm_read_write_datain_4                       => CONNECTED_TO_mm_read_write_datain_4,                       --                                         .datain_4
			mm_read_write_datain_5                       => CONNECTED_TO_mm_read_write_datain_5,                       --                                         .datain_5
			mm_read_write_datain_6                       => CONNECTED_TO_mm_read_write_datain_6,                       --                                         .datain_6
			mm_read_write_datain_7                       => CONNECTED_TO_mm_read_write_datain_7,                       --                                         .datain_7
			mm_read_write_datain_8                       => CONNECTED_TO_mm_read_write_datain_8,                       --                                         .datain_8
			mm_read_write_datain_9                       => CONNECTED_TO_mm_read_write_datain_9,                       --                                         .datain_9
			mm_read_write_datain_10                      => CONNECTED_TO_mm_read_write_datain_10,                      --                                         .datain_10
			mm_read_write_datain_11                      => CONNECTED_TO_mm_read_write_datain_11,                      --                                         .datain_11
			mm_read_write_datain_12                      => CONNECTED_TO_mm_read_write_datain_12,                      --                                         .datain_12
			mm_read_write_datain_13                      => CONNECTED_TO_mm_read_write_datain_13,                      --                                         .datain_13
			mm_read_write_datain_14                      => CONNECTED_TO_mm_read_write_datain_14,                      --                                         .datain_14
			mm_read_write_datain_15                      => CONNECTED_TO_mm_read_write_datain_15,                      --                                         .datain_15
			mm_read_only_0                               => CONNECTED_TO_mm_read_only_0,                               --                             mm_read_only.0
			mm_read_only_1                               => CONNECTED_TO_mm_read_only_1,                               --                                         .1
			mm_read_only_2                               => CONNECTED_TO_mm_read_only_2,                               --                                         .2
			mm_read_only_3                               => CONNECTED_TO_mm_read_only_3,                               --                                         .3
			mm_read_only_4                               => CONNECTED_TO_mm_read_only_4,                               --                                         .4
			mm_read_only_5                               => CONNECTED_TO_mm_read_only_5,                               --                                         .5
			mm_read_only_6                               => CONNECTED_TO_mm_read_only_6,                               --                                         .6
			mm_read_only_7                               => CONNECTED_TO_mm_read_only_7,                               --                                         .7
			mm_read_only_8                               => CONNECTED_TO_mm_read_only_8,                               --                                         .8
			mm_read_only_9                               => CONNECTED_TO_mm_read_only_9,                               --                                         .9
			mm_read_only_10                              => CONNECTED_TO_mm_read_only_10,                              --                                         .10
			mm_read_only_11                              => CONNECTED_TO_mm_read_only_11,                              --                                         .11
			mm_read_only_12                              => CONNECTED_TO_mm_read_only_12,                              --                                         .12
			mm_read_only_13                              => CONNECTED_TO_mm_read_only_13,                              --                                         .13
			mm_read_only_14                              => CONNECTED_TO_mm_read_only_14,                              --                                         .14
			mm_read_only_15                              => CONNECTED_TO_mm_read_only_15                               --                                         .15
		);

