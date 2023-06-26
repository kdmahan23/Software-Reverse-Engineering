; Kayla Mahan
; Binary Search
%assign SYS_EXIT    1
%assign SYS_WRITE   4
%assign STDOUT      1

global	_atoi	
global  _printDec	
global  _printString
global  _printCString	
global  _println
global  _printInt
global  _printMinus
global  _getInput
global  binSearch
global  main

    section .data
table1  dd      1,3,5,10,11,20,21,22,23,34
        dd      40,41,42,43,45,48,50,51,100
        dd      102,103,200,255,256,1000,1001
        dd      1020,2000,3000,4000,4001,5000
table1len equ   ($-table1)/4

table2  dd      10,20,30,40,41,50,60,80,90,100
table2len equ   ($-table2)/4

minus   db      '-'

    section .text
_atoi:	
    section .bss
intg2           resd    1
isneg2          resb    1
        
    section .text
    pushad                 
    mov     esi, eax       
    mov     ecx, 0  

.count:		
    cmp	byte[esi], 0
    je	.parse
    inc	esi
    inc	ecx
    jmp	.count

.parse:
    mov     esi, eax 
    mov     ecx, edi       
    mov     dword[intg2], 0
    mov     byte[isneg2], 0

.negativ:      
    cmp     byte[esi], '-'
    jne     .loop
    inc     byte[isneg2]
        
.loop:          
    mov     ebx, 0
    mov     bl, byte[esi]

    cmp     bl, 0	
    je      .done

    cmp     bl, '0'
    jb      .done
    cmp     bl, '9'
    ja      .done

    mov     edx, 10
    mov     eax, dword[intg2]
    mul     edx
    
    sub     bl, '0'
    add     eax, ebx
    mov     dword[intg2], eax
    inc     esi
    loop    .loop
.done:
    cmp     byte[isneg2], 0
    je      .return
    neg     eax
    mov     dword [intg2], eax
.return:
    popad
    mov     eax, [intg2]
    ret


_printInt:      
    push    eax			
    push    ecx
    push    edx
                
    test    eax, 0x80000000
    jz      positive
	neg	eax
    push    eax

    mov     ecx, minus
    mov     edx, 1
    call    _printString
    pop     eax
                
positive:       
    call    _printDec

    pop     edx
    pop     ecx
    pop     eax
    ret

_printMinus:    
    push    ecx
    push    edx
    mov     ecx, minus
    mov     edx, 1
    call    _printString
    pop     edx
    pop     ecx
    ret

_printDec:
    section         .bss
.decstr         resb            10
.ct1            resd            1  

    section .text
    pushad                          

    mov             dword[.ct1],0   
    mov             edi,.decstr     
    add             edi,9           
    xor             edx,edx         
.whileNotZero:
    mov             ebx,10          
    div             ebx             
    add             edx,'0'         
    mov             byte[edi],dl   
    dec             edi             
    inc             dword[.ct1]     
    xor             edx,edx         
    cmp             eax,0           
    jne             .whileNotZero   

    inc             edi             
    mov             ecx, edi       
    mov             edx, [.ct1]     
    mov             eax, SYS_WRITE  
    mov             ebx, STDOUT
    int             0x80

    popad                           
    ret

_printString:
    push            eax
    push            ebx
    mov             eax,SYS_WRITE
    mov             ebx,STDOUT
    int             0x80
    pop             ebx
    pop             eax
    ret

_println:  
    section .data
.nl             db              10
        
    section .text
    push            ecx
    push            edx

    mov             ecx, .nl
    mov             edx, 1
    call            _printString

    pop             edx
    pop             ecx
    ret

binSearch:
    push            ebp
	mov             ebp, esp 		
	%define left    dword[ebp+12] 	
	%define right   dword[ebp+8]  

	mov	            eax, left	
	cmp             eax, right

	jl              .computeMid 		
	je	            .foundSol		
	jg	            .notFound	

.notFound:	
	mov             eax, -1 		    
	pop             ebp
	ret             16

.computeMid:
	push            ebx
	push            ecx
	push            edx
	push            esi
	push            edi

	mov             eax, left
	add             eax, right 		
	mov             ecx, 2
    xor             edx, edx  		
    div             ecx     		
	mov             ecx, 0  		
	mov             edx, 0  		

	mov             esi, dword[ebp+20] 	
	mov             ecx, dword[ebp+16] 	
	mov             ebx, dword[esi+eax*4] 	
	mov             edi, eax	      	

	cmp             ecx, ebx 		
	jl              .recurseDecRight
    jg              .recurseIncLeft

    pop             edi
	pop             esi
	pop             edx
	pop             ecx
	pop             ebx
	pop             ebp     	
	ret             16

.recurseDecRight:

	mov             eax, dword[ebp+20]
	push            eax
	mov             eax, dword[ebp+16]
	push            eax
	mov             eax, dword[ebp+12] 	
	push            eax
	mov             eax, edi 		
	dec             eax			
	push            eax

	mov             ecx, 0
	mov             edx, 0
	call            binSearch		

	pop             edi
	pop             esi
	pop             edx
	pop             ecx
	pop             ebx
	pop             ebp 			
	ret             16

.recurseIncLeft:
	mov             eax, dword[ebp+20]
	push            eax
	mov             eax, dword[ebp+16] 
	push            eax
	mov             eax, edi
	inc             eax     	
	push            eax
	mov             eax, dword[ebp+8]
	push            eax

	mov             ecx, 0
	mov             edx, 0
	call            binSearch

    pop             edi
	pop             esi
	pop             edx
	pop             ecx
	pop             ebx
	pop             ebp     	
	ret             16

    .foundSol:
	mov	            esi, dword[ebp+20] 	
	mov	            ebx, dword[ebp+16] 	
	mov	            ecx, dword[esi+eax*4] 	
	cmp	            ecx, ebx		
	jne	            .notFound		
	mov	            eax, left
	pop             ebp			
	ret             16

main:
    mov             eax, table1
    push            eax
    mov             eax, 43          
    push            eax             
    mov             eax, 0
    push            eax
    mov             eax, table1len-1
    push            eax
    call            binSearch
	call            _printInt
    call            _println 

    mov             ebx, 0
    mov             eax, 1
    mov             eax, table2
    push            eax
    mov             eax, 30          
    push            eax             
    mov             eax, 0
    push            eax
    mov             eax, table2len-1
    push            eax
    call            binSearch
	call            _printInt
    call            _println 

    mov             ebx, 0
    mov             eax, 1
    int             0x80