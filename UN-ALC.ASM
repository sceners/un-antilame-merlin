; Un-ALC v0.1 (c) MERLiN // Delirium Tremens 1998
.386p
cseg            segment         use16
                assume          cs:cseg,ds:cseg,es:cseg
                org             100h
begin           proc
                mov             ah,9
                lea             dx,id
                int             21h
                mov             si,81h
                lodsb
                cmp             al,13
                jz              bad_usage
_keep_scan:
                lodsb
                cmp             al,32
                jz              _keep_scan
                dec             si
                mov             di,si
                push            di di
                mov             al,13
                repne           scasb
                dec             di
                mov             ax,2400h
                stosw

                pop             dx
                mov             ax,3d02h
                int             21h
                jnc             c1
                lea             dx,not_found
view_n_exit:
                mov             ah,9
                int             21h
                mov             ah,4ch
                int             21h
c1:
                xchg            bx,ax
                lea             dx,process
                mov             ah,9
                int             21h
                pop             dx
                int             21h
                mov             ax,cs
                add             ax,1000h
                mov             ds,ax
                xor             dx,dx
                mov             ah,3fh
                mov             cx,65535
                int             21h
                mov             si,66h
                mov             di,0c3h
                call            chk
                jnc             ok
                dec             di
                mov             si,65h
                call            chk
                jc              not_psa2

ok:
                push            ds
                pop             es
                mov             si,di
                push            si
                db              0b9h
sz              dw              ?
_1:
                lodsb
                db              0c0h,0c8h,3
;cf1             db              ?
                db              34h,0dfh
;cf2             db              ?
                xor             al,cl
                stosb
                loop            _1
                mov             ah,3eh
                int             21h

                push            ds
                push            cs
                pop             ds
                lea             dx,_out
                xor             cx,cx
                mov             ah,3ch
                int             21h
                xchg            bx,ax
                mov             ah,40h
                pop             ds
                pop             dx
                mov             cx,cs:sz
                int             21h
                mov             ah,3eh
                int             21h
                mov             ah,4ch
                int             21h
bad_usage:
                lea             dx,usage
                jmp             view_n_exit
chk:
                lodsb
                cmp             al,0beh
                jne             not_psa
                lodsw
                lodsw
                cmp             ax,0fe8bh
                jne             not_psa
                lodsb
                lodsw
                mov             cs:sz,ax
                clc
                retn
not_psa:
                stc
                retn
not_psa2:
                push            cs
                pop             ds
                mov             ah,3eh
                int             21h
                lea             dx,_not_psa
                jmp             view_n_exit
_out            db              'UNCRYPTD.COM'
                db              0
id              db              'UN-ALC v0.1, Unpacks files crypted with [Anti-Lame Cryptor by PSA]',13,10
                db              'Copyright (c) 1998 by MERLiN // Delirium Tremens',13,10,'$'
usage           db              13,10,'Usage: UN-ALC crypted_file',13,10,'$'
not_found       db              'File not found$'
_not_psa        db              13,10,'Specified file doesn''t seem to be crypted with Anti-Lame Cryptor$'
process         db              'Processing file: $'
done            db              '... Done$'
begin           endp
cseg            ends
                end             begin