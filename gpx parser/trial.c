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
    int fd = open(argv[1], O_RDONLY,S_IRUSR | S_IWUSR);
    struct stat sb;
    if(fstat(fd, &sb)==-1)
    {
        perror("File not found");
    }
    char* file_in_memory = mmap(NULL, sb.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    puts(file_in_memory);
    printf("\n");
    munmap(file_in_memory, sb.st_size);
    close(fd);
}
