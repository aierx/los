hello leiwenyong

```bash
# 打印内存
xp /32bx 0x7c00

# 反汇编
objdump -D system
```

### CPU工作模式

- 实模式 real mode
- 保护模式 protect mode
- 兼容模式 compatibility mode
- 平坦模式 long mode

### 寻址方式
- 立即数：
  - mov ax,1234h
  - mov [bx],5678h
- 直接：[0x1111h] 或 symbol
  - mov ax,es:[1234h]
  - mov dx,VALUE
  - mov dx,[VALUE]
- 间接：[bx]
  - mov ax，[bx]
- 间接相对：[bx]+0x1111h
  - mov ax,[bx]+12h
  - mov ax,[si]+5678h
  - mov ax,[bp]+1234h
- 基址变址：
  - mov ax,[bx+si]
  - mov ax,[bp+di]
- 基址变址相对：
  - mov ax,[bx+si]+12h
  - mov ax,[bp+di]+1234h
- 段内直接转移
    - 段内直接短转移：cs不变，ip+(-127 ~ 127)
      - jmp near ptr NEAR_NEW_ADDR
    - 段内直接近转移：cs不变，ip+(-32767 ~ 32767)
      - jmp bx
      - jmp word ptr [bx]+1234h
    - 段间直接寻址：cs和ip同时改变
      - jmp 1234h：5678h
      - jmp far ptr NEW_ADDR
    - 段间间接寻址：
        - jmp dword ptr [bx][si]+1234h
        - jmp dword ptr [1234h]
        - jmp dword ptr [si]