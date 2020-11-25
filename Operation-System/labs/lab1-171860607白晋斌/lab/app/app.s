.code32

.global start
start:
	# TODO


movl $((80*8+0)*2), %edi               
movb $0x0c, %ah                         
movb $72, %al                #the ascii of H is not 42 but 72          
movw %ax, %gs:(%edi)                   

movl $((80*8+1)*2), %edi               
movb $0x0c, %ah                         
movb $101, %al                         #e 
movw %ax, %gs:(%edi)    

movl $((80*8+2)*2), %edi               
movb $0x0c, %ah                         
movb $108, %al                          #l
movw %ax, %gs:(%edi)    

movl $((80*8+3)*2), %edi               
movb $0x0c, %ah                         
movb $108, %al                          #l
movw %ax, %gs:(%edi)    

movl $((80*8+4)*2), %edi               
movb $0x0c, %ah                         
movb $111, %al                          #o
movw %ax, %gs:(%edi)                   

movl $((80*8+5)*2), %edi               
movb $0x0c, %ah                         
movb $44, %al                          #,
movw %ax, %gs:(%edi)    

movl $((80*8+6)*2), %edi               
movb $0x0c, %ah                         
movb $32, %al                          # 
movw %ax, %gs:(%edi)    

movl $((80*8+7)*2), %edi               
movb $0x0c, %ah                         
movb $87, %al                          #W
movw %ax, %gs:(%edi)   

movl $((80*8+8)*2), %edi               
movb $0x0c, %ah                         
movb $111, %al                          #o
movw %ax, %gs:(%edi)                   

movl $((80*8+9)*2), %edi               
movb $0x0c, %ah                         
movb $114, %al                          #r
movw %ax, %gs:(%edi)    

movl $((80*8+10)*2), %edi               
movb $0x0c, %ah                         
movb $108, %al                          #l
movw %ax, %gs:(%edi)    

movl $((80*8+11)*2), %edi               
movb $0x0c, %ah                         
movb $100, %al                          #d
movw %ax, %gs:(%edi)     

movl $((80*8+12)*2), %edi               
movb $0x0c, %ah                         
movb $33, %al                          #!
movw %ax, %gs:(%edi)     

movl $((80*8+13)*2), %edi               
movb $0x0c, %ah                         
movb $10, %al                          #\n
movw %ax, %gs:(%edi)     

movl $((80*8+14)*2), %edi               
movb $0x0c, %ah                         
movb $0, %al                          #\0
movw %ax, %gs:(%edi)     

#extern part
erase:

loopApp:
movl $((80*15+5)*2), %edi               
movb $0x0c, %ah                         
movb $32, %al                          #
movw %ax, %gs:(%edi) 
movl $((80*11+1)*2), %edi               
movb $0x0c, %ah                         
movb $36, %al                          #B
movw %ax, %gs:(%edi)   
 


movl $((80*9+12)*2), %edi               
movb $0x0c, %ah                         
movb $66, %al                          #B
movw %ax, %gs:(%edi)   
movl $((80*9+13)*2), %edi               
movb $0x0c, %ah                         
movb $74, %al                          #J
movw %ax, %gs:(%edi)   
movl $((80*9+14)*2), %edi               
movb $0x0c, %ah                         
movb $66, %al                          #J
movw %ax, %gs:(%edi)   

movl $((80*11+1)*2), %edi               
movb $0x0c, %ah                         
movb $32, %al                          #
movw %ax, %gs:(%edi) 
movl $((80*12+2)*2), %edi               
movb $0x0c, %ah                         
movb $36, %al                          #B
movw %ax, %gs:(%edi)  

movl $((80*9+12)*2), %edi               
movb $0x0b, %ah                         
movb $66, %al                          #B
movw %ax, %gs:(%edi)  
movl $((80*9+13)*2), %edi               
movb $0x0b, %ah                         
movb $74, %al                          #J
movw %ax, %gs:(%edi)   
movl $((80*9+14)*2), %edi               
movb $0x0b, %ah                         
movb $66, %al                          #J
movw %ax, %gs:(%edi)  

movl $((80*12+2)*2), %edi               
movb $0x0c, %ah                         
movb $32, %al                          #
movw %ax, %gs:(%edi) 
movl $((80*13+3)*2), %edi               
movb $0x0c, %ah                         
movb $36, %al                          #B
movw %ax, %gs:(%edi) 


movl $((80*9+12)*2), %edi               
movb $0x0e, %ah                         
movb $66, %al                          #B
movl $((80*9+13)*2), %edi               
movb $0x0e, %ah                         
movb $74, %al                          #J
movw %ax, %gs:(%edi)   
movl $((80*9+14)*2), %edi               
movb $0x0e, %ah                         
movb $66, %al                          #J
movw %ax, %gs:(%edi)   

movl $((80*13+3)*2), %edi               
movb $0x0c, %ah                         
movb $32, %al                          #
movw %ax, %gs:(%edi) 
movl $((80*14+4)*2), %edi               
movb $0x0c, %ah                         
movb $36, %al                          #B
movw %ax, %gs:(%edi) 


movl $((80*9+12)*2), %edi               
movb $0x0f, %ah                         
movb $66, %al                          #B
movl $((80*9+13)*2), %edi               
movb $0x0f, %ah                         
movb $74, %al   
movw %ax, %gs:(%edi)   
movl $((80*9+14)*2), %edi               
movb $0x0f, %ah                         
movb $66, %al                          #J
movw %ax, %gs:(%edi)  

movl $((80*14+4)*2), %edi               
movb $0x0c, %ah                         
movb $32, %al                          #
movw %ax, %gs:(%edi) 
movl $((80*15+5)*2), %edi               
movb $0x0c, %ah                         
movb $36, %al                          #B
movw %ax, %gs:(%edi) 



#cmp %ebx,%20
#jmp erase


	jmp loopApp




	#
	ret
