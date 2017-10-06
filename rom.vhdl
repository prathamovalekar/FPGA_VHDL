library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity rom is
	port(	addr:in unsigned (2 downto 0);
			dataout: out unsigned(3 downto 0));
end entity;
	
architecture behave of rom is
	
	type my_array is array(0 to 7 ) of unsigned (3 downto 0);
	signal A1 :my_array :=(X"0",X"1",X"2",X"3",X"4",X"5",X"6",X"7");
	
	begin
	dataout <= A1(to_integer (addr));
end behave;

