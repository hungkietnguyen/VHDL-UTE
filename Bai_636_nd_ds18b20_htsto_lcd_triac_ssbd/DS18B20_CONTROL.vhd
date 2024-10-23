----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:17:38 05/15/2023 
-- Design Name: 
-- Module Name:    DS18B20_CONTROL - Behavioral 
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

entity DS18B20_CONTROL is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DS18B20 : inout  STD_LOGIC;
           DS_PRE : out  STD_LOGIC;
           NHIETDO : out  STD_LOGIC_VECTOR (11 downto 0));
end DS18B20_CONTROL;

architecture Behavioral of DS18B20_CONTROL is
CONSTANT	ML_SKIP_ROM	:	STD_LOGIC_VECTOR(7 DOWNTO 0):=X"CC";
CONSTANT	ML_CONVERT	:	STD_LOGIC_VECTOR(7 DOWNTO 0):=X"44";
CONSTANT	ML_READ_RAM	:	STD_LOGIC_VECTOR(7 DOWNTO 0):=X"BE";

TYPE	STATE_TYPE IS(
	RESET,
	SKIP_ROM,
	WRITE_BYTE,
	WRITE_BIT0,
	WRITE_BIT1,
	READ_BIT,
	CONVERT_T,
	READ_SCRAT,
	GET_TEMP,
	WAIT_4MS);
SIGNAL	STATE:	STATE_TYPE:=RESET;
SIGNAL	J:	INTEGER	RANGE	0 TO 200001:=0;
SIGNAL	K:	INTEGER	RANGE	0 TO 13:=0;

SIGNAL	TT:	INTEGER	RANGE	0 TO 4:=0;
SIGNAL	TT_RST:	INTEGER	RANGE	0 TO 3:=0;

SIGNAL	TT_WR_B0:	INTEGER	RANGE	0 TO 1:=0;
SIGNAL	TT_WR_B1:	INTEGER	RANGE 0 TO 1:=0;
SIGNAL	TT_RD_B:		INTEGER	RANGE 0 TO 3:=0;

SIGNAL	DS_IN:	STD_LOGIC;
SIGNAL	DS_OUT:	STD_LOGIC;
SIGNAL	DS_ENA:	STD_LOGIC;

SIGNAL	DLG	:	STD_LOGIC_VECTOR(7 DOWNTO 0):=X"00";
SIGNAL	DLN	:	STD_LOGIC_VECTOR(11 DOWNTO 0);
begin
	DS18B20	<=	DS_OUT	WHEN	DS_ENA='1'	ELSE
					'Z';
	PROCESS(STATE,CKHT,RST)
	BEGIN
		IF	RST='1'	THEN	STATE	<=	RESET;
								TT		<=	0;
								TT_WR_B0<=	0;
								TT_WR_B1<=	0;
								K		<=	0;
								TT_RD_B	<=	0;
								DLG	<=	"00000001";
		ELSIF	RISING_EDGE(CKHT)	THEN
			CASE	STATE IS
				WHEN	RESET	=>	
					CASE	TT_RST IS
						WHEN	0	=>	DS_OUT	<=	'0';
										DS_ENA	<=	'1';
										IF	J<25000 THEN J	<=	J+1;
										ELSE	J	<=0;
												TT_RST	<=	1;
										END IF;
						WHEN	1	=>	DS_ENA	<='0';
										IF	J<500 THEN J <= J+1;
										ELSE	J<= 0;
												TT_RST <= 2;
										END IF;
						WHEN	2	=>	DS_ENA	<=	'0';
										IF	J<12000 THEN J <= J+1;
										ELSE	J<= 0;
												TT_RST <= 3;
										END IF;
										IF	J=3000 THEN DS_PRE<=	DS18B20;
															DS_IN	<=	DS18B20;
										END IF;
						WHEN 3	=>	TT_RST<= 0;
										IF DS_IN= '0' THEN STATE <= SKIP_ROM;
										ELSE STATE	<=	RESET;
										END IF;
					END CASE;
				WHEN	SKIP_ROM	=>	DLG	<=	ML_SKIP_ROM;
											STATE	<=	WRITE_BYTE;
				WHEN	WRITE_BYTE=>	
					CASE K IS
						WHEN 0 TO 7 =>	IF DLG(K)='0' THEN
																STATE<=	WRITE_BIT0;
											ELSE				STATE<=	WRITE_BIT1;
											END IF;
											K<= K+1;
						WHEN	8		=>	IF TT=0 THEN TT<=1;
														STATE	<=	CONVERT_T;
											ELSIF	TT=1 THEN TT<=2;
													STATE	<=	RESET;
											ELSIF	TT=2 THEN TT<=3;
														STATE <=	READ_SCRAT;
											ELSIF	TT=3 THEN TT<=0;
														STATE <=	GET_TEMP;
											END IF;
											K <=	0;
						WHEN OTHERS	=>	STATE <=	RESET;
					END CASE;
				WHEN	WRITE_BIT0=>
					CASE	TT_WR_B0 IS
						WHEN 0 =>	DS_OUT<=	'0';
										DS_ENA<=	'1';
										IF J<3500 THEN J<=J+1;
										ELSE J<= 0;
												TT_WR_B0<= 1;
										END IF;
						WHEN 1 =>	DS_ENA <= '0';
										IF J<250 THEN J <=J+1;
										ELSE	J<=0;
												TT_WR_B0<=0;
												STATE<=	WRITE_BYTE;
										END IF;
					END CASE;
				WHEN	WRITE_BIT1=>
					CASE	TT_WR_B1 IS
						WHEN 0 =>	DS_OUT<= '0';
										DS_ENA<=	'1';
										IF J<400 THEN J<=J+1;
										ELSE	J<=0;
												TT_WR_B1<= 1;
										END IF;
						WHEN 1 =>	DS_ENA<= '0';
										IF J<3600 THEN J<=J+1;
										ELSE J<=0;
												TT_WR_B1<=0;
												STATE<=	WRITE_BYTE;
										END IF;
					END CASE;
				WHEN CONVERT_T =>	DLG 	<=	ML_CONVERT;
										STATE	<=	WRITE_BYTE;
				WHEN	READ_SCRAT=>	DLG <=	ML_READ_RAM;
											STATE<=	WRITE_BYTE;
				WHEN	READ_BIT=>
					CASE	TT_RD_B IS
						WHEN 0 =>	DS_OUT <= '0';
										DS_ENA <= '1';
										IF J<200 THEN J<= J+1;
										ELSE	J<=0;
												TT_RD_B<=1;
										END IF;
						WHEN 1 =>	DS_ENA <= '0';
										IF J<200 THEN J<=J+1;
										ELSE J<=0;
												TT_RD_B<=2;
										END IF;
						WHEN 2 =>	DS_ENA <= '0';
										DS_IN	 <= DS18B20;
										IF J<50 THEN J<=J+1;
										ELSE J<=0;
												TT_RD_B<=3;
										END IF;
						WHEN 3 =>	DS_ENA<= '0';
										IF J<2750 THEN J<= J+1;
										ELSE J<= 0;
												TT_RD_B<= 0;
												STATE<= GET_TEMP;
										END IF;
					END CASE;
				WHEN GET_TEMP=>
					CASE K IS
						WHEN 0	=>	STATE <= READ_BIT;
										K		<=	K+1;
						WHEN 1 TO 12 =>	STATE<= READ_BIT;
												DLN(K-1)<=DS_IN;
												K<=K+1;
						WHEN 13		=>		K<= 0;
												STATE<= WAIT_4MS;
					END CASE;
				WHEN WAIT_4MS		=>	IF J<200000 THEN 
															J<= J+1;
															STATE<= WAIT_4MS;
											ELSE J<=0;
													STATE<= RESET;
											END IF;
			END CASE;
		END IF;
	END PROCESS;
	NHIETDO	<= DLN;

end Behavioral;

