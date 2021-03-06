module PN_Seq(
	clk_o, 	/* 此处定义时钟引脚名称 */
	reset_n,          /* 此处定义复位引脚名称 */	
	
	data_PN  /* 此处定义伪随机码输出引脚名称 */
);

input clk_o;	/* 此处定义时钟信号位宽和方向 */
input reset_n;/* 此处定义复位信号位宽和方向 */
output data_PN;/* 此处定义伪随机码输出信号位宽和方向 */

reg    [ 7 : 0 ] c; /* 思考：寄存器c的作用是什么？ 定义移位寄存器结构，3 位宽 8 位深。*/
	
always @( posedge clk_o or negedge reset_n ) 
 begin 
 if( !reset_n )  
 begin //复位过程中，对移位寄存器的各位置初值。
 c <= 8'b0000_0001; 
 end 
 else //复位完成，移位寄存器开始工作。
 begin 
 c[ 7 ] <= c[ 6 ]; //在时钟触发下，数据依次移位。
 c[ 6 ] <= c[ 5 ]; 
 c[ 5 ] <= c[ 4 ]; 
 c[ 4 ] <= c[ 3 ]; 
 c[ 3 ] <= c[ 2 ]; 
 c[ 2 ] <= c[ 1 ]; 
 c[ 1 ] <= c[ 0 ]; 
 c[ 0 ] <= c[ 2 ] ^ c[ 3 ] ^ c[ 4 ] ^ c[ 7 ];
 end 
 end 
 assign data_PN = c[ 0 ]; //数据从移位寄存器的最后一级输出	/* 此处实现m序列的移位反馈结构 */
	
endmodule