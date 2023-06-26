## Kayla Mahan
# SRE Lab 5 - Bomb 1997
# SRE S20
------------------------------------------------
## Collaboration Statement
Rylan Boyer

## Summary
The purpose of this lab was to test your understanding of x86 reversing using IDA.

### Flag 1 - Yellow
The password for the yellow wire was 84371065. I found this by using IDA and the internet to convert the hex values into their ASCII values.

![YellowWire](./imgs/yellow_1.png)

![YellowWire](./imgs/yellow_2.png)

![YellowWire](./imgs/yellow_4.png)

![YellowWire](./imgs/yellow_3.png)

### Flag 2 - Green
To get past the green wire, I needed to cause a buffer overflow. If I would have just put in the password given, the unlock disengages then re-engages. In order to cause the buffer overflow I  typed in the password that was given twice. 

![](./imgs/green_1.png)

![](./imgs/green_2.png)

![](./imgs/green_3.png)

![](./imgs/green_4.png)

### Flag 3 - Blue
For the blue wire, I needed to know a circuit route. The easiest way to find the path to the correct circuit route was to use a python script.
The alphabet was L and R; the length of the path was four. I noticed that I needed to have an new line character after my circuit path for the program to register the path. 
With this information and the example provided in class, I constructed a python script to try multiple combinations of the alphabet.
I wasn't able to get the python script to work properly, so I reached out to fellow classmates. I learned that I needed print out the paths before they are tried,so when the program crashed the printed path before the crash was the solution. This lead me to the final solution of "LLRR".

![](./imgs/blue_2.png)

![](./imgs/blue_1.png)

![](./imgs/bluewire1.png)

![](./imgs/bluewire2.png)

### Flag 4 - Red
For the red wire, I had to figure out the resynchronization sequence given three clock sync values. Using Ghidra and other decompilers, I learned that the resynchronization sequence was a function of a alphanumeric array and the clock sync values. I also learned the length of the resynchronization value was either 18 or 19.   
For each character of the password, I had to find the corresponding character in the alphanumeric array. This was done by using the clock sync values given to us by the code. The index of the alphanumeric array was found by doing a bitwise AND. This was between the last clock sync value and the integer 31, but after each letter was found the clock sync values changed.  
The last clock sync value was set to a bitwise OR between the second clock sync value shifted left by 27 and itself shifted right by 5.  
The second clock sync value was set to a bitwise OR between the first clock sync value shifted left by 27 and itself shifted right by 5.  
The first clock sync value was set to itself shifted right by 5.  
This pattern continued until the password was complete.
Using the decompiled code, I wrote a C program to compute the password and printed it out. By doing this, I was able to find the solution.


![](./imgs/red_3.png)

![](./imgs/red_1.png)

![](./imgs/red_2.png)

![](./imgs/red_4.png)

![](./imgs/red_5.png)

![](./imgs/red_6.png)