//-----------------------------------------------
//	module name: Sender
//	author: Anping HE (heap@lzu.edu.cn)
//	modify author: 
//		Tong FU (fut21@lzu.edu.cn)
//		Xiabao WAN (wanbx21@lzu.edu.cn)
//		Mingshu CHEN (chenmsh18@lzu.edu.cn)	
//	version: 1st version (2021-11-13)
//	Last Modified: 2021-11-16
//	description: 
//		continue tap 
//		req = !req when trig is valid
//		tech: xilinx fpga
//-----------------------------------------------
//	version: 2st version (2024-08-02) for 40 nm -- xing.yunpeng



`timescale 1ns / 1ps

module contTap(trig, req, rst);

input trig, rst;

output req;

wire reqNeg,rstNeg;

// UMC 110nm
// INVM0HM inv6 ( .A(req), .Z(reqNeg) );
// //INUHDV1 inv6 ( .I(req), .ZN(reqNeg) );
// //INUHDV1 inv ( .I(rst), .ZN(rstNeg) );
// //DRNQUHDV1 ffState ( .D(reqNeg), .CK(trig), .RDN(rst), .Q(req) );
// DFQRM2HM ffState ( .D(reqNeg), .CK(trig), .RB(rst), .Q(req) );

// UMC 40nm
INV_X1M_A9TRULP_C40_W3 inv6 ( .A(req), .Y(reqNeg) );
//INUHDV1 inv6 ( .I(req), .ZN(reqNeg) );
//INUHDV1 inv ( .I(rst), .ZN(rstNeg) );
//DRNQUHDV1 ffState ( .D(reqNeg), .CK(trig), .RDN(rst), .Q(req) );
wire Nrst;
INV_X1M_A9TRULP_C40_W3 inv_for_rst ( .A(rst), .Y(Nrst) );
DFFRPQ_X1M_A9TRULP_C40_W3 ffState ( .D(reqNeg), .CK(trig), .R(Nrst), .Q(req) );

endmodule
