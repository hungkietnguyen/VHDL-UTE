----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:10 05/26/2022 
-- Design Name: 
-- Module Name:    DHT11_HUMI_TEMP - Behavioral 
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

entity DHT11_HUMI_TEMP is
    Port ( CKHT : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           DHT11 : inout  STD_LOGIC;
           DHT_PR : out  STD_LOGIC;
           DA_ND5 : out  STD_LOGIC_VECTOR (39 downto 0));
end DHT11_HUMI_TEMP;

architecture Behavioral of DHT11_HUMI_TEMP is

TYPE STATE_TYPE IS ( RESET, GET_HUMI_TEMP,READ_BIT, WAIT_MS);
SIGNAL STATE: STATE_TYPE:= RESET;

CONSTANT N: INTEGER:= 50000000;
SIGNAL J: INTEGER RANGE 0 TO N*2:=0;

SIGNAL DHT_IN: STD_LOGIC;
SIGNAL DHT_OUT: STD_LOGIC;
SIGNAL DHT_ENA: STD_LOGIC;
SIGNAL DHT_DATA: STD_LOGIC;

SIGNAL TT_RST: INTEGER RANGE 0 TO 7:=0;
SIGNAL TT_RD:  INTEGER RANGE 0 TO 3:=0;
SIGNAL PTR:    INTEGER RANGE 0 TO 40:=0;

begin
	DHT11		<= DHT_OUT  WHEN DHT_ENA ='1' ELSE
					'Z';
	
	PROCESS( STATE, CKHT, RST)
	BEGIN
		IF RST='1' THEN STATE  <= RESET;
							 TT_RD  <= 0;
							 TT_RST <= 0;
							 PTR    <= 0;
							 
		ELSIF FALLING_EDGE(CKHT) THEN
			CASE STATE IS
				WHEN RESET  => 
				
					CASE TT_RST IS
					
					 WHEN 0 => DHT_ENA  <= '0';
							IF J =3000 THEN J <= 0;
											TT_RST <= 1;
						ELSE				 J    <= J+1;
						END IF;

					 WHEN 1 => DHT_OUT  <= '0';-- KEO XUONG 0
					           DHT_ENA  <= '1';
							IF J =1250000 THEN J <= 0;
											   TT_RST <= 2;
						ELSE				 J    <= J+1;
						END IF;

					 WHEN 2 => DHT_ENA  <= '0';--- KEO LEN 1
							IF J =3000 THEN J <= 0;
											TT_RST <= 3;
						ELSE				 J    <= J+1;
						END IF;
    
	   ----DHT11 KEO VE 0
				    WHEN 3 => DHT_ENA  <= '0';
					           DHT_IN   <= DHT11;
							IF J =4000 THEN J <= 0;
											   TT_RST <= 7;
						ELSE				 J    <= J+1;
						   IF DHT_IN ='0'  THEN   TT_RST  <= 4;
																J   <= 0;
							END IF;
						END IF;
						
		----DHT11 KEO LEN 1
				    WHEN 4 => DHT_ENA  <= '0';
					           DHT_IN   <= DHT11;
							IF J =4000 THEN J <= 0;
											   TT_RST <= 7;
						ELSE				 J    <= J+1;
						   IF DHT_IN ='1'  THEN   TT_RST  <= 5;
																J   <= 0;
							END IF;
						END IF;
						
		--- DHT11 KEO VE 0 VA KET THUC
					 WHEN 5    => DHT_ENA   <= '0';
					              DHT_IN    <= DHT11;
									  IF DHT_IN = '0' THEN TT_RST  <= 6;
									                           J <= 0;
										END IF;
										
						
                WHEN 6    => 	TT_RST  <= 0;
                               STATE  <= GET_HUMI_TEMP;
                               DHT_PR <= '0';-- CO DHT11		
										 
					 WHEN 7    => 	TT_RST  <= 0;
                               STATE  <= RESET;
                               DHT_PR <= '1';-- KHONG CO DHT11
          END CASE;	
          
                WHEN GET_HUMI_TEMP  =>
							CASE PTR IS
								WHEN 0        => STATE <= READ_BIT;
												     PTR   <= PTR+1;
								WHEN 1 TO 40  => STATE <= READ_BIT;
													  DA_ND5(40-PTR) <= DHT_DATA;
													  PTR   <= PTR+1;
													  IF PTR =40 THEN STATE  <= WAIT_MS;
													                  PTR    <= 0;
													  END IF;
							END CASE;
							
							WHEN READ_BIT =>
								CASE TT_RD IS
									WHEN 0  => DHT_ENA  <= '0';
									           DHT_IN   <= DHT11;
												  IF DHT_IN ='0' THEN TT_RD <= 1;
												                       J    <= 0;
												  END IF;
										
									WHEN 1  => DHT_ENA  <= '0';
									           DHT_IN   <= DHT11;
												  IF DHT_IN ='1' THEN TT_RD <= 2;
												                       J    <= 0;
												  END IF;
								
								   WHEN 2  => DHT_ENA  <= '0';
									           DHT_IN   <= DHT11;
												  IF DHT_IN ='1' THEN J   <= J+1;
												  ELSE                 TT_RD  <= 3 ;
												   IF J > 2000 THEN DHT_DATA  <= '1';
													ELSE             DHT_DATA  <= '0';
													END IF;
																		  
												  END IF;
												  
									WHEN 3  => TT_RD  <= 0;
													J     <= 0;
													STATE <= GET_HUMI_TEMP;
									END CASE;
									
								WHEN WAIT_MS  => J  <= J+1;  -- 2 GIAY
													IF(J >=N*2) THEN TT_RD  <= 0;
													                 TT_RST <= 0;
																		  PTR    <= 0;
																		  STATE  <= RESET;
																		  J      <=0;
													END IF;
								END CASE;
						END IF;
				END PROCESS;
									
									
											
end Behavioral;





