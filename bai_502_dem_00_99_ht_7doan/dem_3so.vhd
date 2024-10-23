----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:56:20 03/28/2023 
-- Design Name: 
-- Module Name:    dem_3so - Behavioral 
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

entity dem_3so is
    Port ( ena_db : in  STD_LOGIC;
           ckht : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena_ss : in  STD_LOGIC;
           donvi : out  STD_LOGIC_VECTOR (3 downto 0);
           chuc : out  STD_LOGIC_VECTOR (3 downto 0);
           tram : out  STD_LOGIC_VECTOR (3 downto 0));
end dem_3so;

architecture Behavioral of dem_3so is

begin


end Behavioral;

