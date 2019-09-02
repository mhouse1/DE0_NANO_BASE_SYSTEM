/////////////////////////////////////////////////////////////////////////////
///Name: serial_uart.h
///Date: Sep 2, 2019 10:47:48 AM
///Author: Michael on computer Mech1 
///Copyright: 2019 Terrafirma Technologies, Inc. 
///Description: serial uart definitions
/////////////////////////////////////////////////////////////////////////////
#include "types.h"

#ifndef SERIAL_UART_H_
#define SERIAL_UART_H_


/*! Define structure of debugger UART, 16-bit registers on 32-bit boundaries,
 * 	upper words are not used.
 */
struct UART_HW_struct
{
  alt_u16 rxdata;					// Receive Data
  alt_u16 rxdata_unused;
  alt_u16 txdata;					// Transmit Data
  alt_u16 txdata_unused;
  union
  {
    alt_u16 word;
    struct
    {
    	alt_u16  pe         : 1;
    	alt_u16  fe         : 1;
    	alt_u16  brk        : 1;
    	alt_u16  roe        : 1;

    	alt_u16  toe        : 1;
    	alt_u16  tmt        : 1;
    	alt_u16  trdy       : 1;
    	alt_u16  rrdy       : 1;

    	alt_u16  e          : 1;
    	alt_u16  unused     : 1;
    	alt_u16  dcts       : 1;
    	alt_u16  cts        : 1;

    	alt_u16  eop        : 1;
    	alt_u16  reserved   : 3;
    } sBits;
  } sStatus;					// Status Bits
  alt_u16 status_unused;

  union
  {
	  alt_u16 word;
    struct
    {
		  alt_u16  ipe        : 1;
		  alt_u16  ife        : 1;
		  alt_u16  ibrk       : 1;
		  alt_u16  iroe       : 1;

		  alt_u16  itoe       : 1;
		  alt_u16  itmt       : 1;
		  alt_u16  itrdy      : 1;
		  alt_u16  irrdy      : 1;

		  alt_u16  ie         : 1;
		  alt_u16  trbk       : 1;
		  alt_u16  idcts      : 1;
		  alt_u16  rts        : 1;

		  alt_u16  ieop       : 1;
		  alt_u16  reserved   : 3;
    } sBits;
  } sControl;					// Control Bits
  alt_u16 control_unused;

  alt_u16 divisor;
  alt_u16 divisor_unused;
  alt_u16 end_of_packet;
  alt_u16 end_of_packet_unused;
  alt_u16 uart_rx_fifo_used;
  alt_u16 uart_rx_fifo_unused;
  alt_u16 uart_tx_fifo_used;
  alt_u16 uart_tx_fifo_unused;
  alt_u16 gap_timeout_value;
  alt_u16 gap_timeout_unvalue;
  alt_u16 timestamp_value;
  alt_u16 timestamp_unvalue;
};

void serial_initialize(void);
void serial_send(alt_u8 x);
void serial_print(void);
void serial_send_string(alt_char *pText);
alt_u8 * serial_read(void);

#endif /* SERIAL_UART_H_ */
