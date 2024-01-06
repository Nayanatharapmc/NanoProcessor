----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2023 15:05:41
-- Design Name: 
-- Module Name: three_bit_adder - Behavioral
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

entity three_bit_adder is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end three_bit_adder;

architecture Behavioral of three_bit_adder is

component FA
port (
    A: in std_logic;
    B: in std_logic;
    C_in: in std_logic;
    S: out std_logic;
    C_out: out std_logic);
end component;

signal FA0_C,FA1_C : std_logic;

begin
  FA0: FA 
  port map(
  A => A(0), 
  B => '1', 
  C_in => Cin, 
  S => Sum(0), 
  C_out => FA0_C);
  
  FA1: FA 
  port map(
  A => A(1), 
  B => '0', 
  C_in => FA0_C, 
  S => Sum(1), 
  C_out => FA1_C);
  
  FA2: FA 
  port map(
  A => A(2), 
  B => '0', 
  C_in => FA1_C, 
  S => Sum(2), 
  C_out => Cout);

end architecture Behavioral;