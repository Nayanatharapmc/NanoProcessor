----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2023 09:29:33
-- Design Name: 
-- Module Name: Sim_PC - Behavioral
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

entity Sim_PC is
--  Port ( );
end Sim_PC;

architecture Behavioral of Sim_PC is
    component PC is
        Port(
             Clk : in STD_LOGIC;
             Reset : in STD_LOGIC;
             Count_in : in STD_LOGIC_VECTOR(2 downto 0);
             Count_out : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;
    
    signal Clk : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '0';
    signal Count_in : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal Count_out : STD_LOGIC_VECTOR(2 downto 0);
    
    constant CLK_PERIOD : time := 10 ns;

begin
    UUT: PC
    port map (
        Clk => Clk,
        Reset => Reset,
        Count_in => Count_in,
        Count_out => Count_out
    );
    
    Clk_process: process
    begin
        while now < 1000 ns loop  -- Run the simulation for 1000 ns
            Clk <= '0';
            wait for CLK_PERIOD / 2;
            Clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    Stimulus_process: process
    begin
        Reset <= '1';  -- Assert reset
        wait for 20 ns;
        Reset <= '0';  -- Deassert reset

        Count_in <= "000";
        wait for CLK_PERIOD;
        Count_in <= "001";
        wait for CLK_PERIOD;
        Count_in <= "010";
        wait for CLK_PERIOD;
        Count_in <= "011";
        wait for CLK_PERIOD;
        Reset <= '1';
        Count_in <= "100";
        wait for CLK_PERIOD;
        Count_in <= "101";
        wait for CLK_PERIOD;
        Count_in <= "110";
        wait for CLK_PERIOD;
        Count_in <= "111";
        wait for CLK_PERIOD;
        
        wait;
    end process;

end Behavioral;
