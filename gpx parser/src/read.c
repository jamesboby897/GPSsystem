#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
int main(int argc, char* argv[])
{
    char* gpx_data;
    int fd = open(argv[1], O_RDONLY,S_IRUSR | S_IWUSR);
    struct stat sb;
    if(argc<2)
    {
        printf("Please enter file location\n");
        exit(0);
    }
    if(fstat(fd, &sb)==-1)
    {
        perror("File not found");
        exit(0);
    }
    gpx_data = mmap(NULL, sb.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    while(gpx_data=strstr(gpx_data,"<trkpt")!=NULL)
    {
        printf("%s\n",gpx_data);

    }
    munmap(gpx_data, sb.st_size);
    close(fd);
}
