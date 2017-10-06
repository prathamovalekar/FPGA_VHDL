library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity debounce is
	port (
		incr : in std_logic;
		clk: in std_logic;
		incr_pulse:out std_logic);
		
end entity;


architecture arc of debounce is
signal dff1,dff2,dff3,dff4,dff5,dff6,incr_debounced :std_logic;


begin

	process(clk)
	begin
		if clk'event and clk='1' then
			dff1<=incr;
			dff2<=dff1;
			dff3<=dff2;
		end if;
	end process;
	
	process(clk)
	begin
		if clk'event and clk='1' then
			dff4<=incr_debounced;
			dff5<=dff4;
			dff6<=not dff5;
		end if;
	end process;
	
	incr_debounced<=dff1 and dff2 and  dff3;
	incr_pulse<=dff4 and dff5 and dff6;	


end arc;