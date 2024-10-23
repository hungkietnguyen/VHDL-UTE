----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:53 04/27/2022 
-- Design Name: 
-- Module Name:    dahop_4kenh - Behavioral 
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

entity dahop_4kenh is
    Port ( s : in  STD_LOGIC_VECTOR (1 downto 0);
           i0 : in  STD_LOGIC_VECTOR (3 downto 0);
           i1 : in  STD_LOGIC_VECTOR (3 downto 0);
           i2 : in  STD_LOGIC_VECTOR (3 downto 0);
           i3 : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end dahop_4kenh;

architecture Behavioral of dahop_4kenh is

begin
			o <= 	i0 when s="00" else
					i1 when s="01" else
					i2 when s="10"else
					i3 ;

end Behavioral;

