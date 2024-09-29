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
    input i_hit_sig,
    output [20:0] buffer_out
);
    
    reg [2:0] lru_buffer [7:0]; //7个两位宽的reg
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
            lru_buffer[0] = 3'd0;lru_buffer[1] = 3'd0;lru_buffer[2] = 3'd0;lru_buffer[3] = 3'd0;
            lru_buffer[4] = 3'd0;lru_buffer[5] = 3'd0;lru_buffer[6] = 3'd0;lru_buffer[7] = 3'd0;
        end
        else begin
            lru_buffer[0] = lru_buffer_datain[0];lru_buffer[1] = lru_buffer_datain[1];
            lru_buffer[2] = lru_buffer_datain[2];lru_buffer[3] = lru_buffer_datain[3];
            lru_buffer[4] = lru_buffer_datain[4];lru_buffer[5] = lru_buffer_datain[5];
            lru_buffer[6] = lru_buffer_datain[6];lru_buffer[7] = lru_buffer_datain[7];
        end
    end

    genvar i;
    generate
        for ( i=0; i<8; i=i+1 ) begin :lru_algorithm
            assign lru_buffer_datahitin[i] = (i == i_hit_way_8) ?  3'b111 : (( lru_buffer[i] < w_encoder_3 ) ?  (lru_buffer[i]+3'b001) : lru_buffer[i]);
            assign lru_buffer_datamissin[i] = (lru_buffer[i] == 3'b000) ? 3'b111 : (lru_buffer[i]-3'b001) ;
            assign lru_buffer_datain[i] = i_hit_sig ? lru_buffer_datahitin[i] : lru_buffer_datamissin[i];
        end
    endgenerate

endmodule
