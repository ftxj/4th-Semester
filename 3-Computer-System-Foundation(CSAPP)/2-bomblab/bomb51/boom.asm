
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a90 <_init>:
  400a90:	48 83 ec 08          	sub    rsp,0x8
  400a94:	48 8b 05 5d 35 20 00 	mov    rax,QWORD PTR [rip+0x20355d]        # 603ff8 <__gmon_start__>
  400a9b:	48 85 c0             	test   rax,rax
  400a9e:	74 05                	je     400aa5 <_init+0x15>
  400aa0:	e8 fb 00 00 00       	call   400ba0 <__gmon_start__@plt>
  400aa5:	48 83 c4 08          	add    rsp,0x8
  400aa9:	c3                   	ret    

Disassembly of section .plt:

0000000000400ab0 <.plt>:
  400ab0:	ff 35 52 35 20 00    	push   QWORD PTR [rip+0x203552]        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400ab6:	ff 25 54 35 20 00    	jmp    QWORD PTR [rip+0x203554]        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400abc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400ac0 <getenv@plt>:
  400ac0:	ff 25 52 35 20 00    	jmp    QWORD PTR [rip+0x203552]        # 604018 <getenv@GLIBC_2.2.5>
  400ac6:	68 00 00 00 00       	push   0x0
  400acb:	e9 e0 ff ff ff       	jmp    400ab0 <.plt>

0000000000400ad0 <__errno_location@plt>:
  400ad0:	ff 25 4a 35 20 00    	jmp    QWORD PTR [rip+0x20354a]        # 604020 <__errno_location@GLIBC_2.2.5>
  400ad6:	68 01 00 00 00       	push   0x1
  400adb:	e9 d0 ff ff ff       	jmp    400ab0 <.plt>

0000000000400ae0 <strcpy@plt>:
  400ae0:	ff 25 42 35 20 00    	jmp    QWORD PTR [rip+0x203542]        # 604028 <strcpy@GLIBC_2.2.5>
  400ae6:	68 02 00 00 00       	push   0x2
  400aeb:	e9 c0 ff ff ff       	jmp    400ab0 <.plt>

0000000000400af0 <puts@plt>:
  400af0:	ff 25 3a 35 20 00    	jmp    QWORD PTR [rip+0x20353a]        # 604030 <puts@GLIBC_2.2.5>
  400af6:	68 03 00 00 00       	push   0x3
  400afb:	e9 b0 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b00 <write@plt>:
  400b00:	ff 25 32 35 20 00    	jmp    QWORD PTR [rip+0x203532]        # 604038 <write@GLIBC_2.2.5>
  400b06:	68 04 00 00 00       	push   0x4
  400b0b:	e9 a0 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b10 <printf@plt>:
  400b10:	ff 25 2a 35 20 00    	jmp    QWORD PTR [rip+0x20352a]        # 604040 <printf@GLIBC_2.2.5>
  400b16:	68 05 00 00 00       	push   0x5
  400b1b:	e9 90 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b20 <alarm@plt>:
  400b20:	ff 25 22 35 20 00    	jmp    QWORD PTR [rip+0x203522]        # 604048 <alarm@GLIBC_2.2.5>
  400b26:	68 06 00 00 00       	push   0x6
  400b2b:	e9 80 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b30 <close@plt>:
  400b30:	ff 25 1a 35 20 00    	jmp    QWORD PTR [rip+0x20351a]        # 604050 <close@GLIBC_2.2.5>
  400b36:	68 07 00 00 00       	push   0x7
  400b3b:	e9 70 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b40 <read@plt>:
  400b40:	ff 25 12 35 20 00    	jmp    QWORD PTR [rip+0x203512]        # 604058 <read@GLIBC_2.2.5>
  400b46:	68 08 00 00 00       	push   0x8
  400b4b:	e9 60 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b50 <__libc_start_main@plt>:
  400b50:	ff 25 0a 35 20 00    	jmp    QWORD PTR [rip+0x20350a]        # 604060 <__libc_start_main@GLIBC_2.2.5>
  400b56:	68 09 00 00 00       	push   0x9
  400b5b:	e9 50 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b60 <fgets@plt>:
  400b60:	ff 25 02 35 20 00    	jmp    QWORD PTR [rip+0x203502]        # 604068 <fgets@GLIBC_2.2.5>
  400b66:	68 0a 00 00 00       	push   0xa
  400b6b:	e9 40 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b70 <signal@plt>:
  400b70:	ff 25 fa 34 20 00    	jmp    QWORD PTR [rip+0x2034fa]        # 604070 <signal@GLIBC_2.2.5>
  400b76:	68 0b 00 00 00       	push   0xb
  400b7b:	e9 30 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b80 <gethostbyname@plt>:
  400b80:	ff 25 f2 34 20 00    	jmp    QWORD PTR [rip+0x2034f2]        # 604078 <gethostbyname@GLIBC_2.2.5>
  400b86:	68 0c 00 00 00       	push   0xc
  400b8b:	e9 20 ff ff ff       	jmp    400ab0 <.plt>

0000000000400b90 <fprintf@plt>:
  400b90:	ff 25 ea 34 20 00    	jmp    QWORD PTR [rip+0x2034ea]        # 604080 <fprintf@GLIBC_2.2.5>
  400b96:	68 0d 00 00 00       	push   0xd
  400b9b:	e9 10 ff ff ff       	jmp    400ab0 <.plt>

0000000000400ba0 <__gmon_start__@plt>:
  400ba0:	ff 25 e2 34 20 00    	jmp    QWORD PTR [rip+0x2034e2]        # 604088 <__gmon_start__>
  400ba6:	68 0e 00 00 00       	push   0xe
  400bab:	e9 00 ff ff ff       	jmp    400ab0 <.plt>

0000000000400bb0 <strtol@plt>:
  400bb0:	ff 25 da 34 20 00    	jmp    QWORD PTR [rip+0x2034da]        # 604090 <strtol@GLIBC_2.2.5>
  400bb6:	68 0f 00 00 00       	push   0xf
  400bbb:	e9 f0 fe ff ff       	jmp    400ab0 <.plt>

0000000000400bc0 <memcpy@plt>:
  400bc0:	ff 25 d2 34 20 00    	jmp    QWORD PTR [rip+0x2034d2]        # 604098 <memcpy@GLIBC_2.14>
  400bc6:	68 10 00 00 00       	push   0x10
  400bcb:	e9 e0 fe ff ff       	jmp    400ab0 <.plt>

0000000000400bd0 <fflush@plt>:
  400bd0:	ff 25 ca 34 20 00    	jmp    QWORD PTR [rip+0x2034ca]        # 6040a0 <fflush@GLIBC_2.2.5>
  400bd6:	68 11 00 00 00       	push   0x11
  400bdb:	e9 d0 fe ff ff       	jmp    400ab0 <.plt>

0000000000400be0 <__isoc99_sscanf@plt>:
  400be0:	ff 25 c2 34 20 00    	jmp    QWORD PTR [rip+0x2034c2]        # 6040a8 <__isoc99_sscanf@GLIBC_2.7>
  400be6:	68 12 00 00 00       	push   0x12
  400beb:	e9 c0 fe ff ff       	jmp    400ab0 <.plt>

0000000000400bf0 <bcopy@plt>:
  400bf0:	ff 25 ba 34 20 00    	jmp    QWORD PTR [rip+0x2034ba]        # 6040b0 <bcopy@GLIBC_2.2.5>
  400bf6:	68 13 00 00 00       	push   0x13
  400bfb:	e9 b0 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c00 <fopen@plt>:
  400c00:	ff 25 b2 34 20 00    	jmp    QWORD PTR [rip+0x2034b2]        # 6040b8 <fopen@GLIBC_2.2.5>
  400c06:	68 14 00 00 00       	push   0x14
  400c0b:	e9 a0 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c10 <gethostname@plt>:
  400c10:	ff 25 aa 34 20 00    	jmp    QWORD PTR [rip+0x2034aa]        # 6040c0 <gethostname@GLIBC_2.2.5>
  400c16:	68 15 00 00 00       	push   0x15
  400c1b:	e9 90 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c20 <sprintf@plt>:
  400c20:	ff 25 a2 34 20 00    	jmp    QWORD PTR [rip+0x2034a2]        # 6040c8 <sprintf@GLIBC_2.2.5>
  400c26:	68 16 00 00 00       	push   0x16
  400c2b:	e9 80 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c30 <exit@plt>:
  400c30:	ff 25 9a 34 20 00    	jmp    QWORD PTR [rip+0x20349a]        # 6040d0 <exit@GLIBC_2.2.5>
  400c36:	68 17 00 00 00       	push   0x17
  400c3b:	e9 70 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c40 <connect@plt>:
  400c40:	ff 25 92 34 20 00    	jmp    QWORD PTR [rip+0x203492]        # 6040d8 <connect@GLIBC_2.2.5>
  400c46:	68 18 00 00 00       	push   0x18
  400c4b:	e9 60 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c50 <sleep@plt>:
  400c50:	ff 25 8a 34 20 00    	jmp    QWORD PTR [rip+0x20348a]        # 6040e0 <sleep@GLIBC_2.2.5>
  400c56:	68 19 00 00 00       	push   0x19
  400c5b:	e9 50 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c60 <__ctype_b_loc@plt>:
  400c60:	ff 25 82 34 20 00    	jmp    QWORD PTR [rip+0x203482]        # 6040e8 <__ctype_b_loc@GLIBC_2.3>
  400c66:	68 1a 00 00 00       	push   0x1a
  400c6b:	e9 40 fe ff ff       	jmp    400ab0 <.plt>

0000000000400c70 <socket@plt>:
  400c70:	ff 25 7a 34 20 00    	jmp    QWORD PTR [rip+0x20347a]        # 6040f0 <socket@GLIBC_2.2.5>
  400c76:	68 1b 00 00 00       	push   0x1b
  400c7b:	e9 30 fe ff ff       	jmp    400ab0 <.plt>

Disassembly of section .text:

0000000000400c80 <_start>:
  400c80:	31 ed                	xor    ebp,ebp   // 0 -> ebp
  400c82:	49 89 d1             	mov    r9,rdx	 //
  400c85:	5e                   	pop    rsi	
  400c86:	48 89 e2             	mov    rdx,rsp
  400c89:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  400c8d:	50                   	push   rax
  400c8e:	54                   	push   rsp
  400c8f:	49 c7 c0 90 22 40 00 	mov    r8,0x402290
  400c96:	48 c7 c1 20 22 40 00 	mov    rcx,0x402220
  400c9d:	48 c7 c7 6d 0d 40 00 	mov    rdi,0x400d6d
  400ca4:	e8 a7 fe ff ff       	call   400b50 <__libc_start_main@plt>
  400ca9:	f4                   	hlt    
  400caa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400cb0 <deregister_tm_clones>:
  400cb0:	b8 87 4b 60 00       	mov    eax,0x604b87
  400cb5:	55                   	push   rbp
  400cb6:	48 2d 80 4b 60 00    	sub    rax,0x604b80
  400cbc:	48 83 f8 0e          	cmp    rax,0xe
  400cc0:	48 89 e5             	mov    rbp,rsp
  400cc3:	77 02                	ja     400cc7 <deregister_tm_clones+0x17>
  400cc5:	5d                   	pop    rbp
  400cc6:	c3                   	ret    
  400cc7:	b8 00 00 00 00       	mov    eax,0x0
  400ccc:	48 85 c0             	test   rax,rax
  400ccf:	74 f4                	je     400cc5 <deregister_tm_clones+0x15>
  400cd1:	5d                   	pop    rbp
  400cd2:	bf 80 4b 60 00       	mov    edi,0x604b80
  400cd7:	ff e0                	jmp    rax
  400cd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000400ce0 <register_tm_clones>:
  400ce0:	b8 80 4b 60 00       	mov    eax,0x604b80
  400ce5:	55                   	push   rbp
  400ce6:	48 2d 80 4b 60 00    	sub    rax,0x604b80
  400cec:	48 c1 f8 03          	sar    rax,0x3
  400cf0:	48 89 e5             	mov    rbp,rsp
  400cf3:	48 89 c2             	mov    rdx,rax
  400cf6:	48 c1 ea 3f          	shr    rdx,0x3f
  400cfa:	48 01 d0             	add    rax,rdx
  400cfd:	48 d1 f8             	sar    rax,1
  400d00:	75 02                	jne    400d04 <register_tm_clones+0x24>
  400d02:	5d                   	pop    rbp
  400d03:	c3                   	ret    
  400d04:	ba 00 00 00 00       	mov    edx,0x0
  400d09:	48 85 d2             	test   rdx,rdx
  400d0c:	74 f4                	je     400d02 <register_tm_clones+0x22>
  400d0e:	5d                   	pop    rbp
  400d0f:	48 89 c6             	mov    rsi,rax
  400d12:	bf 80 4b 60 00       	mov    edi,0x604b80
  400d17:	ff e2                	jmp    rdx
  400d19:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000400d20 <__do_global_dtors_aux>:
  400d20:	80 3d 71 3e 20 00 00 	cmp    BYTE PTR [rip+0x203e71],0x0        # 604b98 <completed.6344>
  400d27:	75 11                	jne    400d3a <__do_global_dtors_aux+0x1a>
  400d29:	55                   	push   rbp
  400d2a:	48 89 e5             	mov    rbp,rsp
  400d2d:	e8 7e ff ff ff       	call   400cb0 <deregister_tm_clones>
  400d32:	5d                   	pop    rbp
  400d33:	c6 05 5e 3e 20 00 01 	mov    BYTE PTR [rip+0x203e5e],0x1        # 604b98 <completed.6344>
  400d3a:	f3 c3                	repz ret 
  400d3c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400d40 <frame_dummy>:
  400d40:	48 83 3d d8 30 20 00 	cmp    QWORD PTR [rip+0x2030d8],0x0        # 603e20 <__JCR_END__>
  400d47:	00 
  400d48:	74 1e                	je     400d68 <frame_dummy+0x28>
  400d4a:	b8 00 00 00 00       	mov    eax,0x0
  400d4f:	48 85 c0             	test   rax,rax
  400d52:	74 14                	je     400d68 <frame_dummy+0x28>
  400d54:	55                   	push   rbp
  400d55:	bf 20 3e 60 00       	mov    edi,0x603e20
  400d5a:	48 89 e5             	mov    rbp,rsp
  400d5d:	ff d0                	call   rax
  400d5f:	5d                   	pop    rbp
  400d60:	e9 7b ff ff ff       	jmp    400ce0 <register_tm_clones>
  400d65:	0f 1f 00             	nop    DWORD PTR [rax]
  400d68:	e9 73 ff ff ff       	jmp    400ce0 <register_tm_clones>

0000000000400d6d <main>:
  400d6d:	53                   	push   rbx
  400d6e:	83 ff 01             	cmp    edi,0x1
  400d71:	75 10                	jne    400d83 <main+0x16>
  400d73:	48 8b 05 0e 3e 20 00 	mov    rax,QWORD PTR [rip+0x203e0e]        # 604b88 <stdin@@GLIBC_2.2.5>
  400d7a:	48 89 05 1f 3e 20 00 	mov    QWORD PTR [rip+0x203e1f],rax        # 604ba0 <infile>
  400d81:	eb 59                	jmp    400ddc <main+0x6f>
  400d83:	48 89 f3             	mov    rbx,rsi
  400d86:	83 ff 02             	cmp    edi,0x2
  400d89:	75 35                	jne    400dc0 <main+0x53>
  400d8b:	48 8b 7e 08          	mov    rdi,QWORD PTR [rsi+0x8]
  400d8f:	be b0 22 40 00       	mov    esi,0x4022b0
  400d94:	e8 67 fe ff ff       	call   400c00 <fopen@plt>
  400d99:	48 89 05 00 3e 20 00 	mov    QWORD PTR [rip+0x203e00],rax        # 604ba0 <infile>
  400da0:	48 85 c0             	test   rax,rax
  400da3:	75 37                	jne    400ddc <main+0x6f>
  400da5:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
  400da9:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
  400dac:	bf b2 22 40 00       	mov    edi,0x4022b2
  400db1:	e8 5a fd ff ff       	call   400b10 <printf@plt>
  400db6:	bf 08 00 00 00       	mov    edi,0x8
  400dbb:	e8 70 fe ff ff       	call   400c30 <exit@plt>
  400dc0:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  400dc3:	bf cf 22 40 00       	mov    edi,0x4022cf
  400dc8:	b8 00 00 00 00       	mov    eax,0x0
  400dcd:	e8 3e fd ff ff       	call   400b10 <printf@plt>
  400dd2:	bf 08 00 00 00       	mov    edi,0x8
  400dd7:	e8 54 fe ff ff       	call   400c30 <exit@plt>
  400ddc:	e8 46 05 00 00       	call   401327 <initialize_bomb>
  400de1:	bf 38 23 40 00       	mov    edi,0x402338
  400de6:	e8 05 fd ff ff       	call   400af0 <puts@plt>
  400deb:	bf 78 23 40 00       	mov    edi,0x402378
  400df0:	e8 fb fc ff ff       	call   400af0 <puts@plt>
  400df5:	e8 54 07 00 00       	call   40154e <read_line>
  400dfa:	48 89 c7             	mov    rdi,rax // rax is your input msg
  400dfd:	e8 9e 00 00 00       	call   400ea0 <phase_1>
  400e02:	e8 6d 08 00 00       	call   401674 <phase_defused>
  400e07:	bf a8 23 40 00       	mov    edi,0x4023a8
  400e0c:	e8 df fc ff ff       	call   400af0 <puts@plt>
  400e11:	e8 38 07 00 00       	call   40154e <read_line>
  400e16:	48 89 c7             	mov    rdi,rax
  400e19:	e8 9e 00 00 00       	call   400ebc <phase_2>
  400e1e:	e8 51 08 00 00       	call   401674 <phase_defused>
  400e23:	bf e9 22 40 00       	mov    edi,0x4022e9
  400e28:	e8 c3 fc ff ff       	call   400af0 <puts@plt>
  400e2d:	e8 1c 07 00 00       	call   40154e <read_line>
  400e32:	48 89 c7             	mov    rdi,rax
  400e35:	e8 c9 00 00 00       	call   400f03 <phase_3>
  400e3a:	e8 35 08 00 00       	call   401674 <phase_defused>
  400e3f:	bf 07 23 40 00       	mov    edi,0x402307
  400e44:	e8 a7 fc ff ff       	call   400af0 <puts@plt>
  400e49:	e8 00 07 00 00       	call   40154e <read_line>
  400e4e:	48 89 c7             	mov    rdi,rax
  400e51:	e8 70 01 00 00       	call   400fc6 <phase_4>
  400e56:	e8 19 08 00 00       	call   401674 <phase_defused>
  400e5b:	bf d8 23 40 00       	mov    edi,0x4023d8
  400e60:	e8 8b fc ff ff       	call   400af0 <puts@plt>
  400e65:	e8 e4 06 00 00       	call   40154e <read_line>
  400e6a:	48 89 c7             	mov    rdi,rax
  400e6d:	e8 a5 01 00 00       	call   401017 <phase_5>
  400e72:	e8 fd 07 00 00       	call   401674 <phase_defused>
  400e77:	bf 16 23 40 00       	mov    edi,0x402316
  400e7c:	e8 6f fc ff ff       	call   400af0 <puts@plt>
  400e81:	e8 c8 06 00 00       	call   40154e <read_line>
  400e86:	48 89 c7             	mov    rdi,rax
  400e89:	e8 f6 01 00 00       	call   401084 <phase_6>
  400e8e:	e8 e1 07 00 00       	call   401674 <phase_defused>
  400e93:	b8 00 00 00 00       	mov    eax,0x0
  400e98:	5b                   	pop    rbx
  400e99:	c3                   	ret    
  400e9a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400ea0 <phase_1>: // key is :: All your base are belong to us.
  400ea0:	48 83 ec 08          	sub    rsp,0x8
  400ea4:	be 00 24 40 00       	mov    esi,0x402400  // esi is the key
  400ea9:	e8 10 04 00 00       	call   4012be <strings_not_equal>
  400eae:	85 c0                	test   eax,eax
  400eb0:	74 05                	je     400eb7 <phase_1+0x17> // if eax == 0
  400eb2:	e8 1f 06 00 00       	call   4014d6 <explode_bomb>
  400eb7:	48 83 c4 08          	add    rsp,0x8
  400ebb:	c3                   	ret    

0000000000400ebc <phase_2>: // key is :: 1 2 4 8 16 32
  400ebc:	55                   	push   rbp
  400ebd:	53                   	push   rbx
  400ebe:	48 83 ec 28          	sub    rsp,0x28
  400ec2:	48 89 e6             	mov    rsi,rsp
  400ec5:	e8 42 06 00 00       	call   40150c <read_six_numbers>
  400eca:	83 3c 24 01          	cmp    DWORD PTR [rsp],0x1
  400ece:	74 20                	je     400ef0 <phase_2+0x34> // if [rsp] is not 1
  400ed0:	e8 01 06 00 00       	call   4014d6 <explode_bomb>
  400ed5:	eb 19                	jmp    400ef0 <phase_2+0x34>
  400ed7:	8b 43 fc             	mov    eax,DWORD PTR [rbx-0x4]
  400eda:	01 c0                	add    eax,eax
  400edc:	39 03                	cmp    DWORD PTR [rbx],eax
  400ede:	74 05                	je     400ee5 <phase_2+0x29> // if eax is not [rbx] then explode
  400ee0:	e8 f1 05 00 00       	call   4014d6 <explode_bomb>
  400ee5:	48 83 c3 04          	add    rbx,0x4
  400ee9:	48 39 eb             	cmp    rbx,rbp
  400eec:	75 e9                	jne    400ed7 <phase_2+0x1b>
  400eee:	eb 0c                	jmp    400efc <phase_2+0x40>
  400ef0:	48 8d 5c 24 04       	lea    rbx,[rsp+0x4]
  400ef5:	48 8d 6c 24 18       	lea    rbp,[rsp+0x18]
  400efa:	eb db                	jmp    400ed7 <phase_2+0x1b>
  400efc:	48 83 c4 28          	add    rsp,0x28
  400f00:	5b                   	pop    rbx
  400f01:	5d                   	pop    rbp
  400f02:	c3                   	ret    

0000000000400f03 <phase_3>://key is :: 0 481
  400f03:	48 83 ec 18          	sub    rsp,0x18
  400f07:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  400f0c:	48 8d 54 24 0c       	lea    rdx,[rsp+0xc]
  400f11:	be f5 26 40 00       	mov    esi,0x4026f5
  400f16:	b8 00 00 00 00       	mov    eax,0x0
  400f1b:	e8 c0 fc ff ff       	call   400be0 <__isoc99_sscanf@plt>
  400f20:	83 f8 01             	cmp    eax,0x1
  400f23:	7f 05                	jg     400f2a <phase_3+0x27>
  400f25:	e8 ac 05 00 00       	call   4014d6 <explode_bomb>
  400f2a:	83 7c 24 0c 07       	cmp    DWORD PTR [rsp+0xc],0x7
  400f2f:	77 3c                	ja     400f6d <phase_3+0x6a> // exploed
  400f31:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  400f35:	ff 24 c5 60 24 40 00 	jmp    QWORD PTR [rax*8+0x402460] // what is this ??? use gdb to watch memary
  400f3c:	b8 e1 01 00 00       	mov    eax,0x1e1
  400f41:	eb 3b                	jmp    400f7e <phase_3+0x7b>
  400f43:	b8 fd 02 00 00       	mov    eax,0x2fd
  400f48:	eb 34                	jmp    400f7e <phase_3+0x7b>
  400f4a:	b8 6f 00 00 00       	mov    eax,0x6f
  400f4f:	eb 2d                	jmp    400f7e <phase_3+0x7b>
  400f51:	b8 bf 03 00 00       	mov    eax,0x3bf
  400f56:	eb 26                	jmp    400f7e <phase_3+0x7b>
  400f58:	b8 30 03 00 00       	mov    eax,0x330
  400f5d:	eb 1f                	jmp    400f7e <phase_3+0x7b>
  400f5f:	b8 5a 01 00 00       	mov    eax,0x15a
  400f64:	eb 18                	jmp    400f7e <phase_3+0x7b>
  400f66:	b8 2c 02 00 00       	mov    eax,0x22c
  400f6b:	eb 11                	jmp    400f7e <phase_3+0x7b>
  400f6d:	e8 64 05 00 00       	call   4014d6 <explode_bomb>
  400f72:	b8 00 00 00 00       	mov    eax,0x0
  400f77:	eb 05                	jmp    400f7e <phase_3+0x7b>
  400f79:	b8 92 01 00 00       	mov    eax,0x192
  400f7e:	3b 44 24 08          	cmp    eax,DWORD PTR [rsp+0x8]
  400f82:	74 05                	je     400f89 <phase_3+0x86> // if r
  400f84:	e8 4d 05 00 00       	call   4014d6 <explode_bomb>
  400f89:	48 83 c4 18          	add    rsp,0x18
  400f8d:	c3                   	ret    

0000000000400f8e <func4>:
  400f8e:	41 54                	push   r12
  400f90:	55                   	push   rbp
  400f91:	53                   	push   rbx
  400f92:	89 fb                	mov    ebx,edi
  400f94:	85 ff                	test   edi,edi
  400f96:	7e 24                	jle    400fbc <func4+0x2e>
  400f98:	89 f5                	mov    ebp,esi
  400f9a:	89 f0                	mov    eax,esi
  400f9c:	83 ff 01             	cmp    edi,0x1
  400f9f:	74 20                	je     400fc1 <func4+0x33>
  400fa1:	8d 7f ff             	lea    edi,[rdi-0x1]
  400fa4:	e8 e5 ff ff ff       	call   400f8e <func4>
  400fa9:	44 8d 24 28          	lea    r12d,[rax+rbp*1]
  400fad:	8d 7b fe             	lea    edi,[rbx-0x2]
  400fb0:	89 ee                	mov    esi,ebp
  400fb2:	e8 d7 ff ff ff       	call   400f8e <func4>
  400fb7:	44 01 e0             	add    eax,r12d
  400fba:	eb 05                	jmp    400fc1 <func4+0x33>
  400fbc:	b8 00 00 00 00       	mov    eax,0x0
  400fc1:	5b                   	pop    rbx
  400fc2:	5d                   	pop    rbp
  400fc3:	41 5c                	pop    r12
  400fc5:	c3                   	ret    

0000000000400fc6 <phase_4>:// key is :: 352 4	
  400fc6:	48 83 ec 18          	sub    rsp,0x18
  400fca:	48 8d 4c 24 0c       	lea    rcx,[rsp+0xc]
  400fcf:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  400fd4:	be f5 26 40 00       	mov    esi,0x4026f5
  400fd9:	b8 00 00 00 00       	mov    eax,0x0
  400fde:	e8 fd fb ff ff       	call   400be0 <__isoc99_sscanf@plt>
  400fe3:	83 f8 02             	cmp    eax,0x2 //eax must be 2 
  400fe6:	75 0c                	jne    400ff4 <phase_4+0x2e>
  400fe8:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc] // this memory is >= 4
  400fec:	83 e8 02             	sub    eax,0x2
  400fef:	83 f8 02             	cmp    eax,0x2 
  400ff2:	76 05                	jbe    400ff9 <phase_4+0x33> // eax >= 2 
  400ff4:	e8 dd 04 00 00       	call   4014d6 <explode_bomb>
  400ff9:	8b 74 24 0c          	mov    esi,DWORD PTR [rsp+0xc]
  400ffd:	bf 09 00 00 00       	mov    edi,0x9
  401002:	e8 87 ff ff ff       	call   400f8e <func4>
  401007:	3b 44 24 08          	cmp    eax,DWORD PTR [rsp+0x8]
  40100b:	74 05                	je     401012 <phase_4+0x4c>
  40100d:	e8 c4 04 00 00       	call   4014d6 <explode_bomb>
  401012:	48 83 c4 18          	add    rsp,0x18
  401016:	c3                   	ret    

0000000000401017 <phase_5>: //key is :: 5 115
  401017:	48 83 ec 18          	sub    rsp,0x18
  40101b:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  401020:	48 8d 54 24 0c       	lea    rdx,[rsp+0xc]
  401025:	be f5 26 40 00       	mov    esi,0x4026f5
  40102a:	b8 00 00 00 00       	mov    eax,0x0
  40102f:	e8 ac fb ff ff       	call   400be0 <__isoc99_sscanf@plt>
  401034:	83 f8 01             	cmp    eax,0x1
  401037:	7f 05                	jg     40103e <phase_5+0x27>
  401039:	e8 98 04 00 00       	call   4014d6 <explode_bomb>
  40103e:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  401042:	83 e0 0f             	and    eax,0xf
  401045:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  401049:	83 f8 0f             	cmp    eax,0xf
  40104c:	74 2c                	je     40107a <phase_5+0x63>
  40104e:	b9 00 00 00 00       	mov    ecx,0x0
  401053:	ba 00 00 00 00       	mov    edx,0x0

  401058:	83 c2 01             	add    edx,0x1
  40105b:	48 98                	cdqe   
  40105d:	8b 04 85 a0 24 40 00 	mov    eax,DWORD PTR [rax*4+0x4024a0]
  401064:	01 c1                	add    ecx,eax
  401066:	83 f8 0f             	cmp    eax,0xf
  401069:	75 ed                	jne    401058 <phase_5+0x41>

  40106b:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40106f:	83 fa 0f             	cmp    edx,0xf
  401072:	75 06                	jne    40107a <phase_5+0x63>
  401074:	3b 4c 24 08          	cmp    ecx,DWORD PTR [rsp+0x8]
  401078:	74 05                	je     40107f <phase_5+0x68>
  40107a:	e8 57 04 00 00       	call   4014d6 <explode_bomb>
  40107f:	48 83 c4 18          	add    rsp,0x18
  401083:	c3                   	ret    

0000000000401084 <phase_6>:// key is :: 1 5 4 2 6 3
  401084:	41 56                	push   r14 // r14 is the add of input 1 
  401086:	41 55                	push   r13 // r13 is the iteration of input from 1 to 6 (add 4 byte)
  401088:	41 54                	push   r12
  40108a:	55                   	push   rbp // rbp is the add of input 1
  40108b:	53                   	push   rbx
  40108c:	48 83 ec 50          	sub    rsp,0x50 // rsp + 0x30 is the add of input 1
  401090:	4c 8d 6c 24 30       	lea    r13,[rsp+0x30]
  401095:	4c 89 ee             	mov    rsi,r13
  401098:	e8 6f 04 00 00       	call   40150c <read_six_numbers>
  40109d:	4d 89 ee             	mov    r14,r13  
  4010a0:	41 bc 00 00 00 00    	mov    r12d,0x0  
  4010a6:	4c 89 ed             	mov    rbp,r13
  4010a9:	41 8b 45 00          	mov    eax,DWORD PTR [r13+0x0] // input of r13 add
  4010ad:	83 e8 01             	sub    eax,0x1
  4010b0:	83 f8 05             	cmp    eax,0x5
  4010b3:	76 05                	jbe    4010ba <phase_6+0x36>
  4010b5:	e8 1c 04 00 00       	call   4014d6 <explode_bomb>
  4010ba:	41 83 c4 01          	add    r12d,0x1
  4010be:	41 83 fc 06          	cmp    r12d,0x6
  4010c2:	74 22                	je     4010e6 <phase_6+0x62>
  4010c4:	44 89 e3             	mov    ebx,r12d
  4010c7:	48 63 c3             	movsxd rax,ebx
  4010ca:	8b 44 84 30          	mov    eax,DWORD PTR [rsp+rax*4+0x30]
  4010ce:	39 45 00             	cmp    DWORD PTR [rbp+0x0],eax
  4010d1:	75 05                	jne    4010d8 <phase_6+0x54>
  4010d3:	e8 fe 03 00 00       	call   4014d6 <explode_bomb>
  4010d8:	83 c3 01             	add    ebx,0x1
  4010db:	83 fb 05             	cmp    ebx,0x5
  4010de:	7e e7                	jle    4010c7 <phase_6+0x43> 
  4010e0:	49 83 c5 04          	add    r13,0x4 // r13 -> next input 
  4010e4:	eb c0                	jmp    4010a6 <phase_6+0x22>


//this block change input i to (7 - input i)  i belong to (1,6)
  4010e6:	48 8d 74 24 48       	lea    rsi,[rsp+0x48] // rsi is add of input 7 (if exist)
  4010eb:	4c 89 f0             	mov    rax,r14 // rax is add of input 1
  4010ee:	b9 07 00 00 00       	mov    ecx,0x7

  4010f3:	89 ca                	mov    edx,ecx
  4010f5:	2b 10                	sub    edx,DWORD PTR [rax] // edx = edx - input i (where i is ax/4)
  4010f7:	89 10                	mov    DWORD PTR [rax],edx
  4010f9:	48 83 c0 04          	add    rax,0x4 // rax -> next
  4010fd:	48 39 f0             	cmp    rax,rsi // rax is input 7 ?
  401100:	75 f1                	jne    4010f3 <phase_6+0x6f>



  401102:	be 00 00 00 00       	mov    esi,0x0
  401107:	eb 20                	jmp    401129 <phase_6+0xa5>

  401109:	48 8b 52 08          	mov    rdx,QWORD PTR [rdx+0x8]
  40110d:	83 c0 01             	add    eax,0x1
  401110:	39 c8                	cmp    eax,ecx
  401112:	75 f5                	jne    401109 <phase_6+0x85>
  401114:	eb 05                	jmp    40111b <phase_6+0x97>

  401116:	ba 00 43 60 00       	mov    edx,0x604300   //[0x604300] == 176 (\260) 
  40111b:	48 89 14 74          	mov    QWORD PTR [rsp+rsi*2],rdx
  40111f:	48 83 c6 04          	add    rsi,0x4 // do this 6 times
  401123:	48 83 fe 18          	cmp    rsi,0x18
  401127:	74 15                	je     40113e <phase_6+0xba> // break this block when rsi == 0x18

  401129:	8b 4c 34 30          	mov    ecx,DWORD PTR [rsp+rsi*1+0x30] // ecx is 7 - input[rsi/4]
  40112d:	83 f9 01             	cmp    ecx,0x1// 7 - input[rsi/4] <= 1?
  401130:	7e e4                	jle    401116 <phase_6+0x92> 
  401132:	b8 01 00 00 00       	mov    eax,0x1
  401137:	ba 00 43 60 00       	mov    edx,0x604300 //[0x604300] == 176 (\260) 
  40113c:	eb cb                	jmp    401109 <phase_6+0x85>




  40113e:	48 8b 1c 24          	mov    rbx,QWORD PTR [rsp]
  401142:	48 8d 44 24 08       	lea    rax,[rsp+0x8] //rax is the iterator of rsp(+8) 
  401147:	48 8d 74 24 30       	lea    rsi,[rsp+0x30]//rsi is the end of iter
  40114c:	48 89 d9             	mov    rcx,rbx // rcx is add to

  40114f:	48 8b 10             	mov    rdx,QWORD PTR [rax] 
  401152:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
  401156:	48 83 c0 08          	add    rax,0x8
  40115a:	48 39 f0             	cmp    rax,rsi
  40115d:	74 05                	je     401164 <phase_6+0xe0> // break;
  40115f:	48 89 d1             	mov    rcx,rdx // rdx is an add
  401162:	eb eb                	jmp    40114f <phase_6+0xcb> // continue loop;


// list from big to small 
  401164:	48 c7 42 08 00 00 00 	mov    QWORD PTR [rdx+0x8],0x0
  40116b:	00 
  40116c:	bd 05 00 00 00       	mov    ebp,0x5
  401171:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
  401175:	8b 00                	mov    eax,DWORD PTR [rax]
  401177:	39 03                	cmp    DWORD PTR [rbx],eax
  401179:	7d 05                	jge    401180 <phase_6+0xfc>
  40117b:	e8 56 03 00 00       	call   4014d6 <explode_bomb>
  401180:	48 8b 5b 08          	mov    rbx,QWORD PTR [rbx+0x8]
  401184:	83 ed 01             	sub    ebp,0x1
  401187:	75 e8                	jne    401171 <phase_6+0xed>


  401189:	48 83 c4 50          	add    rsp,0x50
  40118d:	5b                   	pop    rbx
  40118e:	5d                   	pop    rbp
  40118f:	41 5c                	pop    r12
  401191:	41 5d                	pop    r13
  401193:	41 5e                	pop    r14
  401195:	c3                   	ret    




0000000000401196 <fun7>:
// edx is the value of this leaf, edi is the indoor of tree
  401196:	48 83 ec 08          	sub    rsp,0x8
  40119a:	48 85 ff             	test   rdi,rdi
  40119d:	74 2b                	je     4011ca <fun7+0x34> // leaf == NULL ,bomb

  40119f:	8b 17                	mov    edx,DWORD PTR [rdi] 
  4011a1:	39 f2                	cmp    edx,esi  
  4011a3:	7e 0d                	jle    4011b2 <fun7+0x1c> // if your leaf <= input, goto r

  4011a5:	48 8b 7f 08          	mov    rdi,QWORD PTR [rdi+0x8]//left leaf
  4011a9:	e8 e8 ff ff ff       	call   401196 <fun7>

  4011ae:	01 c0                	add    eax,eax 
  4011b0:	eb 1d                	jmp    4011cf <fun7+0x39> // return eax*2

//r:
  4011b2:	b8 00 00 00 00       	mov    eax,0x0
  4011b7:	39 f2                	cmp    edx,esi // if your input = leaf ,return 0
  4011b9:	74 14                	je     4011cf <fun7+0x39>

  4011bb:	48 8b 7f 10          	mov    rdi,QWORD PTR [rdi+0x10]// right leaf
  4011bf:	e8 d2 ff ff ff       	call   401196 <fun7>

  4011c4:	8d 44 00 01          	lea    eax,[rax+rax*1+0x1] // eax = 2 * rax + 1
  4011c8:	eb 05                	jmp    4011cf <fun7+0x39>//return eax

  4011ca:	b8 ff ff ff ff       	mov    eax,0xffffffff // return -1
  4011cf:	48 83 c4 08          	add    rsp,0x8
  4011d3:	c3                   	ret    

00000000004011d4 <secret_phase>:// the key is :: 20 // 22
  4011d4:	53                   	push   rbx
  4011d5:	e8 74 03 00 00       	call   40154e <read_line>
  4011da:	ba 0a 00 00 00       	mov    edx,0xa
  4011df:	be 00 00 00 00       	mov    esi,0x0
  4011e4:	48 89 c7             	mov    rdi,rax //rdi is the input address
  4011e7:	e8 c4 f9 ff ff       	call   400bb0 <strtol@plt>

  4011ec:	48 89 c3             	mov    rbx,rax //rax is pre two input
  4011ef:	8d 40 ff             	lea    eax,[rax-0x1] 
  4011f2:	3d e8 03 00 00       	cmp    eax,0x3e8// pre two input <= 505
  4011f7:	76 05                	jbe    4011fe <secret_phase+0x2a> 
  4011f9:	e8 d8 02 00 00       	call   4014d6 <explode_bomb>

  4011fe:	89 de                	mov    esi,ebx//pre two input
  401200:	bf 20 41 60 00       	mov    edi,0x604120 // this memory is "$", and this is the indoor of tree
  401205:	e8 8c ff ff ff       	call   401196 <fun7>
  40120a:	83 f8 02             	cmp    eax,0x2 // eax = 2
  40120d:	74 05                	je     401214 <secret_phase+0x40>
  40120f:	e8 c2 02 00 00       	call   4014d6 <explode_bomb>
  401214:	bf 20 24 40 00       	mov    edi,0x402420
  401219:	e8 d2 f8 ff ff       	call   400af0 <puts@plt>
  40121e:	e8 51 04 00 00       	call   401674 <phase_defused>
  401223:	5b                   	pop    rbx
  401224:	c3                   	ret    
  401225:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40122c:	00 00 00 
  40122f:	90                   	nop





0000000000401230 <sig_handler>:
  401230:	48 83 ec 08          	sub    rsp,0x8
  401234:	bf e0 24 40 00       	mov    edi,0x4024e0
  401239:	e8 b2 f8 ff ff       	call   400af0 <puts@plt>
  40123e:	bf 03 00 00 00       	mov    edi,0x3
  401243:	e8 08 fa ff ff       	call   400c50 <sleep@plt>
  401248:	bf 71 26 40 00       	mov    edi,0x402671
  40124d:	b8 00 00 00 00       	mov    eax,0x0
  401252:	e8 b9 f8 ff ff       	call   400b10 <printf@plt>
  401257:	48 8b 3d 22 39 20 00 	mov    rdi,QWORD PTR [rip+0x203922]        # 604b80 <stdout@@GLIBC_2.2.5>
  40125e:	e8 6d f9 ff ff       	call   400bd0 <fflush@plt>
  401263:	bf 01 00 00 00       	mov    edi,0x1
  401268:	e8 e3 f9 ff ff       	call   400c50 <sleep@plt>
  40126d:	bf 79 26 40 00       	mov    edi,0x402679
  401272:	e8 79 f8 ff ff       	call   400af0 <puts@plt>
  401277:	bf 10 00 00 00       	mov    edi,0x10
  40127c:	e8 af f9 ff ff       	call   400c30 <exit@plt>

0000000000401281 <invalid_phase>:
  401281:	48 83 ec 08          	sub    rsp,0x8
  401285:	48 89 fe             	mov    rsi,rdi
  401288:	bf 81 26 40 00       	mov    edi,0x402681
  40128d:	b8 00 00 00 00       	mov    eax,0x0
  401292:	e8 79 f8 ff ff       	call   400b10 <printf@plt>
  401297:	bf 08 00 00 00       	mov    edi,0x8
  40129c:	e8 8f f9 ff ff       	call   400c30 <exit@plt>

00000000004012a1 <string_length>:
  4012a1:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  4012a4:	74 12                	je     4012b8 <string_length+0x17>
  4012a6:	48 89 fa             	mov    rdx,rdi
  4012a9:	48 83 c2 01          	add    rdx,0x1
  4012ad:	89 d0                	mov    eax,edx
  4012af:	29 f8                	sub    eax,edi
  4012b1:	80 3a 00             	cmp    BYTE PTR [rdx],0x0
  4012b4:	75 f3                	jne    4012a9 <string_length+0x8>
  4012b6:	f3 c3                	repz ret 
  4012b8:	b8 00 00 00 00       	mov    eax,0x0
  4012bd:	c3                   	ret    

00000000004012be <strings_not_equal>:
  4012be:	41 54                	push   r12
  4012c0:	55                   	push   rbp
  4012c1:	53                   	push   rbx   //  1 : mov esi,0x402400, sub sp 8
  4012c2:	48 89 fb             	mov    rbx,rdi
  4012c5:	48 89 f5             	mov    rbp,rsi
  4012c8:	e8 d4 ff ff ff       	call   4012a1 <string_length>
  4012cd:	41 89 c4             	mov    r12d,eax
  4012d0:	48 89 ef             	mov    rdi,rbp
  4012d3:	e8 c9 ff ff ff       	call   4012a1 <string_length>
  4012d8:	ba 01 00 00 00       	mov    edx,0x1
  4012dd:	41 39 c4             	cmp    r12d,eax
  4012e0:	75 3e                	jne    401320 <strings_not_equal+0x62>  // judgment length, if jmp then bomb
  4012e2:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
  4012e5:	84 c0                	test   al,al
  4012e7:	74 24                	je     40130d <strings_not_equal+0x4f>  // success when run this jmp
  4012e9:	3a 45 00             	cmp    al,BYTE PTR [rbp+0x0]
  4012ec:	74 09                	je     4012f7 <strings_not_equal+0x39>  
  4012ee:	66 90                	xchg   ax,ax
  4012f0:	eb 22                	jmp    401314 <strings_not_equal+0x56> // not run this jmp
  4012f2:	3a 45 00             	cmp    al,BYTE PTR [rbp+0x0]
  4012f5:	75 24                	jne    40131b <strings_not_equal+0x5d> // not run this jmp
  4012f7:	48 83 c3 01          	add    rbx,0x1
  4012fb:	48 83 c5 01          	add    rbp,0x1
  4012ff:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
  401302:	84 c0                	test   al,al
  401304:	75 ec                	jne    4012f2 <strings_not_equal+0x34>
  401306:	ba 00 00 00 00       	mov    edx,0x0
  40130b:	eb 13                	jmp    401320 <strings_not_equal+0x62> 
  40130d:	ba 00 00 00 00       	mov    edx,0x0
  401312:	eb 0c                	jmp    401320 <strings_not_equal+0x62>
  401314:	ba 01 00 00 00       	mov    edx,0x1
  401319:	eb 05                	jmp    401320 <strings_not_equal+0x62>
  40131b:	ba 01 00 00 00       	mov    edx,0x1
  401320:	89 d0                	mov    eax,edx
  401322:	5b                   	pop    rbx
  401323:	5d                   	pop    rbp
  401324:	41 5c                	pop    r12
  401326:	c3                   	ret    

0000000000401327 <initialize_bomb>:
  401327:	48 81 ec 48 20 00 00 	sub    rsp,0x2048
  40132e:	be 30 12 40 00       	mov    esi,0x401230
  401333:	bf 02 00 00 00       	mov    edi,0x2
  401338:	e8 33 f8 ff ff       	call   400b70 <signal@plt>
  40133d:	be 40 00 00 00       	mov    esi,0x40
  401342:	48 8d bc 24 00 20 00 	lea    rdi,[rsp+0x2000]
  401349:	00 
  40134a:	e8 c1 f8 ff ff       	call   400c10 <gethostname@plt>
  40134f:	85 c0                	test   eax,eax
  401351:	74 14                	je     401367 <initialize_bomb+0x40>
  401353:	bf 18 25 40 00       	mov    edi,0x402518
  401358:	e8 93 f7 ff ff       	call   400af0 <puts@plt>
  40135d:	bf 08 00 00 00       	mov    edi,0x8
  401362:	e8 c9 f8 ff ff       	call   400c30 <exit@plt>
  401367:	48 89 e7             	mov    rdi,rsp
  40136a:	e8 9b 0c 00 00       	call   40200a <init_driver>
  40136f:	85 c0                	test   eax,eax
  401371:	79 1c                	jns    40138f <initialize_bomb+0x68>
  401373:	48 89 e6             	mov    rsi,rsp
  401376:	bf 92 26 40 00       	mov    edi,0x402692
  40137b:	b8 00 00 00 00       	mov    eax,0x0
  401380:	e8 8b f7 ff ff       	call   400b10 <printf@plt>
  401385:	bf 08 00 00 00       	mov    edi,0x8
  40138a:	e8 a1 f8 ff ff       	call   400c30 <exit@plt>
  40138f:	48 81 c4 48 20 00 00 	add    rsp,0x2048
  401396:	c3                   	ret    

0000000000401397 <initialize_bomb_solve>:
  401397:	f3 c3                	repz ret 

0000000000401399 <blank_line>:
  401399:	55                   	push   rbp
  40139a:	53                   	push   rbx
  40139b:	48 83 ec 08          	sub    rsp,0x8
  40139f:	48 89 fb             	mov    rbx,rdi
  4013a2:	eb 17                	jmp    4013bb <blank_line+0x22>
  4013a4:	e8 b7 f8 ff ff       	call   400c60 <__ctype_b_loc@plt>
  4013a9:	48 83 c3 01          	add    rbx,0x1
  4013ad:	48 0f be ed          	movsx  rbp,bpl
  4013b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  4013b4:	f6 44 68 01 20       	test   BYTE PTR [rax+rbp*2+0x1],0x20
  4013b9:	74 0f                	je     4013ca <blank_line+0x31>
  4013bb:	0f b6 2b             	movzx  ebp,BYTE PTR [rbx]
  4013be:	40 84 ed             	test   bpl,bpl
  4013c1:	75 e1                	jne    4013a4 <blank_line+0xb>
  4013c3:	b8 01 00 00 00       	mov    eax,0x1
  4013c8:	eb 05                	jmp    4013cf <blank_line+0x36>
  4013ca:	b8 00 00 00 00       	mov    eax,0x0
  4013cf:	48 83 c4 08          	add    rsp,0x8
  4013d3:	5b                   	pop    rbx
  4013d4:	5d                   	pop    rbp
  4013d5:	c3                   	ret    

00000000004013d6 <skip>:
  4013d6:	53                   	push   rbx
  4013d7:	48 63 05 be 37 20 00 	movsxd rax,DWORD PTR [rip+0x2037be]        # 604b9c <num_input_strings>
  4013de:	48 8d 3c 80          	lea    rdi,[rax+rax*4]
  4013e2:	48 c1 e7 04          	shl    rdi,0x4
  4013e6:	48 81 c7 c0 4b 60 00 	add    rdi,0x604bc0
  4013ed:	48 8b 15 ac 37 20 00 	mov    rdx,QWORD PTR [rip+0x2037ac]        # 604ba0 <infile>
  4013f4:	be 50 00 00 00       	mov    esi,0x50
  4013f9:	e8 62 f7 ff ff       	call   400b60 <fgets@plt>
  4013fe:	48 89 c3             	mov    rbx,rax
  401401:	48 85 c0             	test   rax,rax
  401404:	74 0c                	je     401412 <skip+0x3c>
  401406:	48 89 c7             	mov    rdi,rax
  401409:	e8 8b ff ff ff       	call   401399 <blank_line>
  40140e:	85 c0                	test   eax,eax
  401410:	75 c5                	jne    4013d7 <skip+0x1>
  401412:	48 89 d8             	mov    rax,rbx
  401415:	5b                   	pop    rbx
  401416:	c3                   	ret    

0000000000401417 <send_msg>:
  401417:	48 81 ec 08 40 00 00 	sub    rsp,0x4008
  40141e:	89 fe                	mov    esi,edi
  401420:	44 8b 05 75 37 20 00 	mov    r8d,DWORD PTR [rip+0x203775]        # 604b9c <num_input_strings>
  401427:	41 8d 40 ff          	lea    eax,[r8-0x1]
  40142b:	48 98                	cdqe   
  40142d:	4c 8d 0c 80          	lea    r9,[rax+rax*4]
  401431:	49 c1 e1 04          	shl    r9,0x4
  401435:	49 81 c1 c0 4b 60 00 	add    r9,0x604bc0
  40143c:	4c 89 cf             	mov    rdi,r9
  40143f:	b8 00 00 00 00       	mov    eax,0x0
  401444:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  40144b:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  40144d:	48 f7 d1             	not    rcx
  401450:	48 83 c1 63          	add    rcx,0x63
  401454:	48 81 f9 00 20 00 00 	cmp    rcx,0x2000
  40145b:	76 14                	jbe    401471 <send_msg+0x5a>
  40145d:	bf 50 25 40 00       	mov    edi,0x402550
  401462:	e8 a9 f6 ff ff       	call   400b10 <printf@plt>
  401467:	bf 08 00 00 00       	mov    edi,0x8
  40146c:	e8 bf f7 ff ff       	call   400c30 <exit@plt>
  401471:	85 f6                	test   esi,esi
  401473:	b8 ac 26 40 00       	mov    eax,0x4026ac
  401478:	b9 b4 26 40 00       	mov    ecx,0x4026b4
  40147d:	48 0f 45 c8          	cmovne rcx,rax
  401481:	8b 15 d9 32 20 00    	mov    edx,DWORD PTR [rip+0x2032d9]        # 604760 <bomb_id>
  401487:	be bd 26 40 00       	mov    esi,0x4026bd
  40148c:	48 8d bc 24 00 20 00 	lea    rdi,[rsp+0x2000]
  401493:	00 
  401494:	b8 00 00 00 00       	mov    eax,0x0
  401499:	e8 82 f7 ff ff       	call   400c20 <sprintf@plt>
  40149e:	48 89 e1             	mov    rcx,rsp
  4014a1:	ba 00 00 00 00       	mov    edx,0x0
  4014a6:	48 8d b4 24 00 20 00 	lea    rsi,[rsp+0x2000]
  4014ad:	00 
  4014ae:	bf 60 43 60 00       	mov    edi,0x604360
  4014b3:	e8 f0 0c 00 00       	call   4021a8 <driver_post>
  4014b8:	85 c0                	test   eax,eax
  4014ba:	79 12                	jns    4014ce <send_msg+0xb7>
  4014bc:	48 89 e7             	mov    rdi,rsp
  4014bf:	e8 2c f6 ff ff       	call   400af0 <puts@plt>
  4014c4:	bf 00 00 00 00       	mov    edi,0x0
  4014c9:	e8 62 f7 ff ff       	call   400c30 <exit@plt>
  4014ce:	48 81 c4 08 40 00 00 	add    rsp,0x4008
  4014d5:	c3                   	ret    

00000000004014d6 <explode_bomb>:
  4014d6:	48 83 ec 08          	sub    rsp,0x8
  4014da:	bf 00 00 00 00       	mov    edi,0x0
  4014df:	e8 33 ff ff ff       	call   401417 <send_msg>
  4014e4:	bf c9 26 40 00       	mov    edi,0x4026c9
  4014e9:	e8 02 f6 ff ff       	call   400af0 <puts@plt>
  4014ee:	bf d2 26 40 00       	mov    edi,0x4026d2
  4014f3:	e8 f8 f5 ff ff       	call   400af0 <puts@plt>
  4014f8:	bf 78 25 40 00       	mov    edi,0x402578
  4014fd:	e8 ee f5 ff ff       	call   400af0 <puts@plt>
  401502:	bf 08 00 00 00       	mov    edi,0x8
  401507:	e8 24 f7 ff ff       	call   400c30 <exit@plt>

000000000040150c <read_six_numbers>:
  40150c:	48 83 ec 18          	sub    rsp,0x18
  401510:	48 89 f2             	mov    rdx,rsi
  401513:	48 8d 4e 04          	lea    rcx,[rsi+0x4]
  401517:	48 8d 46 14          	lea    rax,[rsi+0x14]
  40151b:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  401520:	48 8d 46 10          	lea    rax,[rsi+0x10]
  401524:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  401528:	4c 8d 4e 0c          	lea    r9,[rsi+0xc]
  40152c:	4c 8d 46 08          	lea    r8,[rsi+0x8]
  401530:	be e9 26 40 00       	mov    esi,0x4026e9
  401535:	b8 00 00 00 00       	mov    eax,0x0
  40153a:	e8 a1 f6 ff ff       	call   400be0 <__isoc99_sscanf@plt>
  40153f:	83 f8 05             	cmp    eax,0x5 
  401542:	7f 05                	jg     401549 <read_six_numbers+0x3d> // input less 5 , explode
  401544:	e8 8d ff ff ff       	call   4014d6 <explode_bomb>
  401549:	48 83 c4 18          	add    rsp,0x18
  40154d:	c3                   	ret    

000000000040154e <read_line>:
  40154e:	48 83 ec 08          	sub    rsp,0x8
  401552:	b8 00 00 00 00       	mov    eax,0x0
  401557:	e8 7a fe ff ff       	call   4013d6 <skip>
  40155c:	48 85 c0             	test   rax,rax
  40155f:	75 6e                	jne    4015cf <read_line+0x81>
  401561:	48 8b 05 20 36 20 00 	mov    rax,QWORD PTR [rip+0x203620]        # 604b88 <stdin@@GLIBC_2.2.5>
  401568:	48 39 05 31 36 20 00 	cmp    QWORD PTR [rip+0x203631],rax        # 604ba0 <infile>
  40156f:	75 14                	jne    401585 <read_line+0x37>
  401571:	bf fb 26 40 00       	mov    edi,0x4026fb
  401576:	e8 75 f5 ff ff       	call   400af0 <puts@plt>
  40157b:	bf 08 00 00 00       	mov    edi,0x8
  401580:	e8 ab f6 ff ff       	call   400c30 <exit@plt>
  401585:	bf 19 27 40 00       	mov    edi,0x402719
  40158a:	e8 31 f5 ff ff       	call   400ac0 <getenv@plt>
  40158f:	48 85 c0             	test   rax,rax
  401592:	74 0a                	je     40159e <read_line+0x50>
  401594:	bf 00 00 00 00       	mov    edi,0x0
  401599:	e8 92 f6 ff ff       	call   400c30 <exit@plt>
  40159e:	48 8b 05 e3 35 20 00 	mov    rax,QWORD PTR [rip+0x2035e3]        # 604b88 <stdin@@GLIBC_2.2.5>
  4015a5:	48 89 05 f4 35 20 00 	mov    QWORD PTR [rip+0x2035f4],rax        # 604ba0 <infile>
  4015ac:	b8 00 00 00 00       	mov    eax,0x0
  4015b1:	e8 20 fe ff ff       	call   4013d6 <skip>
  4015b6:	48 85 c0             	test   rax,rax
  4015b9:	75 14                	jne    4015cf <read_line+0x81>
  4015bb:	bf fb 26 40 00       	mov    edi,0x4026fb
  4015c0:	e8 2b f5 ff ff       	call   400af0 <puts@plt>
  4015c5:	bf 00 00 00 00       	mov    edi,0x0
  4015ca:	e8 61 f6 ff ff       	call   400c30 <exit@plt>
  4015cf:	8b 15 c7 35 20 00    	mov    edx,DWORD PTR [rip+0x2035c7]        # 604b9c <num_input_strings>
  4015d5:	48 63 c2             	movsxd rax,edx
  4015d8:	48 8d 34 80          	lea    rsi,[rax+rax*4]
  4015dc:	48 c1 e6 04          	shl    rsi,0x4
  4015e0:	48 81 c6 c0 4b 60 00 	add    rsi,0x604bc0
  4015e7:	48 89 f7             	mov    rdi,rsi
  4015ea:	b8 00 00 00 00       	mov    eax,0x0
  4015ef:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  4015f6:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  4015f8:	48 f7 d1             	not    rcx
  4015fb:	48 83 e9 01          	sub    rcx,0x1
  4015ff:	83 f9 4e             	cmp    ecx,0x4e
  401602:	7e 46                	jle    40164a <read_line+0xfc>
  401604:	bf 24 27 40 00       	mov    edi,0x402724
  401609:	e8 e2 f4 ff ff       	call   400af0 <puts@plt>
  40160e:	8b 05 88 35 20 00    	mov    eax,DWORD PTR [rip+0x203588]        # 604b9c <num_input_strings>
  401614:	8d 50 01             	lea    edx,[rax+0x1]
  401617:	89 15 7f 35 20 00    	mov    DWORD PTR [rip+0x20357f],edx        # 604b9c <num_input_strings>
  40161d:	48 98                	cdqe   
  40161f:	48 6b c0 50          	imul   rax,rax,0x50
  401623:	48 bf 2a 2a 2a 74 72 	movabs rdi,0x636e7572742a2a2a
  40162a:	75 6e 63 
  40162d:	48 89 b8 c0 4b 60 00 	mov    QWORD PTR [rax+0x604bc0],rdi
  401634:	48 bf 61 74 65 64 2a 	movabs rdi,0x2a2a2a64657461
  40163b:	2a 2a 00 
  40163e:	48 89 b8 c8 4b 60 00 	mov    QWORD PTR [rax+0x604bc8],rdi
  401645:	e8 8c fe ff ff       	call   4014d6 <explode_bomb>
  40164a:	83 e9 01             	sub    ecx,0x1
  40164d:	48 63 c9             	movsxd rcx,ecx
  401650:	48 63 c2             	movsxd rax,edx
  401653:	48 8d 04 80          	lea    rax,[rax+rax*4]
  401657:	48 c1 e0 04          	shl    rax,0x4
  40165b:	c6 84 01 c0 4b 60 00 	mov    BYTE PTR [rcx+rax*1+0x604bc0],0x0
  401662:	00 
  401663:	83 c2 01             	add    edx,0x1
  401666:	89 15 30 35 20 00    	mov    DWORD PTR [rip+0x203530],edx        # 604b9c <num_input_strings>
  40166c:	48 89 f0             	mov    rax,rsi
  40166f:	48 83 c4 08          	add    rsp,0x8
  401673:	c3                   	ret    

0000000000401674 <phase_defused>:
  401674:	48 83 ec 68          	sub    rsp,0x68
  401678:	bf 01 00 00 00       	mov    edi,0x1
  40167d:	e8 95 fd ff ff       	call   401417 <send_msg>
  401682:	83 3d 13 35 20 00 06 	cmp    DWORD PTR [rip+0x203513],0x6        # 604b9c <num_input_strings>
  401689:	75 6d                	jne    4016f8 <phase_defused+0x84>
  40168b:	4c 8d 44 24 10       	lea    r8,[rsp+0x10]
  401690:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  401695:	48 8d 54 24 0c       	lea    rdx,[rsp+0xc]
  40169a:	be 3f 27 40 00       	mov    esi,0x40273f // "%d %d %s"
  40169f:	bf b0 4c 60 00       	mov    edi,0x604cb0 // "352 4"
  4016a4:	b8 00 00 00 00       	mov    eax,0x0
  4016a9:	e8 32 f5 ff ff       	call   400be0 <__isoc99_sscanf@plt>
  4016ae:	83 f8 03             	cmp    eax,0x3 //eax == 3
  4016b1:	75 31                	jne    4016e4 <phase_defused+0x70>
  4016b3:	be 48 27 40 00       	mov    esi,0x402748  //DrEvil
  4016b8:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4016bd:	e8 fc fb ff ff       	call   4012be <strings_not_equal> // esi
  4016c2:	85 c0                	test   eax,eax //eax == 0 
  4016c4:	75 1e                	jne    4016e4 <phase_defused+0x70>
  4016c6:	bf a0 25 40 00       	mov    edi,0x4025a0
  4016cb:	e8 20 f4 ff ff       	call   400af0 <puts@plt>
  4016d0:	bf c8 25 40 00       	mov    edi,0x4025c8
  4016d5:	e8 16 f4 ff ff       	call   400af0 <puts@plt>
  4016da:	b8 00 00 00 00       	mov    eax,0x0
  4016df:	e8 f0 fa ff ff       	call   4011d4 <secret_phase>

  4016e4:	bf 00 26 40 00       	mov    edi,0x402600
  4016e9:	e8 02 f4 ff ff       	call   400af0 <puts@plt>
  4016ee:	bf 30 26 40 00       	mov    edi,0x402630
  4016f3:	e8 f8 f3 ff ff       	call   400af0 <puts@plt>
  4016f8:	48 83 c4 68          	add    rsp,0x68
  4016fc:	c3                   	ret    
  4016fd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000401700 <sigalrm_handler>:
  401700:	48 83 ec 08          	sub    rsp,0x8
  401704:	ba 00 00 00 00       	mov    edx,0x0
  401709:	be 60 27 40 00       	mov    esi,0x402760
  40170e:	48 8b 3d 7b 34 20 00 	mov    rdi,QWORD PTR [rip+0x20347b]        # 604b90 <stderr@@GLIBC_2.2.5>
  401715:	b8 00 00 00 00       	mov    eax,0x0
  40171a:	e8 71 f4 ff ff       	call   400b90 <fprintf@plt>
  40171f:	bf 01 00 00 00       	mov    edi,0x1
  401724:	e8 07 f5 ff ff       	call   400c30 <exit@plt>

0000000000401729 <rio_readlineb>:
  401729:	41 57                	push   r15
  40172b:	41 56                	push   r14
  40172d:	41 55                	push   r13
  40172f:	41 54                	push   r12
  401731:	55                   	push   rbp
  401732:	53                   	push   rbx
  401733:	48 83 ec 38          	sub    rsp,0x38
  401737:	49 89 f6             	mov    r14,rsi
  40173a:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
  40173f:	48 83 fa 01          	cmp    rdx,0x1
  401743:	0f 86 c2 00 00 00    	jbe    40180b <rio_readlineb+0xe2>
  401749:	48 89 fb             	mov    rbx,rdi
  40174c:	41 bd 01 00 00 00    	mov    r13d,0x1
  401752:	4c 8d 67 10          	lea    r12,[rdi+0x10]
  401756:	eb 2e                	jmp    401786 <rio_readlineb+0x5d>
  401758:	ba 00 20 00 00       	mov    edx,0x2000
  40175d:	4c 89 e6             	mov    rsi,r12
  401760:	8b 3b                	mov    edi,DWORD PTR [rbx]
  401762:	e8 d9 f3 ff ff       	call   400b40 <read@plt>
  401767:	89 43 04             	mov    DWORD PTR [rbx+0x4],eax
  40176a:	85 c0                	test   eax,eax
  40176c:	79 0f                	jns    40177d <rio_readlineb+0x54>
  40176e:	e8 5d f3 ff ff       	call   400ad0 <__errno_location@plt>
  401773:	83 38 04             	cmp    DWORD PTR [rax],0x4
  401776:	74 0e                	je     401786 <rio_readlineb+0x5d>
  401778:	e9 9d 00 00 00       	jmp    40181a <rio_readlineb+0xf1>
  40177d:	85 c0                	test   eax,eax
  40177f:	90                   	nop
  401780:	74 6c                	je     4017ee <rio_readlineb+0xc5>
  401782:	4c 89 63 08          	mov    QWORD PTR [rbx+0x8],r12
  401786:	8b 6b 04             	mov    ebp,DWORD PTR [rbx+0x4]
  401789:	85 ed                	test   ebp,ebp
  40178b:	7e cb                	jle    401758 <rio_readlineb+0x2f>
  40178d:	85 ed                	test   ebp,ebp
  40178f:	41 0f 95 c7          	setne  r15b
  401793:	41 0f b6 c7          	movzx  eax,r15b
  401797:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40179b:	45 0f b6 ff          	movzx  r15d,r15b
  40179f:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
  4017a3:	4c 89 fa             	mov    rdx,r15
  4017a6:	48 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],rcx
  4017ab:	48 89 ce             	mov    rsi,rcx
  4017ae:	48 8d 7c 24 2f       	lea    rdi,[rsp+0x2f]
  4017b3:	e8 08 f4 ff ff       	call   400bc0 <memcpy@plt>
  4017b8:	4c 03 7c 24 10       	add    r15,QWORD PTR [rsp+0x10]
  4017bd:	4c 89 7b 08          	mov    QWORD PTR [rbx+0x8],r15
  4017c1:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  4017c5:	29 c5                	sub    ebp,eax
  4017c7:	89 6b 04             	mov    DWORD PTR [rbx+0x4],ebp
  4017ca:	83 f8 01             	cmp    eax,0x1
  4017cd:	75 13                	jne    4017e2 <rio_readlineb+0xb9>
  4017cf:	49 83 c6 01          	add    r14,0x1
  4017d3:	0f b6 44 24 2f       	movzx  eax,BYTE PTR [rsp+0x2f]
  4017d8:	41 88 46 ff          	mov    BYTE PTR [r14-0x1],al
  4017dc:	3c 0a                	cmp    al,0xa
  4017de:	75 18                	jne    4017f8 <rio_readlineb+0xcf>
  4017e0:	eb 2f                	jmp    401811 <rio_readlineb+0xe8>
  4017e2:	83 7c 24 0c 00       	cmp    DWORD PTR [rsp+0xc],0x0
  4017e7:	75 3a                	jne    401823 <rio_readlineb+0xfa>
  4017e9:	44 89 e8             	mov    eax,r13d
  4017ec:	eb 03                	jmp    4017f1 <rio_readlineb+0xc8>
  4017ee:	44 89 e8             	mov    eax,r13d
  4017f1:	83 f8 01             	cmp    eax,0x1
  4017f4:	75 1b                	jne    401811 <rio_readlineb+0xe8>
  4017f6:	eb 34                	jmp    40182c <rio_readlineb+0x103>
  4017f8:	41 83 c5 01          	add    r13d,0x1
  4017fc:	49 63 c5             	movsxd rax,r13d
  4017ff:	48 3b 44 24 18       	cmp    rax,QWORD PTR [rsp+0x18]
  401804:	73 0b                	jae    401811 <rio_readlineb+0xe8>
  401806:	e9 7b ff ff ff       	jmp    401786 <rio_readlineb+0x5d>
  40180b:	41 bd 01 00 00 00    	mov    r13d,0x1
  401811:	41 c6 06 00          	mov    BYTE PTR [r14],0x0
  401815:	49 63 c5             	movsxd rax,r13d
  401818:	eb 17                	jmp    401831 <rio_readlineb+0x108>
  40181a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  401821:	eb 0e                	jmp    401831 <rio_readlineb+0x108>
  401823:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  40182a:	eb 05                	jmp    401831 <rio_readlineb+0x108>
  40182c:	b8 00 00 00 00       	mov    eax,0x0
  401831:	48 83 c4 38          	add    rsp,0x38
  401835:	5b                   	pop    rbx
  401836:	5d                   	pop    rbp
  401837:	41 5c                	pop    r12
  401839:	41 5d                	pop    r13
  40183b:	41 5e                	pop    r14
  40183d:	41 5f                	pop    r15
  40183f:	c3                   	ret    

0000000000401840 <submitr>:
  401840:	41 57                	push   r15
  401842:	41 56                	push   r14
  401844:	41 55                	push   r13
  401846:	41 54                	push   r12
  401848:	55                   	push   rbp
  401849:	53                   	push   rbx
  40184a:	48 81 ec 58 a0 00 00 	sub    rsp,0xa058
  401851:	48 89 fd             	mov    rbp,rdi
  401854:	41 89 f5             	mov    r13d,esi
  401857:	48 89 14 24          	mov    QWORD PTR [rsp],rdx
  40185b:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
  401860:	4d 89 c7             	mov    r15,r8
  401863:	4c 89 cb             	mov    rbx,r9
  401866:	4c 8b b4 24 90 a0 00 	mov    r14,QWORD PTR [rsp+0xa090]
  40186d:	00 
  40186e:	c7 84 24 2c 20 00 00 	mov    DWORD PTR [rsp+0x202c],0x0
  401875:	00 00 00 00 
  401879:	ba 00 00 00 00       	mov    edx,0x0
  40187e:	be 01 00 00 00       	mov    esi,0x1
  401883:	bf 02 00 00 00       	mov    edi,0x2
  401888:	e8 e3 f3 ff ff       	call   400c70 <socket@plt>
  40188d:	41 89 c4             	mov    r12d,eax
  401890:	85 c0                	test   eax,eax
  401892:	79 50                	jns    4018e4 <submitr+0xa4>
  401894:	48 b8 45 72 72 6f 72 	movabs rax,0x43203a726f727245
  40189b:	3a 20 43 
  40189e:	49 89 06             	mov    QWORD PTR [r14],rax
  4018a1:	48 b8 6c 69 65 6e 74 	movabs rax,0x6e7520746e65696c
  4018a8:	20 75 6e 
  4018ab:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  4018af:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  4018b6:	74 6f 20 
  4018b9:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  4018bd:	48 b8 63 72 65 61 74 	movabs rax,0x7320657461657263
  4018c4:	65 20 73 
  4018c7:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  4018cb:	41 c7 46 20 6f 63 6b 	mov    DWORD PTR [r14+0x20],0x656b636f
  4018d2:	65 
  4018d3:	66 41 c7 46 24 74 00 	mov    WORD PTR [r14+0x24],0x74
  4018da:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4018df:	e9 ed 06 00 00       	jmp    401fd1 <submitr+0x791>
  4018e4:	48 89 ef             	mov    rdi,rbp
  4018e7:	e8 94 f2 ff ff       	call   400b80 <gethostbyname@plt>
  4018ec:	48 85 c0             	test   rax,rax
  4018ef:	75 6b                	jne    40195c <submitr+0x11c>
  4018f1:	48 b8 45 72 72 6f 72 	movabs rax,0x44203a726f727245
  4018f8:	3a 20 44 
  4018fb:	49 89 06             	mov    QWORD PTR [r14],rax
  4018fe:	48 b8 4e 53 20 69 73 	movabs rax,0x6e7520736920534e
  401905:	20 75 6e 
  401908:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  40190c:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  401913:	74 6f 20 
  401916:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  40191a:	48 b8 72 65 73 6f 6c 	movabs rax,0x2065766c6f736572
  401921:	76 65 20 
  401924:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  401928:	48 b8 73 65 72 76 65 	movabs rax,0x6120726576726573
  40192f:	72 20 61 
  401932:	49 89 46 20          	mov    QWORD PTR [r14+0x20],rax
  401936:	41 c7 46 28 64 64 72 	mov    DWORD PTR [r14+0x28],0x65726464
  40193d:	65 
  40193e:	66 41 c7 46 2c 73 73 	mov    WORD PTR [r14+0x2c],0x7373
  401945:	41 c6 46 2e 00       	mov    BYTE PTR [r14+0x2e],0x0
  40194a:	44 89 e7             	mov    edi,r12d
  40194d:	e8 de f1 ff ff       	call   400b30 <close@plt>
  401952:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401957:	e9 75 06 00 00       	jmp    401fd1 <submitr+0x791>
  40195c:	48 c7 84 24 40 a0 00 	mov    QWORD PTR [rsp+0xa040],0x0
  401963:	00 00 00 00 00 
  401968:	48 c7 84 24 48 a0 00 	mov    QWORD PTR [rsp+0xa048],0x0
  40196f:	00 00 00 00 00 
  401974:	66 c7 84 24 40 a0 00 	mov    WORD PTR [rsp+0xa040],0x2
  40197b:	00 02 00 
  40197e:	48 63 50 14          	movsxd rdx,DWORD PTR [rax+0x14]
  401982:	48 8d b4 24 44 a0 00 	lea    rsi,[rsp+0xa044]
  401989:	00 
  40198a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  40198e:	48 8b 38             	mov    rdi,QWORD PTR [rax]
  401991:	e8 5a f2 ff ff       	call   400bf0 <bcopy@plt>
  401996:	66 41 c1 cd 08       	ror    r13w,0x8
  40199b:	66 44 89 ac 24 42 a0 	mov    WORD PTR [rsp+0xa042],r13w
  4019a2:	00 00 
  4019a4:	ba 10 00 00 00       	mov    edx,0x10
  4019a9:	48 8d b4 24 40 a0 00 	lea    rsi,[rsp+0xa040]
  4019b0:	00 
  4019b1:	44 89 e7             	mov    edi,r12d
  4019b4:	e8 87 f2 ff ff       	call   400c40 <connect@plt>
  4019b9:	85 c0                	test   eax,eax
  4019bb:	79 5d                	jns    401a1a <submitr+0x1da>
  4019bd:	48 b8 45 72 72 6f 72 	movabs rax,0x55203a726f727245
  4019c4:	3a 20 55 
  4019c7:	49 89 06             	mov    QWORD PTR [r14],rax
  4019ca:	48 b8 6e 61 62 6c 65 	movabs rax,0x6f7420656c62616e
  4019d1:	20 74 6f 
  4019d4:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  4019d8:	48 b8 20 63 6f 6e 6e 	movabs rax,0x7463656e6e6f6320
  4019df:	65 63 74 
  4019e2:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  4019e6:	48 b8 20 74 6f 20 74 	movabs rax,0x20656874206f7420
  4019ed:	68 65 20 
  4019f0:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  4019f4:	41 c7 46 20 73 65 72 	mov    DWORD PTR [r14+0x20],0x76726573
  4019fb:	76 
  4019fc:	66 41 c7 46 24 65 72 	mov    WORD PTR [r14+0x24],0x7265
  401a03:	41 c6 46 26 00       	mov    BYTE PTR [r14+0x26],0x0
  401a08:	44 89 e7             	mov    edi,r12d
  401a0b:	e8 20 f1 ff ff       	call   400b30 <close@plt>
  401a10:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401a15:	e9 b7 05 00 00       	jmp    401fd1 <submitr+0x791>
  401a1a:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
  401a21:	48 89 df             	mov    rdi,rbx
  401a24:	b8 00 00 00 00       	mov    eax,0x0
  401a29:	48 89 d1             	mov    rcx,rdx
  401a2c:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  401a2e:	48 f7 d1             	not    rcx
  401a31:	48 89 ce             	mov    rsi,rcx
  401a34:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
  401a38:	48 89 d1             	mov    rcx,rdx
  401a3b:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  401a3d:	49 89 c8             	mov    r8,rcx
  401a40:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
  401a45:	48 89 d1             	mov    rcx,rdx
  401a48:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  401a4a:	48 f7 d1             	not    rcx
  401a4d:	49 89 c9             	mov    r9,rcx
  401a50:	4c 89 ff             	mov    rdi,r15
  401a53:	48 89 d1             	mov    rcx,rdx
  401a56:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  401a58:	4d 29 c1             	sub    r9,r8
  401a5b:	49 29 c9             	sub    r9,rcx
  401a5e:	48 8d 44 76 fd       	lea    rax,[rsi+rsi*2-0x3]
  401a63:	49 8d 44 01 7b       	lea    rax,[r9+rax*1+0x7b]
  401a68:	48 3d 00 20 00 00    	cmp    rax,0x2000
  401a6e:	76 73                	jbe    401ae3 <submitr+0x2a3>
  401a70:	48 b8 45 72 72 6f 72 	movabs rax,0x52203a726f727245
  401a77:	3a 20 52 
  401a7a:	49 89 06             	mov    QWORD PTR [r14],rax
  401a7d:	48 b8 65 73 75 6c 74 	movabs rax,0x747320746c757365
  401a84:	20 73 74 
  401a87:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  401a8b:	48 b8 72 69 6e 67 20 	movabs rax,0x6f6f7420676e6972
  401a92:	74 6f 6f 
  401a95:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  401a99:	48 b8 20 6c 61 72 67 	movabs rax,0x202e656772616c20
  401aa0:	65 2e 20 
  401aa3:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  401aa7:	48 b8 49 6e 63 72 65 	movabs rax,0x6573616572636e49
  401aae:	61 73 65 
  401ab1:	49 89 46 20          	mov    QWORD PTR [r14+0x20],rax
  401ab5:	48 b8 20 53 55 42 4d 	movabs rax,0x5254494d42555320
  401abc:	49 54 52 
  401abf:	49 89 46 28          	mov    QWORD PTR [r14+0x28],rax
  401ac3:	48 b8 5f 4d 41 58 42 	movabs rax,0x46554258414d5f
  401aca:	55 46 00 
  401acd:	49 89 46 30          	mov    QWORD PTR [r14+0x30],rax
  401ad1:	44 89 e7             	mov    edi,r12d
  401ad4:	e8 57 f0 ff ff       	call   400b30 <close@plt>
  401ad9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401ade:	e9 ee 04 00 00       	jmp    401fd1 <submitr+0x791>
  401ae3:	48 8d 94 24 30 40 00 	lea    rdx,[rsp+0x4030]
  401aea:	00 
  401aeb:	b9 00 04 00 00       	mov    ecx,0x400
  401af0:	b8 00 00 00 00       	mov    eax,0x0
  401af5:	48 89 d7             	mov    rdi,rdx
  401af8:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  401afb:	48 89 df             	mov    rdi,rbx
  401afe:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  401b05:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  401b07:	48 f7 d1             	not    rcx
  401b0a:	48 83 e9 01          	sub    rcx,0x1
  401b0e:	85 c9                	test   ecx,ecx
  401b10:	0f 84 d2 03 00 00    	je     401ee8 <submitr+0x6a8>
  401b16:	8d 41 ff             	lea    eax,[rcx-0x1]
  401b19:	4c 8d 6c 03 01       	lea    r13,[rbx+rax*1+0x1]
  401b1e:	48 89 d5             	mov    rbp,rdx
  401b21:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
  401b24:	80 fa 2a             	cmp    dl,0x2a
  401b27:	74 1f                	je     401b48 <submitr+0x308>
  401b29:	8d 42 d3             	lea    eax,[rdx-0x2d]
  401b2c:	3c 01                	cmp    al,0x1
  401b2e:	76 18                	jbe    401b48 <submitr+0x308>
  401b30:	80 fa 5f             	cmp    dl,0x5f
  401b33:	74 13                	je     401b48 <submitr+0x308>
  401b35:	8d 42 d0             	lea    eax,[rdx-0x30]
  401b38:	3c 09                	cmp    al,0x9
  401b3a:	76 0c                	jbe    401b48 <submitr+0x308>
  401b3c:	89 d0                	mov    eax,edx
  401b3e:	83 e0 df             	and    eax,0xffffffdf
  401b41:	83 e8 41             	sub    eax,0x41
  401b44:	3c 19                	cmp    al,0x19
  401b46:	77 09                	ja     401b51 <submitr+0x311>
  401b48:	48 8d 45 01          	lea    rax,[rbp+0x1]
  401b4c:	88 55 00             	mov    BYTE PTR [rbp+0x0],dl
  401b4f:	eb 52                	jmp    401ba3 <submitr+0x363>
  401b51:	80 fa 20             	cmp    dl,0x20
  401b54:	75 0a                	jne    401b60 <submitr+0x320>
  401b56:	48 8d 45 01          	lea    rax,[rbp+0x1]
  401b5a:	c6 45 00 2b          	mov    BYTE PTR [rbp+0x0],0x2b
  401b5e:	eb 43                	jmp    401ba3 <submitr+0x363>
  401b60:	8d 42 e0             	lea    eax,[rdx-0x20]
  401b63:	3c 5f                	cmp    al,0x5f
  401b65:	76 09                	jbe    401b70 <submitr+0x330>
  401b67:	80 fa 09             	cmp    dl,0x9
  401b6a:	0f 85 d9 03 00 00    	jne    401f49 <submitr+0x709>
  401b70:	0f b6 d2             	movzx  edx,dl
  401b73:	be 30 28 40 00       	mov    esi,0x402830
  401b78:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401b7d:	b8 00 00 00 00       	mov    eax,0x0
  401b82:	e8 99 f0 ff ff       	call   400c20 <sprintf@plt>
  401b87:	0f b6 44 24 10       	movzx  eax,BYTE PTR [rsp+0x10]
  401b8c:	88 45 00             	mov    BYTE PTR [rbp+0x0],al
  401b8f:	0f b6 44 24 11       	movzx  eax,BYTE PTR [rsp+0x11]
  401b94:	88 45 01             	mov    BYTE PTR [rbp+0x1],al
  401b97:	48 8d 45 03          	lea    rax,[rbp+0x3]
  401b9b:	0f b6 54 24 12       	movzx  edx,BYTE PTR [rsp+0x12]
  401ba0:	88 55 02             	mov    BYTE PTR [rbp+0x2],dl
  401ba3:	48 83 c3 01          	add    rbx,0x1
  401ba7:	4c 39 eb             	cmp    rbx,r13
  401baa:	0f 84 38 03 00 00    	je     401ee8 <submitr+0x6a8>
  401bb0:	48 89 c5             	mov    rbp,rax
  401bb3:	e9 69 ff ff ff       	jmp    401b21 <submitr+0x2e1>
  401bb8:	48 89 da             	mov    rdx,rbx
  401bbb:	48 89 ee             	mov    rsi,rbp
  401bbe:	44 89 e7             	mov    edi,r12d
  401bc1:	e8 3a ef ff ff       	call   400b00 <write@plt>
  401bc6:	48 85 c0             	test   rax,rax
  401bc9:	7f 0f                	jg     401bda <submitr+0x39a>
  401bcb:	e8 00 ef ff ff       	call   400ad0 <__errno_location@plt>
  401bd0:	83 38 04             	cmp    DWORD PTR [rax],0x4
  401bd3:	75 12                	jne    401be7 <submitr+0x3a7>
  401bd5:	b8 00 00 00 00       	mov    eax,0x0
  401bda:	48 01 c5             	add    rbp,rax
  401bdd:	48 29 c3             	sub    rbx,rax
  401be0:	75 d6                	jne    401bb8 <submitr+0x378>
  401be2:	4d 85 ed             	test   r13,r13
  401be5:	79 5f                	jns    401c46 <submitr+0x406>
  401be7:	48 b8 45 72 72 6f 72 	movabs rax,0x43203a726f727245
  401bee:	3a 20 43 
  401bf1:	49 89 06             	mov    QWORD PTR [r14],rax
  401bf4:	48 b8 6c 69 65 6e 74 	movabs rax,0x6e7520746e65696c
  401bfb:	20 75 6e 
  401bfe:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  401c02:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  401c09:	74 6f 20 
  401c0c:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  401c10:	48 b8 77 72 69 74 65 	movabs rax,0x6f74206574697277
  401c17:	20 74 6f 
  401c1a:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  401c1e:	48 b8 20 74 68 65 20 	movabs rax,0x7265732065687420
  401c25:	73 65 72 
  401c28:	49 89 46 20          	mov    QWORD PTR [r14+0x20],rax
  401c2c:	41 c7 46 28 76 65 72 	mov    DWORD PTR [r14+0x28],0x726576
  401c33:	00 
  401c34:	44 89 e7             	mov    edi,r12d
  401c37:	e8 f4 ee ff ff       	call   400b30 <close@plt>
  401c3c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401c41:	e9 8b 03 00 00       	jmp    401fd1 <submitr+0x791>
  401c46:	44 89 a4 24 30 80 00 	mov    DWORD PTR [rsp+0x8030],r12d
  401c4d:	00 
  401c4e:	c7 84 24 34 80 00 00 	mov    DWORD PTR [rsp+0x8034],0x0
  401c55:	00 00 00 00 
  401c59:	48 8d 84 24 40 80 00 	lea    rax,[rsp+0x8040]
  401c60:	00 
  401c61:	48 89 84 24 38 80 00 	mov    QWORD PTR [rsp+0x8038],rax
  401c68:	00 
  401c69:	ba 00 20 00 00       	mov    edx,0x2000
  401c6e:	48 8d b4 24 30 60 00 	lea    rsi,[rsp+0x6030]
  401c75:	00 
  401c76:	48 8d bc 24 30 80 00 	lea    rdi,[rsp+0x8030]
  401c7d:	00 
  401c7e:	e8 a6 fa ff ff       	call   401729 <rio_readlineb>
  401c83:	48 85 c0             	test   rax,rax
  401c86:	7f 74                	jg     401cfc <submitr+0x4bc>
  401c88:	48 b8 45 72 72 6f 72 	movabs rax,0x43203a726f727245
  401c8f:	3a 20 43 
  401c92:	49 89 06             	mov    QWORD PTR [r14],rax
  401c95:	48 b8 6c 69 65 6e 74 	movabs rax,0x6e7520746e65696c
  401c9c:	20 75 6e 
  401c9f:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  401ca3:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  401caa:	74 6f 20 
  401cad:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  401cb1:	48 b8 72 65 61 64 20 	movabs rax,0x7269662064616572
  401cb8:	66 69 72 
  401cbb:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  401cbf:	48 b8 73 74 20 68 65 	movabs rax,0x6564616568207473
  401cc6:	61 64 65 
  401cc9:	49 89 46 20          	mov    QWORD PTR [r14+0x20],rax
  401ccd:	48 b8 72 20 66 72 6f 	movabs rax,0x73206d6f72662072
  401cd4:	6d 20 73 
  401cd7:	49 89 46 28          	mov    QWORD PTR [r14+0x28],rax
  401cdb:	41 c7 46 30 65 72 76 	mov    DWORD PTR [r14+0x30],0x65767265
  401ce2:	65 
  401ce3:	66 41 c7 46 34 72 00 	mov    WORD PTR [r14+0x34],0x72
  401cea:	44 89 e7             	mov    edi,r12d
  401ced:	e8 3e ee ff ff       	call   400b30 <close@plt>
  401cf2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401cf7:	e9 d5 02 00 00       	jmp    401fd1 <submitr+0x791>
  401cfc:	4c 8d 44 24 20       	lea    r8,[rsp+0x20]
  401d01:	48 8d 8c 24 2c 20 00 	lea    rcx,[rsp+0x202c]
  401d08:	00 
  401d09:	48 8d 94 24 30 20 00 	lea    rdx,[rsp+0x2030]
  401d10:	00 
  401d11:	be 37 28 40 00       	mov    esi,0x402837
  401d16:	48 8d bc 24 30 60 00 	lea    rdi,[rsp+0x6030]
  401d1d:	00 
  401d1e:	b8 00 00 00 00       	mov    eax,0x0
  401d23:	e8 b8 ee ff ff       	call   400be0 <__isoc99_sscanf@plt>
  401d28:	8b 94 24 2c 20 00 00 	mov    edx,DWORD PTR [rsp+0x202c]
  401d2f:	81 fa c8 00 00 00    	cmp    edx,0xc8
  401d35:	0f 84 b2 00 00 00    	je     401ded <submitr+0x5ad>
  401d3b:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
  401d40:	be 88 27 40 00       	mov    esi,0x402788
  401d45:	4c 89 f7             	mov    rdi,r14
  401d48:	b8 00 00 00 00       	mov    eax,0x0
  401d4d:	e8 ce ee ff ff       	call   400c20 <sprintf@plt>
  401d52:	44 89 e7             	mov    edi,r12d
  401d55:	e8 d6 ed ff ff       	call   400b30 <close@plt>
  401d5a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401d5f:	e9 6d 02 00 00       	jmp    401fd1 <submitr+0x791>
  401d64:	ba 00 20 00 00       	mov    edx,0x2000
  401d69:	48 8d b4 24 30 60 00 	lea    rsi,[rsp+0x6030]
  401d70:	00 
  401d71:	48 8d bc 24 30 80 00 	lea    rdi,[rsp+0x8030]
  401d78:	00 
  401d79:	e8 ab f9 ff ff       	call   401729 <rio_readlineb>
  401d7e:	48 85 c0             	test   rax,rax
  401d81:	7f 6a                	jg     401ded <submitr+0x5ad>
  401d83:	48 b8 45 72 72 6f 72 	movabs rax,0x43203a726f727245
  401d8a:	3a 20 43 
  401d8d:	49 89 06             	mov    QWORD PTR [r14],rax
  401d90:	48 b8 6c 69 65 6e 74 	movabs rax,0x6e7520746e65696c
  401d97:	20 75 6e 
  401d9a:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  401d9e:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  401da5:	74 6f 20 
  401da8:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  401dac:	48 b8 72 65 61 64 20 	movabs rax,0x6165682064616572
  401db3:	68 65 61 
  401db6:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  401dba:	48 b8 64 65 72 73 20 	movabs rax,0x6f72662073726564
  401dc1:	66 72 6f 
  401dc4:	49 89 46 20          	mov    QWORD PTR [r14+0x20],rax
  401dc8:	48 b8 6d 20 73 65 72 	movabs rax,0x726576726573206d
  401dcf:	76 65 72 
  401dd2:	49 89 46 28          	mov    QWORD PTR [r14+0x28],rax
  401dd6:	41 c6 46 30 00       	mov    BYTE PTR [r14+0x30],0x0
  401ddb:	44 89 e7             	mov    edi,r12d
  401dde:	e8 4d ed ff ff       	call   400b30 <close@plt>
  401de3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401de8:	e9 e4 01 00 00       	jmp    401fd1 <submitr+0x791>
  401ded:	80 bc 24 30 60 00 00 	cmp    BYTE PTR [rsp+0x6030],0xd
  401df4:	0d 
  401df5:	0f 85 69 ff ff ff    	jne    401d64 <submitr+0x524>
  401dfb:	80 bc 24 31 60 00 00 	cmp    BYTE PTR [rsp+0x6031],0xa
  401e02:	0a 
  401e03:	0f 85 5b ff ff ff    	jne    401d64 <submitr+0x524>
  401e09:	80 bc 24 32 60 00 00 	cmp    BYTE PTR [rsp+0x6032],0x0
  401e10:	00 
  401e11:	0f 85 4d ff ff ff    	jne    401d64 <submitr+0x524>
  401e17:	ba 00 20 00 00       	mov    edx,0x2000
  401e1c:	48 8d b4 24 30 60 00 	lea    rsi,[rsp+0x6030]
  401e23:	00 
  401e24:	48 8d bc 24 30 80 00 	lea    rdi,[rsp+0x8030]
  401e2b:	00 
  401e2c:	e8 f8 f8 ff ff       	call   401729 <rio_readlineb>
  401e31:	48 85 c0             	test   rax,rax
  401e34:	7f 73                	jg     401ea9 <submitr+0x669>
  401e36:	48 b8 45 72 72 6f 72 	movabs rax,0x43203a726f727245
  401e3d:	3a 20 43 
  401e40:	49 89 06             	mov    QWORD PTR [r14],rax
  401e43:	48 b8 6c 69 65 6e 74 	movabs rax,0x6e7520746e65696c
  401e4a:	20 75 6e 
  401e4d:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  401e51:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  401e58:	74 6f 20 
  401e5b:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  401e5f:	48 b8 72 65 61 64 20 	movabs rax,0x6174732064616572
  401e66:	73 74 61 
  401e69:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  401e6d:	48 b8 74 75 73 20 6d 	movabs rax,0x7373656d20737574
  401e74:	65 73 73 
  401e77:	49 89 46 20          	mov    QWORD PTR [r14+0x20],rax
  401e7b:	48 b8 61 67 65 20 66 	movabs rax,0x6d6f726620656761
  401e82:	72 6f 6d 
  401e85:	49 89 46 28          	mov    QWORD PTR [r14+0x28],rax
  401e89:	48 b8 20 73 65 72 76 	movabs rax,0x72657672657320
  401e90:	65 72 00 
  401e93:	49 89 46 30          	mov    QWORD PTR [r14+0x30],rax
  401e97:	44 89 e7             	mov    edi,r12d
  401e9a:	e8 91 ec ff ff       	call   400b30 <close@plt>
  401e9f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401ea4:	e9 28 01 00 00       	jmp    401fd1 <submitr+0x791>
  401ea9:	48 8d b4 24 30 60 00 	lea    rsi,[rsp+0x6030]
  401eb0:	00 
  401eb1:	4c 89 f7             	mov    rdi,r14
  401eb4:	e8 27 ec ff ff       	call   400ae0 <strcpy@plt>
  401eb9:	44 89 e7             	mov    edi,r12d
  401ebc:	e8 6f ec ff ff       	call   400b30 <close@plt>
  401ec1:	41 0f b6 06          	movzx  eax,BYTE PTR [r14]
  401ec5:	83 e8 4f             	sub    eax,0x4f
  401ec8:	75 0f                	jne    401ed9 <submitr+0x699>
  401eca:	41 0f b6 46 01       	movzx  eax,BYTE PTR [r14+0x1]
  401ecf:	83 e8 4b             	sub    eax,0x4b
  401ed2:	75 05                	jne    401ed9 <submitr+0x699>
  401ed4:	41 0f b6 46 02       	movzx  eax,BYTE PTR [r14+0x2]
  401ed9:	85 c0                	test   eax,eax
  401edb:	0f 95 c0             	setne  al
  401ede:	0f b6 c0             	movzx  eax,al
  401ee1:	f7 d8                	neg    eax
  401ee3:	e9 e9 00 00 00       	jmp    401fd1 <submitr+0x791>
  401ee8:	4c 8d 8c 24 30 40 00 	lea    r9,[rsp+0x4030]
  401eef:	00 
  401ef0:	4d 89 f8             	mov    r8,r15
  401ef3:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  401ef8:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]
  401efc:	be b8 27 40 00       	mov    esi,0x4027b8
  401f01:	48 8d bc 24 30 60 00 	lea    rdi,[rsp+0x6030]
  401f08:	00 
  401f09:	b8 00 00 00 00       	mov    eax,0x0
  401f0e:	e8 0d ed ff ff       	call   400c20 <sprintf@plt>
  401f13:	48 8d bc 24 30 60 00 	lea    rdi,[rsp+0x6030]
  401f1a:	00 
  401f1b:	b8 00 00 00 00       	mov    eax,0x0
  401f20:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  401f27:	f2 ae                	repnz scas al,BYTE PTR es:[rdi]
  401f29:	48 f7 d1             	not    rcx
  401f2c:	48 83 e9 01          	sub    rcx,0x1
  401f30:	49 89 cd             	mov    r13,rcx
  401f33:	0f 84 0d fd ff ff    	je     401c46 <submitr+0x406>
  401f39:	48 89 cb             	mov    rbx,rcx
  401f3c:	48 8d ac 24 30 60 00 	lea    rbp,[rsp+0x6030]
  401f43:	00 
  401f44:	e9 6f fc ff ff       	jmp    401bb8 <submitr+0x378>
  401f49:	48 b8 45 72 72 6f 72 	movabs rax,0x52203a726f727245
  401f50:	3a 20 52 
  401f53:	49 89 06             	mov    QWORD PTR [r14],rax
  401f56:	48 b8 65 73 75 6c 74 	movabs rax,0x747320746c757365
  401f5d:	20 73 74 
  401f60:	49 89 46 08          	mov    QWORD PTR [r14+0x8],rax
  401f64:	48 b8 72 69 6e 67 20 	movabs rax,0x6e6f6320676e6972
  401f6b:	63 6f 6e 
  401f6e:	49 89 46 10          	mov    QWORD PTR [r14+0x10],rax
  401f72:	48 b8 74 61 69 6e 73 	movabs rax,0x6e6120736e696174
  401f79:	20 61 6e 
  401f7c:	49 89 46 18          	mov    QWORD PTR [r14+0x18],rax
  401f80:	48 b8 20 69 6c 6c 65 	movabs rax,0x6c6167656c6c6920
  401f87:	67 61 6c 
  401f8a:	49 89 46 20          	mov    QWORD PTR [r14+0x20],rax
  401f8e:	48 b8 20 6f 72 20 75 	movabs rax,0x72706e7520726f20
  401f95:	6e 70 72 
  401f98:	49 89 46 28          	mov    QWORD PTR [r14+0x28],rax
  401f9c:	48 b8 69 6e 74 61 62 	movabs rax,0x20656c6261746e69
  401fa3:	6c 65 20 
  401fa6:	49 89 46 30          	mov    QWORD PTR [r14+0x30],rax
  401faa:	48 b8 63 68 61 72 61 	movabs rax,0x6574636172616863
  401fb1:	63 74 65 
  401fb4:	49 89 46 38          	mov    QWORD PTR [r14+0x38],rax
  401fb8:	66 41 c7 46 40 72 2e 	mov    WORD PTR [r14+0x40],0x2e72
  401fbf:	41 c6 46 42 00       	mov    BYTE PTR [r14+0x42],0x0
  401fc4:	44 89 e7             	mov    edi,r12d
  401fc7:	e8 64 eb ff ff       	call   400b30 <close@plt>
  401fcc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  401fd1:	48 81 c4 58 a0 00 00 	add    rsp,0xa058
  401fd8:	5b                   	pop    rbx
  401fd9:	5d                   	pop    rbp
  401fda:	41 5c                	pop    r12
  401fdc:	41 5d                	pop    r13
  401fde:	41 5e                	pop    r14
  401fe0:	41 5f                	pop    r15
  401fe2:	c3                   	ret    

0000000000401fe3 <init_timeout>:
  401fe3:	53                   	push   rbx
  401fe4:	89 fb                	mov    ebx,edi
  401fe6:	85 ff                	test   edi,edi
  401fe8:	74 1e                	je     402008 <init_timeout+0x25>
  401fea:	be 00 17 40 00       	mov    esi,0x401700
  401fef:	bf 0e 00 00 00       	mov    edi,0xe
  401ff4:	e8 77 eb ff ff       	call   400b70 <signal@plt>
  401ff9:	85 db                	test   ebx,ebx
  401ffb:	bf 00 00 00 00       	mov    edi,0x0
  402000:	0f 49 fb             	cmovns edi,ebx
  402003:	e8 18 eb ff ff       	call   400b20 <alarm@plt>
  402008:	5b                   	pop    rbx
  402009:	c3                   	ret    

000000000040200a <init_driver>:
  40200a:	55                   	push   rbp
  40200b:	53                   	push   rbx
  40200c:	48 83 ec 18          	sub    rsp,0x18
  402010:	48 89 fd             	mov    rbp,rdi
  402013:	be 01 00 00 00       	mov    esi,0x1
  402018:	bf 0d 00 00 00       	mov    edi,0xd
  40201d:	e8 4e eb ff ff       	call   400b70 <signal@plt>
  402022:	be 01 00 00 00       	mov    esi,0x1
  402027:	bf 1d 00 00 00       	mov    edi,0x1d
  40202c:	e8 3f eb ff ff       	call   400b70 <signal@plt>
  402031:	be 01 00 00 00       	mov    esi,0x1
  402036:	bf 1d 00 00 00       	mov    edi,0x1d
  40203b:	e8 30 eb ff ff       	call   400b70 <signal@plt>
  402040:	ba 00 00 00 00       	mov    edx,0x0
  402045:	be 01 00 00 00       	mov    esi,0x1
  40204a:	bf 02 00 00 00       	mov    edi,0x2
  40204f:	e8 1c ec ff ff       	call   400c70 <socket@plt>
  402054:	89 c3                	mov    ebx,eax
  402056:	85 c0                	test   eax,eax
  402058:	79 4f                	jns    4020a9 <init_driver+0x9f>
  40205a:	48 b8 45 72 72 6f 72 	movabs rax,0x43203a726f727245
  402061:	3a 20 43 
  402064:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
  402068:	48 b8 6c 69 65 6e 74 	movabs rax,0x6e7520746e65696c
  40206f:	20 75 6e 
  402072:	48 89 45 08          	mov    QWORD PTR [rbp+0x8],rax
  402076:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  40207d:	74 6f 20 
  402080:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
  402084:	48 b8 63 72 65 61 74 	movabs rax,0x7320657461657263
  40208b:	65 20 73 
  40208e:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
  402092:	c7 45 20 6f 63 6b 65 	mov    DWORD PTR [rbp+0x20],0x656b636f
  402099:	66 c7 45 24 74 00    	mov    WORD PTR [rbp+0x24],0x74
  40209f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4020a4:	e9 f8 00 00 00       	jmp    4021a1 <init_driver+0x197>
  4020a9:	bf 48 28 40 00       	mov    edi,0x402848
  4020ae:	e8 cd ea ff ff       	call   400b80 <gethostbyname@plt>
  4020b3:	48 85 c0             	test   rax,rax
  4020b6:	75 68                	jne    402120 <init_driver+0x116>
  4020b8:	48 b8 45 72 72 6f 72 	movabs rax,0x44203a726f727245
  4020bf:	3a 20 44 
  4020c2:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
  4020c6:	48 b8 4e 53 20 69 73 	movabs rax,0x6e7520736920534e
  4020cd:	20 75 6e 
  4020d0:	48 89 45 08          	mov    QWORD PTR [rbp+0x8],rax
  4020d4:	48 b8 61 62 6c 65 20 	movabs rax,0x206f7420656c6261
  4020db:	74 6f 20 
  4020de:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
  4020e2:	48 b8 72 65 73 6f 6c 	movabs rax,0x2065766c6f736572
  4020e9:	76 65 20 
  4020ec:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
  4020f0:	48 b8 73 65 72 76 65 	movabs rax,0x6120726576726573
  4020f7:	72 20 61 
  4020fa:	48 89 45 20          	mov    QWORD PTR [rbp+0x20],rax
  4020fe:	c7 45 28 64 64 72 65 	mov    DWORD PTR [rbp+0x28],0x65726464
  402105:	66 c7 45 2c 73 73    	mov    WORD PTR [rbp+0x2c],0x7373
  40210b:	c6 45 2e 00          	mov    BYTE PTR [rbp+0x2e],0x0
  40210f:	89 df                	mov    edi,ebx
  402111:	e8 1a ea ff ff       	call   400b30 <close@plt>
  402116:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40211b:	e9 81 00 00 00       	jmp    4021a1 <init_driver+0x197>
  402120:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  402127:	00 
  402128:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  40212f:	00 00 
  402131:	66 c7 04 24 02 00    	mov    WORD PTR [rsp],0x2
  402137:	48 63 50 14          	movsxd rdx,DWORD PTR [rax+0x14]
  40213b:	48 8d 74 24 04       	lea    rsi,[rsp+0x4]
  402140:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  402144:	48 8b 38             	mov    rdi,QWORD PTR [rax]
  402147:	e8 a4 ea ff ff       	call   400bf0 <bcopy@plt>
  40214c:	66 c7 44 24 02 3b 6e 	mov    WORD PTR [rsp+0x2],0x6e3b
  402153:	ba 10 00 00 00       	mov    edx,0x10
  402158:	48 89 e6             	mov    rsi,rsp
  40215b:	89 df                	mov    edi,ebx
  40215d:	e8 de ea ff ff       	call   400c40 <connect@plt>
  402162:	85 c0                	test   eax,eax
  402164:	79 25                	jns    40218b <init_driver+0x181>
  402166:	ba 48 28 40 00       	mov    edx,0x402848
  40216b:	be 08 28 40 00       	mov    esi,0x402808
  402170:	48 89 ef             	mov    rdi,rbp
  402173:	b8 00 00 00 00       	mov    eax,0x0
  402178:	e8 a3 ea ff ff       	call   400c20 <sprintf@plt>
  40217d:	89 df                	mov    edi,ebx
  40217f:	e8 ac e9 ff ff       	call   400b30 <close@plt>
  402184:	b8 ff ff ff ff       	mov    eax,0xffffffff
  402189:	eb 16                	jmp    4021a1 <init_driver+0x197>
  40218b:	89 df                	mov    edi,ebx
  40218d:	e8 9e e9 ff ff       	call   400b30 <close@plt>
  402192:	66 c7 45 00 4f 4b    	mov    WORD PTR [rbp+0x0],0x4b4f
  402198:	c6 45 02 00          	mov    BYTE PTR [rbp+0x2],0x0
  40219c:	b8 00 00 00 00       	mov    eax,0x0
  4021a1:	48 83 c4 18          	add    rsp,0x18
  4021a5:	5b                   	pop    rbx
  4021a6:	5d                   	pop    rbp
  4021a7:	c3                   	ret    

00000000004021a8 <driver_post>:
  4021a8:	53                   	push   rbx
  4021a9:	48 83 ec 10          	sub    rsp,0x10
  4021ad:	48 89 cb             	mov    rbx,rcx
  4021b0:	85 d2                	test   edx,edx
  4021b2:	74 1f                	je     4021d3 <driver_post+0x2b>
  4021b4:	bf 55 28 40 00       	mov    edi,0x402855
  4021b9:	b8 00 00 00 00       	mov    eax,0x0
  4021be:	e8 4d e9 ff ff       	call   400b10 <printf@plt>
  4021c3:	66 c7 03 4f 4b       	mov    WORD PTR [rbx],0x4b4f
  4021c8:	c6 43 02 00          	mov    BYTE PTR [rbx+0x2],0x0
  4021cc:	b8 00 00 00 00       	mov    eax,0x0
  4021d1:	eb 3e                	jmp    402211 <driver_post+0x69>
  4021d3:	48 85 ff             	test   rdi,rdi
  4021d6:	74 2b                	je     402203 <driver_post+0x5b>
  4021d8:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  4021db:	74 26                	je     402203 <driver_post+0x5b>
  4021dd:	48 89 0c 24          	mov    QWORD PTR [rsp],rcx
  4021e1:	49 89 f1             	mov    r9,rsi
  4021e4:	41 b8 6c 28 40 00    	mov    r8d,0x40286c
  4021ea:	48 89 f9             	mov    rcx,rdi
  4021ed:	ba 7a 28 40 00       	mov    edx,0x40287a
  4021f2:	be 6e 3b 00 00       	mov    esi,0x3b6e
  4021f7:	bf 48 28 40 00       	mov    edi,0x402848
  4021fc:	e8 3f f6 ff ff       	call   401840 <submitr>
  402201:	eb 0e                	jmp    402211 <driver_post+0x69>
  402203:	66 c7 03 4f 4b       	mov    WORD PTR [rbx],0x4b4f
  402208:	c6 43 02 00          	mov    BYTE PTR [rbx+0x2],0x0
  40220c:	b8 00 00 00 00       	mov    eax,0x0
  402211:	48 83 c4 10          	add    rsp,0x10
  402215:	5b                   	pop    rbx
  402216:	c3                   	ret    
  402217:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40221e:	00 00 

0000000000402220 <__libc_csu_init>:
  402220:	41 57                	push   r15
  402222:	41 89 ff             	mov    r15d,edi
  402225:	41 56                	push   r14
  402227:	49 89 f6             	mov    r14,rsi
  40222a:	41 55                	push   r13
  40222c:	49 89 d5             	mov    r13,rdx
  40222f:	41 54                	push   r12
  402231:	4c 8d 25 d8 1b 20 00 	lea    r12,[rip+0x201bd8]        # 603e10 <__frame_dummy_init_array_entry>
  402238:	55                   	push   rbp
  402239:	48 8d 2d d8 1b 20 00 	lea    rbp,[rip+0x201bd8]        # 603e18 <__init_array_end>
  402240:	53                   	push   rbx
  402241:	4c 29 e5             	sub    rbp,r12
  402244:	31 db                	xor    ebx,ebx
  402246:	48 c1 fd 03          	sar    rbp,0x3
  40224a:	48 83 ec 08          	sub    rsp,0x8
  40224e:	e8 3d e8 ff ff       	call   400a90 <_init>
  402253:	48 85 ed             	test   rbp,rbp
  402256:	74 1e                	je     402276 <__libc_csu_init+0x56>
  402258:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40225f:	00 
  402260:	4c 89 ea             	mov    rdx,r13
  402263:	4c 89 f6             	mov    rsi,r14
  402266:	44 89 ff             	mov    edi,r15d
  402269:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40226d:	48 83 c3 01          	add    rbx,0x1
  402271:	48 39 eb             	cmp    rbx,rbp
  402274:	75 ea                	jne    402260 <__libc_csu_init+0x40>
  402276:	48 83 c4 08          	add    rsp,0x8
  40227a:	5b                   	pop    rbx
  40227b:	5d                   	pop    rbp
  40227c:	41 5c                	pop    r12
  40227e:	41 5d                	pop    r13
  402280:	41 5e                	pop    r14
  402282:	41 5f                	pop    r15
  402284:	c3                   	ret    
  402285:	90                   	nop
  402286:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40228d:	00 00 00 

0000000000402290 <__libc_csu_fini>:
  402290:	f3 c3                	repz ret 
  402292:	66 90                	xchg   ax,ax

Disassembly of section .fini:

0000000000402294 <_fini>:
  402294:	48 83 ec 08          	sub    rsp,0x8
  402298:	48 83 c4 08          	add    rsp,0x8
  40229c:	c3                   	ret    
