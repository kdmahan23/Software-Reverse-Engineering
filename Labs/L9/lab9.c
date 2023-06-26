#include <windows.h>
#include <WinUser.h>
#include <string.h>

int main(){

    char password[100] = "gNieTmpken2865";
    
    if(IsDebuggerPresent()){
        return 0;
    }
    else{
        printf("No debugger found\n");
    }

    char str[100];
    printf("Please enter in password to receive flag.\n");
    BlockInput(TRUE);
    printf("Input is blocked! Good luck!");
    gets[str];

    if(strcmp(str, password)){
        printf("flag{YOU DID IT!!!}");
    }
    else{
        printf("Password is incorrect")
    }

    return 0;
}