`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/26 19:00:01
// Design Name: 
// Module Name: LRU
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


module LRU(
    input clk,rst, 
    input [7:0] i_hit_way_8,
    input i_lru_write_enable, 
    input i_hit_sig,
    output [2:0] buffer_out0,buffer_out1,buffer_out2,buffer_out3,buffer_out4,buffer_out5,buffer_out6,buffer_out7
);
    
    reg [2:0] lru_buffer [7:0]; //7个三位宽的reg  111 MRU  000 LRU
    wire [2:0] lru_buffer_datain [7:0];
    wire [2:0] lru_buffer_datahitin [7:0];
    wire [2:0] lru_buffer_datamissin [7:0];
    reg [2:0] w_encoder_3;
    
    always @( *) begin
        case (i_hit_way_8)
            8'b00000001:w_encoder_3 = 3'b000; 
            8'b00000010:w_encoder_3 = 3'b001;
            8'b00000100:w_encoder_3 = 3'b010;
            8'b00001000:w_encoder_3 = 3'b011;
            8'b00010000:w_encoder_3 = 3'b100;
            8'b00100000:w_encoder_3 = 3'b101;
            8'b01000000:w_encoder_3 = 3'b110;
            8'b10000000:w_encoder_3 = 3'b111;
            default: w_encoder_3 = 3'b000;
        endcase
    end

    always @(posedge clk or negedge rst) begin
        if (rst==0) begin
            lru_buffer[0] <= 3'b000;lru_buffer[1] <= 3'b001;lru_buffer[2] <= 3'b010;lru_buffer[3] <= 3'b011;
            lru_buffer[4] <= 3'b100;lru_buffer[5] <= 3'b101;lru_buffer[6] <= 3'b110;lru_buffer[7] <= 3'b111;
        end
        else begin
            if (i_lru_write_enable) begin
                lru_buffer[0] <= lru_buffer_datain[0];lru_buffer[1] <= lru_buffer_datain[1];
                lru_buffer[2] <= lru_buffer_datain[2];lru_buffer[3] <= lru_buffer_datain[3];
                lru_buffer[4] <= lru_buffer_datain[4];lru_buffer[5] <= lru_buffer_datain[5];
                lru_buffer[6] <= lru_buffer_datain[6];lru_buffer[7] <= lru_buffer_datain[7]; 
            end
        end
    end

    genvar i;
    generate
        for ( i=0; i<8; i=i+1 ) begin :lru_algorithm
            assign lru_buffer_datahitin[i] = (i == w_encoder_3) ?  3'b111 : (( lru_buffer[i] > w_encoder_3 ) ?  (lru_buffer[i]-3'b001) : lru_buffer[i]);
            assign lru_buffer_datamissin[i] = (lru_buffer[i] == 3'b000) ? 3'b111 : (lru_buffer[i]-3'b001) ;
            // = i_hit_sig ? lru_buffer_datahitin[i] : lru_buffer_datamissin[i];
        end
    endgenerate

    assign buffer_out0 = lru_buffer[0];
    assign buffer_out1 = lru_buffer[1];
    assign buffer_out2 = lru_buffer[2];
    assign buffer_out3 = lru_buffer[3];
    assign buffer_out4 = lru_buffer[4];
    assign buffer_out5 = lru_buffer[5];
    assign buffer_out6 = lru_buffer[6];
    assign buffer_out7 = lru_buffer[7];


    assign lru_buffer_datain[0] = i_hit_sig ? lru_buffer_datahitin[0] : lru_buffer_datamissin[0];
    assign lru_buffer_datain[1] = i_hit_sig ? lru_buffer_datahitin[1] : lru_buffer_datamissin[1];
    assign lru_buffer_datain[2] = i_hit_sig ? lru_buffer_datahitin[2] : lru_buffer_datamissin[2];
    assign lru_buffer_datain[3] = i_hit_sig ? lru_buffer_datahitin[3] : lru_buffer_datamissin[3];
    assign lru_buffer_datain[4] = i_hit_sig ? lru_buffer_datahitin[4] : lru_buffer_datamissin[4];
    assign lru_buffer_datain[5] = i_hit_sig ? lru_buffer_datahitin[5] : lru_buffer_datamissin[5];
    assign lru_buffer_datain[6] = i_hit_sig ? lru_buffer_datahitin[6] : lru_buffer_datamissin[6];
    assign lru_buffer_datain[7] = i_hit_sig ? lru_buffer_datahitin[7] : lru_buffer_datamissin[7];

endmodule
