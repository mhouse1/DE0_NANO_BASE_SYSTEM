///////////////////////////////////////////////////////////////////////////////
//@author Michael
//@date 9/2/2019
//@details demo firmware that tests hardware by utilizing onboard components
//
//@history
//		09/02/2019 71KB serial send and receive added
//
///////////////////////////////////////////////////////////////////////////////
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "slave_template_macros.h"

#include "serial_uart.h"

int main()
{
  printf("starting! 9/2/2019\n");

  int dip_switch_value;

  serial_initialize();

  int counter = 0;
  while (1)
  {
	  counter
	  //where SWITCHES_BASE is a #define from system.h
	  //generated as a result of qsys edits
	  dip_switch_value = IORD_ALTERA_AVALON_PIO_DATA(SWITCHES_BASE);
	  printf("DIP = %d\n", dip_switch_value);
	  serial_send('h');
	  serial_send('e');
	  serial_send('l');
	  serial_send('l');
	  serial_send('o');

	  //time delay
	  usleep(500000);

	  //Verify send string working
	  serial_send_string("world the quick brown fox jumped");
	  //serial_send_string("world the quick brown fox jumped");
	  //serial_send('\0');

	  //serial_read();
	  serial_print();

	  IOWR_32DIRECT(SLAVE_TEMPLATE_0_BASE, (DATA_OUT_0*4), 307);


  }
  return 0;
}
