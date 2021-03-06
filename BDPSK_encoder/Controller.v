module Controller(
			clk,
			reset_n,
			datain,

			address,
			clk_DA,
			blank_DA_n,
			sync_DA_n
);

	input            clk         ;
	input            reset_n     ;
	input            datain      ;
	
	output [ 6 : 0 ] address     ;
	output           clk_DA      ; 
	output           blank_DA_n  ; 
	output           sync_DA_n   ; 
	
	reg    [ 6 : 0 ] address_data;
	reg    datain_1;
	wire   flag_pos,flag_neg;


	always@(posedge clk)begin
		datain_1 <= datain;
	end
	assign flag_pos = (~datain_1) & datain;
	assign flag_neg = (~datain) & datain_1;
	
	always@(posedge clk or negedge reset_n)
	begin
		if(!reset_n)
			address_data <= 7'd0;
		else begin
			if (flag_pos) begin
				address_data <= 7'd0;
			end
			else if (flag_neg) begin
				address_data <= 7'd64;
			end
			else begin
			  	address_data <= address_data + 7'd1;
			end
		end
	end
	
	assign address    = address_data;
	assign clk_DA     = clk;
	assign blank_DA_n = 1'b1;
	assign sync_DA_n  = 1'b1;
	
endmodule