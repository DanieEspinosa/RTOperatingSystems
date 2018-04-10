#PURPOSE:    This program finds the minimum number of a
#            set  of  data items and will end with 255.
#
# %ebx - Shortest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
# to terminate the data
#
.section .data
data_items:                     #These are the data items
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,255

.section .text

.globl _start
_start:
movl $0, %edi                   # move 0 into the index register
movl data_items(,%edi,4), %eax  # load the first byte of data
movl %eax, %ebx                 # since this is the first item, %eax is
                                # the biggest
start_loop:
cmpl $255, %eax                   # check to see if we’ve hit the end
je loop_exit
incl %edi                       # load next value
movl data_items(,%edi,4),%eax
cmpl $255, %eax                   # check to see if we’ve hit the end
je loop_exit
cmpl %ebx, %eax                 # compare values
jge start_loop                  # jump to loop beginning if the new
                                # one isn’t lower
movl %eax, %ebx                 # move the value as the lowest
jmp start_loop                  # jump to loop beginning

loop_exit:

# %ebx is the status code for the exit system call
# and it already has the maximum number
movl $1, %eax                    # 1 is the exit() syscall
int $0x80
