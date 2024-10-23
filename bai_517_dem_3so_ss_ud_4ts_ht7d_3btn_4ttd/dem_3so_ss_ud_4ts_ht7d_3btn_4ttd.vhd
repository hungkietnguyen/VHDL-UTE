----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:37:47 04/14/2023 
-- Design Name: 
-- Module Name:    dem_3so_ss_ud_4ts_ht7d_3btn_4ttd - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_3so_ss_ud_4ts_ht7d_3btn_4ttd is
    Port ( ckht : in  STD_LOGIC;
           btn : in  STD_LOGIC_VECTOR (2 downto 0);
           led : out  STD_LOGIC_VECTOR (3 downto 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0);
           cathode : out  STD_LOGIC_VECTOR (7 downto 0));
end dem_3so_ss_ud_4ts_ht7d_3btn_4ttd;

architecture Behavioral of dem_3so_ss_ud_4ts_ht7d_3btn_4ttd is
signal rst: std_logic;
signal donvi : std_logic_vector(3 downto 0);
signal chuc  : std_logic_vector(3 downto 0);
signal tram  : std_logic_vector(3 downto 0);
signal ena_db: std_logic;
signal ena1khz :std_logic;
signal ena1hz :std_logic;
signal ena5hz :std_logic;
signal ena10hz :std_logic;
signal ena20hz :std_logic;
signal dc_8led: std_logic_vector(7 downto 0);
signal ena_8led:std_logic_vector(7 downto 0);
signal ena2b   :std_logic_vector(1 downto 0);
signal s4ts : std_logic_vector(1 downto 0);
signal dv_ts   :std_logic_vector(3 downto 0);
signal ch_ts   :std_logic_vector(3 downto 0);
signal btnud: std_logic;
signal ena_ss: std_logic;
signal ena_ud: std_logic;
signal btnts : std_logic;
signal btndk : std_logic;
signal ttdk : std_logic_vector(1 downto 0);
begin
    rst <= btn(0);
	 btndk <= btn(1);
	 btnts <= btn(2);
	 
	 led(0) <= ena_ss;
	 led(1) <= ena_ud;
	 led(2) <= s4ts(0);
	 led(3) <= s4ts(1);

	 dc_8led <=x"00";
	 ena_8led <="11000" & ena2b &'1';
	 ena_ss <= ttdk(0);
	 ena_ud <= not ttdk(1);
				  
IC1: entity work.xoa_so_0_vn
     port map( ena2b => ena2b,
	            tram =>tram,
					chuc => chuc);
					
IC2: entity work.ht_4tanso
     port map( ena1hz => ena1hz,
					ena5hz => ena5hz,
					ena10hz => ena10hz,
					ena20hz => ena20hz,
					ena_db => ena_db,
					dv_ts => dv_ts,
					ch_ts => ch_ts,
					s     =>s4ts);
					
IC3: entity work.chia_10ena
     port map( ckht => ckht,
	            ena1hz => ena1hz,
					ena5hz => ena5hz,
					ena10hz => ena10hz,
					ena20hz => ena20hz,
					ena1khz => ena1khz);
		
IC4: entity work.dem_3so_ssud
	  port map( ckht => ckht,
				   rst => rst,
				   ena_db => ena_db,
				   ena_ss => ena_ss,
				   ena_ud => ena_ud,
				   donvi => donvi,
					chuc => chuc,
					tram => tram);
IC5: entity work.gm_ht_8led
	  port map( ckht => ckht,
				   ena1khz => ena1khz,
				   led70 => donvi,
				   led71 => chuc,
				   led72 => tram,
				   led73 => x"3",
				   led74 => x"4",
				   led75 => x"5",
				   led76 => dv_ts,
				   led77 => ch_ts,
				   dc_8led => dc_8led,
				   ena_8led => ena_8led,
				   sseg     => sseg,
				   cathode  => cathode);
					
IC6: entity work.dem_2bit_btn
     port map( ckht => ckht,
	            btn => btndk,
					rst =>rst,
					q => ttdk);
IC7: entity work.dem_2bit_btn
     port map( ckht => ckht,
	            btn => btnts,
					rst =>rst,
					q   => s4ts);
					

					
end Behavioral;

