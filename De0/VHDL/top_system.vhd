--*****************************************************************************
--*  DEFINE: Library                                                          *
--*****************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
--USE WORK.mult_dim_ports.ALL;
--*****************************************************************************
--*  DEFINE: Entity                                                           *
--*****************************************************************************
--All IO defined here will show up in pin planner as unmapped to a pin,
--you must manually map IO defined here to a specific pin. 
--Components like SDRAM, CLK, DIP SWITCH are on the DE0 nano board, you must map 
--the proper pin to the component. for example, the 4 pos DIP switches are always 
--M1, M15, B9, T8.
--custom IO that will interface the DE0 Nano must be mapped to a desired header pin
--you must check the DE0 manual to see which header pins are ADC, Input or output
entity top_system is
  port ( 

			RECEIVER_CHANNEL : in std_logic_vector(7 downto 0);
			PPM_OUTPUT		 : out std_logic_vector(5 downto 0);
			
			-- UART
			--
			TxD : out std_logic;
			RxD : in std_logic;

			SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			CLOCK_50 : IN STD_LOGIC;
			LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			DRAM_CLK, DRAM_CKE : OUT STD_LOGIC;
			DRAM_ADDR : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
			DRAM_BA : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			DRAM_CS_N, DRAM_CAS_N, DRAM_RAS_N, DRAM_WE_N : OUT STD_LOGIC;
			DRAM_DQ : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			DRAM_DQM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
		);
end entity top_system;


--*****************************************************************************
--*  DEFINE: Architecture                                                     *
--*****************************************************************************
architecture components_interconnections of top_system is


   --
   -- Define all components which are included here
   --
	COMPONENT my_nios1			
	port (
		clk_clk                                      : in    std_logic                     := '0';             --                                      clk.clk
		fifoed_avalon_uart_0_external_connection_rxd : in    std_logic                     := '0';             -- fifoed_avalon_uart_0_external_connection.rxd
		fifoed_avalon_uart_0_external_connection_txd : out   std_logic;                                        --                                         .txd
		leds_export                                  : out   std_logic_vector(7 downto 0);                     --                                     leds.export
		mm_read_only_0                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                             mm_read_only.0
		mm_read_only_1                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .1
		mm_read_only_2                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .2
		mm_read_only_3                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .3
		mm_read_only_4                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .4
		mm_read_only_5                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .5
		mm_read_only_6                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .6
		mm_read_only_7                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .7
		mm_read_only_8                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .8
--		mm_read_only_9                               : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .9
--		mm_read_only_10                              : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .10
--		mm_read_only_11                              : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .11
--		mm_read_only_12                              : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .12
--		mm_read_only_13                              : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .13
--		mm_read_only_14                              : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .14
--		mm_read_only_15                              : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .15
		mm_read_write_dataout_0                      : out   std_logic_vector(31 downto 0);                    --                            mm_read_write.dataout_0
		mm_read_write_dataout_1                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_1
		mm_read_write_dataout_2                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_2
		mm_read_write_dataout_3                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_3
		mm_read_write_dataout_4                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_4
		mm_read_write_dataout_5                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_5
		mm_read_write_dataout_6                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_6
		mm_read_write_dataout_7                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_7
		mm_read_write_dataout_8                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_8
--		mm_read_write_dataout_9                      : out   std_logic_vector(31 downto 0);                    --                                         .dataout_9
--		mm_read_write_dataout_10                     : out   std_logic_vector(31 downto 0);                    --                                         .dataout_10
--		mm_read_write_dataout_11                     : out   std_logic_vector(31 downto 0);                    --                                         .dataout_11
--		mm_read_write_dataout_12                     : out   std_logic_vector(31 downto 0);                    --                                         .dataout_12
--		mm_read_write_dataout_13                     : out   std_logic_vector(31 downto 0);                    --                                         .dataout_13
--		mm_read_write_dataout_14                     : out   std_logic_vector(31 downto 0);                    --                                         .dataout_14
--		mm_read_write_dataout_15                     : out   std_logic_vector(31 downto 0);                    --                                         .dataout_15
--		mm_read_write_datain_0                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_0
--		mm_read_write_datain_1                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_1
--		mm_read_write_datain_2                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_2
--		mm_read_write_datain_3                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_3
--		mm_read_write_datain_4                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_4
--		mm_read_write_datain_5                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_5
--		mm_read_write_datain_6                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_6
--		mm_read_write_datain_7                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_7
--		mm_read_write_datain_8                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_8
--		mm_read_write_datain_9                       : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_9
--		mm_read_write_datain_10                      : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_10
--		mm_read_write_datain_11                      : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_11
--		mm_read_write_datain_12                      : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_12
--		mm_read_write_datain_13                      : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_13
--		mm_read_write_datain_14                      : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_14
--		mm_read_write_datain_15                      : in    std_logic_vector(31 downto 0) := (others => '0'); --                                         .datain_15

		reset_reset_n                                : in    std_logic                     := '0';             --                                    reset.reset_n
		sdram_addr                                   : out   std_logic_vector(12 downto 0);                    --                                    sdram.addr
		sdram_ba                                     : out   std_logic_vector(1 downto 0);                     --                                         .ba
		sdram_cas_n                                  : out   std_logic;                                        --                                         .cas_n
		sdram_cke                                    : out   std_logic;                                        --                                         .cke
		sdram_cs_n                                   : out   std_logic;                                        --                                         .cs_n
		sdram_dq                                     : inout std_logic_vector(15 downto 0) := (others => '0'); --                                         .dq
		sdram_dqm                                    : out   std_logic_vector(1 downto 0);                     --                                         .dqm
		sdram_ras_n                                  : out   std_logic;                                        --                                         .ras_n
		sdram_we_n                                   : out   std_logic;                                        --                                         .we_n
		sdram_clk_clk                                : out   std_logic;                                        --                                sdram_clk.clk
		switches_export                              : in    std_logic_vector(7 downto 0) := (others => '0')   --                                 switches.export
	);
	END COMPONENT my_nios1;

	--want a 20ms pwm frequency with 1ms to 2ms pulse width
	--this means duty cycle must be 1/20 to 2/20 (0.05 to 0.1)
	--20ms pwm period = 1/(20ms)=50Hz pwm frequency
	--2^(bit_resolution)-1 = 100% duty cycle
	COMPONENT pwm
	GENERIC(
		sys_clk         : INTEGER := 50_000_000; --system clock frequency in Hz
		pwm_freq        : INTEGER := 50;    --PWM switching frequency in Hz
		bits_resolution : INTEGER := 15;          --bits of resolution setting the duty cycle
		phases          : INTEGER := 1);         --number of output pwms and phases
	PORT(
		clk       : IN  STD_LOGIC;                                    --system clock
		reset_n   : IN  STD_LOGIC;                                    --asynchronous reset
		ena       : IN  STD_LOGIC;                                    --latches in new duty cycle
		duty      : IN  STD_LOGIC_VECTOR(bits_resolution-1 DOWNTO 0); --duty cycle
		pwm_out   : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0);          --pwm outputs
		pwm_n_out : OUT STD_LOGIC_VECTOR(phases-1 DOWNTO 0));         --pwm inverse outputs
	END component pwm;
			

	--used to read pulse width value of receiver signal
	COMPONENT pulse_width_measure 
	PORT(
			clk_50mhz : in std_logic;
	--          Q1_O, Q2_O : out std_logic;
	--                  reset : in std_logic;
			pulse_signal : in std_logic;
	--          pulse_counter_O : out std_logic_vector(31 downto 0);
			pulse_width : out std_logic_vector(31 downto 0)
		
		);
			 
	END COMPONENT pulse_width_measure;

--	--used to read pulse width of value of receiver signal then convert to a digital output high or low
--	COMPONENT pulse_width_measure_toggle 
--	PORT(
--			clk_50mhz : in std_logic;
--	--          Q1_O, Q2_O : out std_logic;
--	--                  reset : in std_logic;
--			pulse_signal : in std_logic;
--	--          pulse_counter_O : out std_logic_vector(31 downto 0);
--			pulse_width : out std_logic_vector(31 downto 0);
--				  digital_output : out std_logic
--		
--		);
--                     
--    END COMPONENT pulse_width_measure_toggle;

	--receiver channel read value
	Signal sig_receiver_channel0 : std_logic_vector(31 downto 0);
	Signal sig_receiver_channel1 : std_logic_vector(31 downto 0);
	Signal sig_receiver_channel2 : std_logic_vector(31 downto 0);
	Signal sig_receiver_channel3 : std_logic_vector(31 downto 0);
	Signal sig_receiver_channel4 : std_logic_vector(31 downto 0);
	Signal sig_receiver_channel5 : std_logic_vector(31 downto 0);
	Signal sig_receiver_channel6 : std_logic_vector(31 downto 0);
	Signal sig_receiver_channel7 : std_logic_vector(31 downto 0);
	
	--ppm signal duty cycle values, 4 for motor driver, 1 for extra peripheral
	Signal sig_ppm_duty_cycle0 : std_logic_vector(31 downto 0);
	Signal sig_ppm_duty_cycle1 : std_logic_vector(31 downto 0);
	Signal sig_ppm_duty_cycle2 : std_logic_vector(31 downto 0);
	Signal sig_ppm_duty_cycle3 : std_logic_vector(31 downto 0);
	Signal sig_ppm_duty_cycle4 : std_logic_vector(31 downto 0);
	Signal sig_ppm_duty_cycle5 : std_logic_vector(31 downto 0);
	
	--ppm square wave signal output
	Signal sig_ppm_output0 : std_logic_vector(0 downto 0);
	Signal sig_ppm_output1 : std_logic_vector(0 downto 0);
	Signal sig_ppm_output2 : std_logic_vector(0 downto 0);
	Signal sig_ppm_output3 : std_logic_vector(0 downto 0);
	Signal sig_ppm_output4 : std_logic_vector(0 downto 0);
	Signal sig_ppm_output5 : std_logic_vector(0 downto 0);

	

begin

		NiosII: component my_nios1
			PORT MAP (
				clk_clk => CLOCK_50,
--				reset_reset_n => KEY(0),
				reset_reset_n => '1', -- reset.reset_n
				sdram_clk_clk => DRAM_CLK,
				fifoed_avalon_uart_0_external_connection_rxd  => RxD,
				fifoed_avalon_uart_0_external_connection_txd => TxD,
				leds_export => open, --LED,
				switches_export(3 DOWNTO 0) => SW(3 downto 0),
				
				mm_read_only_0          =>  sig_receiver_channel0,     
				mm_read_only_1          =>  sig_receiver_channel1,     
				mm_read_only_2          =>  sig_receiver_channel2,     
				mm_read_only_3          =>  sig_receiver_channel3,     
				mm_read_only_4          =>  sig_receiver_channel4,     
				mm_read_only_5          =>  sig_receiver_channel5,     
				mm_read_only_6          =>  sig_receiver_channel6,     
				mm_read_only_7          =>  sig_receiver_channel7,     
				mm_read_write_dataout_0 =>  sig_ppm_duty_cycle0,     
				mm_read_write_dataout_1 =>  sig_ppm_duty_cycle1,     
				mm_read_write_dataout_2 =>  sig_ppm_duty_cycle2,     
				mm_read_write_dataout_3 =>  sig_ppm_duty_cycle3,     
				mm_read_write_dataout_4 =>  sig_ppm_duty_cycle4,     
				mm_read_write_dataout_5 =>  sig_ppm_duty_cycle5,     
     
				
				sdram_addr => DRAM_ADDR,
				sdram_ba => DRAM_BA,
				sdram_cas_n => DRAM_CAS_N,
				sdram_cke => DRAM_CKE,
				sdram_cs_n => DRAM_CS_N,
				sdram_dq => DRAM_DQ,
				sdram_dqm => DRAM_DQM,
				sdram_ras_n => DRAM_RAS_N,
				sdram_we_n => DRAM_WE_N );
				
     inst_pwM1 : component pulse_width_measure
            port map (
            clk_50mhz => CLOCK_50,
            pulse_signal => RECEIVER_CHANNEL(0),
            pulse_width => sig_receiver_channel0
            );

     inst_pwM2 : component pulse_width_measure
            port map (
            clk_50mhz => CLOCK_50,
            pulse_signal => RECEIVER_CHANNEL(1),
            pulse_width => sig_receiver_channel1
            );

     inst_pwM3 : component pulse_width_measure
            port map (
            clk_50mhz => CLOCK_50,
            pulse_signal => RECEIVER_CHANNEL(2),
            pulse_width => sig_receiver_channel2
            );

     inst_pwM4 : component pulse_width_measure
            port map (
            clk_50mhz => CLOCK_50,
            pulse_signal => RECEIVER_CHANNEL(3),
            pulse_width => sig_receiver_channel3
            );

     inst_pwM5 : component pulse_width_measure
            port map (
            clk_50mhz => CLOCK_50,
            pulse_signal => RECEIVER_CHANNEL(4),
            pulse_width => sig_receiver_channel4
            );
			
     inst_pwM6 : component pulse_width_measure
            port map (
            clk_50mhz => CLOCK_50,
            pulse_signal => RECEIVER_CHANNEL(5),
            pulse_width => sig_receiver_channel5
            );

     inst_pwM7 : component pulse_width_measure
            port map (
            clk_50mhz => CLOCK_50,
            pulse_signal => RECEIVER_CHANNEL(7),
            pulse_width => sig_receiver_channel7
            );			

	ppm_generator0 : component pwm
			port map(
				clk       => CLOCK_50,                             --system clock
				reset_n   => KEY(0),                             --asynchronous reset
				ena       => '1',                                --latches in new duty cycle
				duty      => sig_ppm_duty_cycle0(14 downto 0),   --duty cycle
				pwm_out   => sig_ppm_output0
				);  
	ppm_generator1 : component pwm
			port map(
				clk       => CLOCK_50,                             --system clock
				reset_n   => KEY(0),                             --asynchronous reset
				ena       => '1',                                --latches in new duty cycle
				duty      => sig_ppm_duty_cycle1(14 downto 0),   --duty cycle
				pwm_out   => sig_ppm_output1
				);  
	ppm_generator2 : component pwm
			port map(
				clk       => CLOCK_50,                             --system clock
				reset_n   => KEY(0),                             --asynchronous reset
				ena       => '1',                                --latches in new duty cycle
				duty      => sig_ppm_duty_cycle2(14 downto 0),   --duty cycle
				pwm_out   => sig_ppm_output2
				);  
	ppm_generator3 : component pwm
			port map(
				clk       => CLOCK_50,                             --system clock
				reset_n   => KEY(0),                             --asynchronous reset
				ena       => '1',                                --latches in new duty cycle
				duty      => sig_ppm_duty_cycle3(14 downto 0),   --duty cycle
				pwm_out   => sig_ppm_output3
				);  
	ppm_generator4 : component pwm
			port map(
				clk       => CLOCK_50,                             --system clock
				reset_n   => KEY(0),                             --asynchronous reset
				ena       => '1',                                --latches in new duty cycle
				duty      => sig_ppm_duty_cycle4(14 downto 0),   --duty cycle
				pwm_out   => sig_ppm_output4
				);  
	ppm_generator5 : component pwm
			port map(
				clk       => CLOCK_50,                             --system clock
				reset_n   => KEY(0),                             --asynchronous reset
				ena       => '1',                                --latches in new duty cycle
				duty      => sig_ppm_duty_cycle5(14 downto 0),   --duty cycle
				pwm_out   => sig_ppm_output5
				);  

	PPM_OUTPUT(0 downto 0) <= sig_ppm_output0;
	PPM_OUTPUT(1 downto 1) <= sig_ppm_output1;
	PPM_OUTPUT(2 downto 2) <= sig_ppm_output2;
	PPM_OUTPUT(3 downto 3) <= sig_ppm_output3;
	PPM_OUTPUT(4 downto 4) <= sig_ppm_output4;
	PPM_OUTPUT(5 downto 5) <= sig_ppm_output5;
	
	LED(3 downto 0) <= SW(3 downto 0);
	LED(7 downto 4) <= SW(3 downto 0);--"0101";
	
end architecture components_interconnections;
-- *** EOF ***