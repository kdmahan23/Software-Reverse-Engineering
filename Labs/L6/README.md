## Kayla Mahan
# SRE Lab 6 - Rewriting
# SRE S20
------------------------------------------------
## Collaboration Statement
Rylan Boyer

## Summary
This lab's purpose is to write source code by hand that is derived from a disassembly.

## Procedure
I began by going through the disassembled code instruction by instruction. I then commented on the pieces of code that was important. I utilized free programs that assisted me in decompiling code, this helped me understand how the code was being decrypted. The decryption process used the OpenSSL MD5 library. I used the online library to see exactly what functions were needed to be called to ensure the decryption would work successfully. I hardcoded the messages and keys because I could not get the program to read in the messages or keys correctly from the command line. I then used the MD5 library functions to decrypt each message using the correct key. 

The following image shows the decrypted messages:

![Decrypted Message](./lab6.png)

## Description of Reverse Engineered Code
The first section of the code sets up an integer count for the decryption process, along with four character arrays to hold the decoded messages. The length of the array is set to 17 characters to account for the length of the messages and a new line character. The last character is set to an end line character to make sure that the program knows when to stop printing the decrypted message so that junk characters are not printed. 

The next section of code created four unsigned character arrays, each are used in the MD5 decryption. These are initialized to a length of MD5_DIGEST_LENGTH, which is a set size in the MD5 library. The MD5_DIGEST_LENGTH is 16 bytes.

The next two sections are the hardcoded messages and keys. The keys are in hexadecimal while the messages are a string of ASCII characters. The following sections are the decryption process for each message. Each decryption calls four functions from the MD5 library and one constructor. The first line creates a MD5_CTX variable to be used in the next functions. The second line computes the MD5 message digest of the message array , this is 16 and places this in result array. The third line initializes a MD5_CTX structure using the variable created in the first line. The fourth line hashes the message and then the fifth line places the message digest in the result array and erases the MD5_CTX.

The while loop uses a bitwise XOR between the result of the MD5 hash and the key, then places the result in the arrays created for the decrypted messages.

The last sections print all of the decrypted messages to the screen.

## Conclusion
I have gained a deeper knowledge of how to read disassembly and turn it into source code. There are still some aspects of reversing that I continue to educate myself on, but I will continue to improve my skills in time and practice. 
