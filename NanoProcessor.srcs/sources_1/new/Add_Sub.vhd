----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 11:57:12
-- Design Name: 
-- Module Name: Add_Sub_Unit - Behavioral
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

entity Add_Sub is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub;

architecture Behavioral of Add_Sub is
COMPONENT RCA4
Port ( A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       S3 : out STD_LOGIC;
       c_out : out STD_LOGIC);
END COMPONENT;
signal b0,b1,b2,b3,zero0,s0,s1,s2,s3 : std_logic;
begin
RCA0 : RCA4
PORT MAP(
    A0 => A(0),
    A1 => A(1),
    A2 => A(2),
    A3 => A(3),
    B0 => b0,
    B1 => b1,
    B2 => b2,
    B3 => b3,
    C_in => M,
    S0 => s0,
    S1 => s1,
    S2 => s2,
    S3 => s3,
    c_out => carry
);

b0 <= B(0) XOR M;
b1 <= B(1) XOR M;
b2 <= B(2) XOR M;
b3 <= B(3) XOR M;
Zero <= NOT(s0 OR s1 OR s2 OR s3);
S(0) <= s0;
S(1) <= s1;
S(2) <= s2;
S(3) <= s3;




end Behavioral;