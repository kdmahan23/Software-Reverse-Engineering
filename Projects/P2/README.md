
## Kayla Mahan
# SRE Project 2 - C & C++ RE
# SRE S20

## Collaboration Statement
Matthew Ray  
Shawn Kelso

## Summary
The goal of this project is to use the skills and tool sets you've learned so far in the course to answer the following questions

### Part 1 - Reversing C

#### prog1.exe
1. What are the arguments to sub_401000?  
    - 6 & 9

2. Where is the return value of sub_401000 stored?  
    - eax register 

3. What does the main function return?  
    - the return value of sub_401000

4. What does sub_401000 do?  
    - An integer multiplication between arg_0 and arg_0
then adds arg_4 

5. What does sub_401000 return?  
    - 45

#### prog2.exe
6. What is done with the result of sub_401000?  
    - nothing is done with the result

7. What is the loop exit condition?  
    - Exit when less than or equal to 0

8. What is the functionality of sub_401000  
    - Increments variable

9. The result of the multiplication in sub_401000 quickly settles to a static value. Why?
    - Because the number gets too large for the register to handle

#### prog3.exe
10. cdq is an instruction we’ve not encountered yet. What does it do? Why is it used here?  
    - Convert doubleword to quadword  
    - Doubles the size of the operand in register EAX by means of sign extension and stores the result in EDX:EAX
    - It is used so that we can use idiv 

11. How many loops does this program utilize?  
    - 4 loops

12. What is the functionality inside of the loops?  
    - division

13. What condition is being tested before the final loop?  
    - If edx is not zero

14. What are the value of eax and ecx at the end of the final loop (before the return value is set)?  
    - eax: 273
    - ecx: 15

#### prog4.exe
15. How many function calls are made in main?  
    - 5 function calls

16. What are the arguments to each function call (at an abstract level, not necessarily the exact values)?
    - Two ints

17. What is the functionality of sub_401000?
    - Increments variable using an argument passed to it

#### prog5.exe
18. What are the arguments to sub_401000?  
    - 2 & 32

19. Where is the return value of sub_401000 stored?  
    - eax register

20. What does the main function return?
    - the return value of sub_401000

21. What does sub_401000 do?  
    - Compares the 2 arguments  
    - Returns the larger argument

### Part 2 - Reversing C++

#### cpp-class-demo.exe
22. How many objects are created?
    - 3 objects 

23. What type of allocation is each object? (local, dynamic, global)
    - A -> local
    - B -> dynamic
    - C -> dynamic

24. How big is an instance of each object?
    - A -> 4 bytes
    - B -> 12 bytes
    - C -> 16 bytes

25. What does each object look like in memory?
	- class A   size(4)
        - 0  |  {vfptr}
    - A::$vftable@:
        - 0  |  &A::mult


    - Class B   size(4)
        - 0  |  {vfptr}
    - B::$vftable@:
        - 0  |  &B::virt_sub_1
        - 4  |  &B::virt_sub_2


    - Class C   size(8)
        - Base class B
            - 0  |  {vfptr}
        - 4  |  {vfptr}
    - B::$vftable@:
        - 0  |  &B::virt_sub_1
        - 4  |  &B::virt_sub_2
    - C::$vftable@:
        - 0  |  &C::virt_sub_1

27. What value does class B’s default constructor initialize its local variables to?
    - Initializes both variables to 0

28. Determine which function is being called for each indirect call (e.g. call eax). Comment each call accordingly.
    - ![](./eax_main1.png)
    - ![](./eax_main2.png)

#### cpp-pt2.exe
28. Show the class hierarchy for all classes (which classes inherit from which). 
    - Class A does not inherit
    - Class B does not inherit
    - Class C inherits from Class B
    - Class D inherits from Class A and Class B

29. Which classes have a user defined destructor? Why do they need this?
    - A & B
    - They call calloc and malloc respectfully 

30. Draw the in-memory layout of each class including any vtables.
    - class A   size(4)
        - 0  |  {vfptr}
    - A::$vftable@:
        - 0  |  &A::A_virt_sub
        - 4  |  &A::A_print


    - Class B   size(4)
        - 0  |  {vfptr}
    - B::$vftable@:
        - 0  |  &B::B_virt_sub
        - 4  |  &B::B_print


    - Class C   size(8)
        - Base class B
            - 0  |  {vfptr}
        - 4  |  {vfptr}
    - B::$vftable@:
        - 0  |  &B::B_virt_sub
        - 4  |  &B::B_print
    - C::$vftable@:
        - 0  |  &C::C_print


    - Class D   size(12)
        - Base class A
            - 0  |  {vfptr}
        - Base class B
            - 4  |  {vfptr}
        - 8  |  {vfptr_1}
    - A::$vftable@:
        - 0  |  &A::A_virt_sub
        - 4  |  &A::A_print
    - B::$vftable@:
        - 0  |  &B::virt_sub_1
        - 4  |  &B::virt_sub_2
    - D::$vftable@:
        - 0  |  &D::D_virt_sub
        - 4  |  &D::D_print 

31. Which classes are local? Dynamic? How do you know?
    - A -> local
    - B -> dynamic
    - C -> local
    - D -> dynamic
    - We know whether or not they are local or dynamic by how they are called in the assembly
    
32. Determine the function being called by each indirect call, document it in IDA.
    - Uploaded IDA file with comments


## Conclusion
I learned that reverse engineering C and C++ is a lot more difficult than I originally thought. Assembly language can be and is extremely hard to understand. The project did deepen my knowledge of assembly and stacks.

