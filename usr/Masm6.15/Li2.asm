 
DATA SEGMENT          ;�������ݶ�   
  SUM DW ?			  ;����SUM����������
DATA ENDS          

STACK SEGMENT STACK   ;�������ݶ�
  DB 100 DUP(0)
STACK ENDS

CODE SEGMENT 'CODE'   ;��������
     ASSUME CS:CODE,DS:DATA,SS:STACK

 START:
     MOV AX,DATA
     MOV DS,AX
     MOV CX,1         ;CX�Ǽ�����,����ÿ�β���һ������������ѭ����ʱ����
 CYCLE:
     ADD SUM,CX       ;���ϵ�ǰ��
     INC CX           ;������һ������
     CMP CX,11        ;�Ƚ�(CX)��12���Ƿ���Խ���
     JLE CYCLE        ;δ����תCYCLE����
     
     MOV AX,SUM
     AAM			  ;����ֵת��ΪBCD����	
     ADD AX,3030H     ;ת��ΪASCII��
     
     MOV BX,AX        ;���ִ���BX��
          
     MOV AH,2		  ;��ʾ��λ����	
     MOV DL,BH
     INT 21H
     MOV DL,BL        ;��ʾ��λ����
     INT 21H
          
          
     MOV AH,4CH       ;���ز���ϵͳ
     INT 21H

CODE ENDS
     END START                    