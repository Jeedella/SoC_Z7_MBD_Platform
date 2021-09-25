# SoC Z7 MBD Platform

## Progress

### Implemented
* XADC
* PS uart, uartlite and uart16550.
  * 1x uartlite and uart16550 on the Zybo z10.
  * 2x uartlite and uart16550 on the Zybo z20.
* 2 x PS I2C. (Listed in user space but not yet tested in C app).
* PS spi controller with 3 slave selects. (Listed in user space but not yet tested in C app).
* Switches, buttons, leds and rgb leds accessible in user space using gpiochip.

### To do
* Investigate I2C acknowledge
* Investigate Zynqberry

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
3. Make the necessary adjustments to the vivado project, generate a bitstream and export the hdf.
4. Generate a device tree using the [xilinx device-tree-generator](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842279/Build+Device+Tree+Blob).
    ````
    bash /opt/Xilinx/SDK/2018.2/bin/xsct
    hsi open_hw_design buildroot_project/buildroot_project.sdk/matlab_buildroot_top.hdf 
    hsi set_repo_path device-tree-xlnx/
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
Some small test/demo applications for testing the features included in the image are located in the `test_apps` folder.

## Pinout
| Pin | PMOD-B (z20 only) | PMOD-E       | PMOD-F |
| --- | ----------------- | ------------ | ------ |
| 1   | UARTlite-rx       | I2C0-SCL     | SS[0]  |
| 2   | UARTlite-tx       | I2C0-SDA     | MOSI   |
| 3   | UART16550-rx      | UARTlite-rx  | MISO   |
| 4   | UART16550-tx      | UARTlite-tx  | SCLK   |
| 7   | GND               | I2C1-SCL     | GPIO   |
| 8   | GND               | I2C1-SDA     | GPIO   |
| 9   | GND               | UART16550-rx | SS[1]  |
| 10  | GND               | UART16550-tx | SS[2]  |
