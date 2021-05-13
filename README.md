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
This entire proces is made and tested on an ubuntu 18.04.5 LTS machine using the Zybo Z20 as a target.
1. Install buildroot dependencies located in `buildroot/docs/manuals/prerequisits.txt`.
2. Install [linaro toolchain](https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/arm-linux-gnueabihf/) in `/opt`. Path should be: `/opt/linaro/aarch32-6.3.1-2017.02`.
3. Build buildroot image: (Will take some time)
	````
	cd buildroot/
	./build.py -c board/mathworks/zynq/boards/zyboz7/catalog.xml
	````
4. Unzip the Vivado (2018.2) project, make the desired changes to the block diagram, generate a bitstream and export the hardware.
5. Generate a device tree using the [xilinx device-tree-generator](board/mathworks/zynq/boards/zyboz7/catalog.xml).
    ````
    cd SoC_Z7_MBD_Platform/
    bash /opt/Xilinx/SDK/2018.2/bin/xsct
    hsi open_hw_design Zybo-Z20-Vivado/Zybo-Z20-Vivado.sdk/matlab_buildroot_wrapper.hdf 
    hsi set_repo_path device-tree-xlnx/
    hsi create_sw_design device_tree -os device_tree -proc ps7_cortexa9_0
    hsi generate_target -dir dts
    hsi close_hw_design matlab_buildroot_wrapper
    exit
    ````
    Now a device-tree is generated in the dts folder. In these files the nescessary adjustments can be made. For example, in the XADC node the following needs to be added:
    ````
    xlnx,channels {
        #address-cells = <1>;
        #size-cells = <0>;
        channelJA4@7 {
            reg = <7>;
        };
        channelJA2@8 {
            reg = <8>;
        };
        channelJA1@15 {
            reg = <15>;
        };
        channelJA3@16 {
            reg = <16>;
        };
    };
    ````
    Once finished the device-tree needs to be compiled into a blob (.dtb), this can be done using the [device tree compiler](https://launchpad.net/ubuntu/+source/device-tree-compiler).
    ````
    cd dts
    dtc -I dts -O dtb -o devicetree.dtb system-top.dts
    ````
6. Put the buildroot output files (`buildroot/output/zybo_linux_linaro/images/sdcard`) on a fat32 formatted SD card and boot from it. Scp the .dtb file and bitstream to the zybo and set them using `fw_set_bitsream` and `fw_set_devicetree`. Reboot the Zybo and everything should work.

## Test/Demo
Some small test/demo applications for testing the features included in the image are located in the `test_apps` folder.
