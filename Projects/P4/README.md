## Karson Mahan
# SRE Project 4 - Ghidra Processor Spec
# SRE S20
------------------------------------------------
## Collaboration Statement
Matthew Ray   

## Introduction
IDA, Binary Ninja, and Ghidra are incredibly useful tools for reverse engineering. However, these tools support a limited number of assembly languages and processor architectures. Luckily, Ghidra allows us to create new processor specifications to fill these gaps. This would normally be used to add support for processors not supported by Ghidra, but instead you will be creating a processor specification for x86 (which is already supported by Ghidra).

## Procedure
The first thing I did was use Ghidra to disassemble the program. I then looked at the main function to see what instructions I would need for the main function to disassemble correctly. These instructions were the MOV, ADD, PUSH, and POP instructions. 

To start off my SLAspec, I used the example that was done in class. I then looked at the x86 SLAspec files that Ghidra has already to find out how to set everything up. 

From there, I would look at the x86 manual, the SLEIGH manual, the Ghidra x86 SLAspec, and a table of the instructions and their opcodes. After every few instructions I would try to compile my SLAspec and fix any errors that popped up. 

## Conclusion
If I were more interested in the subject, I feel like I would have liked the assignment better and been able to understand it better. It was difficult trying to wrap my head around everything that needed to be in my SLAspec file just for the main function to disassemble properly.   

