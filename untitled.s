	.data
bytes: 	.byte 0x10, 0x20, 0x30, 0x40
word:	.word 0

        .text
main:   ldr r0, =word
	ldr r1, =bytes
	ldr r1, [r1]
	str r1, [r0]
stop:   wfi
