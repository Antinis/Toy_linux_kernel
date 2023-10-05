#include "print.h"
#include "sbi.h"
#include "types.h"

void putc(char c) {
  sbi_ecall(SBI_PUTCHAR, 0, c, 0, 0, 0, 0, 0);
}

void puti(uint64 x)
{
    if(x==0)
    {
        sbi_ecall(SBI_PUTCHAR, 0, 48, 0, 0, 0, 0, 0);
        return;
    }

    // 获取每位的数字
    int a[11]={0};
    int i;
    for(i=0; x!=0; i++)
    {
        a[i]=x%10;
        x=x/10;
    }

    // 逐位打印数字
    int j;
    for(j=i-1; j>=0; j--)
        sbi_ecall(SBI_PUTCHAR, 0, 48+a[j], 0, 0, 0, 0, 0);
}

static int vprintfmt(void(*putch)(char), const char *fmt, va_list vl) {
    int in_format = 0, longarg = 0;
    size_t pos = 0;
    for( ; *fmt; fmt++) {
        if (in_format) {
            switch(*fmt) {
                case 'l': { 
                    longarg = 1; 
                    break; 
                }
                
                case 'x': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);

                    int hexdigits = 2 * (longarg ? sizeof(long) : sizeof(int)) - 1;
                    for(int halfbyte = hexdigits; halfbyte >= 0; halfbyte--) {
                        int hex = (num >> (4*halfbyte)) & 0xF;
                        char hexchar = (hex < 10 ? '0' + hex : 'a' + hex - 10);
                        putch(hexchar);
                        pos++;
                    }
                    longarg = 0; in_format = 0; 
                    break;
                }
            
                case 'd': {
                    long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
                    if (num < 0) {
                        num = -num; putch('-');
                        pos++;
                    }
                    int bits = 0;
                    char decchar[25] = {'0', 0};
                    for (long tmp = num; tmp; bits++) {
                        decchar[bits] = (tmp % 10) + '0';
                        tmp /= 10;
                    }

                    for (int i = bits; i >= 0; i--) {
                        putch(decchar[i]);
                    }
                    pos += bits + 1;
                    longarg = 0; in_format = 0; 
                    break;
                }

                case 'u': {
                    unsigned long num = longarg ? va_arg(vl, long) : va_arg(vl, int);
                    int bits = 0;
                    char decchar[25] = {'0', 0};
                    for (unsigned long tmp = num; tmp; bits++) {
                        decchar[bits] = (tmp % 10) + '0';
                        tmp /= 10;
                    }

                    for (int i = bits; i >= 0; i--) {
                        putch(decchar[i]);
                    }
                    pos += bits + 1;
                    longarg = 0; in_format = 0; 
                    break;
                }

                case 's': {
                    const char* str = va_arg(vl, const char*);
                    while (*str) {
                        putch(*str);
                        pos++; 
                        str++;
                    }
                    longarg = 0; in_format = 0; 
                    break;
                }

                case 'c': {
                    char ch = (char)va_arg(vl,int);
                    putch(ch);
                    pos++;
                    longarg = 0; in_format = 0; 
                    break;
                }
                default:
                    break;
            }
        }
        else if(*fmt == '%') {
          in_format = 1;
        }
        else {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            putch(*fmt);
            pos++;
        }
    }
    return pos;
}



int printk(const char* s, ...) {
    int res = 0;
    va_list vl;
    va_start(vl, s);
    res = vprintfmt(putc, s, vl);
    va_end(vl);
    return res;
}
