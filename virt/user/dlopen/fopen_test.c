#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>

 
int main()
{
    // 声明原始的fopen函数指针
    static FILE* (*original_fopen)(const char*, const char*) = NULL;
    static FILE* (*original_add)(int, int) = NULL;
    static void *fHandle = NULL;
    static void *addfHandle = NULL;
    FILE * fp;

    // 获取原始的fopen函数指针
    if ( fHandle == NULL ) {
        fHandle = dlopen("./libc.so", RTLD_LAZY);
	addfHandle = dlopen("./libadd.so", RTLD_LAZY);
    }

    if (original_fopen == NULL) {
        original_fopen = dlsym(fHandle, "fopen");
	original_add = dlsym(addfHandle, "add");
    }

    // 执行原始的fopen函数
    printf("Intercepting fopen call for file\n");

    original_add(1, 2);

 
   fp = original_fopen("file.txt", "w+");
   fp = fopen("file.txt", "w+");

   fprintf(fp, "%s %s %s %d", "We", "are", "in", 2014);
   
   fclose(fp);
   
   return(0);
}
