`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/27 09:08:55
// Design Name: 
// Module Name: click
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//	version: 2st version (2024-08-02) for 40 nm -- xing.yunpeng


module relay(inR, inA, outR, outA, fire, rst); 

input inR, outA, rst;

output inA, outR, fire;

wire inAR, outAR, notR, rstNeg;
wire Rtemp0, Rtemp1, Rtemp2, Rtemp3, Rtemp4;

// UMC 110nm
// XOR2M0HM neqIn ( .A(inR), .B(inA), .Z(inAR) );
// XNR2M0HM eqOut ( .A(outA), .B(inA), .Z(outAR) );
// AN2M0HM andFire ( .A(inAR), .B(outAR), .Z(fire) );
// INVM0HM invTmp ( .A(inA), .Z(notR) );
// DFQRM2HM ffState ( .D(notR), .CK(fire), .RB(rst), .Q(Rtemp0) );

// DEL1M4HM delay7 ( .A(Rtemp0), .Z(inA) );
// BUFM2HM U1 ( .A(inA), .Z(outR) );

// UMC 40nm
XOR2_X1M_A9TRULP_C40_W3         neqIn       ( .A(inR), .B(inA), .Y(inAR) );
XNOR2_X1M_A9TRULP_C40_W3        eqOut       ( .A(outA), .B(inA), .Y(outAR) );
AND2_X1M_A9TRULP_C40_W3         andFire     ( .A(inAR), .B(outAR), .Y(fire) );
INV_X1M_A9TRULP_C40_W3          invTmp      ( .A(inA), .Y(notR) );
wire Nrst;
INV_X1M_A9TRULP_C40_W3 inv_for_rst ( .A(rst), .Y(Nrst) );
DFFRPQ_X1M_A9TRULP_C40_W3       ffState     ( .D(notR), .CK(fire), .R(Nrst), .Q(Rtemp0) );

// delay 约为0.23n
DLYCLK8S4_X1B_A9TRULP_C40_W3 delay7 ( .A(Rtemp0), .Y(inA) );
// delay 约为0.5ns
// DLYCLK8S8_X1B_A9TRULP_C40_W3 delay7 ( .A(Rtemp0), .Z(inA) );

// 高速缓冲 0.1ns
BUFH_X4M_A9TRULP_C40_W3 U1 ( .A(inA), .Y(outR) );

endmodule
