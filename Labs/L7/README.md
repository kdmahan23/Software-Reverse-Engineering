## Karson Mahan
# SRE Lab 7 - Binary Patching
# SRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The purpose of this lab was to practice binary patching.

**Level 1 - flag{lvl_1_done}**  
Level 1 was the only level where you didn't need to patch anything for the flag. 

**Level 2 - flag{debuggers!}**  
Level 2 is where the fun begins. This level involves calling a function that checks to see if there is a debugger and then uses the return value for a branch. 
![Level2Before](./imgs/level2before.png)  
However, leaving the code as is results in the code to end because there is a debugger. So I needed to invert the branch so that it would jump to the code that contained the flag. To do this, I changed the 'jz' operand to a 'jnz' operand.  
![Level2After](./imgs/level2after.png)  
This patch allowed me to find the flag for level 2. 

**Level 3 - flag{lern2patch}**  
Level 3 builds on Level 2 except with an extra obstacle in the way of getting the flag. Not only does not branching terminate the code, but so does branching. So, what was I to do?? Looking at the graph image, I noticed code that was very similar to the code that gave me the flag for Level 2. The problem? Nothing jumped to this location so the code could run. This gave me the idea to change not only the operand but also where it jumped to. Below, you can see I changed 'jz' to 'jnz' (like in Level 2) and also changed the address it jumped to.   
![Level3Before](./imgs/level3before.png) 
![Level3After](./imgs/level3after.png)  
This patch allowed to section of code I noticed to run and give me the flag.

**Level 4 - flag{rank1stpwn}**  
Level 4 very different than the two levels before it. The level states that it is going to "Spam calls to protect flags!" which lets you know exactly what you're going to have to patch. This particular level spam calls the function 'IsDebuggerPresent' and then branches; however, not branching terminates the program and branching does another call to the function and another branch. So on and so forth.  
Thankfully, I did not have to go through all of the calls and change the operand. I somehow accidentally switched to text view, which allowed me to see code that wasn't showing on the graph view. So I scrolled until I found the code that would print the flag. I noticed that it had the location at the top, like the other branches did. I figured this meant I could do the same thing I did with Level 3. After a few syntax errors and learning about the 'jmp' operand I patched the level and received the flag.   
![Level4Before](./imgs/level4before.png) 
![Level4After](./imgs/level4after.png) 

**Level 5 - flag{flag1stpwn}**  
Level 5 took the complexity and turned it up a notch or two. This is the first level were we had implicit calls to exit, on both sides of the branch. This was also a level that needed to be looked at in text view instead of the graph view. 
Looking at the text view, I could see there were multiple branches that could possibly be taken, some jumps and A LOT of exit calls. To get the flag on this one, I had to make sure the branches went the right direction and 'nop' the exit calls in those branches.  
The first branch didn't need to be patched, I just had to remove the exit call so that the code could continue.
![Level5Before](./imgs/level5before_a.png) 
![Level5After](./imgs/level5after_a.png)

The second branch did need to be changed from 'jz' to 'jnz' and the exit call removed.
![Level5Before](./imgs/level5before_b.png) 
![Level5After](./imgs/level5after_b.png) 

The third and final branch also didn't need to be changed but I still needed to remove the exit call. 
![Level5Before](./imgs/level5before_c.png) 
![Level5After](./imgs/level5after_c.png) 

These patches allowed me to get the flag without it being gibberish because we had the right key. 

**Level 6 - flag{rank2ndpwn}**  
Level 6 seems really scary when you first look at it because it says it's going to mess with the stack alignment. Which it does, but the code for the flag accommodates for this. However, it does not account for moving the stack pointer to an ungodly number. Removing that instruction is all that was needed to patch the program and receive the flag. 
![Level6Before](./imgs/level6before.png) 
![Level6After](./imgs/level6after.png) 

**Level 7 - flag{1337_skill}**  
Level 7 called an exit function over and over until you reached part of the code for the flag and then continued with the exit calls until you reached the next part of the code, and so on until you reached the last part of code. Now, one could go through and 'nop' all the exit calls or use the 'jmp' operand to jump to the locations of the code. I chose the latter. I had to patch the level in 3 different places, shown below.  
![Level7Before](./imgs/level7before_a.png) 
![Level7After](./imgs/level7after_a.png)
![Level7Before](./imgs/level7before_b.png) 
![Level7After](./imgs/level7after_b.png) 
![Level7Before](./imgs/level7before_c.png) 
![Level7After](./imgs/level7after_c.png)

**Level 8 - flag{practmagic}**  
Level 8 seemed to be innocent enough, but had a trick up its sleeve. Even though the code looked normal, there was one instruct that jumped to a function that caused the code to self destruct. This was easily patched by just finding the which instruction was calling the self destruct and removing it. And by removing it, I mean, 'nopping' the instruction. 
![Level8Before](./imgs/level8before.png) 
![Level8After](./imgs/level8after.png)

**Level 9 - flag{tired.....} & Level 10 - flag{pwnmax1v1}** 
Levels 9 and 10 were hidden until you completed the rest of the patches. To get these flags, you had to look at the code with the welcome message. If you looked at where the code called level functions, it calls 2 of the levels twice. To patch, I found the function names of levels 9 and 10 and replaces the duplicate calls with calls to level 9 and level 10.  
![Level9_10Before](./imgs/level9_10before.png) 
![Level9_10After](./imgs/level9_10after.png) 

**Flags**  
![Flags](./imgs/all_flags.png)
![Flag_5](./imgs/flag_5.png)

## Conclusion
I learned there are multiple ways to go about patching. I also learned that spending time exploring the functions and looking at the text view is very important in patching. It gives you a better understanding of what the code is doing and can reveal hidden parts of code.

Side note: IDA debugger is weird. Also, patching in IDA sucks when trying to completely change the operand. 
