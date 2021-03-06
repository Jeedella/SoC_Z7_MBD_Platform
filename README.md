# SoC Z7 MBD Platform

## Progress

### Implemented
* XADC
* PS uart, uartlite and uart16550.
  * 1x uartlite and uart16550 on the Zybo z10.
  * 2x uartlite and uart16550 on the Zybo z20.
* 2 x PS I2C.
* PS spi controller with 3 slave selects. (Listed in user space but not yet tested in C app).
* Switches, buttons, leds and rgb leds accessible in user space using gpiochip.

### To do
* ~Investigate I2C acknowledge~
  * Zynq 7000 built-in I2C controller supports ACK/NACK configuration, but [the cadence driver](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842160/Cadence+I2C+Driver) always sets bit 3 of the [I2C control register (pag 1365)](https://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf). Manually setting bit 3 of the control register, through busybox's devmem, seems to not work after the cadence driver is loaded. The cadence driver can be adjusted and recompiled(not tested), but this would make ACK/NACK not configurable on the fly. This can be possibly be solved with a custom driver/application.
  * [The LogiCORE™ IP AXI IIC Bus Interface](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841974/Linux+I2C+Driver) (I2C in PL) has the same issue. The hardware supports ACK/NACK configuration, but it would require a custom driver/application.
  * From userspace, the i2c-transactions allow for [some possibile modifications](https://www.kernel.org/doc/html/latest/i2c/i2c-protocol.html?highlight=nack#modified-transactions) related to ACK/NACK.
* ~Investigate Zynqberry~

## Using the pre-build images
1. Download a pre-build image from [here](https://github.com/Jeedella/SoC_Z7_MBD_Platform/releases). Make sure the downloaded version corresponds with the used device, either the Zybo z10 or z20.
2. Unzip the contents onto a FAT32 formatted SD card.
3. Insert the SD card in the SD card slot on the Zybo and make sure the jumper is set to boot from SD.
4. Turn on the board and log in using either uart using the micro-usb cable or ssh over ethernet. The image is set to use dhcp by default. If a static IP is desired edit the `interfaces` file on the SD card accordingly.
   - username = root
   - password = root

## Manually building the image
This entire proces is made and tested on an ubuntu 18.04.5 LTS machine using both the Zybo z10 & z20 as a target.
1. Install buildroot dependencies located in `buildroot/docs/manuals/prerequisits.txt` and copy/replace the `catalog.xml`, `defconfig` and `kconfig` from the `buildroot-config` folder into `buildroot/board/mathworks/zynq/boards/zyboz7/`.
   ````
   cp buildroot-config/* buildroot/board/mathworks/zynq/boards/zyboz7/
   ````
2. Install [linaro toolchain](https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/arm-linux-gnueabihf/) in `/opt`. Rename the folder in such a way that the path is: `/opt/linaro/aarch32-6.3.1-2017.02`.
3. Build the buildroot image: (Will take some time)
	````
	cd buildroot
	./build.py -c board/mathworks/zynq/boards/zyboz7/catalog.xml
	````
4. Put the buildroot output files (`output/zybo_linux_linaro/images/sdcard/`) on a FAT32 formatted SD card and boot the Zybo from it.

## Creating a bitstream with accompanying device tree
1. Make sure Vivado 2018.2 is installed together with same version SDK.
2. Create a vivado project using the provided .tcl files as a basis. In the command below replace the x with the desired zybo version.
   ````
   cd zybo-zx0
   vivado -source init_project.tcl
   ````
   > The Vivado project can also be opened in Windows, using the command prompt:
   > ````
   > cd C:\Users\<username>\Downloads\SoC_Z7_MBD_Platform-master\SoC_Z7_MBD_Platform-master\zybo-10\
   > C:\Xilinx\Vivado\2018.2\settings64.bat
   > vivado -source init_project.tcl
   > ````
3. Make the necessary adjustments to the vivado project, generate a bitstream and export the hdf.
4. Generate a device tree using the [xilinx device-tree-generator](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842279/Build+Device+Tree+Blob), which is included with the SDK.
    ````
    bash /opt/Xilinx/SDK/2018.2/bin/xsct
    hsi open_hw_design buildroot_project/buildroot_project.sdk/matlab_buildroot_top.hdf 
    hsi set_repo_path ../device-tree-xlnx/
    hsi create_sw_design device_tree -os device_tree -proc ps7_cortexa9_0
    hsi generate_target -dir dts
    hsi close_hw_design matlab_buildroot_top
    exit
    ````
    Now a device-tree is generated in the dts folder, however these files still require slight adjustments. These adjustments are located in the `system-user.dtsi` and can be applied by including this file at the bottom of the `dts/system-top.dts`. This can be done using:
    ````
    echo /include/ \"../system-user.dtsi\" >> dts/system-top.dts
    ````
    Once finished the device-tree needs to be compiled into a blob (.dtb), this can be done using the [device tree compiler](https://launchpad.net/ubuntu/+source/device-tree-compiler).
    ````
    dtc -I dts -O dtb -o dts/devicetree.dtb dts/system-top.dts
    ````
5.  Scp the `dts/devicetree.dtb` and `zybo-zx0/buildroot_project/buildroot_project.runs/impl_1/matlab_buildroot_top.bit` to the zybo and set them using `fw_setbitsream` and `fw_setdevicetree`. Reboot the Zybo and everything should work.

## Test/Demo
When using a pre-build image, some test/demo applications are included and accesible in `/mnt/demo_apps` (also copied to `/usr/bin/` for easier access).
The source files for these apps are located in the `demo_apps` folder of this repository.

### Peek and Poke
Reading and writing a value to/of a memory address.
Example to read value of the buttons:
````
peek 0x41200008
````
Example to turn on led0:
````
poke 0x41210000 0x1
````
> Busybox's devmem is a good alternative for peek and poke, especially since it is included in MATLAB's image by default, unlike peek and poke.

### XADC
Reading the values of all four XADC channels can be done using:
````
demo_xadc
````

### Uart
For the UART demo, connect the rx and tx of one interface using a male to male jumper wire.
Pass that corresponding tty as an argument of the app. Below is an example for UARTLite shown.
````
demo_uart /dev/ttyUL1
````
It will send and receive `Hello, world!` if all is connected properly.

### Gpio
An interactive demo for testing the switches, buttons, leds and RGB leds can be run with:
````
demo_gpio
````
The buttons are controlling the leds, and three of the switches control the RGB colors.

## Pinout
| Pin | PMOD-B (z20 only) | PMOD-C | PMOD-D | PMOD-E       | PMOD-F |
| --- | ----------------- | ------ | ------ | ------------ | ------ |
| 1   | UARTlite-rx       | GPIO   | GPIO   | I2C0-SCL     | SS[0]  |
| 2   | UARTlite-tx       | GPIO   | GPIO   | I2C0-SDA     | MOSI   |
| 3   | UART16550-rx      | GPIO   | GPIO   | UARTlite-rx  | MISO   |
| 4   | UART16550-tx      | GPIO   | GPIO   | UARTlite-tx  | SCLK   |
| 7   | GND               | GPIO   | GPIO   | I2C1-SCL     | GPIO   |
| 8   | GND               | GPIO   | GPIO   | I2C1-SDA     | GPIO   |
| 9   | GND               | GPIO   | GPIO   | UART16550-rx | SS[1]  |
| 10  | GND               | GPIO   | GPIO   | UART16550-tx | SS[2]  |

## Axi memory map
| Address     | IP              | Description           |
| ----------- | --------------- | --------------------- |
| 0x4120_0000 | axi_gpio_0      | Switches and buttons  |
| 0x4121_0000 | axi_gpio_1      | Leds and RGB Leds     |
| 0x4122_0000 | axi_gpio_2      | PMOD-C and PMOD-D     |
| 0x43C0_0000 | xadc_wiz_0      | XADC                  |
| 0x42C0_0000 | axi_uartlite_0  | UARTlite              |
| 0x42C1_0000 | axi_uartlite_1  | UARTlite (z20 only)   |
| 0x43C1_0000 | axi_uart16550_0 | UART16550             |
| 0x43C2_0000 | axi_uart16550_1 | UART16550 (z20 only)  |

## Userspace listings
| Description | Path               |
| ----------- | ------------------ |
| UART16550   | `/dev/ttyS*`       |
| UARTlite    | `/dev/ttyUL*`      |
| XADC        | `/dev/iio:device1` |
| I2C         | `/dev/i2c-*`       |
| SPI         | `/dev/spidev1.*`   |
| Switches    | `/dev/gpiochip0`   |
| Buttons     | `/dev/gpiochip1`   |
| Leds        | `/dev/gpiochip2`   |
| RGB Leds    | `/dev/gpiochip3`   |
| PMOD-C      | `/dev/gpiochip4`   |
| PMOD-D      | `/dev/gpiochip5`   |
