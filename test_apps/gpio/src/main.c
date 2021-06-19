// C library headers
#include <stdio.h>
#include <string.h>

// Linux headers
#include <fcntl.h> // Contains file controls like O_RDWR
#include <errno.h> // Error integer and strerror() function
#include <unistd.h> // write(), read(), close()

#include <linux/gpio.h>
#include <sys/ioctl.h>

int main(int argc, char **argv)
{
    char swi_name[] = "Switches";
    char but_name[] = "Buttons";
    char led_name[] = "Leds";
    char rgb_name[] = "RGB Leds";
    char *name[] = {swi_name, but_name, led_name, rgb_name};

    char swi_addr[] = "/dev/gpiochip0";
    char but_addr[] = "/dev/gpiochip1";
    char led_addr[] = "/dev/gpiochip2";
    char rgb_addr[] = "/dev/gpiochip3";
    char *addr[] = {swi_addr, but_addr, led_addr, rgb_addr};

    int fd[4], ret;

    for (int i = 0; i < 4; i++) {
        fd[i] = open(addr[i], 0);
        if (fd[i] == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to open %s\n", addr[i]);

            return ret;
        }
    }

    for (int i = 0; i < 4; i++) {
        struct gpiochip_info cinfo;
        ret = ioctl(fd[i], GPIO_GET_CHIPINFO_IOCTL, &cinfo);
        if (ret == -1) {
            ret = -errno;
            fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_CHIPINFO_IOCTL", ret);

            return ret;
        }
        fprintf(stdout, "%s located at GPIO chip: %s, \"%s\", %u GPIO lines\n", name[i], cinfo.name, cinfo.label, cinfo.lines);
    }

    /* Getting line info does not work with AXI GPIO
    struct gpioline_info linfo;
    ret = ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
    if (ret == -1) {
        ret = -errno;
        fprintf(stderr, "Failed to issue %s (%d)\n", "GPIO_GET_LINEINFO_IOCTL", ret);

        return ret;
    }
    fprintf(stdout, "line %2d: %s", linfo.line_offset, linfo.name);
    */
    struct gpiohandle_request req_but[4], req_led[4], req_swi[4], req_rgb[6];
    struct gpiohandle_data data_get, data_set;

    for (int i = 0; i < 6; i++) {
        if (i < 4) {
            req_but[i].lineoffsets[0] = i;
            req_but[i].lines = 1; // Requesting more than one line does not work
            req_but[i].flags = GPIOHANDLE_REQUEST_INPUT;

            req_led[i].lineoffsets[0] = i;
            req_led[i].lines = 1; // Requesting more than one line does not work
            req_led[i].flags = GPIOHANDLE_REQUEST_OUTPUT;

            req_swi[i].lineoffsets[0] = i;
            req_swi[i].lines = 1; // Requesting more than one line does not work
            req_swi[i].flags = GPIOHANDLE_REQUEST_OUTPUT;
        }

        req_rgb[i].lineoffsets[0] = i;
        req_rgb[i].lines = 1; // Requesting more than one line does not work
        req_rgb[i].flags = GPIOHANDLE_REQUEST_OUTPUT;

        ioctl(fd[0], GPIO_GET_LINEHANDLE_IOCTL, &req_swi[i]);
        ioctl(fd[1], GPIO_GET_LINEHANDLE_IOCTL, &req_but[i]);
        ioctl(fd[2], GPIO_GET_LINEHANDLE_IOCTL, &req_led[i]);
        ioctl(fd[3], GPIO_GET_LINEHANDLE_IOCTL, &req_rgb[i]);
    }

    while (1) {
        for (int i = 0; i < 4; i++) {
            ret = ioctl(req_but[i].fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data_get);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);

                return ret;
            }

            data_set.values[0] = data_get.values[0];

            ret = ioctl(req_led[i].fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data_set);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);

                return ret;
            }
        }

        for (int i = 0; i < 3; i++) {
            ret = ioctl(req_swi[i+1].fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data_get);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);

                return ret;
            }

            data_set.values[0] = data_get.values[0];

            ret = ioctl(req_rgb[i].fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data_set);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);

                return ret;
            }

            ret = ioctl(req_rgb[i+3].fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data_set);
            if (ret == -1) {
                ret = -errno;
                fprintf(stderr, "Failed to issue %s (%d)\n", "GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);

                return ret;
            }
        }
    }

    for (int i = 0; i < 3; i++) {
        ret = close(fd[i]);
        if (ret == -1) {
            perror("Failed to close GPIO LINEHANDLE device file");
            ret = -errno;

            return ret;
        }
    }

    return ret;
}
