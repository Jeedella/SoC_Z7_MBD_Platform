# SoC Z7 MBD Platform

## Progress

### Implemented
* XADC
* PS uart, uartlite and uart16550. (Listed in user space but not yet tested in C app).
* 2 PS I2C controllers. (Listed in user space but not yet tested in C app).
* PS spi controller with 3 slave selects. (Listed in user space but not yet tested in C app).

### To do
* Investigate I2C acknowledge
* Investigate Zynqberry

## How to setup
This entire proces is made and tested on an ubuntu 18.04.5 LTS machine using the Zybo Z20 as a target.
1. Install buildroot dependencies located in `buildroot/docs/manuals/prerequisits.txt` and copy/replace the `catalog.xml`, `defconfig` and `kconfig` from this repo into the buildroot/board/mathworks/zynq/boards/zyboz7/` folder.
2. Install [linaro toolchain](https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/arm-linux-gnueabihf/) in `/opt`. Rename the folder in such a way that the path is: `/opt/linaro/aarch32-6.3.1-2017.02`.
3. Build the buildroot image: (Will take some time)
	````
	cd buildroot
	./build.py -c board/mathworks/zynq/boards/zyboz7/catalog.xml
	````
4. Unzip the `Zybo-Z20-Vivado` project (Vivado 2018.2), make the desired changes to the block diagram, generate a bitstream and export the hardware.
5. Generate a device tree using the [xilinx device-tree-generator](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842279/Build+Device+Tree+Blob).
    ````
    cd SoC_Z7_MBD_Platform/
    bash /opt/Xilinx/SDK/2018.2/bin/xsct
    hsi open_hw_design Zybo-Z20-Vivado/Zybo-Z20-Vivado.sdk/matlab_buildroot_top.hdf 
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
    cd dts
    dtc -I dts -O dtb -o devicetree.dtb system-top.dts
    ````
6. Put the buildroot output files (`buildroot/output/zybo_linux_linaro/images/sdcard`) on a fat32 formatted SD card and boot from it. Scp the `dts/devicetree.dtb` and `Zybo-Z20-Vivado/Zybo-Z20-Vivado.runs/impl_1/matlab_buildroot_top.bit` to the zybo and set them using `fw_setbitsream` and `fw_setdevicetree`. Reboot the Zybo and everything should work.

## Test/Demo
Some small test/demo applications for testing the features included in the image are located in the `test_apps` folder.

## Pinout
| Pin | PMOD-E       | PMOD-F |
| --- | ------------ | ------ |
| 1   | I2C0-SCL     | SS[0]  |
| 2   | I2C0-SDA     | MOSI   |
| 3   | UARTlite-rx  | MISO   |
| 4   | UARTlite-tx  | SCLK   |
| 7   | I2C1-SCL     | GPIO   |
| 8   | I2C1-SDA     | GPIO   |
| 9   | UART16550-rx | SS[1]  |
| 10  | UART16550-tx | SS[2]  |
