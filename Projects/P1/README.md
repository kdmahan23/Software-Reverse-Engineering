## Karson
# SRE Project 1 - "It's Machine Code"
# SRE S20
------------------------------------------------
## Collaboration Statement

## Summary
This project addresses the necessity for a software reverse engineer to be proficient in assembly programming. x86 is one of the most prevalent assembly languages and is the most common architecture for the average computer user's operating system. Being able to program in this common assembly language is the first step towards reverse engineering software of this architecture.


### Approach
The first thing I did was read up on each algorithm to understand what exactly they did. 
I then looked at the psuedo-code and actual C implementations of the algorithms to see what functions were called and what they did.

I was able to get binSearch to compile and run and create a main function to test that the search worked correctly. 
For the Tiny Encryption Algorithm, I was able to compile and run, but was unable to create a main function to test if it worked properly 

### Build Instructions
nasm -f elf binSearch.s
gcc -m32 binsSearch.o
./a.out
Output should show 13 and 2

nasm -f elf tea.s
gcc -m32 tea.o
./a.out