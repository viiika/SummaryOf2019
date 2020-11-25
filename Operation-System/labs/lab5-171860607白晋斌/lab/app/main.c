#include "types.h"
#include "utils.h"
#include "lib.h"


union DirEntry {
	uint8_t byte[128];
	struct {
		int32_t inode;
		char name[64];
	};
};

typedef union DirEntry DirEntry;

int ls(char *destFilePath) {
	printf("ls %s\n",destFilePath);
	int fd = open(destFilePath, O_READ |O_DIRECTORY);
	//printf("%d ",fd);
	DirEntry direntry;
	int len = read(fd, (uint8_t*)&direntry, 128);
	//int a=0;
	while(len > 0){
		if (len<128)
		{
			//a=1;
			break;
		}
		
		if(direntry.inode != 0) {
			printf("%s ", direntry.name);
		}
		len = read(fd, (uint8_t*)&direntry, 128);
		//break;
		
	}
	
	printf("\n");
	
	
	
	close(fd);
	return 0;


	//myadd
	// STEP 8
    // TODO: ls
    /** output format
    ls /
    boot dev usr
    */

	return 0;
}

int cat(char *destFilePath) {


	printf("cat %s",destFilePath);
	int fd = open(destFilePath,  O_READ );
	char test2[100];
	read(fd,(uint8_t*)test2,100);
	//*(test+len)=0;
	printf("%s\n",test2);
	//myadd
	// STEP 9
    // TODO: ls
    /** output format
    cat /usr/test
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    */
    close(fd);
	return 0;
}

int uEntry(void) {
    // STEP 2-9
    // TODO: try different test case when you finish a function
    
    /* filesystem test */
	int fd = 0;
	int i = 0;
	char tmp = 0;
	ls("/");
	ls("/boot/");
	ls("/dev/");
	ls("/usr/");
	printf("create /usr/test and write alphabets to it\n");
	fd = open("/usr/test", O_WRITE | O_READ | O_CREATE);
	//write(fd, (uint8_t*)"Hello, World!\n", 14);
	//write(fd, (uint8_t*)"This is a demo!\n", 16);
	//for (i = 0; i < 2049; i ++) {
	//for (i = 0; i < 2048; i ++) {
	//for (i = 0; i < 1025; i ++) {
	//for (i = 0; i < 512; i ++) {
		 
	for (i = 0; i < 26; i ++) {
		tmp = (char)(i % 26 + 'A');
		write(fd, (uint8_t*)&tmp, 1);
	}
	
	//add
	/* 
	char test[200];
	read(fd,(uint8_t*)test,200);
	// *(test+len)=0;
	//printf("test:%c %c\n",test[1024],test[1023]);
	printf("test:%s",test);
	*/
	//add
	close(fd);
	ls("/usr/");
	cat("/usr/test");
	printf("\n");
	printf("rm /usr/test\n");
	remove("/usr/test");
	
	ls("/usr/");
	
	printf("rmdir /usr/\n");
	
	
	
	remove("/usr/");
	//remove("/dev");
	ls("/");
	//ls("/dev");
	printf("create /usr/\n");
	fd = open("/usr/", O_CREATE | O_DIRECTORY);
	close(fd);
	ls("/");
	//fd = open("/usr/test", O_WRITE | O_READ);
	//close(fd);
	//ls("/usr");
	//fd = open("/usr/test/", O_CREATE);
	//close(fd);
	//ls("/usr/");
	//fd = open("/usr/test", O_CREATE);
	//close(fd);
	//ls("/usr/");
	
	exit();
    /**
    Output format can be found in 
    http://114.212.80.195:8170/2019oslab/lab5/
    */
	return 0;
}
