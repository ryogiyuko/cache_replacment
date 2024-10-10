`timescale 1ns / 1ps
module cMutexMerge3_3b_cache( //必须后接fifo
i_drive0, i_data0, o_free0,
i_drive1, i_data1, o_free1,
i_drive2, i_data2, o_free2,
i_freeNext, o_driveNext, o_data ,
rst
);
 
//input & output port
input i_drive0, i_drive1, i_drive2;
input [2:0] i_data0, i_data1, i_data2;
input i_freeNext;
input rst;

output o_free0, o_free1, o_free2;
output o_driveNext;
output [2:0] o_data ;


//wire & reg
wire w_firstTrig,w_secondTrig, w_thirdTrig;
wire w_firstReq,w_secondReq, w_thirdReq;
wire w_driveNext0,w_driveNext1,w_driveNext2,w_driveNext;
wire [2:0] w_data  ;
wire w_free0, w_free1, w_free2;

delay1U outdelay0(.inR  (o_free0  ), .rst  (rst  ), .outR (w_free0 ));

assign w_firstTrig = i_drive0 | w_free0;

contTap firstTap(
.trig(w_firstTrig),
.req(w_firstReq), .rst(rst)
);

delay1U outdelay1(.inR  (o_free1  ), .rst  (rst  ), .outR (w_free1 ));

assign w_secondTrig = i_drive1 | w_free1;

contTap secondTap(
.trig(w_secondTrig),
.req(w_secondReq), .rst(rst)
);

delay1U outdelay2(.inR  (o_free2  ), .rst  (rst  ), .outR (w_free2 ));

assign w_thirdTrig = i_drive2 | w_free2;

contTap thirdTap(
.trig(w_thirdTrig),
.req(w_thirdReq), .rst(rst)
);

assign w_driveNext = i_drive0 
				   | i_drive1 | i_drive2;

delay3U outdelay(.inR  (w_driveNext  ),.rst  (rst  ),.outR (o_driveNext ));

assign o_free0 = i_freeNext & w_firstReq;
assign o_free1 = i_freeNext & w_secondReq;
assign o_free2 = i_freeNext & w_thirdReq;

assign w_data  = (w_firstReq == 1'b1) ? i_data0 :
			    ((w_secondReq == 1'b1) ? i_data1 : 
                ((w_thirdReq == 1'b1)?  i_data2 : 3'b0));

assign o_data  = w_data ;

endmodule
