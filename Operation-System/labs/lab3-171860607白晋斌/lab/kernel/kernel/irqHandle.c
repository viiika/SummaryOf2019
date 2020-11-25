#include "x86.h"
#include "device.h"

extern TSS tss;
extern ProcessTable pcb[MAX_PCB_NUM];
extern int current;

extern int displayRow;
extern int displayCol;

void GProtectFaultHandle(struct StackFrame *sf);

void timerHandle(struct StackFrame *sf);

void syscallHandle(struct StackFrame *sf);

void syscallWrite(struct StackFrame *sf);
void syscallPrint(struct StackFrame *sf);
void syscallFork(struct StackFrame *sf);
void syscallExec(struct StackFrame *sf);
void syscallSleep(struct StackFrame *sf);
void syscallExit(struct StackFrame *sf);

void irqHandle(struct StackFrame *sf) { // pointer sf = esp
	/* Reassign segment register */
	asm volatile("movw %%ax, %%ds"::"a"(KSEL(SEG_KDATA)));
	/*XXX Save esp to stackTop */
	uint32_t tmpStackTop = pcb[current].stackTop;
	pcb[current].prevStackTop = pcb[current].stackTop;
	pcb[current].stackTop = (uint32_t)sf;
	//putChar('\n');putChar('h');
	switch(sf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(sf);
			break;
		case 0x20:
			timerHandle(sf);
			break;
		case 0x80:
			syscallHandle(sf);
			break;
		default:assert(0);
	}
	/*XXX Recover stackTop */
	pcb[current].stackTop = tmpStackTop;
}

void GProtectFaultHandle(struct StackFrame *sf) {
	assert(0);
	return;
}

void timerHandle(struct StackFrame *sf) {
	//putChar('T');
	
	//putChar('I');
	//putChar('M');
	//putChar('E');
	//putChar('\n');
	//int i;
	//uint32_t tmpStackTop;
	//i = (current+1) % MAX_PCB_NUM;
	//putChar('0'+current);
    // make blocked processes sleep time -1, sleep time to 0, re-run
		
		int j;
		for (j = 0; j < MAX_PCB_NUM; j++)
		{
			if (pcb[j].state==STATE_BLOCKED)
			{
				pcb[j].sleepTime-=1;
				if(pcb[j].sleepTime<=0){
					pcb[j].state=STATE_RUNNABLE;
					pcb[j].sleepTime=0;
				}
					
			}
			
			
		}
		
		if( current >=0 && current<MAX_PCB_NUM){
				//putChar('H');
				//putChar(current+'0');
					// time count not max, process continue
				if (pcb[current].state==STATE_RUNNING) {
					pcb[current].timeCount-=1;
					//putChar(pcb[current].timeCount-10+'0');
					if (pcb[current].timeCount<=0){
							pcb[current].state=STATE_RUNNABLE;
							pcb[current].timeCount=MAX_TIME_COUNT;
							//tmpStackTop=pcb[current].stackTop;
							//change another process
								int i=(current+1) % MAX_PCB_NUM;
								//int i=0;
								for (; i !=current;i=(i+1) % MAX_PCB_NUM)
								{
									if(pcb[i].state==STATE_RUNNABLE){
										//current=i;//find the last 
										if(i==0) {
											continue;
										}
										break;
									}

								}
								if (i==current&&pcb[current].state!=STATE_RUNNABLE)
								{
									current=0;
									pcb[current].state=STATE_RUNNING;
									pcb[current].timeCount=MAX_TIME_COUNT;
								
									//while(1){
									//	waitForInterrupt();
									//}		
								}
								else
								{
									current=i;
									pcb[current].state=STATE_RUNNING;
									pcb[current].timeCount=MAX_TIME_COUNT;
									pcb[current].pid=current;
								
								}	
							//owncode
					}
					else
					{
						return;
					}
					

				}
				else
				{
					//putChar('K');
					//change another process
						int i=(current+1) % MAX_PCB_NUM;
						//int i=0;
						for (; i !=current; i=(i+1) % MAX_PCB_NUM)
						{
							if(pcb[i].state==STATE_RUNNABLE){
								//current=i;//find the last 
								if(i==0) {
									continue;
								}
								break;
							}

						}
						if (i==current&&pcb[current].state!=STATE_RUNNABLE)
						{
							current=0;
							pcb[current].state=STATE_RUNNING;
							pcb[current].timeCount=MAX_TIME_COUNT;
							//while(1){
							//	waitForInterrupt();
							//}		
						}
						else
						{
							current=i;
							pcb[current].state=STATE_RUNNING;
							pcb[current].timeCount=MAX_TIME_COUNT;
							pcb[current].pid=current;
							
						}	
				}
		}
		else
		{
			//not exit
			return ;	

		}
		
		
		/*
		for (j = 0; j < MAX_PCB_NUM; j++)
		{
			if (pcb[j].state==STATE_RUNNING)
			{
				pcb[j].timeCount-=1;
				if (pcb[j].timeCount==0)
					;//diaodu
			}
			
		}
		//now is current
		*/
    // else switch to another process
	
		/* echo pid of selected process */
		//??
		putChar(current+'0');
		/*XXX recover stackTop of selected process */
		//??
	//putChar('c');
		//putChar('t');
		//putChar('o');
		//putChar(current+'0');
		//putChar('\n');
		tss.esp0 = (uint32_t)&(pcb[current].stackTop);
		asm volatile("movl %0, %%esp"::"m"(pcb[current].stackTop));
	// setting tss for user process
		// switch kernel stack
		asm volatile("popl %gs");
		asm volatile("popl %fs");
		asm volatile("popl %es");
		asm volatile("popl %ds");
		asm volatile("popal");
		asm volatile("addl $8, %esp");
		asm volatile("iret");
	
}

void syscallHandle(struct StackFrame *sf) {
	//putChar(sf->eax+'0');
	switch(sf->eax) { // syscall number
		case 0:
			syscallWrite(sf);
			break; // for SYS_WRITE
		case 1:
		//putChar('\n');putChar('x');
			//putChar('f');
			syscallFork(sf);
			break; // for SYS_FORK
		case 2:
			syscallExec(sf);
			break; // for SYS_EXEC
		case 3:
			//putChar('s');
			syscallSleep(sf);
			break; // for SYS_SLEEP
		case 4:
			syscallExit(sf);
			break; // for SYS_EXIT
		default:break;
	}
}

void syscallWrite(struct StackFrame *sf) {
	switch(sf->ecx) { // file descriptor
		case 0:
			syscallPrint(sf);
			break; // for STD_OUT
		default:break;
	}
}

void syscallPrint(struct StackFrame *sf) {
	int sel = sf->ds; //TODO segment selector for user data, need further modification
	char *str = (char*)sf->edx;
	int size = sf->ebx;
	int i = 0;
	int pos = 0;
	char character = 0;
	uint16_t data = 0;
	asm volatile("movw %0, %%es"::"m"(sel));
	for (i = 0; i < size; i++) {
		asm volatile("movb %%es:(%1), %0":"=r"(character):"r"(str+i));
		if(character == '\n') {
			displayRow++;
			displayCol=0;
			if(displayRow==25){
				displayRow=24;
				displayCol=0;
				scrollScreen();
			}
		}
		else {
			data = character | (0x0c << 8);
			pos = (80*displayRow+displayCol)*2;
			asm volatile("movw %0, (%1)"::"r"(data),"r"(pos+0xb8000));
			displayCol++;
			if(displayCol==80){
				displayRow++;
				displayCol=0;
				if(displayRow==25){
					displayRow=24;
					displayCol=0;
					scrollScreen();
				}
			}
		}
		//asm volatile("int $0x20"); //XXX Testing irqTimer during syscall
		//asm volatile("int $0x20":::"memory"); //XXX Testing irqTimer during syscall
	}
	
	updateCursor(displayRow, displayCol);
	//TODO take care of return value
	return;
}

void syscallFork(struct StackFrame *sf) {
    // find empty pcb
	//putChar('f'
	//putChar('\n');putChar('f');putChar('o');putChar('r');putChar('k');
	//putChar('0'+current);
	int i, j;
	for (i = 0; i < MAX_PCB_NUM; i++) {
		if (pcb[i].state == STATE_DEAD)
			break;
	}
	if (i != MAX_PCB_NUM) {
		/*XXX copy userspace
		  XXX enable interrupt
		 */
		enableInterrupt();
		for (j = 0; j < 0x100000; j++) {
			*(uint8_t *)(j + (i+1)*0x100000) = *(uint8_t *)(j + (current+1)*0x100000);
			//asm volatile("int $0x20"); //XXX Testing irqTimer during syscall
		}
		/*XXX disable interrupt
		 */
		disableInterrupt();
		/*XXX set pcb
		  XXX pcb[i]=pcb[current] doesn't work
		*/
		int s=0;
		for(;s<MAX_STACK_SIZE;s++){
			pcb[i].stack[s]=pcb[current].stack[s];
		}
		pcb[i].stackTop=(uint32_t)&pcb[i].regs;
		//pcb[i].prevStackTop=pcb[i].stackTop;//??
		pcb[i].pid=i;
		pcb[i].state=STATE_RUNNABLE;
		pcb[i].timeCount=MAX_TIME_COUNT;
		pcb[i].sleepTime=0;


		
		/*XXX set regs */
		//mycode
		pcb[i].regs.eip=sf->eip;
		//pcb[i].regs.eip=pcb[current].regs.eip;
		pcb[i].regs.eax=pcb[current].regs.eax;
		pcb[i].regs.ebx=pcb[current].regs.ebx;
		pcb[i].regs.ecx=pcb[current].regs.ecx;
		pcb[i].regs.edx=pcb[current].regs.edx;
		pcb[i].regs.edi=pcb[current].regs.edi;
		pcb[i].regs.esi=pcb[current].regs.esi;
		pcb[i].regs.ebp=sf->ebp;
		pcb[i].regs.xxx=pcb[current].regs.xxx;


	//not set yet
	//uint32_t irq, error;
 	//eflags

		//pcb[i].regs.error=pcb[current].regs.error;
		//pcb[i].regs.irq=pcb[current].regs.irq;
		pcb[i].regs.ss = USEL(2*(i+1));
		pcb[i].regs.esp = sf->esp;
		//asm volatile("pushfl");
		//asm volatile("popl %0":"=r"(pcb[i].regs.eflags));
		pcb[i].regs.eflags = sf->eflags;
		pcb[i].regs.cs = USEL(2*(i+1)-1);
		pcb[i].regs.ds = USEL(2*(i+1));
		pcb[i].regs.es = USEL(2*(i+1));
		pcb[i].regs.fs = USEL(2*(i+1));
		pcb[i].regs.gs = USEL(2*(i+1));
		//putChar(current+'0');
		//putChar(i+'0');
		//sf->eax=current;
		//mycode
		/*XXX set return value */
		pcb[i].regs.eax = 0;
		pcb[current].regs.eax = i;
	}
	else {
		pcb[current].regs.eax = -1;
	}
	return;
}

void syscallExec(struct StackFrame *sf) {
	return;
}

void syscallSleep(struct StackFrame *sf) {
	//putChar('s');
	//putChar(current+'0');
	//putChar('\n');putChar('s');putChar('l');putChar('e');putChar('e');
	//putChar('0'+current);
	pcb[current].state= STATE_BLOCKED;
	pcb[current].sleepTime=sf->ecx;
	//timerHandle(sf);
	int i=(current+1) % MAX_PCB_NUM;
	//int i=0;
	for (; i !=current; i=(i+1) % MAX_PCB_NUM)
	{
		if(pcb[i].state==STATE_RUNNABLE){
			//current=i;//find the last 
			if(i==0) {
				continue;
			}
			break;
		}

	}
	if (i==current&&pcb[current].state!=STATE_RUNNABLE)
	{
		current=0;
		pcb[current].state=STATE_RUNNING;
		pcb[current].timeCount=MAX_TIME_COUNT;
		tss.esp0 = (uint32_t)&(pcb[current].stackTop);
		asm volatile("movl %0, %%esp"::"m"(pcb[current].stackTop));
		asm volatile("popl %gs");
		asm volatile("popl %fs");
		asm volatile("popl %es");
		asm volatile("popl %ds");
		asm volatile("popal");
		asm volatile("addl $4, %esp");
		asm volatile("addl $4, %esp");
		asm volatile("iret");
		//while(1){
		//	waitForInterrupt();
		//}		
	}
	else
	{
		current=i;
		pcb[current].state=STATE_RUNNING;
		pcb[current].timeCount=MAX_TIME_COUNT;
		pcb[current].pid=current;
		tss.esp0 = (uint32_t)&(pcb[current].stackTop);
		asm volatile("movl %0, %%esp"::"m"(pcb[current].stackTop));
		asm volatile("popl %gs");
		asm volatile("popl %fs");
		asm volatile("popl %es");
		asm volatile("popl %ds");
		asm volatile("popal");
		asm volatile("addl $4, %esp");
		asm volatile("addl $4, %esp");
		asm volatile("iret");
	}	

	return;
}

void syscallExit(struct StackFrame *sf) {
	//putChar('e');
	//putChar(current+'0');
	//putChar('\n');putChar('e');putChar('x');putChar('i');putChar('t');
	//putChar('0'+current);
	pcb[current].state = STATE_DEAD;
	//timerHandle(sf);
	//
	int i=(current+1) % MAX_PCB_NUM;
	//int i=0;
	for (; i !=current; i=(i+1) % MAX_PCB_NUM)
	{
		if(pcb[i].state==STATE_RUNNABLE){
			//current=i;//find the last 
			if(i==0) {
				continue;
			}
			break;
		}

	}
	if (i==current&&pcb[current].state!=STATE_RUNNABLE)
	{
		current=0;
		pcb[current].state=STATE_RUNNING;
		pcb[current].timeCount=MAX_TIME_COUNT;
		tss.esp0 = (uint32_t)&(pcb[current].stackTop);
		asm volatile("movl %0, %%esp"::"m"(pcb[current].stackTop));
		asm volatile("popl %gs");
		asm volatile("popl %fs");
		asm volatile("popl %es");
		asm volatile("popl %ds");
		asm volatile("popal");
		asm volatile("addl $4, %esp");
		asm volatile("addl $4, %esp");
		asm volatile("iret");
		//while(1){
		//	waitForInterrupt();
		//}		
	}
	else
	{
		current=i;
		pcb[current].state=STATE_RUNNING;
		pcb[current].timeCount=MAX_TIME_COUNT;
		pcb[current].pid=current;
		tss.esp0 = (uint32_t)&(pcb[current].stackTop);
		asm volatile("movl %0, %%esp"::"m"(pcb[current].stackTop));
		asm volatile("popl %gs");
		asm volatile("popl %fs");
		asm volatile("popl %es");
		asm volatile("popl %ds");
		asm volatile("popal");
		asm volatile("addl $4, %esp");
		asm volatile("addl $4, %esp");
		asm volatile("iret");
	}	
	//owncode
	//TODO
	
	return;
}


