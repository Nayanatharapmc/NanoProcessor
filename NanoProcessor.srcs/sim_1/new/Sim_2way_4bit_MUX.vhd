----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 14:53:15
-- Design Name: 
-- Module Name: Sim_2way_4bit_MUX - Behavioral
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

entity Sim_2way_4bit_MUX is
--  Port ( );
end Sim_2way_4bit_MUX;

architecture Behavioral of Sim_2way_4bit_MUX is
COMPONENT Mux_2way_4bit
    PORT(
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        S : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

SIGNAL A : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL B : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL S : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(3 downto 0);     
   
begin
UUT : Mux_2way_4bit PORT MAP(
    A=>A,
    B=>B,
    S=>S,
    Q=>Q);
    
process 
begin
    S<='0';
    A<="0000";
    B<="0101";
    
    WAIT FOR 100ns;
    S<='0';
    A<="0110";
    B<="0111";
    
    WAIT FOR 100ns;
    S<='0';
    A<="1110";
    B<="0100";
    
    WAIT FOR 100ns;
    S<='0';
    A<="0111";
    B<="0000";
    
     WAIT FOR 100ns;
     S<='1';
     A<="1110";
     B<="0100";
     
     WAIT FOR 100ns;
      S<='1';
      A<="1010";
      B<="0100";
    
    WAIT;
    
 end process;       

end Behavioral;
