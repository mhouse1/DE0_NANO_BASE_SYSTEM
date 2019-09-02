/////////////////////////////////////////////////////////////////////////////
///Name: serial_uart.c
///Date: Sep 2, 2019 11:06:02 AM
///Author: Michael on computer Mech1 
///Copyright: 2019 Terrafirma Technologies, Inc. 
///Description: 
/////////////////////////////////////////////////////////////////////////////
#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "serial_uart.h"
#include "types.h"

// Define pointer to Serial IO
struct UART_HW_struct *pUART;

//Initialize serial uart
void serial_initialize(void)
{
	pUART = (struct UART_HW_struct *)(FIFOED_AVALON_UART_0_BASE | 0x0000000);
	pUART->sControl.word = 0;
	alt_u16 char_count = 0;
	  //clear any data in the rx fifo
	  if (pUART->sStatus.sBits.rrdy)
	  {
	      char_count = pUART->uart_rx_fifo_used;
	      printf("will clear %d from rx fifo\n",char_count);
	    while (pUART->sStatus.sBits.rrdy) //check data available
	    {
	    	//must read it once to remove from FIFO
	       //(alt_u8)(pUART->rxdata);
	       printf("%c",(char)(pUART->rxdata));
	    }
	    printf("cleared rx fifo\n");
	  }

	  printf("serial initialized\n");
}

//transmit a character
void serial_send(alt_u8 x)
{
    alt_u16 timeout = 0;
    while(!pUART->sStatus.sBits.trdy)
    {
        //poll the transmit ready bit in 1ms intervals
        //usleep(1000);//sleep micro seconds
        timeout++;
        if (timeout > 100)
            printf("timed out waiting for tx ready\n");
    }
    pUART->txdata = x;//transmit
}


////
////
////check rrdy pin, if active then save value from
////rxdata into char list else wait
/////FIFOED_AVALON_UART_0_RX_FIFO_SIZE = 8192
/////pUART->uart_rx_fifo_used must not exceed FIFOED_AVALON_UART_0_RX_FIFO_SIZE
/////if FIFOED_AVALON_UART_0_RX_FIFO_SIZE exceeded then communication error
/////will occur
alt_u8 * serial_read(void)
{
	static int buffer_size = 512;
	alt_u8 length = 0;
	alt_u8 *message;
	message = malloc (sizeof (char) * buffer_size);
	//pUART->sControl.sBits.rts = 1;
	alt_u8 ch;

	//alt_u8 message[512];
	alt_u16 char_count = 0;
	//printf('read:');
	if (pUART->sStatus.sBits.rrdy)
	{
		char_count = pUART->uart_rx_fifo_used;
		printf("in FIFO: %d ",char_count);
		while(length < 512 && pUART->sStatus.sBits.rrdy )
		{
		   ch = (alt_u8)pUART->rxdata;
		   //printf("%c",(char)ch);
		   message[length++] = ch;
		}

		//add an \0 at the end so this is a null terminated string
		//other wise if you tried to printf message it'll keep going
		//until it bumps into a null termination
		message[length] ='\0';
	}

    return (alt_u8 *)message;
    //return 0;

}

void serial_send_string(alt_char *pText)
{
	alt_u16 i;
	for(i=0;i<512;i++)
	{
		//printf( "%c",*pText);
		if(*pText == '\0')
			return;
		else
			serial_send(*pText++);
	}

}

//prints everything received
void serial_print(void)
{
	alt_u8 * message = serial_read();
	if(sizeof(message) >0)
		printf("message %s\n",message);
	else
		printf("no msg \n");

}
