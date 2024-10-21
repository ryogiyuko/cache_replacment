//-----------------------------------------------
//	module name: Sender
//	author: Tong Fu, Lingzhuang Zhang
//	version: 1st version (2022-11-02) for 110nm
//	version: 2st version (2024-08-02) for 40 nm -- xing.yunpeng
//-----------------------------------------------

`timescale 1ns / 1ps
module sender(i_drive,o_free,outR,i_free,rst);
input i_drive, i_free, rst;
output o_free, outR;

wire outRNeg;

// UMC 110nm
// INVM0HM inv6 ( .A(outR), .Z(outRNeg) );
// DFQRM2HM ffState ( .D(outRNeg), .CK(i_drive), .RB(rst), .Q(outR) );

// DEL1M4HM inDelay0 ( .A(i_free), .Z(o_free) );

// UMC 40nm
INV_X1M_A9TRULP_C40_W3 inv6 ( .A(outR), .Y(outRNeg) );

wire Nrst;
INV_X1M_A9TRULP_C40_W3 inv_for_rst ( .A(rst), .Y(Nrst) );
DFFRPQ_X1M_A9TRULP_C40_W3 ffState ( .D(outRNeg), .CK(i_drive), .R(Nrst), .Q(outR) );

// delay ԼΪ0.5ns
DLYCLK8S8_X1B_A9TRULP_C40_W3 inDelay0 ( .A(i_free), .Y(o_free) );  
// delay ԼΪ0.23ns
// DLYCLK8S4_X1B_A9TRULP_C40_W3 inDelay0 ( .A(i_free), .Z(o_free) ); 


endmodule
