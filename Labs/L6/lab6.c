#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/md5.h>


int main()
{   
    int count = 0;
    char decode1[17];
    decode1[16] = '\0';
    char decode2[17];
    decode2[16] = '\0';
    char decode3[17];
    decode3[16] = '\0';
    char decode4[17];
    decode4[16] = '\0';
    
    unsigned char result1[MD5_DIGEST_LENGTH];
    unsigned char result2[MD5_DIGEST_LENGTH];
    unsigned char result3[MD5_DIGEST_LENGTH];
    unsigned char result4[MD5_DIGEST_LENGTH];
    
    char key1[16] = {0x57,0x07,0x59,0xa8,0xc2,0x09,0x77,0xa2,0xdb,0x02,0x0f,0x9a,0x9b,0x17,0x1b,0x4c};
    char key2[16] = {0x05,0x5c,0x94,0x91,0x95,0x84,0x75,0x7f,0x3f,0x53,0xca,0x38,0xda,0xa4,0x3d,0x27};
    char key3[16] = {0xa9,0x91,0xb1,0xd7,0x96,0x20,0x44,0xc3,0x0e,0x62,0x1f,0xfc,0x72,0x3c,0xa4,0xa9};
    char key4[16] = {0x2d,0x43,0xb4,0x98,0x65,0x33,0x6f,0x0a,0x6e,0x88,0x62,0xb5,0xb0,0x6e,0x25,0x8f};
    
    char message1[16] = {"57muR6k8dTFKooTP"};
    char message2[16] = {"khMLc9Vligr1355O"};
    char message3[16] = {"KGtOgn6O5LbBIakP"};
    char message4[16] = {"HwbIlocCh6A9lZbn"};
    
    MD5_CTX c1;
    MD5(message1, 16, result1);
    MD5_Init(&c1);
    MD5_Update(&c1, message1, 16);
    MD5_Final(result1, &c1);

    while(count < 0x10){
        decode1[count] = (char)(result1[count] ^ key1[count]);
        count++;
    }
    
    MD5_CTX c2;
    MD5(message2, 16, result2);
    MD5_Init(&c2);
    MD5_Update(&c2, message2, 16);
    MD5_Final(result2, &c2);
    count = 0;
    while(count < 0x10){
        decode2[count] = (char)(result2[count] ^ key2[count]);
        count++;
    }
    
    MD5_CTX c3;
    MD5(message3, 16, result3);
    MD5_Init(&c3);
    MD5_Update(&c3, message3, 16);
    MD5_Final(result3, &c3);
    count = 0;
    while(count < 0x10){
        decode3[count] = (char)(result3[count] ^ key3[count]);
        count++;
    }
    
    MD5_CTX c4;
    MD5(message4, 16, result4);
    MD5_Init(&c4);
    MD5_Update(&c4, message4, 16);
    MD5_Final(result4, &c4);
    count = 0;
    while(count < 0x10){
        decode4[count] = (char)(result4[count] ^ key4[count]);
        count++;
    }
   
    
    putchar(10);
    printf("%s%s\n", "Decrypted message 1: ", decode1);
    printf("%s%s\n", "Decrypted message 2: ", decode2);
    printf("%s%s\n", "Decrypted message 3: ", decode3);
    printf("%s%s\n", "Decrypted message 4: ", decode4);
    return 0;
}
