; Kayla Mahan
; Tiny Encryption Algorithm

global tea

tea:
    push        ebp
	mov         ebp, esp
    sub         esp, 12

    mov         [esp + 0], ebx
    mov         [esp + 4], esi
    mov         [esp + 8], edi

    mov         eax, [ebp + 8]
    mov         edx, [ebp + 12]

    mov         esi, [eax + 0]
    mov         edi, [eax + 4]

    mov         ecx, 0x9e3779b9

    .loop:
    mov         ebx, edi
    shl         ebx, 4
    add         ebx, [edx + 0]
    lea         eax, [edi,ecx]
    xor         ebx, eax
    mov         eax, edi
    shr         eax, 5
    add         eax, [edx + 4]
    xor         ebx, eax
    add         esi, ebx

    mov         ebx, esi
    shl         ebx, 4
    add         ebx, [edx + 8]
    lea         eax, [esi,ecx]
    xor         ebx, eax
    mov         eax, esi
    shr         eax, 5
    add         eax, [edx + 4]
    xor         ebx, eax
    add         edi, ebx

    add         ecx, 0x9e3779b9
    cmp         ecx, 0x6526B0D9
    jne         .loop

    mov         eax, [ebp + 8]
    mov         [eax + 0], esi
    mov         [eax + 4], edi
    
    mov         ebx, [esp + 0]
    mov         esi, [esp + 4]
    mov         edi, [esp + 8]

    add         esp, 12
    pop         ebp
    ret
