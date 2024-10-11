`timescale 1ns / 1ps

module cMutexMerge5_5b( 
i_drive0, i_data0, o_free0,
i_drive1, i_data1, o_free1,
i_drive2, i_data2, o_free2,
i_drive3, i_data3, o_free3,
i_drive4, i_data4, o_free4,
//i_drive5, i_data5, o_free5,
i_freeNext, o_driveNext, o_data ,
rst
//,pmt
);
 
//input & output port
input i_drive0, i_drive1, i_drive2, i_drive3, i_drive4;
input [5:0] i_data0, i_data1, i_data2, i_data3, i_data4;
input i_freeNext;
input rst;

output o_free0, o_free1, o_free2, o_free3, o_free4;
output o_driveNext;
output [4:0] o_data ;
//output pmt;
 
//wire & reg
wire w_firstTrig, w_secondTrig, w_thirdTrig, w_fourTrig, w_fiveTrig;
wire w_firstReq, w_secondReq, w_thirdReq, w_fourReq, w_fiveReq;
wire w_driveNext;
reg [4:0]  w_data  ;
//wire w_pmt;

wire w_free0, w_free1, w_free2, w_free3, w_free4;

delay1U outdelay0(.inR  (o_free0  ), .rst  (rst  ), .outR (w_free0 ));
delay1U outdelay1(.inR  (o_free1  ), .rst  (rst  ), .outR (w_free1 ));
delay1U outdelay2(.inR  (o_free2  ), .rst  (rst  ), .outR (w_free2 ));
delay1U outdelay3(.inR  (o_free3  ), .rst  (rst  ), .outR (w_free3 ));
delay1U outdelay4(.inR  (o_free4  ), .rst  (rst  ), .outR (w_free4 ));
///delay1U outdelay5(.inR  (o_free5  ), .rst  (rst  ), .outR (w_free5 ));

assign w_firstTrig = i_drive0 | w_free0;
assign w_secondTrig = i_drive1 | w_free1;
assign w_thirdTrig = i_drive2 | w_free2;
assign w_fourTrig = i_drive3 | w_free3;
assign w_fiveTrig = i_drive4 | w_free4;
//assign w_sixTrig = i_drive5 | w_free5;

contTap firstTap(
.trig(w_firstTrig),
.req(w_firstReq), .rst(rst)
);

contTap secondTap(
.trig(w_secondTrig),
.req(w_secondReq), .rst(rst)
);

contTap thirdTap(
.trig(w_thirdTrig),
.req(w_thirdReq), .rst(rst)
);

contTap fourTap(
.trig(w_fourTrig),
.req(w_fourReq), .rst(rst)
);

contTap fiveTap(
.trig(w_fiveTrig),
.req(w_fiveReq), .rst(rst)
);
// contTap sixTap(
// .trig(w_sixTrig),
// .req(w_sixReq), .rst(rst)
// );

// //delay1U(inR, outR);
// delay4U udt_delay1(
// .inR    ( w_firstReq | w_secondReq | w_thirdReq | w_fourReq | w_fiveReq | w_sixReq  ),
// .outR   ( w_pmt  ), .rst(rst)
// );

assign w_driveNext = i_drive0 | i_drive1 | i_drive2| i_drive3| i_drive4;

delay3U outdelay(.inR  (w_driveNext  ),.rst  (rst  ),.outR (o_driveNext ));

assign o_free0 = i_freeNext & w_firstReq;
assign o_free1 = i_freeNext & w_secondReq;
assign o_free2 = i_freeNext & w_thirdReq;
assign o_free3 = i_freeNext & w_fourReq;
assign o_free4 = i_freeNext & w_fiveReq;
//assign o_free5 = i_freeNext & w_sixReq;

// assign w_data  =  (w_firstReq == 1'b1) 	? i_data0 :
// 			    ( (w_secondReq == 1'b1) ? i_data1 : 
// 				( (w_thirdReq == 1'b1) 	? i_data2 :
// 				( (w_fourReq == 1'b1) 	? i_data3 : 
// 				( (w_fiveReq == 1'b1) 	? i_data4 : 5'b0 ))));
wire [4:0] w_req_5;
assign w_req_5 = { w_fiveReq, w_fourReq, w_thirdReq, w_secondReq, w_firstReq };

always @( *) begin
	case (w_req_5)
		5'b00001: w_data = i_data0;
		5'b00010: w_data = i_data1;
		5'b00100: w_data = i_data2;
		5'b01000: w_data = i_data3;
		5'b10000: w_data = i_data4;
		default: w_data = 5'b0;
	endcase
end


assign o_data  = w_data ;

endmodule
