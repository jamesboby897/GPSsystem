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
    char* tok;
    long start_loc;
    struct coordinates
    {
        int lon;
        int lat;
        int trackpos;
    }Coordinates;
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
    gpx_data =(char*) mmap(NULL, sb.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    start_loc=strstr(gpx_data,"<trkseg>")-gpx_data;
    trkseg=(char*)malloc(sb.st_size-start_loc);
    gpx_data=strstr(gpx_data,"<trkseg>");
    memcpy(trkseg,gpx_data,sb.st_size-start_loc);
    munmap(gpx_data, sb.st_size);
    tok=strtok(trkseg,">");
    int count=0;
    while(tok!=NULL)
    {
        double temp;
        if(strstr(tok,"<trkpt")!=NULL)
        {
            tok=strchr(tok,'"')+1;
            temp=atof(tok);
            if(temp<10&&temp>-10)
                temp=temp*10;
            temp=temp*10000000;
            Coordinates.lat=(int)temp;
            printf("lat:%d,",Coordinates.lat);
            tok=strchr(tok,'"')+1;
            tok=strchr(tok,'"')+1;
            temp=atof(tok);
            if(temp<10&&temp>-10)
                temp=temp*10;
            temp=temp*10000000;
            Coordinates.lon=(int)temp;
            printf("lon:%d\n",Coordinates.lon);
            count++;
            Coordinates.trackpos=count;
            printf("Pos:%d\n",Coordinates.trackpos);
        }
        tok=strtok(NULL,">");
    }
    free(trkseg);
    close(fd);
}
