----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.06.2023 09:46:39
-- Design Name: 
-- Module Name: Sim_Prog_Rom - Behavioral
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

entity Sim_Prog_Rom is
--  Port ( );
end Sim_Prog_Rom;

architecture Behavioral of Sim_Prog_Rom is
    component Prog_ROM is
        Port (
            Memo_select : in STD_LOGIC_VECTOR(2 downto 0);
            Ins_bus : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    signal Memo_select : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal Ins_bus : STD_LOGIC_VECTOR(11 downto 0);
    
begin
    UUT: Prog_ROM
    port map (
        Memo_select => Memo_select,
        Ins_bus => Ins_bus
    );
    Stimulus_process: process
        begin
            -- Example test case: Read instructions from different memory locations
            Memo_select <= "000";
            wait for 10 ns;
            assert Ins_bus = "100010000011" report "Incorrect instruction" severity error;
    
            Memo_select <= "001";
            wait for 10 ns;
            assert Ins_bus = "100100000001" report "Incorrect instruction" severity error;
    
            Memo_select <= "010";
            wait for 10 ns;
            assert Ins_bus = "010100000000" report "Incorrect instruction" severity error;
    
            Memo_select <= "011";
            wait for 10 ns;
            assert Ins_bus = "001110010000" report "Incorrect instruction" severity error;
    
            Memo_select <= "100";
            wait for 10 ns;
            assert Ins_bus = "000010100000" report "Incorrect instruction" severity error;
    
            Memo_select <= "101";
            wait for 10 ns;
            assert Ins_bus = "110010000111" report "Incorrect instruction" severity error;
    
            Memo_select <= "110";
            wait for 10 ns;
            assert Ins_bus = "110000000011" report "Incorrect instruction" severity error;
    
            Memo_select <= "111";
            wait for 10 ns;
            assert Ins_bus = "101010101010" report "Incorrect instruction" severity error;
    
            wait;
        end process;

end Behavioral;
