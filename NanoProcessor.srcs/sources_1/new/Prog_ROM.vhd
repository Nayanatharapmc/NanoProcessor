----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2023 01:04:32
-- Design Name: 
-- Module Name: Prog_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Prog_ROM is
    Port ( Memo_select : in STD_LOGIC_VECTOR (2 downto 0);
           Ins_bus : out STD_LOGIC_VECTOR (11 downto 0));
end Prog_ROM;

architecture Behavioral of Prog_ROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
        signal program_ROM : rom_type := (
          "100010000001",  --MOVI R1,1
           "100100000010", --MOVI R2,2
           "100110000011", --MOVI R3,3
           "101110000000", --MOVI R7,0 
           "001110010000", --ADD R7,R1
           "001110100000", --ADD R7,R2
           "001110110000", --ADD R7,R3
           "110000000111"  --JZR R0,7


        );
begin
    Ins_bus <= program_ROM(to_integer(unsigned(Memo_select)));

end Behavioral;
