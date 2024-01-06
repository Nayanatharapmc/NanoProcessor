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

entity Add_Sub_Unit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_Unit;

architecture Behavioral of Add_Sub_Unit is
component Add_Sub_Unit
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               M : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               C_out : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;

    signal A_tb, B_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal M_tb : STD_LOGIC;
    signal S_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal C_out_tb, Zero_tb : STD_LOGIC;

begin

    uut: Add_Sub_Unit
        Port Map (
            A => A_tb,
            B => B_tb,
            M => M_tb,
            S => S_tb,
            C_out => C_out_tb,
            Zero => Zero_tb
        );

    stimulus: process
    begin
        A_tb <= "0000";
        B_tb <= "0000";
        M_tb <= '0';
        wait for 10 ns;

        A_tb <= "0010";
        B_tb <= "0001";
        M_tb <= '0';
        wait for 10 ns;

        A_tb <= "0111";
        B_tb <= "1010";
        M_tb <= '1';
        wait for 10 ns;

     

        wait;
    end process;

end Behavioral;
