----------------------------------------------------------------------------
--
--  Project          : Clock Divider to generate 1Hz frequency
--  File Name        : clk_div.vhd
--  Created By       : Prasad Pandit
--  Contact          : prasadp4009@gmail.com
--  Last Modified    : 09/16/2018
--  Revision History : 1v0
--  ------------
--  Description      : This VHDL code takes an input and generated a 1Hz
--                     frequency. I used 24MHz clock which converts the 
--                     max_count to 24000000. Change as per your clk freq.
--
----------------------------------------------------------------------------
--Start of clk_div
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity clk_div is
    generic (max_count : natural := 24000000);
    port (
          clk     : in std_logic;
          rst_n   : in std_logic;
          op      : out std_logic
    );
end clk_div;


architecture behavioral of clk_div is

begin

  process(clk,rst_n)
    variable count : natural range 0 to max_count;

    begin
        if rst_n = '0' then
            count := 0;
            op    <= '1';
        elsif rising_edge(clk) then
            if count < (max_count/2)-1 then
                op    <='1';
                count := count + 1;
            elsif count < max_count-1 then
                op    <='0';
                count := count + 1;
            else
                count := 0;
                op    <='1';
            end if;
        end if;

end process;

end behavioral;
--End of clk_div
