----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 14:10:09
-- Design Name: 
-- Module Name: Sim_2way_3bit_MUX - Behavioral
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

entity Sim_2way_3bit_MUX is
--  Port ( );
end Sim_2way_3bit_MUX;

architecture Behavioral of Sim_2way_3bit_MUX is
COMPONENT Mux_2way_3bit
    PORT(
        A : in STD_LOGIC_VECTOR(2 downto 0);
        B : in STD_LOGIC_VECTOR(2 downto 0);
        S : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(2 downto 0));
END COMPONENT;

SIGNAL A : std_logic_vector (2 downto 0);
SIGNAL B : std_logic_vector (2 downto 0);
SIGNAL S : std_logic;
SIGNAL Q : std_logic_vector (2 downto 0);        

begin
UUT: Mux_2way_3bit PORT MAP(
    A=>A,
    B=>B,
    S=>S,
    Q=>Q);
    
 process
 begin
    S<='1';
    A<="000";
    B<="001";
    
    WAIT FOR 100ns;
    S<='0';
    A<="001";
    B<="010";
    
    WAIT FOR 100ns;
    S<='1';
    A<="010";
    B<="011";
    
    WAIT FOR 100ns;
    S<='0';
    A<="011";
    B<="100";
        
    WAIT FOR 100ns;
    S<='1';
    A<="100";
    B<="101";
    
    WAIT FOR 100ns;
    S<='0';
    A<="101";
    B<="110";    
    
    WAIT FOR 100ns;
    S<='1';
    A<="110";
    B<="111";
    WAIT;
end process;

end Behavioral;
