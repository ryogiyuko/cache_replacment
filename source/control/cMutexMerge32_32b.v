`timescale 1ns / 1ps

module cMutexMerge32_32b #(//no i_data
    parameter DATA_WIDTH = 32
)(
    input [32-1:0] i_drive,
    // input [DATA_WIDTH-1:0] i_data0, i_data8, i_data16, i_data24,
    // input [DATA_WIDTH-1:0] i_data1, i_data9, i_data17, i_data25,
    // input [DATA_WIDTH-1:0] i_data2, i_data10, i_data18, i_data26,
    // input [DATA_WIDTH-1:0] i_data3, i_data11, i_data19, i_data27,
    // input [DATA_WIDTH-1:0] i_data4, i_data12, i_data20, i_data28,
    // input [DATA_WIDTH-1:0] i_data5, i_data13, i_data21, i_data29,
    // input [DATA_WIDTH-1:0] i_data6, i_data14, i_data22, i_data30,
    // input [DATA_WIDTH-1:0] i_data7, i_data15, i_data23, i_data31,
    input i_freeNext,
    input rst,
    output [32-1:0] o_free,
    output o_driveNext,
    output [DATA_WIDTH-1:0] o_data  //直接用req
);

    wire [32-1:0] w_Trig, w_Req, reqNeg, Nrst, w_free;
    wire w_driveNext;
    reg [DATA_WIDTH-1:0] w_data;

    genvar i;
    generate
        for ( i=0 ; i<32 ; i=i+1 ) begin:
            //conTap
            // INV_X1M_A9TRULP_C40_W3 inv6 ( .A(w_Req[i]), .Y(reqNeg[i]) );
            // INV_X1M_A9TRULP_C40_W3 inv_for_rst ( .A(rst), .Y(Nrst[i]) );
            // DFFRPQ_X1M_A9TRULP_C40_W3 ffState ( .D(reqNeg[i]), .CK(w_Trig[i]), .R(Nrst[i]), .Q(w_Req[i]) );
            contTap Tap(
            .trig(w_Trig[i]),
            .req(w_Req[i]), .rst(rst)
            );
            assign w_Trig[i] = i_drive[i] | w_free[i];
            //outfree
            assign o_free[i] = i_freeNext & w_Req[i];
            delay1U u_out_delay1U(.inR  (o_free[i]  ),.rst  (rst  ),.outR (w_free[i] ));
        end
    endgenerate
    
    assign w_driveNext = | i_drive;
    delay2U outdelay(.inR  (w_driveNext  ),.rst  (rst  ),.outR (o_driveNext ));

    assign o_data = w_Req;

    // always @( *) begin
    //     case (w_Req)
    //     32'b00000000000000000000000000000001:w_data=i_data0;
    //     32'b00000000000000000000000000000010:w_data=i_data1;
    //     32'b00000000000000000000000000000100:w_data=i_data2;
    //     32'b00000000000000000000000000001000:w_data=i_data3;
    //     32'b00000000000000000000000000010000:w_data=i_data4;
    //     32'b00000000000000000000000000100000:w_data=i_data5;
    //     32'b00000000000000000000000001000000:w_data=i_data6;
    //     32'b00000000000000000000000010000000:w_data=i_data7;
    //     32'b00000000000000000000000100000000:w_data=i_data8;
    //     32'b00000000000000000000001000000000:w_data=i_data9;
    //     32'b00000000000000000000010000000000:w_data=i_data10;
    //     32'b00000000000000000000100000000000:w_data=i_data11;
    //     32'b00000000000000000001000000000000:w_data=i_data12;
    //     32'b00000000000000000010000000000000:w_data=i_data13;
    //     32'b00000000000000000100000000000000:w_data=i_data14;
    //     32'b00000000000000001000000000000000:w_data=i_data15;
    //     32'b00000000000000010000000000000000:w_data=i_data16;
    //     32'b00000000000000100000000000000000:w_data=i_data17;
    //     32'b00000000000001000000000000000000:w_data=i_data18;
    //     32'b00000000000010000000000000000000:w_data=i_data19;
    //     32'b00000000000100000000000000000000:w_data=i_data20;
    //     32'b00000000001000000000000000000000:w_data=i_data21;
    //     32'b00000000010000000000000000000000:w_data=i_data22;
    //     32'b00000000100000000000000000000000:w_data=i_data23;
    //     32'b00000001000000000000000000000000:w_data=i_data24;
    //     32'b00000010000000000000000000000000:w_data=i_data25;
    //     32'b00000100000000000000000000000000:w_data=i_data26;
    //     32'b00001000000000000000000000000000:w_data=i_data27;
    //     32'b00010000000000000000000000000000:w_data=i_data28;
    //     32'b00100000000000000000000000000000:w_data=i_data29;
    //     32'b01000000000000000000000000000000:w_data=i_data30;
    //     32'b10000000000000000000000000000000:w_data=i_data31;
    //     default: w_data = {DATA_WIDTH{1'b0}};
    // endcase
    // end

    //assign o_data = w_data;
endmodule