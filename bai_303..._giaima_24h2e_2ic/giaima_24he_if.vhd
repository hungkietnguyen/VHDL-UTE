----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:04 02/08/2023 
-- Design Name: 
-- Module Name:    giaima_24he_if - Behavioral 
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

entity giaima_24he_if is
    Port ( i : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC_VECTOR (3 downto 0);
           e : in  STD_LOGIC);
end giaima_24he_if;
architecture Behavioral of giaima_24he_if is
begin
      process(i)
		       begin
				       if e='0'       then o <="0000";
						 elsif i="00" then o <="0001";
						 elsif i="01" then o <="0010";
						 elsif i="10" then o <="0100";
						 else                     o<="1000";
						 end if;
				 end process;
						 
end Behavioral;

