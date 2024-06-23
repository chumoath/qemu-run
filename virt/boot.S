.global _start

_start:
	mov w0, #0x1
	mov w1, #0x2
	add w0, w1, w0
loop:
	b loop


