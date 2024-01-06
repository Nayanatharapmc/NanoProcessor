----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.06.2023 08:24:28
-- Design Name: 
-- Module Name: Sim_Ins_decoder - Behavioral
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

entity Sim_Ins_decoder is
--  Port ( );
end Sim_Ins_decoder;

architecture Behavioral of Sim_Ins_decoder is
    COMPONENT Ins_decoder
        PORT(
           Data : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_enable : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           Load_select : out STD_LOGIC;
           Reg_select0 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_select1 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_sub_select : out STD_LOGIC;
           Jump_flag : out STD_LOGIC;
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0));
    END COMPONENT;
signal Data : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_check,Immediate_value : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_enable,Reg_select0,Reg_select1,Jump_address :  STD_LOGIC_VECTOR (2 downto 0); 
signal Load_select,Add_sub_select,Jump_flag : STD_LOGIC;
begin

    UUT: Ins_decoder
        port map (
            Data => Data,
            Reg_check => Reg_check,
            Reg_enable => Reg_enable,
            Immediate_value => Immediate_value,
            Load_select => Load_select,
            Reg_select0 => Reg_select0,
            Reg_select1 => Reg_select1,
            Add_sub_select => Add_sub_select,
            Jump_flag => Jump_flag,
            Jump_address => Jump_address
        );

    process
    begin
        Data <= "100010000011"; --MOVI R1,3
        Reg_check <= "0011";
        WAIT FOR 100ns; 
           
        Data <= "100100000001"; --MOVI R2,1
        Reg_check <= "0001";
        WAIT FOR 100ns; 
       
        Data <= "010100000000"; --NEG R2
        Reg_check <= "1011";
        WAIT FOR 100ns;         

        Data <= "001110010000"; --ADD R7,R1
        Reg_check <= "0111";
        WAIT FOR 100ns;      

        Data <= "000010100000"; --ADD R1,R2
        Reg_check <= "1011";
        WAIT FOR 100ns; 
        
        Data <= "110010000111"; --JZR R1,7
        Reg_check <= "0000";
        WAIT; 
    end process;

end Behavioral;