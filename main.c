
#include <stdint.h>

uint32_t* pRccahb1 = (uint32_t*) 0x40023830;
uint32_t* pGpio_modereg = (uint32_t*) 0x40020C00;
uint32_t* pGpio_data_reg = (uint32_t*) 0x40020C14;

int main(void)
{

	*pRccahb1 |= (1<<3);

	*pGpio_modereg &= ~(3<<24);
	*pGpio_modereg |= (1<<24);

	*pGpio_data_reg |= (1<<12);

    /* Loop forever */

	 //*pGpio_data_reg |= (1<<12);

}
