#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include <string.h>
 
int main(int argc, char **argv) {
    void *handle;
    void (*go)(char *);
 
    // get a handle to the library that contains 'puts' function
    handle = dlopen ("/lib/x86_64-linux-gnu/libc.so.6", RTLD_LAZY);
 
    // each character in 'otsr' plus 1 in ascii is 'puts'
    char *encoded = "otsr";
    int encoded_length = strlen(encoded);
    char *decoded = (char*)malloc((encoded_length+1) * sizeof(char));
    for (int i = 0; i < encoded_length; i++){
        decoded[i] = encoded[i]+1;
    }
    // *decoded += '\0';
 
    decoded[encoded_length] = '\0';
    // reference to the dynamically-resolved function 'puts'
    go = dlsym(handle, decoded);
 
    go("hi"); // == puts("hi");
 
    // cleanup
    free(decoded);
    dlclose(handle);
}
