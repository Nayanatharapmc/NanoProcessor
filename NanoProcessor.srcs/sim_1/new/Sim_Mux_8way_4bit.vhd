----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2023 06:30:34
-- Design Name: 
-- Module Name: Sim_Mux_8way_4bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sim_Mux_8way_4bit is
--  Port ( );
end Sim_Mux_8way_4bit;

architecture Behavioral of Sim_Mux_8way_4bit is

COMPONENT Mux_8way_4bit
    PORT (
        D0,D1,D2,D3,D4,D5,D6,D7 : in STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC_VECTOR (2 downto 0);
        Q : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL D0,D1,D2,D3,D4,D5,D6,D7 : STD_LOGIC_VECTOR (3 downto 0);   
SIGNAL S : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Q : STD_LOGIC_VECTOR (3 downto 0);
    
begin
UUT : Mux_8way_4bit PORT MAP(
    D0=>D0,
    D1=>D1,
    D2=>D2,
    D3=>D3,
    D4=>D4,
    D5=>D5,
    D6=>D6,
    D7=>D7,
    S=>S,
    Q=>Q);
    
process
    begin
        D0 <= "0000";
        D1 <= "1010";
        D2 <= "1111";
        D3 <= "0011";
        D4 <= "1000";
        D5 <= "0101";
        D6 <= "0001";
        D7 <= "1101";
        
        S <= "000";
        WAIT FOR 100ns;
        
        S <= "010";
        WAIT FOR 100ns;
        
        S <= "110";
        WAIT FOR 100ns;
        
        S <= "101";
        WAIT FOR 100ns;
        
        S <= "111";
        WAIT;
end process;        
end Behavioral;
