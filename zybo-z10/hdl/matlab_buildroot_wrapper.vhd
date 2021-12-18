--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Sat Dec 18 21:04:41 2021
--Host        : ubuntu18 running 64-bit Ubuntu 18.04.6 LTS
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
    gpio_rtl_4_tri_io : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio_rtl_5_tri_io : inout STD_LOGIC_VECTOR ( 7 downto 0 );
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
    gpio_rtl_3_tri_o : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gpio_rtl_4_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio_rtl_4_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio_rtl_4_tri_t : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio_rtl_5_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio_rtl_5_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gpio_rtl_5_tri_t : out STD_LOGIC_VECTOR ( 7 downto 0 )
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
  signal gpio_rtl_4_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_4_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_4_tri_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_4_tri_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_4_tri_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_4_tri_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_4_tri_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_4_tri_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal gpio_rtl_4_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_4_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_4_tri_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_4_tri_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_4_tri_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_4_tri_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_4_tri_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_4_tri_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal gpio_rtl_4_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_4_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_4_tri_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_4_tri_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_4_tri_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_4_tri_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_4_tri_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_4_tri_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal gpio_rtl_4_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_4_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_4_tri_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_4_tri_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_4_tri_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_4_tri_t_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_4_tri_t_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_4_tri_t_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal gpio_rtl_5_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_5_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_5_tri_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_5_tri_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_5_tri_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_5_tri_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_5_tri_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_5_tri_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal gpio_rtl_5_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_5_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_5_tri_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_5_tri_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_5_tri_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_5_tri_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_5_tri_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_5_tri_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal gpio_rtl_5_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_5_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_5_tri_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_5_tri_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_5_tri_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_5_tri_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_5_tri_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_5_tri_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal gpio_rtl_5_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gpio_rtl_5_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal gpio_rtl_5_tri_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal gpio_rtl_5_tri_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal gpio_rtl_5_tri_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal gpio_rtl_5_tri_t_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal gpio_rtl_5_tri_t_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal gpio_rtl_5_tri_t_7 : STD_LOGIC_VECTOR ( 7 to 7 );
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
gpio_rtl_4_tri_iobuf_0: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_0(0),
      IO => gpio_rtl_4_tri_io(0),
      O => gpio_rtl_4_tri_i_0(0),
      T => gpio_rtl_4_tri_t_0(0)
    );
gpio_rtl_4_tri_iobuf_1: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_1(1),
      IO => gpio_rtl_4_tri_io(1),
      O => gpio_rtl_4_tri_i_1(1),
      T => gpio_rtl_4_tri_t_1(1)
    );
gpio_rtl_4_tri_iobuf_2: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_2(2),
      IO => gpio_rtl_4_tri_io(2),
      O => gpio_rtl_4_tri_i_2(2),
      T => gpio_rtl_4_tri_t_2(2)
    );
gpio_rtl_4_tri_iobuf_3: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_3(3),
      IO => gpio_rtl_4_tri_io(3),
      O => gpio_rtl_4_tri_i_3(3),
      T => gpio_rtl_4_tri_t_3(3)
    );
gpio_rtl_4_tri_iobuf_4: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_4(4),
      IO => gpio_rtl_4_tri_io(4),
      O => gpio_rtl_4_tri_i_4(4),
      T => gpio_rtl_4_tri_t_4(4)
    );
gpio_rtl_4_tri_iobuf_5: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_5(5),
      IO => gpio_rtl_4_tri_io(5),
      O => gpio_rtl_4_tri_i_5(5),
      T => gpio_rtl_4_tri_t_5(5)
    );
gpio_rtl_4_tri_iobuf_6: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_6(6),
      IO => gpio_rtl_4_tri_io(6),
      O => gpio_rtl_4_tri_i_6(6),
      T => gpio_rtl_4_tri_t_6(6)
    );
gpio_rtl_4_tri_iobuf_7: component IOBUF
     port map (
      I => gpio_rtl_4_tri_o_7(7),
      IO => gpio_rtl_4_tri_io(7),
      O => gpio_rtl_4_tri_i_7(7),
      T => gpio_rtl_4_tri_t_7(7)
    );
gpio_rtl_5_tri_iobuf_0: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_0(0),
      IO => gpio_rtl_5_tri_io(0),
      O => gpio_rtl_5_tri_i_0(0),
      T => gpio_rtl_5_tri_t_0(0)
    );
gpio_rtl_5_tri_iobuf_1: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_1(1),
      IO => gpio_rtl_5_tri_io(1),
      O => gpio_rtl_5_tri_i_1(1),
      T => gpio_rtl_5_tri_t_1(1)
    );
gpio_rtl_5_tri_iobuf_2: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_2(2),
      IO => gpio_rtl_5_tri_io(2),
      O => gpio_rtl_5_tri_i_2(2),
      T => gpio_rtl_5_tri_t_2(2)
    );
gpio_rtl_5_tri_iobuf_3: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_3(3),
      IO => gpio_rtl_5_tri_io(3),
      O => gpio_rtl_5_tri_i_3(3),
      T => gpio_rtl_5_tri_t_3(3)
    );
gpio_rtl_5_tri_iobuf_4: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_4(4),
      IO => gpio_rtl_5_tri_io(4),
      O => gpio_rtl_5_tri_i_4(4),
      T => gpio_rtl_5_tri_t_4(4)
    );
gpio_rtl_5_tri_iobuf_5: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_5(5),
      IO => gpio_rtl_5_tri_io(5),
      O => gpio_rtl_5_tri_i_5(5),
      T => gpio_rtl_5_tri_t_5(5)
    );
gpio_rtl_5_tri_iobuf_6: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_6(6),
      IO => gpio_rtl_5_tri_io(6),
      O => gpio_rtl_5_tri_i_6(6),
      T => gpio_rtl_5_tri_t_6(6)
    );
gpio_rtl_5_tri_iobuf_7: component IOBUF
     port map (
      I => gpio_rtl_5_tri_o_7(7),
      IO => gpio_rtl_5_tri_io(7),
      O => gpio_rtl_5_tri_i_7(7),
      T => gpio_rtl_5_tri_t_7(7)
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
      gpio_rtl_4_tri_i(7) => gpio_rtl_4_tri_i_7(7),
      gpio_rtl_4_tri_i(6) => gpio_rtl_4_tri_i_6(6),
      gpio_rtl_4_tri_i(5) => gpio_rtl_4_tri_i_5(5),
      gpio_rtl_4_tri_i(4) => gpio_rtl_4_tri_i_4(4),
      gpio_rtl_4_tri_i(3) => gpio_rtl_4_tri_i_3(3),
      gpio_rtl_4_tri_i(2) => gpio_rtl_4_tri_i_2(2),
      gpio_rtl_4_tri_i(1) => gpio_rtl_4_tri_i_1(1),
      gpio_rtl_4_tri_i(0) => gpio_rtl_4_tri_i_0(0),
      gpio_rtl_4_tri_o(7) => gpio_rtl_4_tri_o_7(7),
      gpio_rtl_4_tri_o(6) => gpio_rtl_4_tri_o_6(6),
      gpio_rtl_4_tri_o(5) => gpio_rtl_4_tri_o_5(5),
      gpio_rtl_4_tri_o(4) => gpio_rtl_4_tri_o_4(4),
      gpio_rtl_4_tri_o(3) => gpio_rtl_4_tri_o_3(3),
      gpio_rtl_4_tri_o(2) => gpio_rtl_4_tri_o_2(2),
      gpio_rtl_4_tri_o(1) => gpio_rtl_4_tri_o_1(1),
      gpio_rtl_4_tri_o(0) => gpio_rtl_4_tri_o_0(0),
      gpio_rtl_4_tri_t(7) => gpio_rtl_4_tri_t_7(7),
      gpio_rtl_4_tri_t(6) => gpio_rtl_4_tri_t_6(6),
      gpio_rtl_4_tri_t(5) => gpio_rtl_4_tri_t_5(5),
      gpio_rtl_4_tri_t(4) => gpio_rtl_4_tri_t_4(4),
      gpio_rtl_4_tri_t(3) => gpio_rtl_4_tri_t_3(3),
      gpio_rtl_4_tri_t(2) => gpio_rtl_4_tri_t_2(2),
      gpio_rtl_4_tri_t(1) => gpio_rtl_4_tri_t_1(1),
      gpio_rtl_4_tri_t(0) => gpio_rtl_4_tri_t_0(0),
      gpio_rtl_5_tri_i(7) => gpio_rtl_5_tri_i_7(7),
      gpio_rtl_5_tri_i(6) => gpio_rtl_5_tri_i_6(6),
      gpio_rtl_5_tri_i(5) => gpio_rtl_5_tri_i_5(5),
      gpio_rtl_5_tri_i(4) => gpio_rtl_5_tri_i_4(4),
      gpio_rtl_5_tri_i(3) => gpio_rtl_5_tri_i_3(3),
      gpio_rtl_5_tri_i(2) => gpio_rtl_5_tri_i_2(2),
      gpio_rtl_5_tri_i(1) => gpio_rtl_5_tri_i_1(1),
      gpio_rtl_5_tri_i(0) => gpio_rtl_5_tri_i_0(0),
      gpio_rtl_5_tri_o(7) => gpio_rtl_5_tri_o_7(7),
      gpio_rtl_5_tri_o(6) => gpio_rtl_5_tri_o_6(6),
      gpio_rtl_5_tri_o(5) => gpio_rtl_5_tri_o_5(5),
      gpio_rtl_5_tri_o(4) => gpio_rtl_5_tri_o_4(4),
      gpio_rtl_5_tri_o(3) => gpio_rtl_5_tri_o_3(3),
      gpio_rtl_5_tri_o(2) => gpio_rtl_5_tri_o_2(2),
      gpio_rtl_5_tri_o(1) => gpio_rtl_5_tri_o_1(1),
      gpio_rtl_5_tri_o(0) => gpio_rtl_5_tri_o_0(0),
      gpio_rtl_5_tri_t(7) => gpio_rtl_5_tri_t_7(7),
      gpio_rtl_5_tri_t(6) => gpio_rtl_5_tri_t_6(6),
      gpio_rtl_5_tri_t(5) => gpio_rtl_5_tri_t_5(5),
      gpio_rtl_5_tri_t(4) => gpio_rtl_5_tri_t_4(4),
      gpio_rtl_5_tri_t(3) => gpio_rtl_5_tri_t_3(3),
      gpio_rtl_5_tri_t(2) => gpio_rtl_5_tri_t_2(2),
      gpio_rtl_5_tri_t(1) => gpio_rtl_5_tri_t_1(1),
      gpio_rtl_5_tri_t(0) => gpio_rtl_5_tri_t_0(0),
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
