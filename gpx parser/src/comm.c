#define TERMINAL    "/dev/tty.ESP32-ESP32SPP"
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>
int main()
{
    char *portname = TERMINAL;
    int fd;
    int wlen;
    char *xstr = "Hello i am under the water here too much raining please help me uuuuuuu\n";
    int xlen = strlen(xstr);
    fd = open(portname, O_RDWR | O_NOCTTY | O_SYNC);
    if (fd < 0) {
        printf("Error opening %s: %s\n", portname, strerror(errno));
        return -1;
    }
    wlen = write(fd, xstr, xlen);
    if (wlen != xlen) {
        printf("Error from write: %d, %d\n", wlen, errno);
    }
    tcdrain(fd);
    while(1)
    {
        unsigned char buf[80];
        int rdlen;
        rdlen = read(fd, buf, sizeof(buf) - 1);
        if (rdlen > 0) 
        {
            unsigned char   *p;
            for (p = buf; rdlen-- > 0; p++)
                printf("%c", *p);
            printf("\n");
        } 
        else if (rdlen < 0) 
        {
            printf("Error from read: %d: %s\n", rdlen, strerror(errno));
        } 
        else 
        {
            printf("Timeout from read\n");
        }
    }
}
