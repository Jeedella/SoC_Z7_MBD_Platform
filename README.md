# SoC Z7 MBD Platform

## Progress

### Implemented
* XADC

### To do
* Better README
* Add extra communication protocols to image (I2C, SPI, UART)
* Investigate I2C acknowledge
* Investigate SPI slave select lines
* Investigate Zynqberry

## How to setup
1. Install buildroot dependencies located in `buildroot/docs/manuals/prerequisits.txt`.
2. Install [linaro toolchain](https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/arm-linux-gnueabihf/) in `/opt`. Path should be: `/opt/linaro/aarch32-6.3.1-2017.02`.
3. Build buildroot image: (Will take some time)
	````
	cd buildroot/
	./build.py -c board/mathworks/zynq/boards/zyboz7/catalog.xml
	````
4. Unzip the Vivado (2018.2) project, make the desired changes, generate a bitstream and export the hardware.
5. Generate a device tree using the [xilinx device-tree-generator](board/mathworks/zynq/boards/zyboz7/catalog.xml). Use the dtc snap package to compile the generated .dts into a .dtb.
6. Put the build output files on a fat32 formatted SD card and boot from it. scp the .dtb file and bitstream to the zybo and set them using `fw_set_bitsream` and `fw_set_devicetree`.

## Test/Demo
Some small test/demo applications for testing the features included in the image are located in the `test_apps` folder.