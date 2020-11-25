#include "lib.h"
#include "types.h"

#define mytest
//#define originaltest
int data = 0;

int uEntry(void) {

#ifdef mytest
    int id;
    int ret = 0;
    sem_t buf;
    sem_t mutex;
    sem_t empty;//show if the buffer is empty
    sem_init(&buf, 0);
    sem_init(&mutex,1);
    sem_init(&empty,0);
    //sem_init(&cons,0);
    ret = fork();//after there is 2
    if (ret==0)
    {
        fork();//after there is 3
    }
    fork();//after there is 6
    id=getpid();
    //id=1;
    if (id==1||id==2)//1 and 2 is producer
    {
        int count=8;
        while (count--)
        {
            printf("pid %d, producer %d, try lock\n",id,id);
            sem_wait(&mutex);
            printf("pid %d, producer %d, locked\n",id,id);
            sem_post(&buf);
            printf("pid %d, producer %d, produce, product %d\n",id,id,8-count);
            sem_post(&empty);
            sem_post(&mutex);
            printf("pid %d, producer %d, unlock\n",id,id);
            sleep(128);
        }
        exit();
       
    }
    else if(id==3||id==4||id==5||id==6)//3 and 4 and 5 and 6 is consumer
    {
        int count=4;
        while (count--)
        {
            printf("pid %d, consumer %d, try lock\n",id,id-2);
            sem_wait(&empty);//check if the buffer is empty
            sem_wait(&mutex);
            printf("pid %d, consumer %d, locked\n",id,id-2);
            printf("pid %d, consumer %d, try consume, product %d\n",id,id-2,4-count);
            sem_wait(&buf);
            printf("pid %d, consumer %d, consumed, product %d\n",id,id-2,4-count);
            sem_post(&mutex);
            printf("pid %d, consumer %d, unlock\n",id,id-2);
            sleep(256);
        }
        exit();
    }
    
    
    return 0;

#endif

#ifdef originaltest
    int i = 4;
    int ret = 0;
    sem_t sem;
    printf("Father Process: Semaphore Initializing.\n");
    ret = sem_init(&sem, 2);
    if (ret == -1) {
        printf("Father Process: Semaphore Initializing Failed.\n");
        exit();
    }

    ret = fork();
    if (ret == 0) {
        while( i != 0) {
            i --;
            printf("Child Process: Semaphore Waiting.\n");
            sem_wait(&sem);
            printf("Child Process: In Critical Area.\n");
        }
        printf("Child Process: Semaphore Destroying.\n");
        sem_destroy(&sem);
        exit();
    }
    else if (ret != -1) {
        while( i != 0) {
            i --;
            printf("Father Process: Sleeping.\n");
            sleep(128);
            printf("Father Process: Semaphore Posting.\n");
            sem_post(&sem);
        }
        printf("Father Process: Semaphore Destroying.\n");
        sem_destroy(&sem);
        exit();
    }
    
    return 0;
#endif
}
