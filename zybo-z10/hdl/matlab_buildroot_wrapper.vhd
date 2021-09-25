--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Fri Sep 24 16:46:20 2021
--Host        : ubuntu18 running 64-bit Ubuntu 18.04.5 LTS
--Command     : generate_target matlab_buildroot_wrapper.bd
--Design      : matlab_buildroot_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity matlab_buildroot_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    IIC_0_0_scl_io : inout STD_LOGIC;
    IIC_0_0_sda_io : inout STD_LOGIC;
    IIC_1_0_scl_io : inout STD_LOGIC;
    IIC_1_0_sda_io : inout STD_LOGIC;
    Vaux14_0_v_n : in STD_LOGIC;
    Vaux14_0_v_p : in STD_LOGIC;
    Vaux15_0_v_n : in STD_LOGIC;
    Vaux15_0_v_p : in STD_LOGIC;
    Vaux6_0_v_n : in STD_LOGIC;
    Vaux6_0_v_p : in STD_LOGIC;
    Vaux7_0_v_n : in STD_LOGIC;
    Vaux7_0_v_p : in STD_LOGIC;
    gpio_rtl_0_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gpio_rtl_1_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gpio_rtl_2_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gpio_rtl_3_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    uart_rtl_0_rxd : in STD_LOGIC;
    uart_rtl_0_txd : out STD_LOGIC;
    uart_rtl_1_baudoutn : out STD_LOGIC;
    uart_rtl_1_ctsn : in STD_LOGIC;
    uart_rtl_1_dcdn : in STD_LOGIC;
    uart_rtl_1_ddis : out STD_LOGIC;
    uart_rtl_1_dsrn : in STD_LOGIC;
    uart_rtl_1_dtrn : out STD_LOGIC;
    uart_rtl_1_out1n : out STD_LOGIC;
    uart_rtl_1_out2n : out STD_LOGIC;
    uart_rtl_1_ri : in STD_LOGIC;
    uart_rtl_1_rtsn : out STD_LOGIC;
    uart_rtl_1_rxd : in STD_LOGIC;
    uart_rtl_1_rxrdyn : out STD_LOGIC;
    uart_rtl_1_txd : out STD_LOGIC;
    uart_rtl_1_txrdyn : out STD_LOGIC
  );
end matlab_buildroot_wrapper;

architecture STRUCTURE of matlab_buildroot_wrapper is
  component matlab_buildroot is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    Vaux6_0_v_n : in STD_LOGIC;
    Vaux6_0_v_p : in STD_LOGIC;
    Vaux7_0_v_n : in STD_LOGIC;
    Vaux7_0_v_p : in STD_LOGIC;
    Vaux14_0_v_n : in STD_LOGIC;
    Vaux14_0_v_p : in STD_LOGIC;
    Vaux15_0_v_n : in STD_LOGIC;
    Vaux15_0_v_p : in STD_LOGIC;
    uart_rtl_0_rxd : in STD_LOGIC;
    uart_rtl_0_txd : out STD_LOGIC;
    uart_rtl_1_baudoutn : out STD_LOGIC;
    uart_rtl_1_ctsn : in STD_LOGIC;
    uart_rtl_1_dcdn : in STD_LOGIC;
    uart_rtl_1_ddis : out STD_LOGIC;
    uart_rtl_1_dsrn : in STD_LOGIC;
    uart_rtl_1_dtrn : out STD_LOGIC;
    uart_rtl_1_out1n : out STD_LOGIC;
    uart_rtl_1_out2n : out STD_LOGIC;
    uart_rtl_1_ri : in STD_LOGIC;
    uart_rtl_1_rtsn : out STD_LOGIC;
    uart_rtl_1_rxd : in STD_LOGIC;
    uart_rtl_1_rxrdyn : out STD_LOGIC;
    uart_rtl_1_txd : out STD_LOGIC;
    uart_rtl_1_txrdyn : out STD_LOGIC;
    IIC_0_0_sda_i : in STD_LOGIC;
    IIC_0_0_sda_o : out STD_LOGIC;
    IIC_0_0_sda_t : out STD_LOGIC;
    IIC_0_0_scl_i : in STD_LOGIC;
    IIC_0_0_scl_o : out STD_LOGIC;
    IIC_0_0_scl_t : out STD_LOGIC;
    IIC_1_0_sda_i : in STD_LOGIC;
    IIC_1_0_sda_o : out STD_LOGIC;
    IIC_1_0_sda_t : out STD_LOGIC;
    IIC_1_0_scl_i : in STD_LOGIC;
    IIC_1_0_scl_o : out STD_LOGIC;
    IIC_1_0_scl_t : out STD_LOGIC;
    gpio_rtl_0_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gpio_rtl_1_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gpio_rtl_2_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gpio_rtl_3_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  end component matlab_buildroot;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal IIC_0_0_scl_i : STD_LOGIC;
  signal IIC_0_0_scl_o : STD_LOGIC;
  signal IIC_0_0_scl_t : STD_LOGIC;
  signal IIC_0_0_sda_i : STD_LOGIC;
  signal IIC_0_0_sda_o : STD_LOGIC;
  signal IIC_0_0_sda_t : STD_LOGIC;
  signal IIC_1_0_scl_i : STD_LOGIC;
  signal IIC_1_0_scl_o : STD_LOGIC;
  signal IIC_1_0_scl_t : STD_LOGIC;
  signal IIC_1_0_sda_i : STD_LOGIC;
  signal IIC_1_0_sda_o : STD_LOGIC;
  signal IIC_1_0_sda_t : STD_LOGIC;
begin
IIC_0_0_scl_iobuf: component IOBUF
     port map (
      I => IIC_0_0_scl_o,
      IO => IIC_0_0_scl_io,
      O => IIC_0_0_scl_i,
      T => IIC_0_0_scl_t
    );
IIC_0_0_sda_iobuf: component IOBUF
     port map (
      I => IIC_0_0_sda_o,
      IO => IIC_0_0_sda_io,
      O => IIC_0_0_sda_i,
      T => IIC_0_0_sda_t
    );
IIC_1_0_scl_iobuf: component IOBUF
     port map (
      I => IIC_1_0_scl_o,
      IO => IIC_1_0_scl_io,
      O => IIC_1_0_scl_i,
      T => IIC_1_0_scl_t
    );
IIC_1_0_sda_iobuf: component IOBUF
     port map (
      I => IIC_1_0_sda_o,
      IO => IIC_1_0_sda_io,
      O => IIC_1_0_sda_i,
      T => IIC_1_0_sda_t
    );
matlab_buildroot_i: component matlab_buildroot
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      IIC_0_0_scl_i => IIC_0_0_scl_i,
      IIC_0_0_scl_o => IIC_0_0_scl_o,
      IIC_0_0_scl_t => IIC_0_0_scl_t,
      IIC_0_0_sda_i => IIC_0_0_sda_i,
      IIC_0_0_sda_o => IIC_0_0_sda_o,
      IIC_0_0_sda_t => IIC_0_0_sda_t,
      IIC_1_0_scl_i => IIC_1_0_scl_i,
      IIC_1_0_scl_o => IIC_1_0_scl_o,
      IIC_1_0_scl_t => IIC_1_0_scl_t,
      IIC_1_0_sda_i => IIC_1_0_sda_i,
      IIC_1_0_sda_o => IIC_1_0_sda_o,
      IIC_1_0_sda_t => IIC_1_0_sda_t,
      Vaux14_0_v_n => Vaux14_0_v_n,
      Vaux14_0_v_p => Vaux14_0_v_p,
      Vaux15_0_v_n => Vaux15_0_v_n,
      Vaux15_0_v_p => Vaux15_0_v_p,
      Vaux6_0_v_n => Vaux6_0_v_n,
      Vaux6_0_v_p => Vaux6_0_v_p,
      Vaux7_0_v_n => Vaux7_0_v_n,
      Vaux7_0_v_p => Vaux7_0_v_p,
      gpio_rtl_0_tri_i(3 downto 0) => gpio_rtl_0_tri_i(3 downto 0),
      gpio_rtl_1_tri_i(3 downto 0) => gpio_rtl_1_tri_i(3 downto 0),
      gpio_rtl_2_tri_o(3 downto 0) => gpio_rtl_2_tri_o(3 downto 0),
      gpio_rtl_3_tri_o(2 downto 0) => gpio_rtl_3_tri_o(2 downto 0),
      uart_rtl_0_rxd => uart_rtl_0_rxd,
      uart_rtl_0_txd => uart_rtl_0_txd,
      uart_rtl_1_baudoutn => uart_rtl_1_baudoutn,
      uart_rtl_1_ctsn => uart_rtl_1_ctsn,
      uart_rtl_1_dcdn => uart_rtl_1_dcdn,
      uart_rtl_1_ddis => uart_rtl_1_ddis,
      uart_rtl_1_dsrn => uart_rtl_1_dsrn,
      uart_rtl_1_dtrn => uart_rtl_1_dtrn,
      uart_rtl_1_out1n => uart_rtl_1_out1n,
      uart_rtl_1_out2n => uart_rtl_1_out2n,
      uart_rtl_1_ri => uart_rtl_1_ri,
      uart_rtl_1_rtsn => uart_rtl_1_rtsn,
      uart_rtl_1_rxd => uart_rtl_1_rxd,
      uart_rtl_1_rxrdyn => uart_rtl_1_rxrdyn,
      uart_rtl_1_txd => uart_rtl_1_txd,
      uart_rtl_1_txrdyn => uart_rtl_1_txrdyn
    );
end STRUCTURE;
