#define UART_BASE_ADDR 0x09000000
#define MUSG_SIZE 24
#define MEM_HEAD_SIZE 10 * 1024 * 1024
void putc(char c) {
    volatile unsigned int *uart = (unsigned int *)UART_BASE_ADDR;
    *uart = c;
}

void printf(const char *str) {
    while (*str) {
        putc(*str++);
    }
}

typedef struct musg {
	unsigned int add;
	int size;
	int state;
	void *next;
} musg;

void main() {
    printf("Hello, World!\n");
	int i = sizeof (musg);
	
}
