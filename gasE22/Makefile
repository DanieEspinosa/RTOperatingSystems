all:hello2

hello2:hello2.o
	ld hello2.o -e _hw -o hello2	

hello2.o:hello2.s
	as hello2.s -o hello2.o
