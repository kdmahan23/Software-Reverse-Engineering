## Karson Mahan
# SRE Lab 1 - Program By Hand
# SRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The goal of this lab is to understand at the lowest level the process used to build software. Students will build a program in a step by step fashion. 

### Part 1

gcc -H -o hello hello.c: This command completely compiles the source code into an executable file. 

gcc -E hello.c -o hello.i: This command only performs the preprocessing. Prepocessing includes replacing all macros in the code 

gcc -S hello.i -o hello.s: This command outputs assembly

gcc -c hello.s -o hello.o: Converts assembly in object code

gcc hello.o -o hello: This is the linking step

**Q1: What is the function that is called? (call ???)**
puts@PLT

**Q2: Any ideas as to why this function isn't the one we used in the source code?**
The assembly code is optimized, so to make the program run quicker the compiler replaced printf with puts. 

**Q3: What is the name of the main code section of the program?**
.text

**Q4: What is the address that the main code section will be loaded**
000000000000105

**Q5: Look at the symbol table, what are 3 symbols in the table?**
_end
_start
_init

### Part 2
For part 2, I rewrote hello.c into a file called test.c to include the second string and ran the commands to see what needed to be changed in the original assembly code. 
I needed to include another section and put in another call function. 

gcc -c hello2.s -o hello2.o

gcc hello2.o -o hello2

## Conclusion
I learned the steps the compiler takes to build a program. 
I also learned a little about how to modify assembly. 
