----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 07:20:00
-- Design Name: 
-- Module Name: Sim_LUT_16_7 - Behavioral
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

entity Sim_LUT_16_7 is
--  Port ( );
end Sim_LUT_16_7;

architecture Behavioral of Sim_LUT_16_7 is
component LUT_16_7
    port(address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal address : STD_LOGIC_VECTOR(3 downto 0);
signal data : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT : LUT_16_7
PORT MAP(
    address => address,
    data => data);
process
begin
    address <= "1100";
    wait for 100ns;
    
    address <= "1000";
    wait for 100ns;
       
    address <= "0011";
    wait for 100ns;
    
    address <= "1010";
    wait;
end process;    
    
end Behavioral;
