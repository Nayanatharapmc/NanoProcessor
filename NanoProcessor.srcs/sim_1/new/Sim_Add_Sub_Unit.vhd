----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.06.2023 12:39:27
-- Design Name: 
-- Module Name: Sim_Add_Sub_Unit - Behavioral
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

entity Sim_Add_Sub is
--  Port ( );
end Sim_Add_Sub;

architecture Behavioral of Sim_Add_Sub is
 COMPONENT Add_Sub
  Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
END COMPONENT;


    signal A_tb, B_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal M_tb : STD_LOGIC;
    signal S_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal C_out_tb, Zero_tb : STD_LOGIC;

begin

    uut: Add_Sub
        Port Map (
            A => A_tb,
            B => B_tb,
            M => M_tb,
            S => S_tb,
            carry => C_out_tb,
            Zero => Zero_tb
        );

    stimulus: process
    begin
        A_tb <= "0000";
        B_tb <= "0000";
        M_tb <= '0';
        wait for 10 ns;

        A_tb <= "0011";
        B_tb <= "0011";
        M_tb <= '0';
        wait for 10 ns;

        A_tb <= "0000";
        B_tb <= "0111";
        M_tb <= '1';
        wait for 10 ns;
        
        A_tb <= "1111";
        B_tb <= "0011";
        M_tb <= '0';
        wait for 10 ns;
        
        A_tb <= "0011";
        B_tb <= "0010";
        M_tb <= '1';
        wait for 10 ns;

     

        wait;
    end process;

end Behavioral;

