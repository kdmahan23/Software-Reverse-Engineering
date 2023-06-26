## Karson Mahan
# SRE Lab 2 - Read the Docs
# SRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The goal of this lab is to understand how opcodes work. Students are given an executable program that has had several instructions removed and will need to "hand assemble" these instructions back to where they need to be. 

### File Offsets  
- 0x104
- 0x105
- 0x109
- 0x5
- 0x6

### Description of Instructions  
- xor al, 0x5  
~ Logical Exclusive OR of AL and 0x5
- inc edx  
~ Increment the register EDX by 1 
- int 0x80  
~ Call to interrupt procedure
~ Transfers flow to the kernel

### Approach and Methodology 
- I followed the instrucstions given to us in the lab README. I compared the original.s file to the disassembled binary file. By doing this, I found which instructions had been replaced with nops. Then I opened the binary file in a hex editor to add the instructions back into the file. I used the search function in the hex editor and the values of the instructions before the ones being replaced to find where the file needed to be modified. There were 5 bytes in total that needed to be changed. 

### Flag printout  
- flag{you_did_it}

## Conclusion
I learned how to edit hex to replace missing instructions or modify instructions. I wasn't sure about how to find the file offsets. That is the only thing I struggled with. 
