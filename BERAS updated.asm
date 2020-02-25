
;Minimum extra allocation: 1648 bytes
;Maximum extra allocation: 1048560 bytes
;Initial stack location: 0x50400
;Program entry point: 0
;Overlay number: 0

;Code (start = 0x3e00, length = 0x53c48):

;Battle of the eras improved disassembly. Using Semblance for GNU/Linux
;======SUBROUTINE 00000======
	mov	dx, 45C6h
	mov	[cs:026Dh], dx
	mov	ah, 30h
	int	21h			;DOS Interrupt 21h
	mov	bp, [0002h]
	mov	bx, [002Ch]
	mov	ds, dx
	mov	[0076h], ax
	mov	[0074h], es
	mov	[0070h], bx
	mov	[0088h], bp
	call	0178			;Jump to 0178
	mov	ax, [0070h]
	mov	es, ax			;Move register from high memory
					;register to a general register
	xor	ax, ax			;logical operation on 16bit ax
					;register
	mov	bx, ax			;Move register from base register to
					;general 16bit register
	mov	di, ax			;Move register from source index
					;integer to general 16bit register
	mov	cx, 7FFFh		;Move couter register to 
	cld				;Set DF Flag to 0
	>repne scasb			;Compare AL with byte at ES and set
					;status flag
	jcxz	007e			;Jump to 007e if CX Register is 0
	inc	bx			;Incriment base register by 1
	cmp	[es:di], al		;Compare two oprands. These oprands
					;being segment es offset di and oprand a
	jnz	0037			;Jump short to 0037 if ZF=0
	or	ch, 80h			;Logical OR on Register ch and
					;syscall interrupt
	neg	cx			
	mov	[006Eh], cx
	mov	cx, 0002h
	shl	bx, cl			;Shift Left bx and cl
	add	bx, 10h			;Add bx to BIOS Interrupt call
	and	bx, F0h			;Logical AND bx and F0h
	mov	[0072h], bx	
	mov	dx, ss
	sub	bp, dx			;subtract bp and dx
	mov	di, 45C6h
	mov	es, di
	mov	di, [es:1430h]
	cmp	di, 0200h		;Compare di and the Get Real mode
					;interrupt vector for memory extender
	jae	0075			;Jump to 0075 if above or equal to 0
					;on CF
	mov	di, 0200h		;Move di register to Get Real Mode
					;Interrupt Vector
	mov	[es:1430h], di		
	>mov	cl, 04h			;Move call counter register to Get
					;Access to Real Mode Stacks
	shr	di, cl			;Shift right
	inc	di			;Incriment Destination Index
					;register by 1
	cmp	bp, di
	jae	0083			;Jump to 0083 if above or equal to 0
					;on CF
	>nop
	push	cs			;Push the code segment register onto
					;the stack
	call	0fda			
	>mov	bx, di			;Move base register to destination
					;index register
	add	bx, dx			;Move base register to Data register
	mov	[0080h], bx
	mov	[0084h], bx
	mov	ax, [0074h]
	sub	bx, ax
	mov	es, ax
	mov	ah, 4Ah			;Move Accumulator Register to Resize
					;DOS Memory Block function
	push	di			;Pushes Destination Index register
					;to the stack
	int	21h			;DOS Interrupt 21h
	pop	di			;Pop Destination Index register from
					;the stack
	shl	di, cl
	cli				;Clear Interrupt
	mov	ss, dx			;Move Stack Segment to Data Register
	mov	sp, di			;Move Stack Pointer Register to
					;Destination Index Register
	sti				;Set Interrupt Flag
	mov	ax, 45C6h		;Move Accumulator Register to 45C6h
	mov	es, ax
	mov	[es:1430h], di
	xor	ax, ax			;Logical Operation on the
					;Accumulator Register
	mov	es, [cs:026Dh]
	mov	di, 78FCh
	mov	cx, A720h
	sub	cx, di
	cld				;Clear Direction Flag
	rep stosb			;Repeat Store String
	cmp	word [7158h], 14h	;Compare Word 7158h with 14h
	jbe	0110			;Jump to 0110 if CF or ZF=1 or below
	cmp	byte [0076h], 03h	;Compare Byte with 03h 
	jb	0110			;Jump short if below CF=1
	ja	00d7			;Jump short if above CF=0
	cmp	byte [0077h], 1Eh	;Compare byte with 1Eh
	jb	0110
	>mov	ax, 5801h
	mov	bx, 0002h		;Move base register to Segment to
					;Descriptor function
	int	21h			;DOS Interrupt 21h
	jb	010b
	mov	ah, 67h
	mov	bx, [7158h]
	int	21h			;DOS Interrupt 21h
	jb	010b
	mov	ah, 48h
	mov	bx, 0001h
	int	21h
	jb	010b
	inc	ax			;Incriment ax register by 1
	mov	[0088h], ax
	dec	ax			;Decriment ax register by 1
	mov	es, ax
	mov	ah, 49h
	int	21h			;DOS Interrupt 21h
	jb	010b
	mov	ax, 5801h
	mov	bx, 0000h
	int	21h			;DOS Interrupt 21h
	jae	0110
	>nop
	push	cs			;Push Code Segment Register onto
					;stack
	call	0fda
	>xor	bp, bp			;Logical OR on Stack Base Point
					;Register
	push	bp			;Push Stack Base Point Register
	nop
	push	cs			;Push Code segment Register
	call	3061
	pop	ax			;Pop value from Accumulator Register
	mov	es, [cs:026Dh]
	mov	si, 78A2h
	mov	di, 78E4h
	call	01e8
	;Word Pushing 
	push	word [006Ch]
	push	word [006Ah]
	push	word [0068h]
	push	word [0066h]
	push	word [0064h]
	;Back to regular code
	call
	push	ax			;Push Accumulator Register on to
					;stack
	nop
	push	cs			;Push Code Segment Register onto
					;stack
	call	1170
;======SUBROUTINE 00146======
00146 <no name>:
00146:	2e 8e 06 6d 02            mov	es, [cs:026Dh]
0014b:	56                        push	si
0014c:	57                        push	di
0014d:	be e4 78                  mov	si, 78E4h
00150:	bf fc 78                  mov	di, 78FCh
00153:	e8 d6 00                  call	022c
00156:	5f                        pop	di
00157:	5e                        pop	si
00158:	cb                        retf

00159 <no name>:
00159:	cb                        retf

0015a <no name>:
0015a:	8b ec                     mov	bp, sp
0015c:	b4 4c                     mov	ah, 4Ch
0015e:	8a 46 04                  mov	al, [bp+04h]
00161:	cd 21                     int	21h
00163:	ba 45 00                  mov	dx, 0045h
00166:	1e                        push	ds
00167:	52                        push	dx
00168:	90                        nop
00169:	0e                        push	cs
0016a:	e8 7b 0f                  call	10e8
0016d:	5a                        pop	dx
0016e:	1f                        pop	ds
0016f:	b8 03 00                  mov	ax, 0003h
00172:	50                        push	ax
00173:	90                        nop
00174:	0e                        push	cs
00175:	e8 0b 10                  call	1183

00178 <no name>:
00178:	1e                        push	ds
00179:	b8 00 35                  mov	ax, 3500h
0017c:	cd 21                     int	21h
0017e:	89 1e 54 00               mov	[0054h], bx
00182:	8c 06 56 00               mov	[0056h], es
00186:	b8 04 35                  mov	ax, 3504h
00189:	cd 21                     int	21h
0018b:	89 1e 58 00               mov	[0058h], bx
0018f:	8c 06 5a 00               mov	[005Ah], es
00193:	b8 05 35                  mov	ax, 3505h
00196:	cd 21                     int	21h
00198:	89 1e 5c 00               mov	[005Ch], bx
0019c:	8c 06 5e 00               mov	[005Eh], es
001a0:	b8 06 35                  mov	ax, 3506h
001a3:	cd 21                     int	21h
001a5:	89 1e 60 00               mov	[0060h], bx
001a9:	8c 06 62 00               mov	[0062h], es
001ad:	b8 00 25                  mov	ax, 2500h
001b0:	8c ca                     mov	dx, cs
001b2:	8e da                     mov	ds, dx
001b4:	ba 63 01                  mov	dx, 0163h
001b7:	cd 21                     int	21h
001b9:	1f                        pop	ds
001ba:	c3                        ret

001bb <no name>:
001bb:	1e                        push	ds
001bc:	b8 00 25                  mov	ax, 2500h
001bf:	c5 16 54 00               lds	dx, [0054h]
001c3:	cd 21                     int	21h
001c5:	1f                        pop	ds
001c6:	1e                        push	ds
001c7:	b8 04 25                  mov	ax, 2504h
001ca:	c5 16 58 00               lds	dx, [0058h]
001ce:	cd 21                     int	21h
001d0:	1f                        pop	ds
001d1:	1e                        push	ds
001d2:	b8 05 25                  mov	ax, 2505h
001d5:	c5 16 5c 00               lds	dx, [005Ch]
001d9:	cd 21                     int	21h
001db:	1f                        pop	ds
001dc:	1e                        push	ds
001dd:	b8 06 25                  mov	ax, 2506h
001e0:	c5 16 60 00               lds	dx, [0060h]
001e4:	cd 21                     int	21h
001e6:	1f                        pop	ds
001e7:	cb                        retf

001e8 <no name>:
001e8:	b8 00 01                 >mov	ax, 0100h
001eb:	8b d7                     mov	dx, di
001ed:	8b de                     mov	bx, si
001ef:	3b df                    >cmp	bx, di
001f1:	74 19                     jz	020c
001f3:	26 80 3f ff               cmp	byte [es:bx], FFh
001f7:	74 0e                     jz	0207
001f9:	26 8a 4f 01               mov	cl, [es:bx+01h]
001fd:	32 ed                     xor	ch, ch
001ff:	3b c8                     cmp	cx, ax
00201:	73 04                     jae	0207
00203:	8b c1                     mov	ax, cx
00205:	8b d3                     mov	dx, bx
00207:	83 c3 06                 >add	bx, 06h
0020a:	eb e3                     jmp	01ef
0020c:	3b d7                    >cmp	dx, di
0020e:	74 1b                     jz	022b
00210:	8b da                     mov	bx, dx
00212:	26 80 3f 00               cmp	byte [es:bx], 00h
00216:	26 c6 07 ff               mov	byte [es:bx], FFh
0021a:	06                        push	es
0021b:	74 07                     jz	0224
0021d:	26 ff 5f 02               call	far [es:bx+02h]
00221:	07                        pop	es
00222:	eb c4                     jmp	01e8
00224:	26 ff 57 02              >call	word [es:bx+02h]
00228:	07                        pop	es
00229:	eb bd                     jmp	01e8
0022b:	c3                       >ret

0022c <no name>:
0022c:	b4 00                    >mov	ah, 00h
0022e:	8b d7                     mov	dx, di
00230:	8b de                     mov	bx, si
00232:	3b df                    >cmp	bx, di
00234:	74 17                     jz	024d
00236:	26 80 3f ff               cmp	byte [es:bx], FFh
0023a:	74 0c                     jz	0248
0023c:	26 38 67 01               cmp	[es:bx+01h], ah
00240:	72 06                     jb	0248
00242:	26 8a 67 01               mov	ah, [es:bx+01h]
00246:	8b d3                     mov	dx, bx
00248:	83 c3 06                 >add	bx, 06h
0024b:	eb e5                     jmp	0232
0024d:	3b d7                    >cmp	dx, di
0024f:	74 1b                     jz	026c
00251:	8b da                     mov	bx, dx
00253:	26 80 3f 00               cmp	byte [es:bx], 00h
00257:	26 c6 07 ff               mov	byte [es:bx], FFh
0025b:	06                        push	es
0025c:	74 07                     jz	0265
0025e:	26 ff 5f 02               call	far [es:bx+02h]
00262:	07                        pop	es
00263:	eb c7                     jmp	022c
00265:	26 ff 57 02              >call	word [es:bx+02h]
00269:	07                        pop	es
0026a:	eb c0                     jmp	022c
0026c:	c3                       >ret
     ...

00fda <no name>:
00fda:	56                        push	si
00fdb:	57                        push	di
00fdc:	1e                        push	ds
00fdd:	b8 9a 6f                  mov	ax, 6F9Ah
00fe0:	50                        push	ax
00fe1:	90                        nop
00fe2:	0e                        push	cs
00fe3:	e8 02 01                  call	10e8
00fe6:	b8 03 00                  mov	ax, 0003h
00fe9:	50                        push	ax
00fea:	90                        nop
00feb:	0e                        push	cs
00fec:	e8 94 01                  call	1183
00fef:	83 c4 06                  add	sp, 06h
00ff2:	5f                        pop	di
00ff3:	5e                        pop	si
00ff4:	cb                        retf
     ...

010e8 <no name>:
010e8:	55                        push	bp
010e9:	8b ec                     mov	bp, sp
010eb:	56                        push	si
010ec:	57                        push	di
010ed:	ff 76 08                  push	word [bp+08h]
010f0:	ff 76 06                  push	word [bp+06h]
010f3:	90                        nop
010f4:	0e                        push	cs
010f5:	e8 45 48                  call	593d
010f8:	59                        pop	cx
010f9:	59                        pop	cx
010fa:	50                        push	ax
010fb:	ff 76 08                  push	word [bp+08h]
010fe:	ff 76 06                  push	word [bp+06h]
01101:	b8 02 00                  mov	ax, 0002h
01104:	50                        push	ax
01105:	90                        nop
01106:	0e                        push	cs
01107:	e8 85 4d                  call	5e8f
0110a:	83 c4 08                  add	sp, 08h
0110d:	5f                        pop	di
0110e:	5e                        pop	si
0110f:	5d                        pop	bp
01110:	cb                        retf
     ...

01116 <no name>:
01116:	55                        push	bp
01117:	8b ec                     mov	bp, sp
01119:	56                        push	si
0111a:	57                        push	di
0111b:	83 7e 08 00               cmp	word [bp+08h], 00h
0111f:	75 22                     jnz	1143
01121:	eb 10                     jmp	1133
01123:	ff 0e ba 6f              >dec	word [6FBAh]
01127:	8b 1e ba 6f               mov	bx, [6FBAh]
0112b:	b1 02                     mov	cl, 02h
0112d:	d3 e3                     shl	bx, cl
0112f:	ff 9f b4 a4               call	far [bx-5B4Ch]
01133:	83 3e ba 6f 00           >cmp	word [6FBAh], 00h
01138:	75 e9                     jnz	1123
0113a:	90                        nop
0113b:	0e                        push	cs
0113c:	e8 07 f0                  call	0146
0113f:	ff 1e bc 6f               call	far [6FBCh]
01143:	90                       >nop
01144:	0e                        push	cs
01145:	e8 73 f0                  call	01bb
01148:	90                        nop
01149:	0e                        push	cs
0114a:	e8 0c f0                  call	0159
0114d:	83 7e 06 00               cmp	word [bp+06h], 00h
01151:	75 17                     jnz	116a
01153:	83 7e 08 00               cmp	word [bp+08h], 00h
01157:	75 08                     jnz	1161
01159:	ff 1e c0 6f               call	far [6FC0h]
0115d:	ff 1e c4 6f               call	far [6FC4h]
01161:	ff 76 04                 >push	word [bp+04h]
01164:	90                        nop
01165:	0e                        push	cs
01166:	e8 f1 ef                  call	015a
01169:	59                        pop	cx
0116a:	5f                       >pop	di
0116b:	5e                        pop	si
0116c:	5d                        pop	bp
0116d:	c2 06 00                  ret	0006h

01170 <no name>:
01170:	55                        push	bp
01171:	8b ec                     mov	bp, sp
01173:	56                        push	si
01174:	57                        push	di
01175:	33 c0                     xor	ax, ax
01177:	50                        push	ax
01178:	50                        push	ax
01179:	ff 76 06                  push	word [bp+06h]
0117c:	e8 97 ff                  call	1116
0117f:	5f                        pop	di
01180:	5e                        pop	si
01181:	5d                        pop	bp
01182:	cb                        retf

01183 <no name>:
01183:	55                        push	bp
01184:	8b ec                     mov	bp, sp
01186:	56                        push	si
01187:	57                        push	di
01188:	b8 01 00                  mov	ax, 0001h
0118b:	50                        push	ax
0118c:	33 c0                     xor	ax, ax
0118e:	50                        push	ax
0118f:	ff 76 06                  push	word [bp+06h]
01192:	e8 81 ff                  call	1116
01195:	5f                        pop	di
01196:	5e                        pop	si
01197:	5d                        pop	bp
01198:	cb                        retf
     ...

01489 <no name>:
01489:	55                        push	bp
0148a:	8b ec                     mov	bp, sp
0148c:	56                        push	si
0148d:	57                        push	di
0148e:	8b 56 04                  mov	dx, [bp+04h]
01491:	0b d2                     or	dx, dx
01493:	7c 17                     jl	14ac
01495:	83 fa 58                  cmp	dx, 58h
01498:	7e 03                     jle	149d
0149a:	ba 57 00                 >mov	dx, 0057h
0149d:	89 16 88 71              >mov	[7188h], dx
014a1:	8b da                     mov	bx, dx
014a3:	8a 87 8a 71               mov	al, [bx+718Ah]
014a7:	98                        cbw
014a8:	8b d0                     mov	dx, ax
014aa:	eb 0e                     jmp	14ba
014ac:	f7 da                    >neg	dx
014ae:	3b 16 52 75               cmp	dx, [7552h]
014b2:	7f e6                     jg	149a
014b4:	c7 06 88 71 ff ff         mov	word [7188h], FFFFh
014ba:	89 16 78 00              >mov	[0078h], dx
014be:	b8 ff ff                  mov	ax, FFFFh
014c1:	5f                        pop	di
014c2:	5e                        pop	si
014c3:	5d                        pop	bp
014c4:	c2 02 00                  ret	0002h
     ...

03061 <no name>:
03061:	56                        push	si
03062:	57                        push	di
03063:	36 c7 06 12 00 00 00      mov	word [ss:0012h], 0000h
0306a:	36 c7 06 10 00 00 00      mov	word [ss:0010h], 0000h
03071:	36 8c 1e 18 00            mov	[ss:0018h], ds
03076:	36 c7 06 16 00 32 74      mov	word [ss:0016h], 7432h
0307d:	8c d8                     mov	ax, ds
0307f:	a3 46 74                  mov	[7446h], ax
03082:	a3 44 74                  mov	[7444h], ax
03085:	36 c4 1e 16 00            les	bx, [ss:0016h]
0308a:	26 8c 5f 22               mov	[es:bx+22h], ds
0308e:	26 c7 47 20 ca a5         mov	word [es:bx+20h], A5CAh
03094:	36 c7 06 14 00 ff ff      mov	word [ss:0014h], FFFFh
0309b:	5f                        pop	di
0309c:	5e                        pop	si
0309d:	cb                        retf
     ...

0593d <no name>:
0593d:	55                        push	bp
0593e:	8b ec                     mov	bp, sp
05940:	56                        push	si
05941:	57                        push	di
05942:	c4 7e 06                  les	di, [bp+06h]
05945:	33 c0                     xor	ax, ax
05947:	3b 46 08                  cmp	ax, [bp+08h]
0594a:	75 04                     jnz	5950
0594c:	3b c7                     cmp	ax, di
0594e:	74 0a                     jz	595a
05950:	fc                       >cld
05951:	b9 ff ff                  mov	cx, FFFFh
05954:	f2 ae                     repne scasb
05956:	91                        xchg	ax, cx
05957:	f7 d0                     not	ax
05959:	48                        dec	ax
0595a:	5f                       >pop	di
0595b:	5e                        pop	si
0595c:	5d                        pop	bp
0595d:	cb                        retf
     ...

05e8f <no name>:
05e8f:	55                        push	bp
05e90:	8b ec                     mov	bp, sp
05e92:	56                        push	si
05e93:	57                        push	di
05e94:	8b 5e 06                  mov	bx, [bp+06h]
05e97:	03 db                     add	bx, bx
05e99:	f6 87 5a 71 01            test	byte [bx+715Ah], 01h
05e9e:	74 06                     jz	5ea6
05ea0:	b8 05 00                  mov	ax, 0005h
05ea3:	50                        push	ax
05ea4:	eb 21                     jmp	5ec7
05ea6:	1e                       >push	ds
05ea7:	b4 40                     mov	ah, 40h
05ea9:	8b 5e 06                  mov	bx, [bp+06h]
05eac:	8b 4e 0c                  mov	cx, [bp+0Ch]
05eaf:	c5 56 08                  lds	dx, [bp+08h]
05eb2:	cd 21                     int	21h
05eb4:	1f                        pop	ds
05eb5:	72 0f                     jb	5ec6
05eb7:	50                        push	ax
05eb8:	8b 5e 06                  mov	bx, [bp+06h]
05ebb:	03 db                     add	bx, bx
05ebd:	81 8f 5a 71 00 10         or	word [bx+715Ah], 1000h
05ec3:	58                        pop	ax
05ec4:	eb 04                     jmp	5eca
05ec6:	50                       >push	ax
05ec7:	e8 bf b5                 >call	1489
05eca:	5f                       >pop	di
05ecb:	5e                        pop	si
05ecc:	5d                        pop	bp
05ecd:	cb                        retf
     ...
