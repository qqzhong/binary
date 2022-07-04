# Code Analysis Exercises

### 8.
**a)**

After each instruction:
```Assembly
MOV W0, 0x66666666
```

```
W0 = 0x66666666
```

---
```Assembly
MOV W1, 0xF000000F
```

```
W0 = 0x66666666
W1 = 0xF000000F
```
---
```Assembly
AND W0, W0, W1
```

```
W0 = 0x60000006
W1 = 0xF000000F
```
---
```Assembly
EOR W0, W0, W1
```

```
0x6 = 0b0110 | 0xF = 0b1111 | EOR(0b0110, 0b1111) = 0b1001 = 0x9
W0 = 0x90000009
W1 = 0xF000000F
```
---
```Assembly
ORR W0, W0, 0x66666666
```

```
0x9 = 0b1001 | 0x6 = 0b0110 | ORR(0b1001, 0b0110) = 0b1111 = 0xF
```

**Answer:** ```W0 = 0xF666666F```

**b)**

After each instruction:
```Assembly
MOV W0, 0x0000BEEF
```

```
W0 = 0x0000BEEF
```
---
```Assembly
ADDS W0, W0, 0x00008000
```

```
W0 = 0x00013EEF (flags are set, C = 1 since there was a carry)
```
---
```Assembly
MOV W1, 0x00003EEE
```

```
W0 = 0x00013EEF
W1 = 0x00003EEE
```
---
```Assembly
SBC W0, W0, W1
```

```
W0 = 0x00010001 (~C = 0)
```
---
```Assembly
ADC W0, W0, W0
```

**Answer:** ```W0 = 0x00020003```

### 9.

Starting value of W0 is ```0x12345678```

**a)**

After each instruction:
```Assembly
MOV W1, 0xABCD0000
```

```
W0 = 0x12345678
W1 = 0xABCD0000
```
---
```Assembly
UBFX W2, W0, 24, 8
```

```
W0 = 0x12345678
W1 = 0xABCD0000
W2 = 0x00000012
```
---
```Assembly
BFI W1, W2, 16, 8
```

```
W2 = 0x00000012
```

**Answer:** ```W1 = 0xAB120000```

**b)**

After each instruction:
```Assembly
REV W1, W0
```

```
W0 = 0x12345678
W1 = 0x78563412
```
---
```Assembly
AND W1, W1, W1, ASR 16
```

```
W1, ASR 16 = 0x00007856 (arithmetic shift right, 16 bits)
```
Therefore:
```
W0 = 0x12345678
W1 = 0x00003012
```
---
```Assembly
REV W1, W1
```

```
W0 = 0x12345678
W1 = 0x12300000
```
---
```Assembly
SUB W1, W0, W1
```

**Answer:** ```W1 = 0x00045678```

**c)**

After each instruction:
```Assembly
EON X1, X1, X1
```

```
X0 = 0x 0000 0000 1234 5678
X1 = 0x FFFF FFFF FFFF FFFF
```
---
```Assembly
ADD X1, X1, X0, SXTB 4
```

```
X0, SXTB 4 = 0x 0000 0000 0000 0078, LSL 4 = 0x 0000 0000 0000 0780
```

**Answer:** ```0x 0000 0000 0000 077F```

### 10.
Meaning of the value stored in X0 after instructions

**a)**

```Assembly
CMP X0, 0
CNEG X0, X0, LT
```

**Answer:** The absolute value of X0 (value X0 is negated if it is less than 0)

**b)**

```Assembly
CMP X1, X2
CSEL X0, X1, X2, GT
CMP X0, X3
CSEL X0, X0, X3, GT
```

**Answer:** The greatest (signed) value between X1, X2 and X3.
In the first comparison, X0 takes the value of ```MAX(X1, X2)```.
In the second comparison, X0 takes the value of ```MAX(X0, X3)``` which is equivalent to ```MAX(X1, X2, X3)```.
