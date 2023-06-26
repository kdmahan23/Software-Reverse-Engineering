## Karson
# SRE Project 1 - "It's Machine Code"
# SRE S20
------------------------------------------------

### BinSearch
First part of the code sets up global variables that correspond to functions within the code  

section .data  
- sets up table and computes their length for the testing the search function in main  
- also sets up a minus sign that can be called if the output ends up being negative  

section .text
- this is where the code actually goes  

atoi:
- gets a numerical input and returns resulting number

printInt:
- prints a 2's complement number

printMinus:
- prints a minus sign

printDec:
- takes double word and print it in decimal

printString:
- prints string

println:
- moves cursor to the next line
- acts like a newline character


binSearch
- The first 2 lines set up the stack frame
    - push            ebp
    - mov             ebp, esp 

- The next 2 lines define the left and right of the array to be searched
    - %define left    dword[ebp+12] 	
    - %define right   dword[ebp+8]  

- The next 5 lines moves the value of left into eax and then compares it to the value of right
- If left is less than right, we jump to computeMid
- If they are equal, we check to see if we have found the solution
- If left is greater than right, we jump to not found
	- mov	            eax, left	
	- cmp             eax, right
	- jl              .computeMid 		
	- je	            .foundSol		
	- jg	            .notFound	

- Not found returns -1 if the key is not found in the array. This is later printed to the screen
    - .notFound:	
	    - mov             eax, -1 		    
	    - pop             ebp
	    - ret             16

- Compute mid calculates the middle of the array that's being searched
    - .computeMid:
    - The first 5 instructions push the values of the registers on the stack to be saved
	    - push            ebx
	    - push            ecx
	    - push            edx
	    - push            esi
	    - push            edi
    
    - To compute the middle we need to add the left and right values and then divide by 2, and that is exactly what the next 7 instructions do
	    - mov             eax, left
        - add             eax, right 		
        - mov             ecx, 2
        - xor             edx, edx  		
        - div             ecx     		
        - mov             ecx, 0  		
        - mov             edx, 0  		

    - The next 4 instructions save values into registers to be uses later
    - ecx holds the key
    - ebx holds the value at the middle point of the array
    - edi holds the index we computed
	    - mov             esi, dword[ebp+20] 	
	    - mov             ecx, dword[ebp+16] 	
	    - mov             ebx, dword[esi+eax*4] 	
	    - mov             edi, eax	      	

    - The next 3 lines compare the key to the value at the index
    - From there, we either decrement the right index or increment the left index
        - cmp             ecx, ebx 		
        - jl              .recurseDecRight
        - jg              .recurseIncLeft

    - These next lines restores the stack and returns
        - pop             edi
        - pop             esi
        - pop             edx
        - pop             ecx
        - pop             ebx
        - pop             ebp     	
        - ret             16

- This function calls binSearch after setting the right index to the middle index minus 1
    - .recurseDecRight:
    - The first 6 instructions push the table, key, and left index to the stack
        - mov             eax, dword[ebp+20]
        - push            eax
        - mov             eax, dword[ebp+16]
        - push            eax
        - mov             eax, dword[ebp+12] 	
        - push            eax
    
    - The 3 following instructions push the middle index minus 1 to the stack
        - mov             eax, edi 		
        - dec             eax			
        - push            eax

    - The next 3 instructions clean up the registers and calls binSearch. This is where the recursion comes in 
        - mov             ecx, 0
        - mov             edx, 0
        - call            binSearch	

    - These next lines restores the stack and returns
        - pop             edi
        - pop             esi
        - pop             edx
        - pop             ecx
        - pop             ebx
        - pop             ebp 			
        - ret             16

- This function does the same thing as the function above, expect instead of setting the right index to middle minus one, we set the left index to the middle plus one
    - .recurseIncLeft:
    - First 9 lines push the table, key, the middle index plus one, and right index to the stack
        - mov             eax, dword[ebp+20]
        - push            eax
        - mov             eax, dword[ebp+16] 
        - push            eax
        - mov             eax, edi
        - inc             eax     	
        - push            eax
        - mov             eax, dword[ebp+8]
        - push            eax

        - mov             ecx, 0
        - mov             edx, 0
        - call            binSearch

        - pop             edi
        - pop             esi
        - pop             edx
        - pop             ecx
        - pop             ebx
        - pop             ebp     	
        - ret             16

- Found solution compares values to see if the key has been found
- If left == right && key == table[left], the key has been found
    - .foundSol:
        - The first 3 lines move the values to be compared into registers
            - mov	            esi, dword[ebp+20] 	
            - mov	            ebx, dword[ebp+16] 	
            - mov	            ecx, dword[esi+eax*4]

        - The next 2 lines compares table[left] with the key, if they are not equal, we did not find the solution and we jump to not found 	
            - cmp	            ecx, ebx		
            - jne	            .notFound

        - They last lines return the solution to the search, if there was a solution		
            - mov	            eax, left
            - pop             ebp			
            - ret             16


### TEA
- This one was a bit more difficult to write
- There is no data section because I could not figure out how to set up data to test with since this was a cipher and not a simple search

- The first 3 lines set up the stack frame
    - push        ebp
	- mov         ebp, esp
    - sub         esp, 12

- The next lines of code preserve the registers
    - mov         [esp + 0], ebx
    - mov         [esp + 4], esi
    - mov         [esp + 8], edi

- These 2 lines load in the base of the message array and key array
    - mov         eax, [ebp + 8]
    - mov         edx, [ebp + 12]

- These lines store the message into 2 registers
    - mov         esi, [eax + 0]
    - mov         edi, [eax + 4]

- This instruction is used to initialize a constant called delta
    - mov         ecx, 0x9e3779b9

- The loop is where the actual encryption happens
    .loop:

- The following lines take one of the registers the message is saved in and performs the encrpytion
    - mov         ebx, edi
    - shl         ebx, 4
    - add         ebx, [edx + 0]
    - lea         eax, [edi,ecx]
    - xor         ebx, eax
    - mov         eax, edi
    - shr         eax, 5
    - add         eax, [edx + 4]
    - xor         ebx, eax
    - add         esi, ebx

- These lines do the same thing but on the other register
    - mov         ebx, esi
    - shl         ebx, 4
    - add         ebx, [edx + 8]
    - lea         eax, [esi,ecx]
    - xor         ebx, eax
    - mov         eax, esi
    - shr         eax, 5
    - add         eax, [edx + 4]
    - xor         ebx, eax
    - add         edi, ebx

- These lines advance the constant and compare it to another constant to see if the encryption is complete
    - add         ecx, 0x9e3779b9
    - cmp         ecx, 0x6526B0D9
    - jne         .loop

- These lines store the encrypted messafe
    - mov         eax, [ebp + 8]
    - mov         [eax + 0], esi
    - mov         [eax + 4], edi
- Restore the registers
    - mov         ebx, [esp + 0]
    - mov         esi, [esp + 4]
    - mov         edi, [esp + 8]

- Deallocate stack and return
    - add         esp, 12
    - pop         ebp
    - ret