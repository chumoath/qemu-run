#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>

// 重写的fopen函数
FILE* fopen(const char *pathname, const char *mode) {
    // 声明原始的fopen函数指针
    static FILE* (*original_fopen)(const char*, const char*) = NULL;
    static void *fHandle = NULL;

    // 获取原始的fopen函数指针
    if ( fHandle == NULL )
    	fHandle = dlopen("/usr/lib/x86_64-linux-gnu/libc.so", RTLD_LAZY);

    if (original_fopen == NULL)
    	original_fopen = dlsym(fHandle, "fopen");

    // 执行原始的fopen函数
    printf("Intercepting fopen call for file: %s\n", pathname);

    return original_fopen(pathname, mode);
}
