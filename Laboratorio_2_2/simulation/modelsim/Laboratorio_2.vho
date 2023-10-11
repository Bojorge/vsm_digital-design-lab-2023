-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"

-- DATE "08/23/2023 12:13:30"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	problema_2 IS
    PORT (
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	Cin : IN std_logic;
	Sum : BUFFER std_logic_vector(3 DOWNTO 0);
	Cout : BUFFER std_logic
	);
END problema_2;

-- Design Ports Information
-- Sum[0]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum[1]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum[2]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sum[3]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cout	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cin	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF problema_2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cin : std_logic;
SIGNAL ww_Sum : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Cout : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \Cin~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \FA_instance0|Sum~combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \FA_instance1|Sum~combout\ : std_logic;
SIGNAL \FA_instance1|Cout~combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \FA_instance2|Sum~combout\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \FA_instance3|Sum~combout\ : std_logic;
SIGNAL \FA_instance3|Cout~combout\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \FA_instance1|ALT_INV_Cout~combout\ : std_logic;
SIGNAL \ALT_INV_Cin~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Cin <= Cin;
Sum <= ww_Sum;
Cout <= ww_Cout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\FA_instance1|ALT_INV_Cout~combout\ <= NOT \FA_instance1|Cout~combout\;
\ALT_INV_Cin~input_o\ <= NOT \Cin~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;

-- Location: IOOBUF_X89_Y20_N96
\Sum[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA_instance0|Sum~combout\,
	devoe => ww_devoe,
	o => ww_Sum(0));

-- Location: IOOBUF_X89_Y25_N5
\Sum[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA_instance1|Sum~combout\,
	devoe => ww_devoe,
	o => ww_Sum(1));

-- Location: IOOBUF_X89_Y20_N79
\Sum[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA_instance2|Sum~combout\,
	devoe => ww_devoe,
	o => ww_Sum(2));

-- Location: IOOBUF_X89_Y23_N5
\Sum[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA_instance3|Sum~combout\,
	devoe => ww_devoe,
	o => ww_Sum(3));

-- Location: IOOBUF_X89_Y25_N39
\Cout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \FA_instance3|Cout~combout\,
	devoe => ww_devoe,
	o => ww_Cout);

-- Location: IOIBUF_X89_Y23_N55
\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: IOIBUF_X89_Y21_N55
\Cin~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cin,
	o => \Cin~input_o\);

-- Location: IOIBUF_X89_Y20_N44
\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: LABCELL_X88_Y21_N0
\FA_instance0|Sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA_instance0|Sum~combout\ = ( \A[0]~input_o\ & ( !\B[0]~input_o\ $ (\Cin~input_o\) ) ) # ( !\A[0]~input_o\ & ( !\B[0]~input_o\ $ (!\Cin~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001011010101001011010010101011010010110101010010110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_Cin~input_o\,
	datae => \ALT_INV_A[0]~input_o\,
	combout => \FA_instance0|Sum~combout\);

-- Location: IOIBUF_X89_Y21_N4
\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: IOIBUF_X89_Y23_N21
\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: LABCELL_X88_Y21_N39
\FA_instance1|Sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA_instance1|Sum~combout\ = ( \B[0]~input_o\ & ( !\A[1]~input_o\ $ (!\B[1]~input_o\ $ (((\Cin~input_o\) # (\A[0]~input_o\)))) ) ) # ( !\B[0]~input_o\ & ( !\A[1]~input_o\ $ (!\B[1]~input_o\ $ (((\A[0]~input_o\ & \Cin~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101001101001011010011010010101011010011010010110100110100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[1]~input_o\,
	datab => \ALT_INV_A[0]~input_o\,
	datac => \ALT_INV_B[1]~input_o\,
	datad => \ALT_INV_Cin~input_o\,
	datae => \ALT_INV_B[0]~input_o\,
	combout => \FA_instance1|Sum~combout\);

-- Location: LABCELL_X88_Y21_N42
\FA_instance1|Cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA_instance1|Cout~combout\ = ( \B[0]~input_o\ & ( (!\B[1]~input_o\ & (\A[1]~input_o\ & ((\A[0]~input_o\) # (\Cin~input_o\)))) # (\B[1]~input_o\ & (((\A[0]~input_o\) # (\A[1]~input_o\)) # (\Cin~input_o\))) ) ) # ( !\B[0]~input_o\ & ( (!\B[1]~input_o\ & 
-- (\Cin~input_o\ & (\A[1]~input_o\ & \A[0]~input_o\))) # (\B[1]~input_o\ & (((\Cin~input_o\ & \A[0]~input_o\)) # (\A[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100010111000101110011111100000011000101110001011100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Cin~input_o\,
	datab => \ALT_INV_B[1]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	datad => \ALT_INV_A[0]~input_o\,
	datae => \ALT_INV_B[0]~input_o\,
	combout => \FA_instance1|Cout~combout\);

-- Location: IOIBUF_X89_Y21_N21
\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: IOIBUF_X89_Y21_N38
\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: LABCELL_X88_Y21_N51
\FA_instance2|Sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA_instance2|Sum~combout\ = ( \A[2]~input_o\ & ( \B[2]~input_o\ & ( \FA_instance1|Cout~combout\ ) ) ) # ( !\A[2]~input_o\ & ( \B[2]~input_o\ & ( !\FA_instance1|Cout~combout\ ) ) ) # ( \A[2]~input_o\ & ( !\B[2]~input_o\ & ( !\FA_instance1|Cout~combout\ ) 
-- ) ) # ( !\A[2]~input_o\ & ( !\B[2]~input_o\ & ( \FA_instance1|Cout~combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000011110000111100000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \FA_instance1|ALT_INV_Cout~combout\,
	datae => \ALT_INV_A[2]~input_o\,
	dataf => \ALT_INV_B[2]~input_o\,
	combout => \FA_instance2|Sum~combout\);

-- Location: IOIBUF_X89_Y20_N61
\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X89_Y23_N38
\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: LABCELL_X88_Y21_N54
\FA_instance3|Sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA_instance3|Sum~combout\ = ( \A[3]~input_o\ & ( \B[2]~input_o\ & ( !\B[3]~input_o\ $ (((\A[2]~input_o\) # (\FA_instance1|Cout~combout\))) ) ) ) # ( !\A[3]~input_o\ & ( \B[2]~input_o\ & ( !\B[3]~input_o\ $ (((!\FA_instance1|Cout~combout\ & 
-- !\A[2]~input_o\))) ) ) ) # ( \A[3]~input_o\ & ( !\B[2]~input_o\ & ( !\B[3]~input_o\ $ (((\FA_instance1|Cout~combout\ & \A[2]~input_o\))) ) ) ) # ( !\A[3]~input_o\ & ( !\B[2]~input_o\ & ( !\B[3]~input_o\ $ (((!\FA_instance1|Cout~combout\) # 
-- (!\A[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100111100111100001100001100111100111100001100001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \FA_instance1|ALT_INV_Cout~combout\,
	datac => \ALT_INV_B[3]~input_o\,
	datad => \ALT_INV_A[2]~input_o\,
	datae => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_B[2]~input_o\,
	combout => \FA_instance3|Sum~combout\);

-- Location: LABCELL_X88_Y21_N33
\FA_instance3|Cout\ : cyclonev_lcell_comb
-- Equation(s):
-- \FA_instance3|Cout~combout\ = ( \A[3]~input_o\ & ( \B[2]~input_o\ & ( ((\FA_instance1|Cout~combout\) # (\A[2]~input_o\)) # (\B[3]~input_o\) ) ) ) # ( !\A[3]~input_o\ & ( \B[2]~input_o\ & ( (\B[3]~input_o\ & ((\FA_instance1|Cout~combout\) # 
-- (\A[2]~input_o\))) ) ) ) # ( \A[3]~input_o\ & ( !\B[2]~input_o\ & ( ((\A[2]~input_o\ & \FA_instance1|Cout~combout\)) # (\B[3]~input_o\) ) ) ) # ( !\A[3]~input_o\ & ( !\B[2]~input_o\ & ( (\B[3]~input_o\ & (\A[2]~input_o\ & \FA_instance1|Cout~combout\)) ) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001010101110101011100010101000101010111111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[3]~input_o\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \FA_instance1|ALT_INV_Cout~combout\,
	datae => \ALT_INV_A[3]~input_o\,
	dataf => \ALT_INV_B[2]~input_o\,
	combout => \FA_instance3|Cout~combout\);

-- Location: MLABCELL_X15_Y64_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


