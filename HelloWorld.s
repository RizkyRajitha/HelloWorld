# Hello World in Assembly
# Run with command
# as Helloworld.s -o HelloWorld.o -arch i386
# ld Helloworld.o -e _main -lc -macosx_version_min 10.14 -o HelloWorld -no_pie && ./HelloWorld

    .globl  _main           # set start point of program

message:                                 
    .asciz "Hello World\n"

_main:                      # program starts here               
    push    %ebp            # save base-pointer register 
    sub     $8, %esp        # reserve bytes from stack to call _printf

    lea     message, %eax   # get memory address of message string...
    mov     %eax, (%esp)    # ...and store it into reserved stack area

    call    _printf         # display a "Hello World" on console

    add     $8, %esp        # free up reserved stack memory
    pop     %ebp            # restore base-pointer register 
    xor     %eax, %eax      # set return code to zero
    ret                     # exit program