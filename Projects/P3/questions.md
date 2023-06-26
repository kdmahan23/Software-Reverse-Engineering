# Questions

- Besides any techniques used, what are 2 other techniques that the malware could have used to make itself difficult to debug? 
    - Could check if malware is running in a virtual box by checking
        - the MAC address
        - processes that indicate a virtual box
        - check for existing files that indicate a virtual box
    - Could do timing checks, if a process is taking too long due to single-stepping, crash or exit 

- Besides any techniques used, what is a technique that the malware could have used to make it more difficult to statically reverse engineer?
    - Could have used a scrambler on the already compressed file
        - For example, a scrambler might change section names and add new entry code
    - Could have used a virtualizer
        - These tools allow an application's native code to be replaced with bytecode

- List five ways you could improve the malware and how you would implement those improvements.


- Describe your overall philosophy for reverse engineering this binary. 
    - Go through each function graph and look for anything interesting. Also research the function calls that seem interesting
    - Also google the malware to see if anyone else has tried to reverse engineer it
    - Take the reversing one step at a time. Focus on different areas that could be affected by the malware,
    such as registers and files
    
- Please comment on the difficulty of reverse engineering this binary and how long it took.
    - This program was extremely hard to reverse engineer and it took multiple days.

- Please comment on any frustrations or complaints while completing this assignment. 
    - IDA in general is frustrating because it likes to disassembly things weirdly. The code was a little hard to follow with how IDA disassembled it. Assembly code itself is hard to follow at times. And I'm not 100% sure how everything works
    - This assignment was too big and too complicated for the level of knowledge we learned in class. I definitely was not prepared for the task at hand with this assignment. 
