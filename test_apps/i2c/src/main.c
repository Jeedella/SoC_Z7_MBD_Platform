#include <stdint.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#include <sys/ioctl.h>

#include <linux/i2c.h>
#include <linux/i2c-dev.h>

int I2CRead(uint8_t reg, uint16_t* read_data)
{
    uint8_t command = reg << 1;

    union i2c_smbus_data bus_data;
    struct i2c_smbus_ioctl_data args;
    args.read_write = I2C_SMBUS_READ;
    args.command = command;
    args.size = I2C_SMBUS_WORD_DATA;
    args.data = &bus_data;

    int _fdi2c = open("/dev/i2c-0", O_RDWR);

    if (_fdi2c < 0) {
        printf("Cannot open file descriptor.");
        return -1;
	}

    if (ioctl(_fdi2c, I2C_SLAVE, 0) < 0) {
        printf("Cannot set device as a slave.");
        return -1;
	}

    if (ioctl(_fdi2c,I2C_SMBUS,&args) < 0) {
        printf("Cannot read data from slave.");
        return -1;
	}

    *read_data = bus_data.word;

	if (close(_fdi2c) < 0) {
        printf("Cannot close file descriptor.");
        return -1;
	}

    return 0;
}

int I2CWrite(uint8_t reg, uint16_t write_data)
{
    uint8_t command = (reg << 1) ^ ((write_data >> 8) & 0x1);

    union i2c_smbus_data bus_data;
    struct i2c_smbus_ioctl_data args;
    args.read_write = I2C_SMBUS_WRITE;
    args.command = command;
    args.size = I2C_SMBUS_BYTE_DATA;
    args.data = &bus_data;

    bus_data.byte = (uint8_t)write_data;

    int _fdi2c = open("/dev/i2c-0", O_RDWR);

    if (_fdi2c < 0) {
        printf("Cannot open file descriptor.");
        return -1;
	}

    if (ioctl(_fdi2c, I2C_SLAVE, 0) < 0)  {
        printf("Cannot set device as a slave.");
        return -1;
	}

    if (ioctl(_fdi2c,I2C_SMBUS,&args) < 0) {
        printf("Cannot write data to slave.");
        return -1;
	}

	if (close(_fdi2c) < 0) {
        printf("Cannot close file descriptor.");
	}

    return 0;
}

int main()
{
    I2CWrite(0,0);
    return 0;
}
