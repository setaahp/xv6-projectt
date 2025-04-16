#include "types.h"
#include "riscv.h"
#include "custom_logger.h"
#include "defs.h"


char *strmeow(char *final, const char *src)
{
    char *start = final;

    while (*final != '\0')
    {
        final++;
    }
    while (*src != '\0')
    {
        *final = *src;
        final++;
        src++;
    }
    *final = '\0';

    return start;
}

void log_message(int level, const char *message) {
    switch (level){
    case 0:
    {
        char warning[200] = "WARNING - ";
        strmeow(warning, message);
        printf("%s",warning);
        break;
    }
    case 1:
    {
        char error[200] = "ERROR - ";
        strmeow(error, message);
        printf("%s",error);
        break;
    }
    case 2:
    {
        char info[200] = "INFO - ";
        strmeow(info, message);
        printf("%s",info);
        break;
    }
}

}