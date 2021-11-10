#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main()
{
    FILE *f=fopen("/tmp/route.gpx","r");
    if(f==NULL)
    {
        printf("Error opening file.\n");
        return -1;
    }
    struct coordinate
    {
        int lat;
        int lon;
    };
    fseek(f,0,SEEK_END);
    int file_end = ftell(f);
    char* trkseg = (char*)malloc(file_end);
    char* trkseg1 = (char*)malloc(1024);
    char* tok;
    char s[]=">";
    fseek(f,42,SEEK_SET);
    fgets(trkseg1,1024,f);
    int loc = strstr(trkseg1,"<trkseg>")-trkseg1+50;
    free(trkseg1);
    fseek(f,loc,SEEK_SET);
    fgets(trkseg,file_end,f);
    tok=strtok(trkseg,s);
    while(tok!=NULL)
    {
        char latitude[15],longitude[15];
        int i=0;
        tok=tok+12;
        while(*tok!='"'&&*tok!='\0')
        {
            if(*tok!='.')
            {
                latitude[i]=*tok;
                tok++;
                i++;
            }
            else
            {
                tok++;
            }
        }
        i++;
        latitude[i]='\0';
        i=0;
        printf("%s,",latitude);
        tok=tok+7;
        while(*tok!='"'&&*tok!='\0')
        {
            if(*tok!='.')
            {
                longitude[i]=*tok;
                tok++;
                i++;
            }
            else
            {
                tok++;
            }
        }
        i++;
        longitude[i]='\0';
        printf("%s\n",longitude);
        tok=strtok(NULL,s);
    }
    fclose(f);
    return 0;
}