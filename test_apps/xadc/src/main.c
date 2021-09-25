#include <stdio.h>
#include <stdlib.h>

#include <errno.h>

int main()
{
    int ret, rawVal = 0;
    float scaleVal = 0;
    FILE *fptr = 0;

    char pathCh6[] = "/sys/bus/platform/devices/43c00000.xadc_wiz/iio:device1/in_voltage8_raw";
    char pathCh7[] = "/sys/bus/platform/devices/43c00000.xadc_wiz/iio:device1/in_voltage9_raw";
    char pathCh14[] = "/sys/bus/platform/devices/43c00000.xadc_wiz/iio:device1/in_voltage10_raw";
    char pathCh15[] ="/sys/bus/platform/devices/43c00000.xadc_wiz/iio:device1/in_voltage11_raw";

    if ((fptr = fopen(pathCh6, "r")) == NULL) {
        fprintf(stderr, "Failed to open %s\n", pathCh6);
        ret = -errno;
        return ret;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    fprintf(stdout, "Channel 6: \t%fV\n", scaleVal);

    if ((fptr = fopen(pathCh7, "r")) == NULL) {
        fprintf(stderr, "Failed to open %s\n", pathCh7);
        ret = -errno;
        return ret;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    fprintf(stdout, "Channel 7: \t%fV\n", scaleVal);

    if ((fptr = fopen(pathCh14, "r")) == NULL) {
        fprintf(stderr, "Failed to open %s\n", pathCh14);
        ret = -errno;
        return ret;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    fprintf(stdout, "Channel 14: \t%fV\n", scaleVal);

    if ((fptr = fopen(pathCh15, "r")) == NULL) {
        fprintf(stderr, "Failed to open %s\n", pathCh15);
        ret = -errno;
        return ret;
    }

    fscanf(fptr, "%d", &rawVal);
    fclose(fptr);

    scaleVal = (float)rawVal/4095;
    fprintf(stdout, "Channel 15: \t%fV\n", scaleVal);

    return ret;
}
