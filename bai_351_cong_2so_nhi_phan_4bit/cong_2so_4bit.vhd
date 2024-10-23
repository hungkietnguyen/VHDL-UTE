----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:59:50 02/13/2023 
-- Design Name: 
-- Module Name:    cong_2so_4bit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cong_2so_4bit is
    Port ( soa : in  STD_LOGIC_VECTOR (3 downto 0);
           sob : in  STD_LOGIC_VECTOR (3 downto 0);
           ketqua : out  STD_LOGIC_VECTOR (4 downto 0));
end cong_2so_4bit;
architecture Behavioral of cong_2so_4bit is
signal kqt, soat, sobt : signed (4 downto 0);
begin
    soat<='0' & signed(soa);
	 sobt<='0' & signed(sob);
	 kqt<=soat+sobt;
	 ketqua<=std_logic_vector(kqt);
end Behavioral;

