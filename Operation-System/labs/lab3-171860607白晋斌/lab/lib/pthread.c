#include "pthread.h"
#include "lib.h"
/*
 * pthread lib here
 * 用户态多线程写在这
 */
 
ThreadTable tcb[MAX_TCB_NUM];
int current;

void pthread_initial(void){
    int i;
    for (i = 0; i < MAX_TCB_NUM; i++) {
        tcb[i].state = STATE_DEAD;
        tcb[i].joinid = -1;
    }
    tcb[0].state = STATE_RUNNING;
    tcb[0].pthid = 0;
    current = 0; // main thread
    return;
}
int creatediaoyong2(uint32_t i){//no running
    asm volatile("movl 4(%%ebp), %0":"=r"(tcb[current].cont.eip));
    //find next
    tcb[current].state=STATE_RUNNABLE;
    //printf("create %d %d",current,i);
  //  printf("\n\n\n\n\n%x \n",tcb[current].cont.eip);
    current=i;
    //
    uint32_t eip=tcb[i].cont.eip;
    uint32_t esp=tcb[i].cont.esp;
    uint32_t ebp=tcb[i].cont.ebp;
    //current=i;
    tcb[i].state=STATE_RUNNING;
    asm volatile("movl %0, %%eax"::"r"(eip));
    asm volatile("movl %0, %%esp"::"m"(esp));
    asm volatile("movl %0, %%ebp"::"m"(ebp));
  
    asm volatile("jmp *%eax");

    return 0;
    
}
void creatediaoyong(uint32_t i){
    asm volatile("movl 4(%%ebp), %0":"=r"(tcb[current].cont.eip));
    //find next
    //tcb[current].state=STATE_RUNNABLE;
    //printf("create %d %d",current,i);
  //  printf("\n\n\n\n\n%x \n",tcb[current].cont.eip);
    current=i;
    //
    uint32_t eip=tcb[i].cont.eip;
    uint32_t esp=tcb[i].cont.esp;
    uint32_t ebp=tcb[i].cont.ebp;
    //current=i;
    tcb[i].state=STATE_RUNNING;
    asm volatile("movl %0, %%eax"::"r"(eip));
    asm volatile("movl %0, %%esp"::"m"(esp));
    asm volatile("movl %0, %%ebp"::"m"(ebp));
  
    asm volatile("jmp *%eax");

    return ;
    
}
int yielddiaoyong(){
    asm volatile("movl 4(%%ebp), %0":"=r"(tcb[current].cont.eip));
    //find next
    int k=(current+1)%MAX_TCB_NUM;
    int count=MAX_TCB_NUM;
    while (count--)
    {
        if (tcb[k].state==STATE_RUNNABLE)
        {
            int f;
            int find=0;
            for (f = 0; f<MAX_TCB_NUM; f++)
            {
                if (tcb[f].joinid==k)
                {
                    find=1;
                }
                
            }
            if (find==1)
            {
                k=(k+1)%MAX_TCB_NUM;
                continue;
            }
            else
            {
                break;
            }
        }
        k=(k+1)%MAX_TCB_NUM;
    }
    /*
    int k;
    for(k=(current+1)%MAX_TCB_NUM;k!=current;k=(k+1)%MAX_TCB_NUM){
        if (tcb[k].state==STATE_RUNNABLE)
        {
            int f;
            int find=0;
            for (f = 0; f<MAX_TCB_NUM; f++)
            {
                if (tcb[f].joinid==k)
                {
                    find=1;
                }
                
            }
            if (find==1)
            {
                continue;
            }
            else
            {
                break;
            }
        }
        
    }
    printf("%d %d",current,k);
    if (k==current)
    {
        current=0;
    }
    else
    {
        current=k;
    }
    */
    //int i;
    //printf("diaoyong %d",current);
    /*
    
    for(; i!=current ; i=(i+1)%MAX_TCB_NUM)
    {
        //if (i==0&&current!=0)
        //{
        //    continue;
        //}
        int find=0;
        int m;
        for (m = 0; m<MAX_TCB_NUM;m++)
        {
           if (tcb[m].joinid==i)
           {
               find=1;
           }
           
        }
        if (find==1)
        {
            continue;
        }
        
        //printf("i=%d,find=%d",i,find);
        
       if(tcb[i].state==STATE_RUNNABLE){
           break;
       }
    }
    */
    //if (i==current)
    //{
        //printf("????????????\n");
        //while(1);
    //    current=0;
    //}
    //else
    //{
        
    //i=current;
    //}
    
     //printf("diaoyong ->%d",current);

    //
    //tcb[i].state=STATE_RUNNING;
    //switch_pth(i);
    int ret=0;
    creatediaoyong(k);
    if (ret<0)
    {
       return -1;
    }
    else
    {
        return 0;
    }
    
    
    /*
    current=i;
    uint32_t eip=tcb[i].cont.eip;
    uint32_t esp=tcb[i].cont.esp;
    uint32_t ebp=tcb[i].cont.ebp;
    tcb[i].state=STATE_RUNNING;
    asm volatile("movl %0, %%esp"::"m"(esp));
    asm volatile("movl %0, %%ebp"::"m"(ebp));
    asm volatile("movl %0, %%eax"::"r"(eip));
    asm volatile("jmp *%eax");
    */
}
int exitdiaoyong(){
    asm volatile("movl 4(%%ebp), %0":"=r"(tcb[current].cont.eip));
    //find next

    int k=(current+1)%MAX_TCB_NUM;
    int count=MAX_TCB_NUM;
    while (count--)
    {
        if (tcb[k].state==STATE_RUNNABLE)
        {
            int f;
            int find=0;
            for (f = 0; f<MAX_TCB_NUM; f++)
            {
                if (tcb[f].joinid==k)
                {
                    find=1;
                }
                
            }
            if (find==1)
            {
                k=(k+1)%MAX_TCB_NUM;
                continue;
            }
            else
            {
                break;
            }
        }
        k=(k+1)%MAX_TCB_NUM;
    }
    /*
    for(k=(current+1)%MAX_TCB_NUM;k!=current;k=(k+1)%MAX_TCB_NUM){
        if (tcb[k].state==STATE_RUNNABLE)
        {
            int f;
            int find=0;
            for (f = 0; f<MAX_TCB_NUM; f++)
            {
                if (tcb[f].joinid==k)
                {
                    find=1;
                }
                
            }
            if (find==1)
            {
                continue;
            }
            else
            {
                break;
            }
            
        }
        
    }
    */
    //printf("exit %d %d",current,k);
    /*
    if (k==current)
    {
        current=0;
    }
    else
    {
        current=k;
    }
    */
    //printf("diaoyong %d",current);
    /*
    int i=(current+1)%MAX_TCB_NUM;
    for(; i!=current ; i=(i+1)%MAX_TCB_NUM)
    {
        //if (i==0&&current!=0)
        //{
        //    continue;
        //}
        int find=0;
        int m;
        for (m = 0; m<MAX_TCB_NUM;m++)
        {
           if (tcb[m].joinid==i)
           {
               find=1;
           }
           
        }
        if (find==1)
        {
            continue;
        }
        
        //printf("i=%d,find=%d",i,find);
        
       if(tcb[i].state==STATE_RUNNABLE){
           break;
       }
    }
    */
    //if (i==current)
    //{
        //printf("????????????\n");
        //while(1);
    //    current=0;
    //}
    //else
    //{
        
        //current=i;
    //}
    
     //printf("diaoyong ->%d",current);

    //
    current=k;
    tcb[current].state=STATE_RUNNING;
    //switch_pth(i);
    /*
    int ret=0;
    creatediaoyong(i);
    if (ret<0)
    {
       return -1;
    }
    else
    {
        return 0;
    }
    */
    
    /*
    current=i;
    */
    uint32_t eip=tcb[current].cont.eip;
    uint32_t esp=tcb[current].cont.esp;
    uint32_t ebp=tcb[current].cont.ebp;
    tcb[current].state=STATE_RUNNING;
    asm volatile("movl %0, %%esp"::"m"(esp));
    asm volatile("movl %0, %%ebp"::"m"(ebp));
    asm volatile("movl %0, %%eax"::"r"(eip));
    asm volatile("jmp *%eax");

    asm volatile("jmp %0"::"m"(tcb[current].cont.eip));
    return 0;
   
}

int pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start_routine)(void *), void *arg){
    //diaoyong();

    
    //tcb[current].state=STATE_RUNNABLE;
    
    int i;
    //printf("create\n");
    for(i = 0; i < MAX_TCB_NUM; i++)
    {
       if(tcb[i].state==STATE_DEAD){
           break;
       }
    }
    if (i==MAX_TCB_NUM) { //didnot find
        return -1;
    }
    else
    {
        *thread=i;
        tcb[i].pthid=i;
        tcb[i].state=STATE_RUNNABLE;
        tcb[i].pthArg=(int32_t)attr;
        tcb[i].cont.eip=(uint32_t)start_routine;
        tcb[i].cont.esp=(uint32_t)&tcb[i].stack[MAX_STACK_SIZE-2];
        tcb[i].cont.ebp=(uint32_t)&tcb[i].stack[MAX_STACK_SIZE-2];
        tcb[i].stack[MAX_STACK_SIZE-1]=(uint32_t)(int*)arg;
        //save 
        //if create neednot to transform then there is no need to do
        
        //asm volatile("movl %%esp,%0":"=m"(tcb[current].cont.esp));
        //asm volatile("movl %%ebp,%0":"=m"(tcb[current].cont.ebp));

        //creatediaoyong(i);
        
        return 0;
    }
    return 0;
}




void pthread_exit(void *retval){
    //printf("exit\n");
    //if there need to wait??
    //printf("exit");
    if (tcb[current].state==STATE_DEAD) {
        return;
    }
    //if (retval!=NULL)
    {
        tcb[current].retPoint=(uint32_t)retval;
    }
    
    tcb[current].joinid=-1;
    tcb[current].state=STATE_DEAD;
    //pthread_yield();
    // *(int*)retval=ret;
    
    // *(uint32_t*)retval=tcb[current].joinid;
    //exitdiaoyong();
    

    int k=(current+1)%MAX_TCB_NUM;
    int count=MAX_TCB_NUM;
    while (count--)
    {
        if (tcb[k].state==STATE_RUNNABLE)
        {
            int f;
            int find=0;
            for (f = 0; f<MAX_TCB_NUM; f++)
            {
                if (tcb[f].joinid==k)
                {
                    find=1;
                }
                
            }
            if (find==1)
            {
                k=(k+1)%MAX_TCB_NUM;
                continue;
            }
            else
            {
                break;
            }
        }
        k=(k+1)%MAX_TCB_NUM;
    }
    /*
    if (k==MAX_TCB_NUM)
    {
        k=0;
    }
    else
    {
        ;
    }
    */
    creatediaoyong(k);
    return;
}

int joindiaoyong(pthread_t thread,void **retval){
    asm volatile("movl 4(%%ebp), %0":"=r"(tcb[current].cont.eip));
    creatediaoyong(thread);
    //printf("helloworld");
    *retval=(void *)(tcb[thread].retPoint);
    return 0;
}

int pthread_join(pthread_t thread, void **retval){
    
    if (tcb[thread].state==STATE_DEAD)
    {
        return -1;
    }
    if (tcb[thread].state!=STATE_RUNNABLE)
    {
        return -1;
    }
    
    tcb[current].state=STATE_RUNNABLE;
    tcb[thread].joinid=current;
    //tcb[thread].state=STATE_RUNNING;
    //save now
    //asm volatile("movl %0,%%eip"::"m"(tcb[i].cont.eip));
    //uint32_t esp=tcb[current].cont.esp;
    //uint32_t ebp=tcb[current].cont.ebp;
    asm volatile("movl %%esp,%0":"=m"(tcb[current].cont.esp));
    asm volatile("movl %%ebp,%0":"=m"(tcb[current].cont.ebp));
    
    joindiaoyong(thread,retval);
    
    //creatediaoyong(thread);
   
    
    
    return 0;   
    //error return -1;
}



int pthread_yield(void){
    tcb[current].state=STATE_RUNNABLE;
    //tcb[thread].joinid=current;
    //tcb[thread].state=STATE_RUNNING;
    //save now
    //asm volatile("movl %0,%%eip"::"m"(tcb[i].cont.eip));
    //uint32_t esp=tcb[current].cont.esp;
    //uint32_t ebp=tcb[current].cont.ebp;
    asm volatile("movl %%esp,%0":"=m"(tcb[current].cont.esp));
    asm volatile("movl %%ebp,%0":"=m"(tcb[current].cont.ebp));
    //printf("yeild %d",current);
    int ret=yielddiaoyong();
    if (ret<0)
    {
        return -1;
    }
    else{
        return 0;
    }
    
    //error return -1;
}
