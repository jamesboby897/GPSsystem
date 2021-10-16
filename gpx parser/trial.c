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
    char* trkseg;
    long start_loc;
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
    start_loc=strstr(gpx_data,"<trkseg>")-gpx_data;
    trkseg=(char*)malloc(sb.st_size-start_loc);
    gpx_data=strstr(gpx_data,"<trkseg>");
    memcpy(trkseg,gpx_data,sb.st_size-start_loc);
    munmap(gpx_data, sb.st_size);
    printf("%s",trkseg);
    free(trkseg);
    close(fd);
}
