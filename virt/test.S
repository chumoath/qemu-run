.global _start

_start:
	ldr      x0, #0x18 
	mov      x1, xzr
	mov      x2, xzr

loop:
	b loop
