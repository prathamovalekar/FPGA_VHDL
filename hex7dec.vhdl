-- hex7dec

library ieee;
--use ieee.numeric_bit.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hex7dec is

port(	dataout	: in unsigned (3 downto 0);
		a_to_g	: out unsigned (6 downto 0));
end hex7dec;

architecture behave of hex7dec is

begin
	process(dataout)
	begin
		case(dataout) is
			when x"0" => a_to_g <= "0000001";
			when x"1" => a_to_g <= "1001111";
			when x"2" => a_to_g <= "0010010";
			when x"3" => a_to_g <= "0000110";
			when x"4" => a_to_g <= "1001100";
			when x"5" => a_to_g <= "0100100";
			when x"6" => a_to_g <= "0100000";
			when x"7" => a_to_g <= "0001111";
			when x"8" => a_to_g <= "0000000";
			when x"9" => a_to_g <= "0000100";
			when x"a" => a_to_g <= "0001000";
			when x"b" => a_to_g <= "1100000";
			when x"c" => a_to_g <= "0110001";
			when x"d" => a_to_g <= "1000010";
			when x"e" => a_to_g <= "0110000";
			when x"f" => a_to_g <= "0111000";
			when others=>a_to_g <= "1111111";
		end case;
	end process;

end behave;