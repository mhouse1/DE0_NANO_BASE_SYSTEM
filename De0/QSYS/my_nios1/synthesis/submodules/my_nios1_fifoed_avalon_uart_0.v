//Legal Notice: (C)2019 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module my_nios1_fifoed_avalon_uart_0_tx (
                                          // inputs:
                                           baud_divisor,
                                           clk,
                                           clk_en,
                                           do_force_break,
                                           reset_n,
                                           tx_data,
                                           tx_wr_strobe,

                                          // outputs:
                                           tx_ready,
                                           tx_shift_empty,
                                           txd
                                        )
;

  output           tx_ready;
  output           tx_shift_empty;
  output           txd;
  input   [  8: 0] baud_divisor;
  input            clk;
  input            clk_en;
  input            do_force_break;
  input            reset_n;
  input   [  7: 0] tx_data;
  input            tx_wr_strobe;


reg              baud_clk_en;
reg     [  8: 0] baud_rate_counter;
wire             baud_rate_counter_is_zero;
reg              do_load_shifter;
wire             do_shift;
reg              pre_txd;
wire             shift_done;
wire    [  9: 0] tx_load_val;
reg              tx_ready;
reg              tx_shift_empty;
wire             tx_shift_reg_out;
wire    [  9: 0] tx_shift_register_contents;
wire             tx_wr_strobe_onset;
reg              txd;
wire    [  9: 0] unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_in;
reg     [  9: 0] unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out;
  assign tx_wr_strobe_onset = tx_wr_strobe && tx_ready;
  assign tx_load_val = {{1 {1'b1}},
    tx_data,
    1'b0};

  assign shift_done = ~(|tx_shift_register_contents);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          do_load_shifter <= 0;
      else if (clk_en)
          do_load_shifter <= (~tx_ready) && shift_done;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tx_ready <= 1'b1;
      else if (clk_en)
          if (tx_wr_strobe_onset)
              tx_ready <= 0;
          else if (do_load_shifter)
              tx_ready <= 1'b1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tx_shift_empty <= 1'b1;
      else if (clk_en)
          tx_shift_empty <= tx_ready && shift_done;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          baud_rate_counter <= 0;
      else if (clk_en)
          if (baud_rate_counter_is_zero || do_load_shifter)
              baud_rate_counter <= baud_divisor;
          else 
            baud_rate_counter <= baud_rate_counter - 1;
    end


  assign baud_rate_counter_is_zero = baud_rate_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          baud_clk_en <= 0;
      else if (clk_en)
          baud_clk_en <= baud_rate_counter_is_zero;
    end


  assign do_shift = baud_clk_en  &&
    (~shift_done) &&
    (~do_load_shifter);

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pre_txd <= 1;
      else if (~shift_done)
          pre_txd <= tx_shift_reg_out;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          txd <= 1;
      else if (clk_en)
          txd <= pre_txd & ~do_force_break;
    end


  //_reg, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out <= 0;
      else if (clk_en)
          unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out <= unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_in;
    end


  assign unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_in = (do_load_shifter)? tx_load_val :
    (do_shift)? {1'b0,
    unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out[9 : 1]} :
    unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out;

  assign tx_shift_register_contents = unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out;
  assign tx_shift_reg_out = unxshiftxtx_shift_register_contentsxtx_shift_reg_outxx5_out[0];

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module my_nios1_fifoed_avalon_uart_0_rx_stimulus_source (
                                                          // inputs:
                                                           baud_divisor,
                                                           clk,
                                                           clk_en,
                                                           reset_n,
                                                           rx_char_ready,
                                                           rxd,

                                                          // outputs:
                                                           source_rxd
                                                        )
;

  output           source_rxd;
  input   [  8: 0] baud_divisor;
  input            clk;
  input            clk_en;
  input            reset_n;
  input            rx_char_ready;
  input            rxd;


reg     [  7: 0] d1_stim_data;
reg              delayed_unxrx_char_readyxx0;
wire             do_send_stim_data;
wire             pickup_pulse;
wire             source_rxd;
wire    [  7: 0] stim_data;
wire             unused_empty;
wire             unused_ready;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //stimulus_transmitter, which is an e_instance
  my_nios1_fifoed_avalon_uart_0_tx stimulus_transmitter
    (
      .baud_divisor   (baud_divisor),
      .clk            (clk),
      .clk_en         (clk_en),
      .do_force_break (1'b0),
      .reset_n        (reset_n),
      .tx_data        (d1_stim_data),
      .tx_ready       (unused_ready),
      .tx_shift_empty (unused_empty),
      .tx_wr_strobe   (1'b1),
      .txd            (source_rxd)
    );

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_stim_data <= 0;
      else if (do_send_stim_data)
          d1_stim_data <= stim_data;
    end


  assign stim_data = 8'b0;
  //delayed_unxrx_char_readyxx0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxrx_char_readyxx0 <= 0;
      else if (clk_en)
          delayed_unxrx_char_readyxx0 <= rx_char_ready;
    end


  assign pickup_pulse = ~(rx_char_ready) &  (delayed_unxrx_char_readyxx0);
  assign do_send_stim_data = (pickup_pulse || 1'b0) && 1'b0;

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  assign source_rxd = rxd;
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module my_nios1_fifoed_avalon_uart_0_rx (
                                          // inputs:
                                           baud_divisor,
                                           clk,
                                           clk_en,
                                           reset_n,
                                           rx_rd_strobe,
                                           rxd,
                                           status_wr_strobe,

                                          // outputs:
                                           break_detect,
                                           framing_error,
                                           parity_error,
                                           rx_char_ready,
                                           rx_data,
                                           rx_overrun
                                        )
;

  output           break_detect;
  output           framing_error;
  output           parity_error;
  output           rx_char_ready;
  output  [  7: 0] rx_data;
  output           rx_overrun;
  input   [  8: 0] baud_divisor;
  input            clk;
  input            clk_en;
  input            reset_n;
  input            rx_rd_strobe;
  input            rxd;
  input            status_wr_strobe;


reg              baud_clk_en;
wire    [  8: 0] baud_load_value;
reg     [  8: 0] baud_rate_counter;
wire             baud_rate_counter_is_zero;
reg              break_detect;
reg              delayed_unxrx_in_processxx3;
reg              delayed_unxsync_rxdxx1;
reg              delayed_unxsync_rxdxx2;
reg              do_start_rx;
reg              framing_error;
wire             got_new_char;
wire    [  7: 0] half_bit_cell_divisor;
wire             is_break;
wire             is_framing_error;
wire             parity_error;
wire    [  7: 0] raw_data_in;
reg              rx_char_ready;
reg     [  7: 0] rx_data;
wire             rx_in_process;
reg              rx_overrun;
wire             rx_rd_strobe_onset;
wire             rxd_edge;
wire             rxd_falling;
wire    [  9: 0] rxd_shift_reg;
wire             sample_enable;
wire             shift_reg_start_bit_n;
wire             source_rxd;
wire             stop_bit;
wire             sync_rxd;
wire             unused_start_bit;
wire    [  9: 0] unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in;
reg     [  9: 0] unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out;
  my_nios1_fifoed_avalon_uart_0_rx_stimulus_source the_my_nios1_fifoed_avalon_uart_0_rx_stimulus_source
    (
      .baud_divisor  (baud_divisor),
      .clk           (clk),
      .clk_en        (clk_en),
      .reset_n       (reset_n),
      .rx_char_ready (rx_char_ready),
      .rxd           (rxd),
      .source_rxd    (source_rxd)
    );

  altera_std_synchronizer the_altera_std_synchronizer
    (
      .clk (clk),
      .din (source_rxd),
      .dout (sync_rxd),
      .reset_n (reset_n)
    );

  defparam the_altera_std_synchronizer.depth = 2;

  //delayed_unxsync_rxdxx1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxsync_rxdxx1 <= 0;
      else if (clk_en)
          delayed_unxsync_rxdxx1 <= sync_rxd;
    end


  assign rxd_falling = ~(sync_rxd) &  (delayed_unxsync_rxdxx1);
  //delayed_unxsync_rxdxx2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxsync_rxdxx2 <= 0;
      else if (clk_en)
          delayed_unxsync_rxdxx2 <= sync_rxd;
    end


  assign rxd_edge = (sync_rxd) ^  (delayed_unxsync_rxdxx2);
  assign rx_rd_strobe_onset = rx_rd_strobe;
  assign half_bit_cell_divisor = baud_divisor[8 : 1];
  assign baud_load_value = (rxd_edge)? half_bit_cell_divisor :
    baud_divisor;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          baud_rate_counter <= 0;
      else if (clk_en)
          if (baud_rate_counter_is_zero || rxd_edge)
              baud_rate_counter <= baud_load_value;
          else 
            baud_rate_counter <= baud_rate_counter - 1;
    end


  assign baud_rate_counter_is_zero = baud_rate_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          baud_clk_en <= 0;
      else if (clk_en)
          if (rxd_edge)
              baud_clk_en <= 0;
          else 
            baud_clk_en <= baud_rate_counter_is_zero;
    end


  assign sample_enable = baud_clk_en && rx_in_process;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          do_start_rx <= 0;
      else if (clk_en)
          if (~rx_in_process && rxd_falling)
              do_start_rx <= 1;
          else 
            do_start_rx <= 0;
    end


  assign rx_in_process = shift_reg_start_bit_n;
  assign {stop_bit,
raw_data_in,
unused_start_bit} = rxd_shift_reg;
  assign is_break = ~(|rxd_shift_reg);
  assign is_framing_error = ~stop_bit && ~is_break;
  //delayed_unxrx_in_processxx3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxrx_in_processxx3 <= 0;
      else if (clk_en)
          delayed_unxrx_in_processxx3 <= rx_in_process;
    end


  assign got_new_char = ~(rx_in_process) &  (delayed_unxrx_in_processxx3);
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          rx_data <= 0;
      else if (got_new_char)
          rx_data <= raw_data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          framing_error <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              framing_error <= 0;
          else if (got_new_char && is_framing_error)
              framing_error <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          break_detect <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              break_detect <= 0;
          else if (got_new_char && is_break)
              break_detect <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          rx_overrun <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              rx_overrun <= 0;
          else if (got_new_char && rx_char_ready)
              rx_overrun <= -1;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          rx_char_ready <= 0;
      else if (clk_en)
          if (rx_rd_strobe_onset)
              rx_char_ready <= 0;
          else if (got_new_char)
              rx_char_ready <= -1;
    end


  assign parity_error = 0;
  //_reg, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out <= 0;
      else if (clk_en)
          unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out <= unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in;
    end


  assign unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_in = (do_start_rx)? {10{1'b1}} :
    (sample_enable)? {sync_rxd,
    unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out[9 : 1]} :
    unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out;

  assign rxd_shift_reg = unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out;
  assign shift_reg_start_bit_n = unxshiftxrxd_shift_regxshift_reg_start_bit_nxx6_out[0];

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module my_nios1_fifoed_avalon_uart_0_txfifo (
                                              // inputs:
                                               clk,
                                               d1_tx_wr_strobe,
                                               reset,
                                               tx_fifo_wr_strobe,
                                               writedata,

                                              // outputs:
                                               tx_empty,
                                               tx_fifo_q,
                                               tx_full,
                                               tx_used
                                            )
;

  output           tx_empty;
  output  [  7: 0] tx_fifo_q;
  output           tx_full;
  output  [  9: 0] tx_used;
  input            clk;
  input            d1_tx_wr_strobe;
  input            reset;
  input            tx_fifo_wr_strobe;
  input   [ 31: 0] writedata;


wire             tx_empty;
wire    [  7: 0] tx_fifo_q;
wire             tx_full;
wire    [  9: 0] tx_used;
  scfifo txfifo
    (
      .clock (clk),
      .data (writedata[7 : 0]),
      .empty (tx_empty),
      .full (tx_full),
      .q (tx_fifo_q),
      .rdreq (d1_tx_wr_strobe),
      .sclr (reset),
      .usedw (tx_used),
      .wrreq (tx_fifo_wr_strobe)
    );

  defparam txfifo.lpm_numwords = 1024,
           txfifo.lpm_showahead = "ON",
           txfifo.lpm_type = "scfifo",
           txfifo.lpm_width = 8,
           txfifo.lpm_widthu = 10,
           txfifo.overflow_checking = "ON",
           txfifo.underflow_checking = "ON",
           txfifo.use_eab = "ON";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module my_nios1_fifoed_avalon_uart_0_rxfifo (
                                              // inputs:
                                               clk,
                                               d1_rx_fifo_rd_strobe,
                                               d1_rx_rd_strobe,
                                               in_rx_data,
                                               reset,

                                              // outputs:
                                               rx_data_b,
                                               rx_empty,
                                               rx_full,
                                               rx_used
                                            )
;

  output  [  7: 0] rx_data_b;
  output           rx_empty;
  output           rx_full;
  output  [  9: 0] rx_used;
  input            clk;
  input            d1_rx_fifo_rd_strobe;
  input            d1_rx_rd_strobe;
  input   [  7: 0] in_rx_data;
  input            reset;


wire    [  7: 0] rx_data_b;
wire             rx_empty;
wire             rx_full;
wire    [  9: 0] rx_used;
  scfifo rxfifo
    (
      .clock (clk),
      .data (in_rx_data),
      .empty (rx_empty),
      .full (rx_full),
      .q (rx_data_b),
      .rdreq (d1_rx_fifo_rd_strobe),
      .sclr (reset),
      .usedw (rx_used),
      .wrreq (d1_rx_rd_strobe)
    );

  defparam rxfifo.lpm_numwords = 1024,
           rxfifo.lpm_showahead = "ON",
           rxfifo.lpm_type = "scfifo",
           rxfifo.lpm_width = 8,
           rxfifo.lpm_widthu = 10,
           rxfifo.overflow_checking = "ON",
           rxfifo.underflow_checking = "ON",
           rxfifo.use_eab = "ON";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module my_nios1_fifoed_avalon_uart_0_regs (
                                            // inputs:
                                             address,
                                             begintransfer,
                                             break_detect,
                                             chipselect,
                                             clk,
                                             clk_en,
                                             framing_error,
                                             keep,
                                             parity_error,
                                             read_n,
                                             reset_n,
                                             rx_char_ready,
                                             rx_data,
                                             rx_overrun,
                                             synthesis,
                                             tx_ready,
                                             tx_shift_empty,
                                             write_n,
                                             writedata,

                                            // outputs:
                                             baud_divisor,
                                             dataavailable,
                                             do_force_break,
                                             gap_detect,
                                             gap_timeout,
                                             irq,
                                             readdata,
                                             readyfordata,
                                             rx_rd_strobe,
                                             status_wr_strobe,
                                             tx_data,
                                             tx_wr_strobe
                                          )
;

  output  [  8: 0] baud_divisor;
  output           dataavailable;
  output           do_force_break;
  output           gap_detect;
  output           gap_timeout;
  output           irq;
  output  [ 31: 0] readdata;
  output           readyfordata;
  output           rx_rd_strobe;
  output           status_wr_strobe;
  output  [  7: 0] tx_data;
  output           tx_wr_strobe;
  input   [  3: 0] address;
  input            begintransfer;
  input            break_detect;
  input            chipselect;
  input            clk;
  input            clk_en;
  input            framing_error;
  input            keep;
  input            parity_error;
  input            read_n;
  input            reset_n;
  input            rx_char_ready;
  input   [  7: 0] rx_data;
  input            rx_overrun;
  input            synthesis;
  input            tx_ready;
  input            tx_shift_empty;
  input            write_n;
  input   [ 31: 0] writedata;


wire             any_error;
wire    [  8: 0] baud_divisor;
reg     [ 15: 0] control_reg;
wire             control_wr_strobe;
wire             cts_status_bit;
reg              d1_rx_fifo_rd_strobe;
reg              d1_rx_not_empty;
reg              d1_rx_rd_strobe;
reg              d1_tx_not_full;
reg              d1_tx_wr_strobe;
wire             dataavailable;
wire             dcts_status_bit;
reg              delayed_unxtx_readyxx4;
wire    [  8: 0] divisor_constant;
wire             do_force_break;
wire             do_write_char;
wire             eop_status_bit;
wire             gap_detect;
wire             gap_timeout;
wire             ie_any_error;
wire             ie_break_detect;
wire             ie_dcts;
wire             ie_eop;
wire             ie_framing_error;
wire             ie_gap_detection;
wire             ie_parity_error;
wire             ie_rx_char_ready;
wire             ie_rx_overrun;
wire             ie_tx_overrun;
wire             ie_tx_ready;
wire             ie_tx_shift_empty;
wire    [  7: 0] in_rx_data;
reg              irq;
wire             pparity_even;
wire             pparity_odd;
wire             qualified_irq;
reg     [ 31: 0] readdata;
wire             readyfordata;
wire             reset;
wire             rts_control_bit;
wire             rx_at_threshold;
wire    [ 10: 0] rx_buff_used;
wire    [  7: 0] rx_data_b;
wire             rx_empty;
wire             rx_fifo_rd_strobe;
wire             rx_full;
wire             rx_not_empty;
wire             rx_not_full;
wire             rx_rd_strobe;
wire    [  9: 0] rx_used;
wire    [ 31: 0] selected_read_data;
wire    [ 14: 0] status_reg;
wire             status_wr_strobe;
wire             timer_timout;
wire             tx_almost_empty;
wire    [ 10: 0] tx_buff_used;
reg     [  7: 0] tx_data;
wire             tx_empty;
wire    [  7: 0] tx_fifo_q;
wire             tx_fifo_wr_strobe;
wire             tx_full;
wire             tx_not_empty;
wire             tx_not_full;
reg              tx_overrun;
wire    [  9: 0] tx_used;
wire             tx_wr_strobe;
  //CJR changed to 32 bits wide
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          readdata <= 0;
      else if (clk_en)
          readdata <= selected_read_data;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          irq <= 0;
      else if (clk_en)
          irq <= qualified_irq;
    end


  assign rx_fifo_rd_strobe = chipselect && ~read_n  && (address == 4'd0) && begintransfer;
  assign rx_rd_strobe = rx_char_ready && rx_not_full;
  assign tx_fifo_wr_strobe = chipselect && ~write_n && (address == 4'd1) && begintransfer;
  assign status_wr_strobe = chipselect && ~write_n && (address == 4'd2);
  assign control_wr_strobe = chipselect && ~write_n && (address == 4'd3);
  assign tx_wr_strobe = tx_ready && tx_not_empty;
  assign reset = ~reset_n;
  //tx_data comming from the tx_fifo
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tx_data <= 0;
      else if (tx_wr_strobe)
          tx_data <= tx_fifo_q;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          control_reg <= 0;
      else if (control_wr_strobe)
          control_reg <= writedata[15 : 0];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tx_overrun <= 0;
      else if (clk_en)
          if (status_wr_strobe)
              tx_overrun <= 0;
          else if (tx_full && tx_fifo_wr_strobe)
              tx_overrun <= -1;
    end


  assign baud_divisor = divisor_constant;
  assign cts_status_bit = 0;
  assign dcts_status_bit = 0;
  assign {pparity_even,
pparity_odd,
ie_gap_detection,
ie_eop,
rts_control_bit,
ie_dcts,
do_force_break,
ie_any_error,
ie_rx_char_ready,
ie_tx_ready,
ie_tx_shift_empty,
ie_tx_overrun,
ie_rx_overrun,
ie_break_detect,
ie_framing_error,
ie_parity_error} = control_reg;
  assign any_error = tx_overrun ||
    rx_overrun ||
    parity_error ||
    framing_error ||
    break_detect;

  assign status_reg = {rx_at_threshold,
    1'b0,
    eop_status_bit,
    cts_status_bit,
    dcts_status_bit,
    1'b0,
    any_error,
    rx_not_empty,
    tx_not_full,
    tx_shift_empty,
    tx_overrun,
    rx_overrun,
    break_detect,
    framing_error,
    parity_error};

  //Register the rx_not_empty for timing
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_rx_not_empty <= 0;
      else if (clk_en)
          d1_rx_not_empty <= rx_not_empty;
    end


  //Register the tx_not_full for timing
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tx_not_full <= 0;
      else if (clk_en)
          d1_tx_not_full <= tx_not_full;
    end


  //Register the rx_rd_strobe for timing
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_rx_rd_strobe <= 0;
      else if (clk_en)
          d1_rx_rd_strobe <= rx_rd_strobe;
    end


  //Register the rx_fifo_strobe for timing
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_rx_fifo_rd_strobe <= 0;
      else if (clk_en)
          d1_rx_fifo_rd_strobe <= rx_fifo_rd_strobe;
    end


  //Register the tx_wr_strobe for timing
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tx_wr_strobe <= 0;
      else if (clk_en)
          d1_tx_wr_strobe <= tx_wr_strobe;
    end


  assign dataavailable = d1_rx_not_empty;
  assign readyfordata = d1_tx_not_full;
  assign tx_almost_empty = (tx_used <=1) && tx_not_full;
  my_nios1_fifoed_avalon_uart_0_txfifo the_my_nios1_fifoed_avalon_uart_0_txfifo
    (
      .clk               (clk),
      .d1_tx_wr_strobe   (d1_tx_wr_strobe),
      .reset             (reset),
      .tx_empty          (tx_empty),
      .tx_fifo_q         (tx_fifo_q),
      .tx_fifo_wr_strobe (tx_fifo_wr_strobe),
      .tx_full           (tx_full),
      .tx_used           (tx_used),
      .writedata         (writedata)
    );

  assign tx_buff_used = {tx_full,tx_used}/* synthesis keep */;
  assign tx_not_full = ~tx_full;
  assign tx_not_empty = ~tx_empty;
  assign gap_detect = 1'b0;
  assign in_rx_data = rx_data;
  my_nios1_fifoed_avalon_uart_0_rxfifo the_my_nios1_fifoed_avalon_uart_0_rxfifo
    (
      .clk                  (clk),
      .d1_rx_fifo_rd_strobe (d1_rx_fifo_rd_strobe),
      .d1_rx_rd_strobe      (d1_rx_rd_strobe),
      .in_rx_data           (in_rx_data),
      .reset                (reset),
      .rx_data_b            (rx_data_b),
      .rx_empty             (rx_empty),
      .rx_full              (rx_full),
      .rx_used              (rx_used)
    );

  assign rx_buff_used = {rx_full,rx_used};
  assign rx_not_empty = ~rx_empty;
  assign rx_at_threshold = (rx_used >=1) || rx_full || timer_timout;
  assign rx_not_full = ~rx_full;
  assign gap_timeout = 0;
  assign timer_timout = 0;
  assign eop_status_bit = 1'b0;
  assign selected_read_data = ({32 {(address == 4'd1)}} & tx_data) |
    ({32 {(address == 4'd2)}} & status_reg) |
    ({32 {(address == 4'd3)}} & control_reg) |
    ({32 {(address == 4'd0)}} & rx_data_b) |
    ({32 {(address == 4'd6)}} & rx_buff_used) |
    ({32 {(address == 4'd7)}} & tx_buff_used);

  assign qualified_irq = (ie_any_error      && any_error      ) ||
    (ie_tx_shift_empty && tx_shift_empty ) ||
    (ie_tx_overrun     && tx_overrun     ) ||
    (ie_rx_overrun     && rx_overrun     ) ||
    (ie_break_detect   && break_detect   ) ||
    (ie_framing_error  && framing_error  ) ||
    (ie_parity_error   && parity_error   ) ||
    (ie_rx_char_ready  && rx_at_threshold  ) ||
    (ie_tx_ready       && tx_almost_empty     );


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //delayed_unxtx_readyxx4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          delayed_unxtx_readyxx4 <= 0;
      else if (clk_en)
          delayed_unxtx_readyxx4 <= tx_ready;
    end


  assign do_write_char = (tx_ready) & ~(delayed_unxtx_readyxx4);
  always @(posedge clk)
    begin
      if (do_write_char)
          $write("%c", tx_data);
    end


  assign divisor_constant = 4;

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  assign divisor_constant = 434;
//synthesis read_comments_as_HDL off

endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

//Generation parameters:
//--add_error_bits=0
//--baud=115200
//--baud_divisor_constant=434
//--clock_freq=50000000
//--data_bits=8
//--divisor_bits=9
//--fifo_export_used=0
//--fifo_size_rx=1024
//--fifo_size_tx=1024
//--fixed_baud=1
//--gap_value=4
//--hw_cts=0
//--num_control_reg_bits=16
//--num_status_reg_bits=15
//--parity=N
//--project_info=HASH(0x604af68)
//--relativepath=1
//--rx_IRQ_Threshold=1
//--rx_fifo_LE=0
//--sim_char_stream=
//--sim_true_baud=0
//--stop_bits=1
//--sync_reg_depth=2
//--system_clk_freq=50000000
//--timeout_value=4
//--timestamp_width=8
//--trans_pin=0
//--tx_IRQ_Threshold=1
//--tx_fifo_LE=0
//--use_cts_rts=0
//--use_eop_register=0
//--use_ext_timestamp=0
//--use_gap_detection=0
//--use_rx_fifo=1
//--use_status_bit_clear=0
//--use_timestamp=0
//--use_timout=0
//--use_tx_fifo=1

module my_nios1_fifoed_avalon_uart_0 (
                                       // inputs:
                                        address,
                                        begintransfer,
                                        chipselect,
                                        clk,
                                        keep,
                                        read_n,
                                        reset_n,
                                        rxd,
                                        synthesis,
                                        write_n,
                                        writedata,

                                       // outputs:
                                        dataavailable,
                                        gap_detect,
                                        gap_timeout,
                                        irq,
                                        readdata,
                                        readyfordata,
                                        txd
                                     )
  /* synthesis altera_attribute = "-name SYNCHRONIZER_IDENTIFICATION OFF" */ ;

  output           dataavailable;
  output           gap_detect;
  output           gap_timeout;
  output           irq;
  output  [ 31: 0] readdata;
  output           readyfordata;
  output           txd;
  input   [  3: 0] address;
  input            begintransfer;
  input            chipselect;
  input            clk;
  input            keep;
  input            read_n;
  input            reset_n;
  input            rxd;
  input            synthesis;
  input            write_n;
  input   [ 31: 0] writedata;


wire    [  8: 0] baud_divisor;
wire             break_detect;
wire             clk_en;
wire             dataavailable;
wire             do_force_break;
wire             framing_error;
wire             gap_detect;
wire             gap_timeout;
wire             irq;
wire             parity_error;
wire    [ 31: 0] readdata;
wire             readyfordata;
wire             rx_char_ready;
wire    [  7: 0] rx_data;
wire             rx_overrun;
wire             rx_rd_strobe;
wire             status_wr_strobe;
wire    [  7: 0] tx_data;
wire             tx_ready;
wire             tx_shift_empty;
wire             tx_wr_strobe;
wire             txd;
  assign clk_en = 1;
  my_nios1_fifoed_avalon_uart_0_tx the_my_nios1_fifoed_avalon_uart_0_tx
    (
      .baud_divisor   (baud_divisor),
      .clk            (clk),
      .clk_en         (clk_en),
      .do_force_break (do_force_break),
      .reset_n        (reset_n),
      .tx_data        (tx_data),
      .tx_ready       (tx_ready),
      .tx_shift_empty (tx_shift_empty),
      .tx_wr_strobe   (tx_wr_strobe),
      .txd            (txd)
    );

  my_nios1_fifoed_avalon_uart_0_rx the_my_nios1_fifoed_avalon_uart_0_rx
    (
      .baud_divisor     (baud_divisor),
      .break_detect     (break_detect),
      .clk              (clk),
      .clk_en           (clk_en),
      .framing_error    (framing_error),
      .parity_error     (parity_error),
      .reset_n          (reset_n),
      .rx_char_ready    (rx_char_ready),
      .rx_data          (rx_data),
      .rx_overrun       (rx_overrun),
      .rx_rd_strobe     (rx_rd_strobe),
      .rxd              (rxd),
      .status_wr_strobe (status_wr_strobe)
    );

  my_nios1_fifoed_avalon_uart_0_regs the_my_nios1_fifoed_avalon_uart_0_regs
    (
      .address          (address),
      .baud_divisor     (baud_divisor),
      .begintransfer    (begintransfer),
      .break_detect     (break_detect),
      .chipselect       (chipselect),
      .clk              (clk),
      .clk_en           (clk_en),
      .dataavailable    (dataavailable),
      .do_force_break   (do_force_break),
      .framing_error    (framing_error),
      .gap_detect       (gap_detect),
      .gap_timeout      (gap_timeout),
      .irq              (irq),
      .keep             (keep),
      .parity_error     (parity_error),
      .read_n           (read_n),
      .readdata         (readdata),
      .readyfordata     (readyfordata),
      .reset_n          (reset_n),
      .rx_char_ready    (rx_char_ready),
      .rx_data          (rx_data),
      .rx_overrun       (rx_overrun),
      .rx_rd_strobe     (rx_rd_strobe),
      .status_wr_strobe (status_wr_strobe),
      .synthesis        (synthesis),
      .tx_data          (tx_data),
      .tx_ready         (tx_ready),
      .tx_shift_empty   (tx_shift_empty),
      .tx_wr_strobe     (tx_wr_strobe),
      .write_n          (write_n),
      .writedata        (writedata)
    );

  //s1, which is an e_avalon_slave

endmodule

