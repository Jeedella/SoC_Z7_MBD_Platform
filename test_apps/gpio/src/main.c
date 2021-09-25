#include <stdio.h>

#include <fcntl.h>
#include <errno.h>
#include <unistd.h>
#include <signal.h>

#include <linux/gpio.h>
#include <sys/ioctl.h>

#define NUMGPIO 4

// Needed for graceful exit
volatile sig_atomic_t stop;

void inthand(int signum) {
    stop = 1;
}

int main(int argc, char *argv[])
{
    char swi_name[] = "Switches";
    char but_name[] = "Buttons ";
    char led_name[] = "Leds    ";
    char rgb_name[] = "RGB Leds";
    char *name[] = {swi_name, but_name, led_name, rgb_name};

    char swi_addr[] = "/dev/gpiochip0";
    char but_addr[] = "/dev/gpiochip1";
    char led_addr[] = "/dev/gpiochip2";
    char rgb_addr[] = "/dev/gpiochip3";
    char *addr[] = {swi_addr, but_addr, led_addr, rgb_addr};

    int fd[NUMGPIO], ret;
    struct gpiochip_info cinfo[NUMGPIO];
    struct gpioline_info linfo;

    for (int i = 0; i < NUMGPIO; i++) {
        fd[i] = open(addr[i], 0);
        if (fd[i] == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to open %s\n", addr[i]);
            return ret;
        }
    }

    for (int i = 0; i < NUMGPIO; i++) {
        ret = ioctl(fd[i], GPIO_GET_CHIPINFO_IOCTL, &cinfo[i]);
        if (ret == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_CHIPINFO_IOCTL", ret);
            return ret;
        }
        fprintf(stdout, "%s located at GPIO chip: %s, \"%s\", %u GPIO lines\n", name[i], cinfo[i].name, cinfo[i].label, cinfo[i].lines);

        // Is printing strange info, Outputs are listed as inputs even when configured as outputs in the device tree
        for (int k = 0; k < cinfo[i].lines; k++) {
            linfo.line_offset = k;
            ret = ioctl(fd[0], GPIO_GET_LINEINFO_IOCTL, &linfo);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_LINEINFO_IOCTL", ret);
                return ret;
            }
            fprintf(stdout, "Offset: %d\tName:%s\tFlags\t%s\t%s\t%s\t%s\t%s\n", linfo.line_offset, linfo.name,
               (linfo.flags & GPIOLINE_FLAG_IS_OUT) ? "OUTPUT" : "INPUT",
               (linfo.flags & GPIOLINE_FLAG_ACTIVE_LOW) ? "ACTIVE_LOW" : "ACTIVE_HIGHT",
               (linfo.flags & GPIOLINE_FLAG_OPEN_DRAIN) ? "OPEN_DRAIN" : "...",
               (linfo.flags & GPIOLINE_FLAG_OPEN_SOURCE) ? "OPENSOURCE" : "...",
               (linfo.flags & GPIOLINE_FLAG_KERNEL) ? "KERNEL" : "");
        }
    }

    struct gpiohandle_request rswi[cinfo[0].lines], rbut[cinfo[1].lines], rled[cinfo[2].lines], rrgb[cinfo[3].lines];

    // Create input request handle for switches
    for (int i = 0; i < cinfo[0].lines; i++) {
        rswi[i].lineoffsets[0] = i;
        rswi[i].lines = 1;
        rswi[i].flags = GPIOHANDLE_REQUEST_INPUT;

        ret = ioctl(fd[0], GPIO_GET_LINEHANDLE_IOCTL, &rswi[i]);
        if (ret == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_LINEHANDLE_IOCTL", ret);
            return ret;
        }
    }

    // Create input request handle for buttons
    for (int i = 0; i < cinfo[1].lines; i++) {
        rbut[i].lineoffsets[0] = i;
        rbut[i].lines = 1;
        rbut[i].flags = GPIOHANDLE_REQUEST_INPUT;

        ret = ioctl(fd[1], GPIO_GET_LINEHANDLE_IOCTL, &rbut[i]);
        if (ret == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_LINEHANDLE_IOCTL", ret);
            return ret;
        }
    }

    // Create output request handle for leds
    for (int i = 0; i < cinfo[2].lines; i++) {
        rled[i].lineoffsets[0] = i;
        rled[i].lines = 1;
        rled[i].flags = GPIOHANDLE_REQUEST_OUTPUT;

        ret = ioctl(fd[2], GPIO_GET_LINEHANDLE_IOCTL, &rled[i]);
        if (ret == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_LINEHANDLE_IOCTL", ret);
            return ret;
        }
    }

    // Create output request handle for rgb leds
    for (int i = 0; i < cinfo[3].lines; i++) {
        rrgb[i].lineoffsets[0] = i;
        rrgb[i].lines = 1;
        rrgb[i].flags = GPIOHANDLE_REQUEST_OUTPUT;

        ret = ioctl(fd[3], GPIO_GET_LINEHANDLE_IOCTL, &rrgb[i]);
        if (ret == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_LINEHANDLE_IOCTL", ret);
            return ret;
        }
    }

    fprintf(stdout, "Request handles acquired, now can be played with the buttons and switches\n");
    signal(SIGINT, inthand);

    while (!stop) {
        struct gpiohandle_data dget, dset;

        // Copy button values to led values
        for (int i = 0; i < cinfo[0].lines; i++) {
            ret = ioctl(rbut[i].fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &dget);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);
                return ret;
            }

            dset.values[0] = dget.values[0];

            ret = ioctl(rled[i].fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &dset);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);
                return ret;
            }
        }

        // Copy switch values to rgb values, switch 4 is therefore unused
        for (int i = 0; i < cinfo[3].lines; i++) {
            ret = ioctl(rswi[i].fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &dget);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);
                return ret;
            }

            dset.values[0] = dget.values[0];

            ret = ioctl(rrgb[i].fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &dset);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);
                return ret;
            }
        }
    }

    // Closing file descriptors
    fprintf(stdout, "\nLoop interrupted, closing all file descriptors\n");

    for (int i = 0; i < cinfo[0].lines; i++) {
        ret = close(rswi[i].fd);
        if (ret == -1) {
            fprintf(stderr, "Failed to close %s (%d)\n", "HANDLE SWITCHES", ret);
            return ret;
        }
    }

    for (int i = 0; i < cinfo[1].lines; i++) {
        ret = close(rbut[i].fd);
        if (ret == -1) {
            fprintf(stderr, "Failed to close %s (%d)\n", "HANDLE BUTTONS", ret);
            ret = -errno;
            return ret;
        }
    }

    for (int i = 0; i < cinfo[2].lines; i++) {
        ret = close(rled[i].fd);
        if (ret == -1) {
            fprintf(stderr, "Failed to close %s (%d)\n", "HANDLE LEDS", ret);
            ret = -errno;
            return ret;
        }
    }

    for (int i = 0; i < cinfo[3].lines; i++) {
        ret = close(rrgb[i].fd);
        if (ret == -1) {
            fprintf(stderr, "Failed to close %s (%d)\n", "HANDLE RGB LEDS", ret);
            ret = -errno;
            return ret;
        }
    }

    for (int i = 0; i < NUMGPIO; i++) {
        ret = close(fd[i]);
        if (ret == -1) {
            fprintf(stderr, "Failed to close %s (%d)\n", name[i], ret);
            ret = -errno;
            return ret;
        }
    }

    return ret;
}
