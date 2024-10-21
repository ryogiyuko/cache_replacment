//-----------------------------------------------
//	module name: Receiver
//	author: Tong Fu, Lingzhuang Zhang
//	version: 1st version (2022-11-02)
//	version: 2st version (2024-08-02) for 40 nm -- xing.yunpeng
//-----------------------------------------------
`timescale 1ns / 1ps

module receiver(inR, inA, i_freeNext, rst);

input inR, i_freeNext, rst;
wire outR, outA;
output inA;

// UMC 110nm
// DFQRM2HM ffState ( .D(inR), .CK(i_freeNext), .RB(!rst), .Q(inA) );

// UMC 40nm
wire Nrst;
INV_X1M_A9TRULP_C40_W3 inv_for_rst ( .A(rst), .Y(Nrst) );
DFFRPQ_X1M_A9TRULP_C40_W3 ffState ( .D(inR), .CK(i_freeNext), .R(Nrst), .Q(inA) );

endmodule

