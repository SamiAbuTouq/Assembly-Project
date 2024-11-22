org 100h
.stack 100

.data 
prompt1 db "Enter First Number: ","$"           ; prompt the user to enter the first number
prompt2 db 0Dh,0Ah,"Enter Second Number: ","$"  ; prompt the user to enter the second number 
num1 db ? ; a variable to store first number
num2 db ? ; a variable to store second number 
GCF db ?  ; greatest common factor
LCM dw ?  ; least common multiple
i db ?   

; three variables each to print the result in a different case
result    db "GCF=",0,0,"  ","LCM=",4 dup (0),"$" 
undefined db "GCF=undefined  LCM=undefined",'$'
nan       db "GCF=1  LCM=NaN",'$' 
error     db "Invalid Input ;(",'$'                                
  
                                      
 .code  
;----------------------------------------------------------  Pormpt 1  -----------------------------------------------------------;   
mov ah,2
mov si,0
enter1:                      
    cmp prompt1[si],"$"
    je n1
    mov dl,prompt1[si] 
    int 21h
    inc si
    jmp enter1    
    
        
       
      
      
        
        
;--------------------------------------------  Taking the first number from the user  ---------------------------------------------;    
        
n1:             ; first digit  
mov ah,1
int 21h
call print_Invalid  
mov num1,al
sub num1,30h
	
int 21h         ; jump to L1 if the user press the enter key (new line) thus the number will be consists of one digit
cmp al,0dh
je L1           ; if the user didn't press the enter key then the number will be consists of two digits   

call print_Invalid                 
push ax          
mov al,10       
mul num1
mov num1,al
pop ax
  
sub al,30h       
add num1,al
; after executing the previous lines of code first number value will be stores in num1

        
        
       
        
;----------------------------------------------------------  Pormpt 2  -----------------------------------------------------------; 
L1:  
mov ah,2
mov si,0
enter2: 
    cmp prompt2[si],"$"
    je n2
    mov dl,prompt2[si] 
    int 21h
    inc si
    jmp enter2     
    
    
  
  
  
    
  
;-------------------------------------------  Taking the second number from the user  ---------------------------------------------;   
n2:             ; first digit 
mov ah,1
int 21h
call print_Invalid                 
mov num2,al
sub num2,30h 
	
int 21h         ; jump to L2 if the user press the enter key (new line) thus the number will be consists of one digit
cmp al,0dh
je L2           ; if the user didn't press the enter key then the number will be consists of two digits   
     
call print_Invalid                                
push ax          
mov al,10       
mul num2
mov num2,al
pop ax
  
sub al,30h       
add num2,al          
; after executing the previous lines of code second number value will be stores in num2

 
   
   
   
 
;-----------------------------------------------------  getting the smaller number  --------------------------------------------------------;
;setting i value with the smaller number 
L2: 
mov dl,num1
cmp dl,num2
jb i_value         ; if num1<num2 jump to i_value label to set i value with num1   
mov dl,num2
mov i,dl    
jmp check          ; else if num1>=num2 set i value with num1
     
i_value:
mov dl,num1
mov i,dl   


check:    
;if num1==0 && num2==K then --> GCF=num2=K   LCM=num1=0   
;if num1==K && num2==0 then --> GCF=num1=K   LCM=num2=0 
cmp i,0
jne compare1
mov LCM,0
cmp num1,0
jne nm2_0
mov dl,num2
mov GCF,dl 
jmp copyVals

nm2_0: 
mov dl,num1
mov GCF,dl 
jmp copyVals 






;----------------------------------------------------------  get GCF value  -----------------------------------------------------------; 
inc i
compare:
dec i
compare1:
;if num1==1 && num2==1 then --> GCF=1   LCM=nan   
cmp num1,1
jne con
cmp num2,1
jne con
mov GCF,1
jmp print_nan       
        con:
        ;if num1%i==0  && num2%i==0 then GCF=i 
        mov ah,0
        mov al,num1
        div i
        cmp ah,0        ;if ah!=0 then num1%i!=0
        jne compare 
      
    compare2:
        mov ah,0
        mov al,num2
        div i
        cmp ah,0        ;if ah==0 then num2%i==0 and jump to end_i_val 
        je end_i_val
        jne compare     ;if ah!=0 then num2%i!=0 and jump to compare
        
      
    end_i_val: ;set the value of GCF
        mov al,i
        mov GCF,al   
        
        
        
        
    

;----------------------------------------------------------  get LCM value  -----------------------------------------------------------;   
; finding LCM value using this formula  -->  lcm(a,b)= a.b / GCF(a,b)                                                                                                                                                                                                                                                                            
  mov al,num1
  mul num2      ;AX= num1.num2   
  mov dx,0 
  mov bh,0
  mov bl,GCF
  div bx        
  mov LCM,ax









;------------------------------------------------- copy GCF value to result variable  -------------------------------------------------;  
copyVals:
            ;if num1==0 && num2==0 then GCF and LCM are undefined operations so print "undefined"
            cmp num1,0      
            jne copyValsCont
            cmp num2,0
            je print_undefined   
copyValsCont:     
mov ah,0
mov al,GCF 
mov bl,10
div bl
cmp al,0
je num1_0X
add al,30h 
num1_0X:
add ah,30h
mov result[4],al 
mov result[5],ah     


                
                
                
                
;------------------------------------------------- copy LCM value to result variable  -------------------------------------------------;  
mov bx,1000
mov ax,LCM 
mov dx,0
div bx 
mov result[12],al 


mov ax,dx
mov bl,100
div bl 
mov result[13],al

mov al,ah
mov ah,0
mov bl,10
div bl 
mov result[14],al 
mov result[15],ah  
 
 
cmp result[12],0
jne num2_XXXX

cmp result[13],0
jne num2_0XXX                                                                                                                                  

cmp result[14],0
jne num2_00XX    
   
cmp result[15],0
jne num2_000X                                                                                                                                        
                                                                                                                                       
jmp num2_000X ;jump to num2_000X if LCM=0

num2_XXXX:mov cx,4
          mov si,12
          jmp num2_loop
                    
num2_0XXX:mov cx,3
          mov si,13
          jmp num2_loop
          
num2_00XX:mov cx,2
          mov si,14
          jmp num2_loop
                 
num2_000X:mov cx,1
          mov si,15
          jmp num2_loop
                    
num2_loop:add result[si],30h 
          inc si 
          loop num2_loop       
          
          
          
          
          
          
                                                                                                                                          

;-----------------------------------------------------  printing and moving cursor -------------------------------------------------------;
move_cursor:    
mov dh,13
mov dl,34
mov ah, 2
mov bh, 0
int 10h

mov si,-1 
print_res:
inc si 
mov dl,result[si]
cmp result[si],0 
je print_res 
int 21h
cmp result[si+1],"$"
jne print_res
ret
		 
;if num1==0 & num2==0 then --> GCF & LCM will be undefined 
print_undefined:  
mov dh,13
mov dl,26
mov ah, 2
mov bh, 0
int 10h 
mov dx, offset undefined
		mov ah, 9
		int 21h  
ret


print_nan:  
mov dh,13
mov dl,33
mov ah, 2
mov bh, 0
int 10h 
mov dx, offset nan
		mov ah, 9
		int 21h	 
ret                
    
    
    

     

   
 
;--------------------------------------------------------  print_Invalid PROC  ---------------------------------------------------------; 
print_Invalid PROC      
cmp al ,30h
jb p_Invalid

cmp al ,39h
ja p_Invalid     
ret


p_Invalid:  
mov dh,13
mov dl,32
mov ah, 2
mov bh, 0
int 10h 

mov dx, offset error
		mov ah, 9
		int 21h  

    
; Terminate the program after printing the error message
mov ah, 4Ch   
int 21h  
        
 
print_Invalid ENDP  





