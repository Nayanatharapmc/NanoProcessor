----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.06.2023 18:28:52
-- Design Name: 
-- Module Name: Ins_decoder - Behavioral
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

entity Ins_decoder is
    Port ( Data : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_enable : out STD_LOGIC_VECTOR (2 downto 0);
           Immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           Load_select : out STD_LOGIC;
           Reg_select0 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_select1 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_sub_select : out STD_LOGIC;
           Jump_flag : out STD_LOGIC;
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0));
end Ins_decoder;

architecture Behavioral of Ins_decoder is

signal OPCODE : STD_LOGIC_VECTOR(1 downto 0);

 
begin
process(Data, Reg_check)
 begin
 Reg_enable <= "000";
 Load_select <= '0';
 Immediate_value <= "0000";
 Reg_select0 <= "000";
 Reg_select1 <= "000";
 Add_sub_select <= '0';
 Jump_address <= "000";
 Jump_flag <= '0';
 
 
 
 
 --==========================================================
 
 If (Data(11)='0' and Data(10)='0') then 
 --Add instruction 
 --Reg En 
 Reg_enable<= Data (9 downto 7);
 
 --Load select
 Load_select <= '0';
 
 --Reg Sel 1
 Reg_select0 <= Data (9 downto 7);
 
 --Reg Sel 2
 Reg_select1 <= Data (6 downto 4);
 
 --Add/Sub
 Add_sub_select <= '0';
 
 --==========================================================
 
 --==========================================================
 
 elsIf (Data(11)='0' and Data(10)='1') then 
 --Neg instruction 
 
 --Reg En 
 Reg_enable <= Data(9 downto 7);
 
 --Load select
 Load_select <= '0';
 
 --Reg Sel 1
 Reg_select0 <= "000";
 
 --Reg Sel 2
 Reg_select1 <= Data (9 downto 7);
 
 --Add/Sub
 Add_sub_select <= '1';
 
 --==========================================================
 
 --==========================================================
 
 elsIf (Data(11)='1' and Data(10)='0') then 
 --Move instruction 
 
 --Reg En 
 Reg_enable <= Data(9 downto 7);
 
 --Load select
 Load_select <= '1';
 
 --Immediate Value
 Immediate_value <= Data(3 downto 0);
 
 --==========================================================
 
 --==========================================================
 
 elsIf (Data(11)='1' and Data(10)='1') then 
 --Jump instruction 
 
 --Reg En 
 Reg_enable <= "000";
 
 
 --Reg Sel 1
 Reg_select0 <= Data (9 downto 7);
 
 --if Reg_Chk_Jmp = 0 then jump flag = 1
 if (Reg_check = "0000") then
 Jump_flag <= '1';
 Jump_address <= Data(2 downto 0);
 else
 Jump_flag <= '0';
 end if; 
 end if;
end process;
end Behavioral;
