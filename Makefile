CC=arm-none-eabi-gcc  
MACH=cortex-m4
CFLAGS=-c -mcpu=$(MACH) -mthumb -std=c11 -Wall -o0
LDFLAGS= -nostdlib -T stm_ls.ld -Wl,-Map=final.map
all:main.o startup_code.o final.elf
 
main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^

startup_code.o:startup_code.c
	$(CC) $(CFLAGS) -o $@ $^	

final.elf:main.o startup_code.o
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f *.o *.elf

load:
	openocd -f board/stm32f4discovery.cfg
	
opocdexe:
	arm-none-eabi-gdb.exe
	