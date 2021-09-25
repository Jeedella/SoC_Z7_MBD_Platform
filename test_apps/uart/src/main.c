#include <stdio.h>
#include <string.h>

#include <fcntl.h>
#include <errno.h>
#include <unistd.h>

#include <termios.h>

const unsigned char msg[] = "Hello, world!";
char read_buf [sizeof(msg)];

int main(int argc, char *argv[])
{
    int ret;

    if (argc != 2) {
        fprintf(stderr, "Wrong number of arguments.\n");
        ret = -errno;
        return ret;
    }

    int serial_port = open(argv[1], O_RDWR);
    if (serial_port == -1) {
        fprintf(stderr, "Failed to open %s\n", argv[1]);
        ret = -errno;
        return ret;
    }

    struct termios tty;
    
    // Read in existing settings
    if(tcgetattr(serial_port, &tty) != 0) {
        fprintf(stderr, "Failed to issue %s (%d)\n", strerror(errno), errno);
        ret = -errno;
        return ret;
    }

    // Write to serial port
    fprintf(stdout, "Writing %s..\n", msg);
    write(serial_port, msg, sizeof(msg));

    // Poll received message
    fprintf(stdout, "Waiting for message..\n");
    int num_bytes = read(serial_port, &read_buf, sizeof(read_buf));
    fprintf(stdout, "Read %i bytes. Received message: %s\n", num_bytes, read_buf);

    // Close serial port
    ret = close(serial_port);
    if (ret == -1) {
        fprintf(stderr, "Failed to close %s (%d)\n", argv[1], ret);
        ret = -errno;
        return ret;
    }

    return ret;
}
