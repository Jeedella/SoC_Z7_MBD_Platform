#include <stdio.h>
#include <stdlib.h>

int main()
{
    int rawVal = 0;
    float scaleVal = 0;
    FILE *fptr = 0;

    char pathCh6[100];
    char pathCh7[100];
    char pathCh14[100];
    char pathCh15[100];

    sprintf(pathCh6, "/sys/bus/platform/devices/43c10000.xadc_wiz/iio:device1/in_voltage8_vaux6_raw");
    sprintf(pathCh7, "/sys/bus/platform/devices/43c10000.xadc_wiz/iio:device1/in_voltage9_vaux7_raw");
    sprintf(pathCh14, "/sys/bus/platform/devices/43c10000.xadc_wiz/iio:device1/in_voltage10_vaux14_raw");
    sprintf(pathCh15, "/sys/bus/platform/devices/43c10000.xadc_wiz/iio:device1/in_voltage11_vaux15_raw");

    if ((fptr = fopen(pathCh6, "r")) == NULL) {
        printf("Error! File cannot be opened.");
        return -1;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    printf("Channel 6: \t%fV\n", scaleVal);

    if ((fptr = fopen(pathCh7, "r")) == NULL) {
        printf("Error! File cannot be opened.");
        return -1;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    printf("Channel 7: \t%fV\n", scaleVal);

    if ((fptr = fopen(pathCh14, "r")) == NULL) {
        printf("Error! File cannot be opened.");
        return -1;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    printf("Channel 14: \t%fV\n", scaleVal);

    if ((fptr = fopen(pathCh15, "r")) == NULL) {
        printf("Error! File cannot be opened.");
        return -1;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    printf("Channel 15: \t%fV\n", scaleVal);

    return 0;
}