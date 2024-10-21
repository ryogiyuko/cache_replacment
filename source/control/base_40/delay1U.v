//-----------------------------------------------
//	module name: delay1U
//	author: Fu Tong , Baoxia Wan , Mingshu Chen
//  modifier: 
//  	modifyer: Anping HE (heap@lzu.edu.cn)
//  		adopting FDPE explicitly
//	version: 2nd version (2021-11-17)
//	description: 
//		one unit delay
//      output ==> input (==>:one uint delay)
//-----------------------------------------------
//	version: 2st version (2024-08-02) for 40 nm -- xing.yunpeng
`timescale 1ns / 1ps

module delay1U(inR, outR, rst);
input inR, rst;
output outR;

wire A,B;

// UMC 110nm
// DEL1M1HM delay1 ( .A(inR), .Z(A) );
// AN2M0HM AND (.A(A), .B(rst), .Z(outR) );

// UMC 40nm
// 1u 0.5ns
DLYCLK8S8_X1B_A9TRULP_C40_W3 delay1 ( .A(inR), .Y(A) );
AND2_X1M_A9TRULP_C40_W3 AND (.A(A), .B(rst), .Y(outR) );

endmodule
