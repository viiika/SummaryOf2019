#include "x86.h"
#include "device.h"
#include "fs.h"

#define SYS_OPEN 0
#define SYS_WRITE 1
#define SYS_READ 2
#define SYS_LSEEK 3
#define SYS_CLOSE 4
#define SYS_REMOVE 5
#define SYS_FORK 6
#define SYS_EXEC 7
#define SYS_SLEEP 8
#define SYS_EXIT 9
#define SYS_SEM 10

#define STD_OUT 0
#define STD_IN 1

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

#define SEM_INIT 0
#define SEM_WAIT 1
#define SEM_POST 2
#define SEM_DESTROY 3

extern TSS tss;

extern ProcessTable pcb[MAX_PCB_NUM];
extern int current;

extern Semaphore sem[MAX_SEM_NUM];
extern Device dev[MAX_DEV_NUM];
extern File file[MAX_FILE_NUM];

extern SuperBlock sBlock;
extern GroupDesc gDesc[MAX_GROUP_NUM];

extern int displayRow;
extern int displayCol;

extern uint32_t keyBuffer[MAX_KEYBUFFER_SIZE];
extern int bufferHead;
extern int bufferTail;

void GProtectFaultHandle(struct StackFrame *sf);
void timerHandle(struct StackFrame *sf);
void keyboardHandle(struct StackFrame *sf);
void syscallHandle(struct StackFrame *sf);

void syscallOpen(struct StackFrame *sf);
void syscallWrite(struct StackFrame *sf);
void syscallRead(struct StackFrame *sf);
void syscallLseek(struct StackFrame *sf);
void syscallClose(struct StackFrame *sf);
void syscallRemove(struct StackFrame *sf);
void syscallFork(struct StackFrame *sf);
void syscallExec(struct StackFrame *sf);
void syscallSleep(struct StackFrame *sf);
void syscallExit(struct StackFrame *sf);
void syscallSem(struct StackFrame *sf);

void syscallWriteStdOut(struct StackFrame *sf);
void syscallWriteFile(struct StackFrame *sf);

void syscallReadStdIn(struct StackFrame *sf);
void syscallReadFile(struct StackFrame *sf);

void syscallSemInit(struct StackFrame *sf);
void syscallSemWait(struct StackFrame *sf);
void syscallSemPost(struct StackFrame *sf);
void syscallSemDestroy(struct StackFrame *sf);

void irqHandle(struct StackFrame *sf) { // pointer sf = esp
	/* Reassign segment register */
	asm volatile("movw %%ax, %%ds"::"a"(KSEL(SEG_KDATA)));
	/*XXX Save esp to stackTop */
	uint32_t tmpStackTop = pcb[current].stackTop;
	pcb[current].prevStackTop = pcb[current].stackTop;
	pcb[current].stackTop = (uint32_t)sf;

	switch(sf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(sf);
			break;
		case 0x20:
			timerHandle(sf);
			break;
		case 0x21:
			keyboardHandle(sf);
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
	int i;
	uint32_t tmpStackTop;
	i = (current+1) % MAX_PCB_NUM;
	while (i != current) {
		if (pcb[i].state == STATE_BLOCKED && pcb[i].sleepTime != -1) {
			pcb[i].sleepTime --;
			if (pcb[i].sleepTime == 0)
				pcb[i].state = STATE_RUNNABLE;
		}
		i = (i+1) % MAX_PCB_NUM;
	}

	if (pcb[current].state == STATE_RUNNING &&
		pcb[current].timeCount != MAX_TIME_COUNT) {
		pcb[current].timeCount++;
		return;
	}
	else {
		if (pcb[current].state == STATE_RUNNING) {
			pcb[current].state = STATE_RUNNABLE;
			pcb[current].timeCount = 0;
		}
		
		i = (current+1) % MAX_PCB_NUM;
		while (i != current) {
			if (i !=0 && pcb[i].state == STATE_RUNNABLE)
				break;
			i = (i+1) % MAX_PCB_NUM;
		}
		if (pcb[i].state != STATE_RUNNABLE)
			i = 0;
		current = i;
		/*XXX echo pid of selected process */
		//putChar('0'+current);
		pcb[current].state = STATE_RUNNING;
		pcb[current].timeCount = 1;
		/*XXX recover stackTop of selected process */
		tmpStackTop = pcb[current].stackTop;
		pcb[current].stackTop = pcb[current].prevStackTop;
		tss.esp0 = (uint32_t)&(pcb[current].stackTop); // setting tss for user process
		asm volatile("movl %0, %%esp"::"m"(tmpStackTop)); // switch kernel stack
		asm volatile("popl %gs");
		asm volatile("popl %fs");
		asm volatile("popl %es");
		asm volatile("popl %ds");
		asm volatile("popal");
		asm volatile("addl $8, %esp");
		asm volatile("iret");
	}
}

void keyboardHandle(struct StackFrame *sf) {
	ProcessTable *pt = NULL;
	uint32_t keyCode = getKeyCode();
	if (keyCode == 0) // illegal keyCode
		return;
	//putChar(getChar(keyCode));
	keyBuffer[bufferTail] = keyCode;
	bufferTail=(bufferTail+1)%MAX_KEYBUFFER_SIZE;
	if (dev[STD_IN].value < 0) { // with process blocked
		dev[STD_IN].value ++;

		pt = (ProcessTable*)((uint32_t)(dev[STD_IN].pcb.prev) -
					(uint32_t)&(((ProcessTable*)0)->blocked));
		pt->state = STATE_RUNNABLE;
		pt->sleepTime = 0;

		dev[STD_IN].pcb.prev = (dev[STD_IN].pcb.prev)->prev;
		(dev[STD_IN].pcb.prev)->next = &(dev[STD_IN].pcb);
	}
	return;
}

void syscallHandle(struct StackFrame *sf) {
	switch(sf->eax) { // syscall number
		case SYS_OPEN:
			syscallOpen(sf);
			break; // for SYS_OPEN
		case SYS_WRITE:
			syscallWrite(sf);
			break; // for SYS_WRITE
		case SYS_READ:
			syscallRead(sf);
			break; // for SYS_READ
		case SYS_LSEEK:
			syscallLseek(sf);
			break; // for SYS_SEEK
		case SYS_CLOSE:
			syscallClose(sf);
			break; // for SYS_CLOSE
		case SYS_REMOVE:
			syscallRemove(sf);
			break; // for SYS_REMOVE
		case SYS_FORK:
			syscallFork(sf);
			break; // for SYS_FORK
		case SYS_EXEC:
			syscallExec(sf);
			break; // for SYS_EXEC
		case SYS_SLEEP:
			syscallSleep(sf);
			break; // for SYS_SLEEP
		case SYS_EXIT:
			syscallExit(sf);
			break; // for SYS_EXIT
		case SYS_SEM:
			syscallSem(sf);
			break; // for SYS_SEM
		default:break;
	}
}


void syscallOpen(struct StackFrame *sf) {
	//putChar('O');
	//putChar('\n');
	///int i;
	char tmp = 0;
	///int length = 0;
	int cond = sf->edx;
	int ret = 0;
	int size = 0;
	int baseAddr = (current + 1) * 0x100000; // base address of user process
	char *str = (char*)sf->ecx + baseAddr; // file path   //ecx  edx
	Inode fatherInode;
	Inode destInode;
	int fatherInodeOffset = 0;
	int destInodeOffset = 0;

	ret = readInode(&sBlock, gDesc, &destInode, &destInodeOffset, str);
    
    // STEP 2
    // TODO: try to complete file open
	//myadd
	if (ret == 0)
	{
		
		//first
		if (destInode.type==DIRECTORY_TYPE&&((cond>>3)%2==0) )//meiyou directory
		{
			//putChar('h');
			pcb[current].regs.eax =-1;
			return ;
		}
		int i=0;
		//second
		for (; i < MAX_DEV_NUM; i++)
		{
			if (dev[i].inodeOffset==destInodeOffset)
			{
				pcb[current].regs.eax =i;
				return;
			}
			
		}
		//third
		for ( i = 0; i < MAX_FILE_NUM; i++)
		{
			if (file[i].inodeOffset==destInodeOffset)
			{
				if (destInode.linkCount>0)
				{
					destInode.linkCount+=1;
					pcb[current].regs.eax = i+MAX_DEV_NUM;
					return;
				}
				if (destInode.linkCount==0)//impossible
				{
					pcb[current].regs.eax = i+MAX_DEV_NUM;
					return;
				}
				
				
			}
			
		}
		//forth
		int fd=0;
		for (; fd < MAX_FILE_NUM; fd++)
		{
			if (file[fd].state==0)
			{
				destInode.linkCount+=1;
				file[fd].state=1;
				file[fd].offset=0;
				file[fd].inodeOffset=destInodeOffset;
				file[fd].flags=(int)sf->edx;
				break;
			}	
		}
		pcb[current].regs.eax = fd+MAX_DEV_NUM;
		return;
			
	}
	else //ret!=0 means theres no file exist
	{
		//putChar(ret+'2');
		
		
		//first
		//if ((cond>>2)&(0x1) ==0)
		if ((cond>>2)%2 ==0)
		{
			pcb[current].regs.eax = -1;
			return;
			//allocInode(&sBlock,gDesc,&fatherInode,&fatherInodeOffset,&destInode,&destInodeOffset,str,REGULAR_TYPE);
		}
		//second
		int dirORfile=0;//1 or 2
		if ((cond>>3)%2 ==0)
		{
			dirORfile=2;
		}
		//third
		if ((cond>>3)%2 ==0)
		{
			dirORfile=1;
		}
		ret = readGroupHeader(&sBlock, gDesc);
		//
		int length = stringLen(str);
		if (str[length - 1] == '/') { // last byte of destDirPath is '/'
			//cond = 1;
			*((char*)str + length - 1) = 0;
			dirORfile=2;
		}
		else 
		{
			dirORfile=1;
		}
		
		//
		ret = stringChrR(str, '/', &size);

		tmp = *((char*)str + size + 1);
		*((char*)str + size + 1) = 0;
		ret = readInode(&sBlock, gDesc,
			&fatherInode, &fatherInodeOffset, str);
		*((char*)str + size + 1) = tmp;
		
		if (dirORfile==1)
		{
			ret = allocInode( &sBlock, gDesc, // safe operation, none of the parameters would be modified if it fails
			&fatherInode, fatherInodeOffset,
			&destInode, &destInodeOffset, str + size + 1, DIRECTORY_TYPE);
		}
		else
		{
			ret = allocInode( &sBlock, gDesc, // safe operation, none of the parameters would be modified if it fails
			&fatherInode, fatherInodeOffset,
			&destInode, &destInodeOffset, str + size + 1, REGULAR_TYPE);
		}
		int fd=0;
		for (; fd < MAX_FILE_NUM; fd++)
		{
			if (file[fd].state==0)
			{
				destInode.linkCount+=1;
				file[fd].state=1;
				file[fd].offset=0;
				file[fd].inodeOffset=destInodeOffset;
				file[fd].flags=(int)sf->edx;
				break;
			}	
		}
		pcb[current].regs.eax = fd+MAX_DEV_NUM;
		return;

		//forth  in fact useless moved it before the first
		if (ret==-1)
		{
			pcb[current].regs.eax = -1;
			return;
		}
		

		
		
	}
	
	
	//myadd
    /** consider following situations
    if file exit (ret == 0) {
        if INODE type != file open mode
            do someting
        if the file refer to a device in use
            do something
        if the file refer to a file in use
            do something
        if the file refer to a file not in use
            do something
        if no available file
            do something
    }
    else {
        if O_CREATE not set
            do something
        if O_DIRECTORY not set
            do something //chuangjian dir 
        else
            do something  //chuangjian file
        //if ret == -1
        //    do something
        //create file success or fail
    */
	
	return;
}

void syscallWrite(struct StackFrame *sf) {
	//putChar('W');
	switch(sf->ecx) { // file descriptor
		case STD_OUT:
			if (dev[STD_OUT].state == 1)
				syscallWriteStdOut(sf);
			break; // for STD_OUT
		default:break;
	}
	if (sf->ecx >= MAX_DEV_NUM && sf->ecx < MAX_DEV_NUM + MAX_FILE_NUM) {
		if (file[sf->ecx - MAX_DEV_NUM].state == 1)
			syscallWriteFile(sf);
	}
	return;
}

void syscallWriteStdOut(struct StackFrame *sf) {
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
			if(displayRow==MAX_ROW){
				displayRow=MAX_ROW-1;
				displayCol=0;
				scrollScreen();
			}
		}
		else {
			data = character | (0x0c << 8);
			pos = (MAX_COL*displayRow+displayCol)*2;
			asm volatile("movw %0, (%1)"::"r"(data),"r"(pos+0xb8000));
			displayCol++;
			if(displayCol==MAX_COL){
				displayRow++;
				displayCol=0;
				if(displayRow==MAX_ROW){
					displayRow=MAX_ROW-1;
					displayCol=0;
					scrollScreen();
				}
			}
		}
		//asm volatile("int $0x20"); //XXX Testing irqTimer during syscall, consistent problem between register and memory can occur
		//asm volatile("int $0x20":::"memory"); //XXX memory option tell the compiler not to sort the instructions (i.e., previous instructions are all finished) and not to cache memory in register
	}
	
	updateCursor(displayRow, displayCol);
	//TODO take care of return value
	pcb[current].regs.eax = size;
	return;
}

void syscallWriteFile(struct StackFrame *sf) {
	putChar('W');
	//putChar('@');
	//putChar('\n');
	if (file[sf->ecx - MAX_DEV_NUM].flags % 2 == 0) { //XXX if O_WRITE is not set
		pcb[current].regs.eax = -1;
		return;
	}

	//int i = 0;
	//int j = 0;
	//int ret = 0;
	int baseAddr = (current + 1) * 0x100000; // base address of user process
	uint8_t *str = (uint8_t*)sf->edx + baseAddr; // buffer of user process
	int size = sf->ebx;
	uint8_t buffer[SECTOR_SIZE * SECTORS_PER_BLOCK];
	int quotient = file[sf->ecx - MAX_DEV_NUM].offset / sBlock.blockSize;
	int remainder = file[sf->ecx - MAX_DEV_NUM].offset % sBlock.blockSize;
	
	Inode inode;
	diskRead(&inode, sizeof(Inode), 1, file[sf->ecx - MAX_DEV_NUM].inodeOffset);
	
	if (size <= 0) {
		pcb[current].regs.eax = 0;
		return;
	}
	//myadd
	//putChar('\n');
	//putChar('!');
	//putChar('\n');
	readBlock(&sBlock,&inode,quotient,buffer);
	//if (remainder!=0&& size<=SECTOR_SIZE*SECTORS_PER_BLOCK-remainder)
	if (size<=SECTOR_SIZE*SECTORS_PER_BLOCK-remainder)
	{
		putChar('a');
		int j=0;
		for (;j<size;j++)
		{
			buffer[remainder+j]=str[j];
			putChar(buffer[remainder+j]);
		}
		inode.size+=size;
		writeBlock(&sBlock, &inode, quotient, buffer);
		//putChar('!');
		//putChar('\n');
		//putChar(buffer[1]);
		file[sf->ecx - MAX_DEV_NUM].offset+=size;
		
		diskWrite(&inode,sizeof(Inode),1,file[sf->ecx - MAX_DEV_NUM].inodeOffset);
		pcb[current].regs.eax = size;
		
		return;
	}
	else   //more than one block
	{
		putChar('b');
		if (remainder!=0)
		{
			int j=0;
			for (;j<SECTOR_SIZE*SECTORS_PER_BLOCK-remainder;j++)
			{
				buffer[remainder+j]=str[j];
			}
			inode.size+=SECTOR_SIZE*SECTORS_PER_BLOCK-remainder;
			writeBlock(&sBlock, &inode, quotient, buffer);
		}
		else//remainder==0
		{
			remainder=SECTOR_SIZE*SECTORS_PER_BLOCK;
		}
		
		
		int j=0;
		//write the rest
		allocBlock(&sBlock,gDesc,&inode,file[sf->ecx - MAX_DEV_NUM].inodeOffset);
		for (j=0;j<size-(SECTOR_SIZE*SECTORS_PER_BLOCK-remainder);j++)
		{
			buffer[j]=str[j+SECTOR_SIZE*SECTORS_PER_BLOCK-remainder];
			putChar(buffer[j]);
		}
		//putChar('!');
		//putChar(buffer[0]);
		//putChar('!');
		inode.blockCount+=1;
		inode.size+=size-(SECTOR_SIZE*SECTORS_PER_BLOCK-remainder);
		writeBlock(&sBlock, &inode, quotient, buffer);//okey
		file[sf->ecx - MAX_DEV_NUM].offset+=size;
		//inode.size+=size;
		//no concern about many blocks
		diskWrite(&inode,sizeof(Inode),1,file[sf->ecx - MAX_DEV_NUM].inodeOffset);
		pcb[current].regs.eax = size;
		return;
	}
	
	
	//if more than rest new Block
	
	//myadd
    // STEP 3
    // TODO: try to complete file write
    /** condider as many situations as you can
    */
	
	return;
}

void syscallRead(struct StackFrame *sf) {
	switch(sf->ecx) { // file descriptor
		case STD_IN:
			if (dev[STD_IN].state == 1)
				syscallReadStdIn(sf);
			break; // for STD_IN
		default:break;
	}
	if (sf->ecx >= MAX_DEV_NUM && sf->ecx < MAX_DEV_NUM + MAX_FILE_NUM) { // for file
		if (file[sf->ecx - MAX_DEV_NUM].state == 1)
			syscallReadFile(sf);
	}
}

void syscallReadStdIn(struct StackFrame *sf) {
	//TODO more than one process request for STD_IN
	if (dev[STD_IN].value == 0) { // no process blocked
		/*XXX Blocked for I/O */
		dev[STD_IN].value --;

		pcb[current].blocked.next = dev[STD_IN].pcb.next;
		pcb[current].blocked.prev = &(dev[STD_IN].pcb);
		dev[STD_IN].pcb.next = &(pcb[current].blocked);
		(pcb[current].blocked.next)->prev = &(pcb[current].blocked);

		pcb[current].state = STATE_BLOCKED;
		pcb[current].sleepTime = -1; // blocked on STD_IN

		bufferHead = bufferTail;
		asm volatile("int $0x20");
		/*XXX Resumed from Blocked */
		int sel = sf->ds;
		char *str = (char*)sf->edx;
		int size = sf->ebx; // MAX_BUFFER_SIZE, reverse last byte
		int i = 0;
		char character = 0;
		asm volatile("movw %0, %%es"::"m"(sel));
		while(i < size-1) {
			if(bufferHead != bufferTail){ //XXX what if keyBuffer is overflow
				character = getChar(keyBuffer[bufferHead]);
				bufferHead = (bufferHead+1)%MAX_KEYBUFFER_SIZE;
				putChar(character);
				if(character != 0) {
					asm volatile("movb %0, %%es:(%1)"::"r"(character),"r"(str+i));
					i++;
				}
			}
			else
				break;
		}
		asm volatile("movb $0x00, %%es:(%0)"::"r"(str+i));
		pcb[current].regs.eax = i;
		return;
	}
	else if (dev[STD_IN].value < 0) { // with process blocked
		pcb[current].regs.eax = -1;
		return;
	}
}

void syscallReadFile(struct StackFrame *sf) {
	putChar('R');
	if ((file[sf->ecx - MAX_DEV_NUM].flags >> 1) % 2 == 0) { //XXX if O_READ is not set
		pcb[current].regs.eax = -1;
		return;
	}

	int i = 0;
	int j = 0;
	int baseAddr = (current + 1) * 0x100000; // base address of user process
	uint8_t *str = (uint8_t*)sf->edx + baseAddr; // buffer of user process
	int size = sf->ebx; // MAX_BUFFER_SIZE, don't need to reserve last byte
	uint8_t buffer[SECTOR_SIZE * SECTORS_PER_BLOCK];
	int quotient = file[sf->ecx - MAX_DEV_NUM].offset / sBlock.blockSize;
	int remainder = file[sf->ecx - MAX_DEV_NUM].offset % sBlock.blockSize;
	
	Inode inode;
	diskRead(&inode, sizeof(Inode), 1, file[sf->ecx - MAX_DEV_NUM].inodeOffset);
	
    // STEP 4
    // TODO: try to complete file read
	if (inode.size-file[sf->ecx - MAX_DEV_NUM].offset<size)
	{
		size=inode.size -file[sf->ecx - MAX_DEV_NUM].offset;
	}
	/* 
	putChar('!');
	putChar(size/100+'0');
	putChar(size/10%10+'0');
	putChar(size%10+'0');
	putChar('!');
	*/
	i=0;
	j=0;
	j = remainder;
	while (i < size)
	{
		//putChar(size+'0');
		readBlock(&sBlock,&inode,quotient,buffer);//quotient is blockIndex?
		
		
		//file[sf->ecx - MAX_DEV_NUM].offset+=size;
		//putChar('~');
		//putChar(buffer[0]);
		//putChar(size);
		// *((char*)buffer + size + 1) = 0;
		while (j < sBlock.blockSize && i < size)
		{
			str[i] = buffer[j];
			i++;
			j++;
		}

		quotient++;
		j = 0;
	}


	//////////////////////////////////////////////////////

	/* 
	if (size<=sBlock.blockSize-remainder)
	{
		//putChar('A');
		readBlock(&sBlock,&inode,quotient,buffer);//quotient is blockIndex?
		file[sf->ecx - MAX_DEV_NUM].offset+=size;
		putChar('~');
		putChar(buffer[2]);
		//putChar(size);
		// *((char*)buffer + size + 1) = 0;
		for (j=0 ;j<size;j++)
		{
			*(str+j)=*(buffer+j+remainder);
			//putChar(str[0]);
		}
		//putChar('!');
		//putChar(str[1023]);
		//putChar(str[1024]);
		//putChar('!');
		pcb[current].regs.eax = size;
		return;
	}
	else
	{
		putChar('K');
		readBlock(&sBlock,&inode,quotient,buffer);//quotient is blockIndex?
		file[sf->ecx - MAX_DEV_NUM].offset+=size;
		//putChar(buffer[20]);
		//putChar(size);
		*((char*)buffer + size + 1) = 0;
		for (j=0 ;j<size;j++)
		{
			*(str+j)=*(buffer+j+remainder);
			//putChar(str[0]);
		}
		pcb[current].regs.eax = size;
		size-=(1024-remainder);
		//putChar('K');
		int a=size/sBlock.blockSize;
		int b=size%sBlock.blockSize;
		i=0;
		while (size>0)
		{
			readBlock(&sBlock,&inode,i,buffer);
			for (j=0 ;j<sBlock.blockSize;j++)
			{
				*(str+j)=*(buffer+j);
			}
			i+=1;
		}
		readBlock(&sBlock,&inode,i,buffer);
		//  *((char*)buffer + b + 1) = 0;
		//putChar('!');
		//putChar(buffer[0]);
		//putChar('!');
		for (j=0 ;j<b;j++)
		{
			*(str+a*sBlock.blockSize+j)=*(buffer+j);//attention
		}
		pcb[current].regs.eax = size;
		return;
	}
	
	*/
    /** consider different size
    */
    file[sf->ecx - MAX_DEV_NUM].offset += size;
	pcb[current].regs.eax = size;
	return;
}

void syscallLseek(struct StackFrame *sf) {//eax ecx edx ebx
    // STEP 5
    // TODO: try to complete seek
    /**
    consider different file type and different whence
    */
   	//myadd	
	//return syscall(SYS_LSEEK, fd, offset, whence, 0, 0);
	int fd=sf->ecx -MAX_DEV_NUM;
	int offset=sf->edx;
	int whence=sf->ebx;
	if (file[fd].flags%2==0||(file[fd].flags>>1)%2==0)
	{
		if (file[fd].state==1)//means open
		{
			if (whence==0)
			{
				file[fd].offset=offset;
			}
			if (whence==1)
			{
				//if(file[fd].offset+offset>max file len)
				//do something
				//security check
				file[fd].offset+=offset;
			}
			
			
		}
		
	}
	

	//return;
	//myadd
    
	return;
}

void syscallClose(struct StackFrame *sf) {
    // STEP 6
    // TODO: try to complete file close
    /**
    if file is dev or out of range
        do something
    if file not in use
        do something
    close file
    */
	//myadd
	int fd=sf->ecx-MAX_DEV_NUM;
	if(fd<0 ||fd>=MAX_FILE_NUM)
		return;
	if (file[fd].state==0)
		return;
	
	file[fd].offset=0;
	file[fd].state=0;
	Inode inode;
	diskRead(&inode, sizeof(Inode), 1, file[sf->ecx - MAX_DEV_NUM].inodeOffset);
	
	if(inode.linkCount>0){
		inode.linkCount-=1;
	}
	diskWrite(&inode, sizeof(Inode), 1, file[sf->ecx - MAX_DEV_NUM].inodeOffset);
	

	//myadd
	return;
}


void syscallRemove(struct StackFrame *sf) {
	int i;
	char tmp = 0;
	int length = 0;
	int cond = 0;
	int ret = 0;
	int size = 0;
	int baseAddr = (current + 1) * 0x100000; // base address of user process
	char *str = (char*)sf->ecx + baseAddr; // file path //
	Inode fatherInode;
	Inode destInode;
	int fatherInodeOffset = 0;
	int destInodeOffset = 0;

	ret = readInode(&sBlock, gDesc, &destInode, &destInodeOffset, str);
    
	//mycode
	if (ret<0)//file not exist
	{
		putChar('N');
		return;
	}
	else
	{ 
		putChar('Y');
		 
		for (i = 0; i < MAX_DEV_NUM; i++)
		{
			if(dev[i].inodeOffset==destInodeOffset){
				return;
			}
		}
		
		for ( i = 0; i < MAX_FILE_NUM; i++)
		{
			if (file[i].inodeOffset==destInodeOffset)
			{
				file[i].state=0;//if use
				
				length = stringLen(str);
				if (str[length - 1] == '/') { // last byte of destDirPath is '/'
					cond = 1;
					*((char*)str + length - 1) = 0;
				}
				ret = stringChrR(str, '/', &size);

				tmp = *((char*)str + size + 1);
				*((char*)str + size + 1) = 0;
				//for (int i = 0; i < size; i++)
				//{
				//	putChar(str[i]);
				//}
				//while (1)
				//{
					/* code */
				//}
				
				ret = readInode(&sBlock, gDesc,
					&fatherInode, &fatherInodeOffset, str);
				*((char*)str + size + 1) = tmp;
				//diskRead(&destInode, sizeof(Inode), 1, file[sf->ecx - MAX_DEV_NUM].inodeOffset);
				if (cond==1)
				{
					freeInode(&sBlock,gDesc,&fatherInode,fatherInodeOffset,&destInode,&destInodeOffset,str,DIRECTORY_TYPE);
				}
				else
				{	
					freeInode(&sBlock,gDesc,&fatherInode,fatherInodeOffset,&destInode,&destInodeOffset,str,REGULAR_TYPE);		
				}
				
			}
			else //not in use
			{
				length = stringLen(str);
				if (str[length - 1] == '/') { // last byte of destDirPath is '/'
					cond = 1;
					*((char*)str + length - 1) = 0;
				}
				ret = stringChrR(str, '/', &size);

				tmp = *((char*)str + size + 1);
				*((char*)str + size + 1) = 0;
				
				
				ret = readInode(&sBlock, gDesc,
					&fatherInode, &fatherInodeOffset, str);
				*((char*)str + size + 1) = tmp;
				
				//diskRead(&destInode, sizeof(Inode), 1, file[sf->ecx - MAX_DEV_NUM].inodeOffset);
				if (cond==1)
				{
					freeInode(&sBlock,gDesc,&fatherInode,fatherInodeOffset,&destInode,&destInodeOffset,str,DIRECTORY_TYPE);
				}
				else
				{	
					freeInode(&sBlock,gDesc,&fatherInode,fatherInodeOffset,&destInode,&destInodeOffset,str,REGULAR_TYPE);		
				}
			}
			
			
		}
		
		
	}
	
	


	//mycode
    // STEP 7
    // TODO: try to complete file remove
    /**
    if file exist {
        if file refer to a device
            do
        if file refer to a file in use
            do
        remove file (different file type, success or not)
    else
        do
    }
    */
	return;
}

void syscallFork(struct StackFrame *sf) {
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
		pcb[i].stackTop = (uint32_t)&(pcb[i].stackTop) -
			((uint32_t)&(pcb[current].stackTop) - pcb[current].stackTop);
		pcb[i].prevStackTop = (uint32_t)&(pcb[i].stackTop) -
			((uint32_t)&(pcb[current].stackTop) - pcb[current].prevStackTop);
		pcb[i].state = STATE_RUNNABLE;
		pcb[i].timeCount = pcb[current].timeCount;
		pcb[i].sleepTime = pcb[current].sleepTime;
		pcb[i].pid = i;
		/*XXX set regs */
		pcb[i].regs.ss = USEL(2+i*2);
		pcb[i].regs.esp = pcb[current].regs.esp;
		pcb[i].regs.eflags = pcb[current].regs.eflags;
		pcb[i].regs.cs = USEL(1+i*2);
		pcb[i].regs.eip = pcb[current].regs.eip;
		pcb[i].regs.eax = pcb[current].regs.eax;
		pcb[i].regs.ecx = pcb[current].regs.ecx;
		pcb[i].regs.edx = pcb[current].regs.edx;
		pcb[i].regs.ebx = pcb[current].regs.ebx;
		pcb[i].regs.xxx = pcb[current].regs.xxx;
		pcb[i].regs.ebp = pcb[current].regs.ebp;
		pcb[i].regs.esi = pcb[current].regs.esi;
		pcb[i].regs.edi = pcb[current].regs.edi;
		pcb[i].regs.ds = USEL(2+i*2);
		pcb[i].regs.es = pcb[current].regs.es;
		pcb[i].regs.fs = pcb[current].regs.fs;
		pcb[i].regs.gs = pcb[current].regs.gs;
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
	if (sf->ecx == 0)
		return;
	else {
		pcb[current].state = STATE_BLOCKED;
		pcb[current].sleepTime = sf->ecx;
		asm volatile("int $0x20");
		return;
	}
}

void syscallExit(struct StackFrame *sf) {
	pcb[current].state = STATE_DEAD;
	asm volatile("int $0x20");
	return;
}

void syscallSem(struct StackFrame *sf) {
	switch(sf->ecx) {
		case SEM_INIT:
			syscallSemInit(sf);
			break;
		case SEM_WAIT:
			syscallSemWait(sf);
			break;
		case SEM_POST:
			syscallSemPost(sf);
			break;
		case SEM_DESTROY:
			syscallSemDestroy(sf);
			break;
		default:break;
	}
}

void syscallSemInit(struct StackFrame *sf) {
	int i;
	for (i = 0; i < MAX_SEM_NUM ; i++) {
		if (sem[i].state == 0) // not in use
			break;
	}
	if (i != MAX_SEM_NUM) {
		sem[i].state = 1;
		sem[i].value = (int32_t)sf->edx;
		sem[i].pcb.next = &(sem[i].pcb);
		sem[i].pcb.prev = &(sem[i].pcb);
		pcb[current].regs.eax = i;
	}
	else
		pcb[current].regs.eax = -1;
	return;
}

void syscallSemWait(struct StackFrame *sf) {
	int i = (int)sf->edx;
	if (i < 0 || i >= MAX_SEM_NUM) {
		pcb[current].regs.eax = -1;
		return;
	}
	if (sem[i].state == 0) { // not in use
		pcb[current].regs.eax = -1;
		return;
	}
	if (sem[i].value >= 1) { // not to block itself
		sem[i].value --;
		pcb[current].regs.eax = 0;
		return;
	}
	if (sem[i].value < 1) { // block itself on this sem
		sem[i].value --;
		pcb[current].blocked.next = sem[i].pcb.next;
		pcb[current].blocked.prev = &(sem[i].pcb);
		sem[i].pcb.next = &(pcb[current].blocked);
		(pcb[current].blocked.next)->prev = &(pcb[current].blocked);
		
		pcb[current].state = STATE_BLOCKED;
		pcb[current].sleepTime = -1;
		asm volatile("int $0x20");
		pcb[current].regs.eax = 0;
		return;
	}
}

void syscallSemPost(struct StackFrame *sf) {
	int i = (int)sf->edx;
	ProcessTable *pt = NULL;
	if (i < 0 || i >= MAX_SEM_NUM) {
		pcb[current].regs.eax = -1;
		return;
	}
	if (sem[i].state == 0) { // not in use
		pcb[current].regs.eax = -1;
		return;
	}
	if (sem[i].value >= 0) { // no process blocked
		sem[i].value ++;
		pcb[current].regs.eax = 0;
		return;
	}
	if (sem[i].value < 0) { // release process blocked on this sem 
		sem[i].value ++;

		pt = (ProcessTable*)((uint32_t)(sem[i].pcb.prev) -
					(uint32_t)&(((ProcessTable*)0)->blocked));
		pt->state = STATE_RUNNABLE;
		pt->sleepTime = 0;

		sem[i].pcb.prev = (sem[i].pcb.prev)->prev;
		(sem[i].pcb.prev)->next = &(sem[i].pcb);
		
		pcb[current].regs.eax = 0;
		return;
	}
}

void syscallSemDestroy(struct StackFrame *sf) {
	int i = (int)sf->edx;
	if (i < 0 || i >= MAX_SEM_NUM) {
		pcb[current].regs.eax = -1;
		return;
	}
	if (sem[i].state == 0) { // not in use
		pcb[current].regs.eax = -1;
		return;
	}
	sem[i].state = 0;
	sem[i].value = 0;
	sem[i].pcb.next = &(sem[i].pcb);
	sem[i].pcb.prev = &(sem[i].pcb);
	pcb[current].regs.eax = 0;
	return;
}
