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
`timescale 1ns / 1ps

//0.375ns

module delay3U(inR, outR, rst);
input inR, rst;
output outR;

wire outR0;


delay1U delay1(.inR(inR), .outR(outR0), .rst(rst));
delay2U delay2(.inR(outR0), .outR(outR), .rst(rst));
endmodule
