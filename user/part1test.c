#include "kernel/param.h"
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"
#include "kernel/fcntl.h"
#include "kernel/syscall.h"
#include "kernel/memlayout.h"
#include "kernel/riscv.h"
#include <stddef.h>


/* Sanity test for task 1*/
void
t1Test(void){
	printf("running sanity test for task1\n");

	int fd;
	char data[1024];
	int numBytes;	//just to check the length
	// fills the data array with 7s
	memset(data, 7, 1024);

	if((fd = open("t1Sanity.txt", O_CREATE |O_TRUNC | O_RDWR )) != -1){
        numBytes = fd; //set initial position
        
        for(int i = 0; i < 1024 * 10; i++){
            numBytes += write(fd, data, sizeof(data));
            if (i == 12)
                printf("Finished writing 12KB (direct)\n");
            if (i == 268)
                printf("Finished writing 268KB (single direct)\n");
        }
        
        // checking the we indeed wrote 1MB data
        // NOTE: using ls after the test we can see the file
        //		 and its size in the file system of QEMU
        if(numBytes - fd == 1024*1024*10)
            printf("Finished writing 10MB\ntest finished successfuly\n");
        else
            printf("test FAILED!!\n");
    }
      else
            printf("test FAILED open file!!\n");
}

int main(int argc, char* argv[]){
	printf("**Sanity Tests**\n");
	t1Test();
	exit(0);
}