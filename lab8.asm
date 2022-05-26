.model tiny
.code
org 100h

main proc near
    loop_sayi_al:
    mov ah,09h
    mov dx,offset islem_sec
    int 21h
    mov number,0 
    
    mov ah,09h
    mov dx,offset islem_sec2
    int 21h
    mov number,0
    
    mov ah,01
    int 21h
    
    cmp al,71h
    je number_c
    
    cmp al,74h
    je TOPLAM
    
    cmp al,63h
    je CIKARMA
    
    cmp al,70h
    je CARPMA
    
    cmp al,62h
    je BOLME
    
    sub al,30h
    mov ah,00
    mov bx,ax
    
    mov ax,number
    mul number_p
    
    add ax,bx
    mov number,ax
    
    jmp loop_c
    

TOPLAM:
    mov ah,09h
    mov dx,offset mesaj_1
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov ah,00
    mov bx,ax 
    mov ax,number
    mul number_p
    add ax,bx
    mov number,ax
    add sums,bl 
    mov ah,09h
    mov dx,offset mesaj_2
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov ah,00
    mov bx,ax
    mov ax,number
    mul number_p
    add ax,bx
    mov number,ax
    add sums,bl
    add sums,48
    mov ah,09h
    mov dx,offset mesaj_3
    int 21h
    mov ah,09h
    mov dx,offset sums
    int 21h
    mov sums,0
    jmp loop_c
    

CIKARMA:

   mov ah,09h
   mov dx,offset mesaj_1
   int 21h
   mov ah,01h
   int 21h
   sub al,30h
   mov ah,00
   mov bx,ax 
   mov ax,number
   mul number_p
   add ax,bx
   mov number,ax
   mov subst,bl
   mov ah,09h
   mov dx,offset mesaj_2
   int 21h
   mov ah,01h
   int 21h
   sub al,30h
   mov ah,00
   mov bx,ax
   mov ax,number
   mul number_p
   add ax,bx
   mov number,ax
   sub subst,bl
   add subst,48
   mov ah,09h
   mov dx,offset mesaj_3
   int 21h 
   mov ah,09h
   mov dx,offset subst
   int 21h
   mov subst,0
   jmp loop_c 


BOLME:  
    
   mov ah,09h
   mov dx,offset divide_1
   int 21h
   mov ah,01h
   int 21h
   sub al,30h
   mov ah,00
   mov bx,ax 
   mov ax,number
   mul number_p
   add ax,bx
   mov number,ax 
   mov divide_1,bl
   mov ah,09h
   mov dx,offset divide_2
   int 21h
   mov ah,01h
   int 21h   
   sub al,30h  
   mov ah,00                            
   mov bx,ax    
   mov ax,number   
   mul number_p                  
   add ax,bx       
   mov number,ax
   mov divide2,bl
   mov ah,0
   mov al,0
   mov bh,0
   mov bh,divide1
   mov al,divide2
   div bh
   mov divide1,al
   mov divide2,ah
   add divide1,48
   mov ah,09h  
   mov dx,offset mesaj_3
   int 21h
   mov ah,09h  
   mov dx,offset divide1    
   int 21h
   mov divide1,0 
   mov divide2,0
   jmp loop_c 
   
   
CARPMA:
   mov ah,09h
   mov dx,offset mesaj_1
   int 21h
   mov ah,01h
   int 21h
   sub al,30h
   mov ah,00
   mov bx,ax 
   mov ax,number
   mul number_p
   add ax,bx
   mov number,ax
   add multp1,bl
   mov ah,09h
   mov dx,offset mesaj_2
   int 21h
   mov ah,01h           
   int 21h     
   sub al,30h 
   mov ah,00                            
   mov bx,ax   
   mov ax,number   
   mul number_p      
   add ax,bx   
   mov number,ax
   mov multp2,bl   
   mov al,multp1
   mul multp2   
   mov multp1,al
   add multp1,48
   mov ah,09h 
   mov dx,offset mesaj_3
   int 21h
   mov ah,09h  
   mov dx,offset multp1    
   int 21h 
   mov ah,09h
   int 21h
   mov multp1,0 
   mov multp2,0
   jmp loop_c   
    
number_c:
    mov ax,number
    mov ah,4ch
    mov al,00
    int 21h
    
    
loop_c:
    mov ah,09
    mov dx,offset cikis
    int 21h
    mov number,0
    
    mov ah,01h
    int 21h
    cmp al,71h
    je number_c
    cmp al,64h
    je loop_sayi_al 
    


    

    
    



          

endp
    number_p db 10
    number dw 0
    sums db 0
    divide1 db 0
    divide2 db 0
    multp1 db 0
    multp2 db 0
    subst db 0 
    
    
    islem_sec db 0ah,0dh,"Yapacaginiz islem" 
    islem_sec2 db 0ah,0dh,"Toplam=t, Cikarma=c, Bolme=b, Carpma=p  : $"
    cikis db 0ah,0dh, "Cikmak icin q, devam etmek icin d ye basiniz : $"
    mesaj_1 db 0ah,0dh, "Ilk sayiyi giriniz : $" 
    mesaj_2 db 0ah,0dh, "Ikinci sayiyi giriniz : $"
    mesaj_3 db 0ah,0dh, "Cevabiniz : $"
    divide_1 db 0ah,0dh, "Boleni giriniz : $"
    divide_2 db 0ah,0dh, "Boluneni giriniz : $"