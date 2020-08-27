;==================================================================;
;                                                                  ;
;                           TIMIDREM.ASM                           ;
;__________________________________________________________________;
;                                                                  ;
; Written by Tom J. Marcoen                                        ;
;__________________________________________________________________;
;                                                                  ;
; This program scans all COM files on the computer and removes the ;
; TIMID virus from them, should the file be infected.              ;
;                                                                  ;
;==================================================================;

; This program uses the simplified segment directives (see the MASM
; Programmer's Guide, pp. 33-37. Specifically, the tiny model
; produces MS-DOS .COM files.
   .MODEL TINY

; This is the start of the code segment. The .STARTUP directive
; eliminates the need for the ORG statement.
   .CODE
   .STARTUP

; Find all files and fix them.
   CALL  FIND_COM_FILE
FIX_FILES:
   CALL  FIX_FILE
   CALL  FIND_NEXT_FILE
   JNZ   FIX_FILES
   


; The .EXIT directive accepts a 1-byte exit code as its optional
; argument. It generates the following code that returns control to
; MS-DOS.
;  MOV   AL,value
;  MOV   AH,4C
;  INT   21
; If the program does not specify a return value, .EXIT returns
; whatever value happens to be in AL.
   .EXIT 0

; This is the start of the data segment.
   .DATA

; Close remaining segments.
   END
   
