`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/26 19:00:17
// Design Name: 
// Module Name: tree_LRU
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

//  [i]中存放三位索引
//  r[i]指示子节点兄弟间的先后  1左边LRU，0右边LRU
//  t表示当前层次与子节点的连接方式 0正常连接，1交错连接

//   正常连接
//          0层                [0]            根据命中情况选择下一步去1层还是2层
//                             /\
//                            /  \
//                           /    \
//                         1/ r[0] \0
//                         /        \
//          1层          [1]   t=0   [2]      
//                       /\          /\
//                     1/  \0      1/  \0
//                     /r[1]\      /r[2]\
//          2层      [3]    [4]  [5]    [6]     
//                 

//   交错连接
//          0层                [0]  
//                             /\
//                            /  \
//                           /    \
//                         1/ r[0] \0
//                         /        \
//          1层          [1]   t=1   [2]      
//                       /\          /\
//                     1/  \0      1/  \0
//                     /r[1]\      /r[2]\
//          2层      [5]    [6]  [3]    [4]     
//     

module tree_LRU(
    input rst,
    input i_drive_treeLRU,
    output o_free_treeLRU, 

    input [6:0] i_hit_way_7,
    input i_hit_sig,
    output [2:0] buffer_out0,buffer_out1,buffer_out2,buffer_out3,buffer_out4,buffer_out5,buffer_out6,buffer_out7
    );

    reg [2:0] lru_buffer [6:0]; //7个三位宽的reg  全0到全1索引缓存行
    reg [2:0] r_flag_3, r_nflag_3, r_tree_linkway;  //标记兄弟节点LRU的位， 本次启动策略时标记位的备份 开始时更新 ,标记树连接

//确定节点的顺序
    reg [1:0] l, m; //one hot  [1] 01, [2] 10
    reg [3:0] ll, mm, lm, ml; //one hot   [3] 0001, [4] 0010, [5] 0100, [6] 1000

    always @( *) begin
    
        case (r_nflag_3[0])
            1'b0:begin l=2'b10; m=2'b01; end
            1'b1:begin l=2'b01; m=2'b10; end 
            default: begin l=2'b00;m=2'b00; end
        endcase
    
        //t=0正常连接
        if (r_tree_linkway==0) begin
            casez (r_nflag_3)
                3'bx11: begin ll = 4'b0001; end 
                3'bx01: begin ll = 4'b0010; end
                3'b1x0: begin ll = 4'b0100; end
                3'b0x0: begin ll = 4'b1000; end
                default: ll = 4'b0;
            endcase

            casez (r_nflag_3)
                3'bx00: begin mm = 4'b0001; end 
                3'bx10: begin mm = 4'b0010; end
                3'b0x1: begin mm = 4'b0100; end
                3'b1x1: begin mm = 4'b1000; end
                default: mm = 4'b0;
            endcase
            
            casez (r_nflag_3)
                3'bx01: begin lm = 4'b0001; end 
                3'bx11: begin lm = 4'b0010; end
                3'b0x0: begin lm = 4'b0100; end
                3'b1x0: begin lm = 4'b1000; end
                default: lm = 4'b0;
            endcase

            casez (r_nflag_3)
                3'bx10: begin ml = 4'b0001; end 
                3'bx00: begin ml = 4'b0010; end
                3'b1x1: begin ml = 4'b0100; end
                3'b0x1: begin ml = 4'b1000; end
                default: ml = 4'b0;
            endcase
        end

        //t=1交错连接
        else begin
            casez (r_flag_3)
                3'bx10: begin ll = 4'b0001; end 
                3'bx00: begin ll = 4'b0010; end
                3'b1x1: begin ll = 4'b0100; end
                3'b0x1: begin ll = 4'b1000; end
                default: ll = 4'b0;
            endcase

            casez (r_flag_3)
                3'bx01: begin mm = 4'b0001; end 
                3'bx11: begin mm = 4'b0010; end
                3'b0x0: begin mm = 4'b0100; end
                3'b1x0: begin mm = 4'b1000; end
                default: mm = 4'b0;
            endcase
            
            casez (r_flag_3)
                3'bx00: begin lm = 4'b0001; end 
                3'bx10: begin lm = 4'b0010; end
                3'b0x1: begin lm = 4'b0100; end
                3'b1x1: begin lm = 4'b1000; end
                default: lm = 4'b0;
            endcase

            casez (r_flag_3)
                3'bx11: begin ml = 4'b0001; end 
                3'bx01: begin ml = 4'b0010; end
                3'b1x0: begin ml = 4'b0100; end
                3'b0x0: begin ml = 4'b1000; end
                default: ml = 4'b0;
            endcase
        end 

    end

//确定当前状态
    reg [2:0] w_case_number; //one hot   未命中 or 命中0层 001，命中1层 010， 命中2层 100
    reg [1:0] w_upper_fire_2;//两位来管理下层能否触发上层  w_upper_fire_2，[2]控制 1层，[1]控制0层; case2时[0]=0，case3时[0]=[1]=0

    always @( *) begin
        case (i_hit_way_7)
            7'b0000000:begin w_case_number = 3'b001; end
            7'b0000001:begin w_case_number = 3'b001; end
            7'b0000010:begin w_case_number = 3'b010; end
            7'b0000100:begin w_case_number = 3'b010; end
            7'b0001000:begin w_case_number = 3'b100; end
            7'b0010000:begin w_case_number = 3'b100; end
            7'b0100000:begin w_case_number = 3'b100; end
            7'b1000000:begin w_case_number = 3'b100; end
            default: w_case_number = 3'b0;
        endcase
        
        case (w_case_number)
            3'b001:begin
              w_upper_fire_2 = 2'b11;
            end
            4'b010:begin
              w_upper_fire_2 = 2'b10;
            end
            4'b100:begin
              w_upper_fire_2 = 2'b00;
            end
            default:begin
              w_upper_fire_2 = 2'b00;
            end
        endcase
    end

//LRUtree walk 遍历LRU树, 控制链 + fire
    wire fire6, fire5, fire4, fire3, fire2, fire1, fire0;
    wire w_fire_to_dff0, w_fire_to_dff1, w_fire_to_dff2;
    
    assign w_fire_to_dff0 = fire1 & w_upper_fire_2[0];
    assign w_fire_to_dff1 = ( fire3 | fire4 ) & w_upper_fire_2[1];
    assign w_fire_to_dff2 = ( fire5 | fire6 ) & w_upper_fire_2[1];

    //控制链
    
    //node 0
    wire w_selector0_drive_selector1, w_selector0_free_selector1;
    wire w_selector0_drive_selector2, w_selector0_free_selector2;
    wire w_selector0_drive_mutex3, w_selector0_free_mutex3;
    wire w_selector0_drive_mutex4, w_selector0_free_mutex4;
    wire w_selector0_drive_mutex5, w_selector0_free_mutex5;
    wire w_selector0_drive_mutex6, w_selector0_free_mutex6;
    
    cSelector6_cache selector0(
        .rst          (rst          ),
        .i_drive      ( i_drive_treeLRU      ),.o_free       ( o_free_treeLRU       ),

        .o_fire       ( fire0       ),       //用于 r_nflag_3 更新

        .valid0       ( ( w_case_number[0] | w_case_number[1] ) & r_nflag_3[0] ),
        .valid1       ( ( w_case_number[0] | w_case_number[1] ) & (~r_nflag_3[0]) ),
        .valid2       ( i_hit_way_7[3]       ),
        .valid3       ( i_hit_way_7[4]       ),
        .valid4       ( i_hit_way_7[5]       ),
        .valid5       ( i_hit_way_7[6]       ),

        .o_driveNext0 ( w_selector0_drive_selector1 ),
        .o_driveNext1 ( w_selector0_drive_selector2 ),
        .o_driveNext2 ( w_selector0_drive_mutex3 ),
        .o_driveNext3 ( w_selector0_drive_mutex4 ),
        .o_driveNext4 ( w_selector0_drive_mutex5 ),
        .o_driveNext5 ( w_selector0_drive_mutex6 ),
        .i_freeNext0  ( w_selector0_free_selector1  ),
        .i_freeNext1  ( w_selector0_free_selector2  ),
        .i_freeNext2  ( w_selector0_free_mutex3  ),
        .i_freeNext3  ( w_selector0_free_mutex4  ),
        .i_freeNext4  ( w_selector0_free_mutex5  ),
        .i_freeNext5  ( w_selector0_free_mutex6  )
    );

    always @(posedge fire0 or negedge rst) begin
        if (rst==0) begin
            r_nflag_3 <= 3'b0;
        end
        else begin
            r_nflag_3 <= r_flag_3;
        end
    end

    //node 1
    wire w_selector1_drive_mutex3, w_selector1_free_mutex3;
    wire w_selector1_drive_mutex4, w_selector1_free_mutex4;
    wire w_selector1_drive_mutex5, w_selector1_free_mutex5;
    wire w_selector1_drive_mutex6, w_selector1_free_mutex6;

    cSelector4_cache selector1(
        .rst          ( rst          ),
        .i_drive      ( w_selector0_drive_selector1      ),
        .o_free       ( w_selector0_free_selector1       ),

        .o_fire       ( fire1       ),

        .valid0       ( (~r_tree_linkway) & r_nflag_3[1]   ),   //r_tree_linkway = 0 正常连接
        .valid1       ( (~r_tree_linkway) & (~r_nflag_3[1])    ),
        .valid2       ( r_tree_linkway & r_nflag_3[2]     ),
        .valid3       ( r_tree_linkway & (~r_nflag_3[2])     ),

        .o_driveNext0 ( w_selector1_drive_mutex3 ),
        .o_driveNext1 ( w_selector1_drive_mutex4 ),
        .o_driveNext2 ( w_selector1_drive_mutex5 ),
        .o_driveNext3 ( w_selector1_drive_mutex6 ),

        .i_freeNext0  ( w_selector1_free_mutex3  ),
        .i_freeNext1  ( w_selector1_free_mutex4  ),
        .i_freeNext2  ( w_selector1_free_mutex5  ),
        .i_freeNext3  ( w_selector1_free_mutex6  )
    );
    
    //node 2
    wire w_selector2_drive_mutex3, w_selector2_free_mutex3;
    wire w_selector2_drive_mutex4, w_selector2_free_mutex4;
    wire w_selector2_drive_mutex5, w_selector2_free_mutex5;
    wire w_selector2_drive_mutex6, w_selector2_free_mutex6;

    cSelector4_cache selector2(
        .rst          ( rst          ),
        .i_drive      ( w_selector0_drive_selector2      ),
        .o_free       ( w_selector0_free_selector2       ),

        .o_fire       ( fire2       ),

        .valid0       ( (~r_tree_linkway) & r_nflag_3[2]   ),   //r_tree_linkway = 0 正常连接
        .valid1       ( (~r_tree_linkway) & (~r_nflag_3[2])    ),
        .valid2       ( r_tree_linkway & r_nflag_3[1]     ),
        .valid3       ( r_tree_linkway & (~r_nflag_3[1])     ),

        .o_driveNext0 ( w_selector2_drive_mutex3 ),
        .o_driveNext1 ( w_selector2_drive_mutex4 ),
        .o_driveNext2 ( w_selector2_drive_mutex5 ),
        .o_driveNext3 ( w_selector2_drive_mutex6 ),

        .i_freeNext0  ( w_selector2_free_mutex3  ),
        .i_freeNext1  ( w_selector2_free_mutex4  ),
        .i_freeNext2  ( w_selector2_free_mutex5  ),
        .i_freeNext3  ( w_selector2_free_mutex6  )
    );

    //node3
    wire w_mutex3_drive_selector3, w_mutex3_free_selector3;
    wire [2:0] w_mutex3_data_3;

    cMutexMerge3_3b_cache mutex3(
        .i_drive0    ( w_selector0_drive_mutex3   ),
        .i_drive1    ( w_selector1_drive_mutex3   ),
        .i_drive2    ( w_selector2_drive_mutex3   ),
        .i_data0     ( 3'b001   ),  //node0
        .i_data1     ( 3'b010   ),  //node1
        .i_data2     ( 3'b100   ),  //node2

        .i_freeNext  ( w_mutex3_free_selector3 ),
        .rst         ( rst         ),
        .o_free0     ( w_selector0_free_mutex3    ),
        .o_free1     ( w_selector1_free_mutex3    ),
        .o_free2     ( w_selector2_free_mutex3    ),
        .o_driveNext ( w_mutex3_drive_selector3 ),
        .o_data      ( w_mutex3_data_3     )
    );
    

    //node4

    //node5

    //node6

//输出
    assign buffer_out0 = lru_buffer[0];
    assign buffer_out1 = lru_buffer[1];
    assign buffer_out2 = lru_buffer[2];
    assign buffer_out3 = lru_buffer[3];
    assign buffer_out4 = lru_buffer[4];
    assign buffer_out5 = lru_buffer[5];
    assign buffer_out6 = lru_buffer[6];
    assign buffer_out7 = lru_buffer[7];

endmodule
