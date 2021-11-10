	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI0_0:
	.quad	0x416312d000000000              ; double 1.0E+7
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #288                    ; =288
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #272]            ; 16-byte Folded Spill
	add	x29, sp, #272                   ; =272
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	mov	x8, x1
	mov	w1, #0
	stur	wzr, [x29, #-20]
	stur	w0, [x29, #-24]
	stur	x8, [x29, #-32]
	ldur	x8, [x29, #-32]
	ldr	x0, [x8, #8]
	mov	x9, sp
	mov	x8, #384
	str	x8, [x9]
	bl	_open
	stur	w0, [x29, #-76]
	ldur	w8, [x29, #-24]
	subs	w8, w8, #2                      ; =2
	b.ge	LBB0_2
; %bb.1:
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w0, #0
	bl	_exit
LBB0_2:
	ldur	w0, [x29, #-76]
	add	x1, sp, #48                     ; =48
	bl	_fstat
	adds	w8, w0, #1                      ; =1
	b.ne	LBB0_4
; %bb.3:
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_perror
	mov	w0, #0
	bl	_exit
LBB0_4:
	ldr	x1, [sp, #144]
	ldur	w4, [x29, #-76]
	mov	x0, #0
	mov	w2, #1
	mov	w3, #2
	mov	x5, #0
	bl	_mmap
	stur	x0, [x29, #-40]
	ldur	x0, [x29, #-40]
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	str	x1, [sp, #24]                   ; 8-byte Folded Spill
	bl	_strstr
	ldur	x8, [x29, #-40]
	subs	x8, x0, x8
	stur	x8, [x29, #-64]
	ldr	x8, [sp, #144]
	ldur	x9, [x29, #-64]
	subs	x0, x8, x9
	bl	_malloc
	ldr	x1, [sp, #24]                   ; 8-byte Folded Reload
	stur	x0, [x29, #-48]
	ldur	x0, [x29, #-40]
	bl	_strstr
	stur	x0, [x29, #-40]
	ldur	x0, [x29, #-48]
	ldur	x1, [x29, #-40]
	ldr	x8, [sp, #144]
	ldur	x9, [x29, #-64]
	subs	x2, x8, x9
	mov	x3, #-1
	bl	___memcpy_chk
	ldur	x0, [x29, #-40]
	ldr	x1, [sp, #144]
	bl	_munmap
	ldur	w0, [x29, #-76]
	bl	_close
	ldur	x0, [x29, #-48]
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_strtok
	stur	x0, [x29, #-56]
	str	wzr, [sp, #44]
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-56]
	cbz	x8, LBB0_15
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=1
	ldur	x0, [x29, #-56]
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_strstr
	cbz	x0, LBB0_14
; %bb.7:                                ;   in Loop: Header=BB0_5 Depth=1
	ldur	x0, [x29, #-56]
	mov	w1, #34
	bl	_strchr
	add	x8, x0, #1                      ; =1
	stur	x8, [x29, #-56]
	ldur	x0, [x29, #-56]
	bl	_atof
	str	d0, [sp, #32]
	ldr	d0, [sp, #32]
	fmov	d1, #10.00000000
	fcmp	d0, d1
	b.pl	LBB0_10
; %bb.8:                                ;   in Loop: Header=BB0_5 Depth=1
	ldr	d0, [sp, #32]
	fmov	d1, #-10.00000000
	fcmp	d0, d1
	b.le	LBB0_10
; %bb.9:                                ;   in Loop: Header=BB0_5 Depth=1
	ldr	d0, [sp, #32]
	fmov	d1, #10.00000000
	fmul	d0, d0, d1
	str	d0, [sp, #32]
LBB0_10:                                ;   in Loop: Header=BB0_5 Depth=1
	ldr	d0, [sp, #32]
	adrp	x8, lCPI0_0@PAGE
	ldr	d1, [x8, lCPI0_0@PAGEOFF]
	fmul	d0, d0, d1
	str	d0, [sp, #32]
	ldr	d0, [sp, #32]
	fcvtzs	w10, d0
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	ldur	x0, [x29, #-56]
	mov	w1, #34
	str	w1, [sp, #20]                   ; 4-byte Folded Spill
	bl	_strchr
	ldr	w1, [sp, #20]                   ; 4-byte Folded Reload
	add	x8, x0, #1                      ; =1
	stur	x8, [x29, #-56]
	ldur	x0, [x29, #-56]
	bl	_strchr
	add	x8, x0, #1                      ; =1
	stur	x8, [x29, #-56]
	ldur	x0, [x29, #-56]
	bl	_atof
	str	d0, [sp, #32]
	ldr	d0, [sp, #32]
	fmov	d1, #10.00000000
	fcmp	d0, d1
	b.pl	LBB0_13
; %bb.11:                               ;   in Loop: Header=BB0_5 Depth=1
	ldr	d0, [sp, #32]
	fmov	d1, #-10.00000000
	fcmp	d0, d1
	b.le	LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_5 Depth=1
	ldr	d0, [sp, #32]
	fmov	d1, #10.00000000
	fmul	d0, d0, d1
	str	d0, [sp, #32]
LBB0_13:                                ;   in Loop: Header=BB0_5 Depth=1
	ldr	d0, [sp, #32]
	adrp	x8, lCPI0_0@PAGE
	ldr	d1, [x8, lCPI0_0@PAGEOFF]
	fmul	d0, d0, d1
	str	d0, [sp, #32]
	ldr	d0, [sp, #32]
	fcvtzs	w10, d0
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9]
	bl	_printf
	ldr	w8, [sp, #44]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #44]
LBB0_14:                                ;   in Loop: Header=BB0_5 Depth=1
	mov	x0, #0
	adrp	x1, l_.str.3@PAGE
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_strtok
	stur	x0, [x29, #-56]
	b	LBB0_5
LBB0_15:
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	mov	x9, sp
	mov	x8, #8
	str	x8, [x9]
	bl	_printf
	ldur	x0, [x29, #-48]
	bl	_free
	ldur	w0, [x29, #-20]
	ldp	x29, x30, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	add	sp, sp, #288                    ; =288
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Please enter file location\n"

l_.str.1:                               ; @.str.1
	.asciz	"File not found"

l_.str.2:                               ; @.str.2
	.asciz	"<trkseg>"

l_.str.3:                               ; @.str.3
	.asciz	">"

l_.str.4:                               ; @.str.4
	.asciz	"<trkpt"

l_.str.5:                               ; @.str.5
	.asciz	"%d,"

l_.str.6:                               ; @.str.6
	.asciz	"%d\n"

l_.str.7:                               ; @.str.7
	.asciz	"%ld"

.subsections_via_symbols
