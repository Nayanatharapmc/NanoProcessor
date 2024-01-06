----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 15:35:09
-- Design Name: 
-- Module Name: Mux_8way_4bit - Behavioral
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

entity Mux_8way_4bit is
    Port ( D0,D1,D2,D3,D4,D5,D6,D7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is
begin
    process(S,D0,D1,D2,D3,D4,D5,D6,D7)
    begin
        case S is
            when "000" =>
                Q <= D0;
            when "001" =>
                Q <= D1;
            when "010" =>
                Q <= D2;
            when "011" =>
                Q <= D3;
            when "100" =>
                Q <= D4;
            when "101" =>
                Q <= D5;
            when "110" =>
                Q <= D6;
            when "111" =>
                Q <= D7;
            when others =>
                Q <= (others => '0');  --Default case
       end case;
   end process;    
end Behavioral;
