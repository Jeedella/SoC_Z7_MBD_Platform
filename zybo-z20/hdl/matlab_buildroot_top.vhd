--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Thu May 13 11:34:58 2021
--Host        : ubuntu-vm running 64-bit Ubuntu 18.04.5 LTS
--Command     : generate_target matlab_buildroot_wrapper.bd
--Design      : matlab_buildroot_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity matlab_buildroot_top is
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
    gpio_rtl_3_tri_o : out STD_LOGIC_VECTOR ( 5 downto 0 );
    pmod_b_gnd : out STD_LOGIC_VECTOR (3 downto 0);
    uart_rtl_0_rxd : in STD_LOGIC;
    uart_rtl_0_txd : out STD_LOGIC;
    uart_rtl_1_rxd : in STD_LOGIC;
    uart_rtl_1_txd : out STD_LOGIC;
    uart_rtl_2_rxd : in STD_LOGIC;
    uart_rtl_2_txd : out STD_LOGIC;
    uart_rtl_3_rxd : in STD_LOGIC;
    uart_rtl_3_txd : out STD_LOGIC
  );
end matlab_buildroot_top;

architecture behavioural of matlab_buildroot_top is
  component matlab_buildroot_wrapper is
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
    gpio_rtl_3_tri_o : out STD_LOGIC_VECTOR ( 5 downto 0 );
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
    uart_rtl_2_baudoutn : out STD_LOGIC;
    uart_rtl_2_ctsn : in STD_LOGIC;
    uart_rtl_2_dcdn : in STD_LOGIC;
    uart_rtl_2_ddis : out STD_LOGIC;
    uart_rtl_2_dsrn : in STD_LOGIC;
    uart_rtl_2_dtrn : out STD_LOGIC;
    uart_rtl_2_out1n : out STD_LOGIC;
    uart_rtl_2_out2n : out STD_LOGIC;
    uart_rtl_2_ri : in STD_LOGIC;
    uart_rtl_2_rtsn : out STD_LOGIC;
    uart_rtl_2_rxd : in STD_LOGIC;
    uart_rtl_2_rxrdyn : out STD_LOGIC;
    uart_rtl_2_txd : out STD_LOGIC;
    uart_rtl_2_txrdyn : out STD_LOGIC;
    uart_rtl_3_rxd : in STD_LOGIC;
    uart_rtl_3_txd : out STD_LOGIC
  );
  end component matlab_buildroot_wrapper;
begin

pmod_b_gnd <= "0000";

matlab_buildroot_i: component matlab_buildroot_wrapper
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
      IIC_0_0_scl_io => IIC_0_0_scl_io,
      IIC_0_0_sda_io => IIC_0_0_sda_io,
      IIC_1_0_scl_io => IIC_1_0_scl_io,
      IIC_1_0_sda_io => IIC_1_0_sda_io,
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
      gpio_rtl_3_tri_o(5 downto 0) => gpio_rtl_3_tri_o(5 downto 0),
      uart_rtl_0_rxd => uart_rtl_0_rxd,
      uart_rtl_0_txd => uart_rtl_0_txd,
      uart_rtl_1_baudoutn => open,
      uart_rtl_1_ctsn => '0',
      uart_rtl_1_dcdn => '1',
      uart_rtl_1_ddis => open,
      uart_rtl_1_dsrn => '1',
      uart_rtl_1_dtrn => open,
      uart_rtl_1_out1n => open,
      uart_rtl_1_out2n => open,
      uart_rtl_1_ri => '1',
      uart_rtl_1_rtsn => open,
      uart_rtl_1_rxd => uart_rtl_1_rxd,
      uart_rtl_1_rxrdyn => open,
      uart_rtl_1_txd => uart_rtl_1_txd,
      uart_rtl_1_txrdyn => open,
      uart_rtl_2_baudoutn => open,
      uart_rtl_2_ctsn => '0',
      uart_rtl_2_dcdn => '1',
      uart_rtl_2_ddis => open,
      uart_rtl_2_dsrn => '1',
      uart_rtl_2_dtrn => open,
      uart_rtl_2_out1n => open,
      uart_rtl_2_out2n => open,
      uart_rtl_2_ri => '1',
      uart_rtl_2_rtsn => open,
      uart_rtl_2_rxd => uart_rtl_2_rxd,
      uart_rtl_2_rxrdyn => open,
      uart_rtl_2_txd => uart_rtl_2_txd,
      uart_rtl_2_txrdyn => open,
      uart_rtl_3_rxd => uart_rtl_3_rxd,
      uart_rtl_3_txd => uart_rtl_3_txd
    );
end behavioural;
