## Karson Mahan
# SRE Lab 9 - Anti-RE Writing"
# SRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The purpose of this lab was to understand various anti-reversing tricks.

### Part 1 - Anti-RE Creation  
**IsDebuggerPresent()**
- No parameters
- Return value
  - If current process is running in the context of a debugger, the return value is non zero
  - If the current process is not running in the context of a debugger, the return value is zero
- Allows an application to determine whether or not it is being debugged, so that it can modify its behavior. 

**BlockInput**
- Parameters
  - fBlockIt - type BOOL
    - If TRUE, keyboard and mouse input events are blocked
    - If FALSE, keyboard and mouse events are unblocked
- When input is blocked, real physical input from the mouse or keyboard will not affect the input queue's synchronous key state, nor will it affect the asynchronous key state.


### Part 2 - Reversing Anti-RE
**IsDebuggerPresent()**
- No parameters
- Return value
  - If current process is running in the context of a debugger, the return value is non zero
  - If the current process is not running in the context of a debugger, the return value is zero
- Allows an application to determine whether or not it is being debugged, so that it can modify its behavior. 
- This is easy enough to get around. You can either change the value of the registers being compared or change the condition of the jump 

- I think the other anti-RE technique used was encryption. 

![](./flag_part2.png)
