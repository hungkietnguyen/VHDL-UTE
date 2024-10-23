----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:42 02/27/2023 
-- Design Name: 
-- Module Name:    dem_ngau_nhien - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dem_ngau_nhien is
    Port ( ckht : in  STD_LOGIC;
           ena_db : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (2 downto 0));
end dem_ngau_nhien;
architecture Behavioral of dem_ngau_nhien is
type fsm is( A,B,C,D,E,F,G,H);
signal tt_next, tt_reg, tt_tg : fsm;
begin
    process(ckht,rst)
	 begin
	     if rst='1'              then tt_reg <= A;
		  elsif falling_edge(ckht) then tt_reg <= tt_next;
		  end if;
	 end process;
	 tt_next <= tt_tg when ena_db ='1' else
		            tt_reg;	 
    process(tt_reg)
	 begin
	      case tt_reg is
			     when A =>q<= "000";
				              tt_tg <= B;
				  when B =>q<= "011";
				              tt_tg <= C;
				  when C =>q<= "100";
				              tt_tg <= D;
				  when D =>q<= "001";
				              tt_tg <= E;
				  when E =>q<= "010";
				              tt_tg <= F;
				  when F =>q<= "110";
				              tt_tg <= G;
				  when G =>q<= "101";
				              tt_tg <= H;
				  when H =>q<= "111";
				              tt_tg <= A;
			end case;
	  end process;
end Behavioral;

