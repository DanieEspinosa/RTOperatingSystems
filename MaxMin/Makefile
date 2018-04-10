all:maxmin3

maxmin3:maxmin3.s
	as --32 -o maxmin3.o maxmin3.s
	gcc -m32  -o maxmin3 maxmin3.o

clean: 
	rm -vf *.o	
	rm maxmin3	
	
