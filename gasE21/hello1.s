.text
message:
 .ascii "Hello world!\0"
 .align 4
.globl main
main:
 pushl %ebp            
 movl %esp,%ebp
 #call ___main          
 pushl $message       
 call puts
 addl $4,%esp
 xorl %eax,%eax
 movl %ebp,%esp     
 popl %ebp
 ret

# as --32 hello.s -o hello.o
# gcc -m32 hello.o -o hello
