`timescale 1ns / 1ps

module cSelector32 #(
    parameter DATA_WIDTH = 32
)(//调低了w_driveNext0到o_driveNext的延时，请勿用本模块的fire决定valid！
    input       rst,         
    input       i_drive,
    output      o_free,
    output      o_fire,
    input       [DATA_WIDTH-1:0]valid,
    output      [DATA_WIDTH-1:0]o_driveNext,
    input       [DATA_WIDTH-1:0]i_freeNext
);

wire [1:0] w_outRRelay_2,w_outARelay_2;
wire w_fire;
wire w_freeNext;
wire w_driveNext;

//pipeline
(* dont_touch="true" *)sender sender(
	.i_drive    (i_drive),
	.o_free     (o_free),
	.outR       (w_outRRelay_2[0]),
	.i_free     (w_fire),
	.rst        (rst)
);

(* dont_touch="true" *)relay relay0(
	.inR        (w_outRRelay_2[0]),
	.inA        (w_outARelay_2[0]),
	.outR       (w_outRRelay_2[1]),
	.outA       (w_outARelay_2[1]),
	.fire       (w_fire), .rst(rst)
);

(* dont_touch="true" *)receiver receiver(
	.inR        (w_outRRelay_2[1]),
	.inA        (w_outARelay_2[1]),
	.i_freeNext (w_freeNext), .rst(rst)
);  

//delay here must match the time of counter to change.
(* dont_touch="true" *)delay4U outdelay0(.inR(w_fire), .outR(w_driveNext), .rst(rst));

genvar i;
generate
    for ( i=0 ; i<32 ; i=i+1 ) begin
        assign o_driveNext[i] = w_driveNext & valid[i];
    end
endgenerate

    assign o_fire = w_fire;
    assign w_freeNext = | i_freeNext;


endmodule