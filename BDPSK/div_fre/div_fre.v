module div_fre(
		clk,
		clk_o
);
	input					clk;
	
	output reg 			clk_o;
	
	reg 	[ 9 : 0 ] 	cnt;		
	
	parameter			N = 32;
	
	initial
	begin
						cnt <= 10'b0;
						clk_o	<= 1'b0;
	end
	
	always @( posedge clk )
	begin
		if( cnt == N/2 - 1 )
		begin
			cnt <= 10'b0;
			clk_o <= ~ clk_o;
		end
		else
		begin
			cnt <= cnt + 10'b1;
		end
	end
	
endmodule