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

//
// if (rst==0) begin
   
// end
// else begin
    // case (w_case_number)
    //     3'b001:begin
            
    //     end
    //     3'b010:begin
            
    //     end
    //     3'b100:begin
            
    //     end
    //     default:begin
            
    //     end 
    // endcase
// end

module tree_LRU(
    input rst,
    // input i_drive_treeLRU, i_freeNext,
    // output o_free_treeLRU, o_driveNext,

    input fire6, fire5, fire4, fire3, fire2, fire1, fire0, leafFire,
    input [6:0] i_hit_way_7,
    input i_hit_sig,
    output [2:0] buffer_out0,buffer_out1,buffer_out2,buffer_out3,buffer_out4,buffer_out5,buffer_out6,buffer_out7
    //buffer_out0恒为LRU位

    );

    reg [2:0] lru_buffer [6:0]; //7个三位宽的reg  全0 到 全1-1 索引缓存行  
    reg [2:0] r_flag_3, r_nflag_3;  //标记兄弟节点LRU的位， 本次启动策略时标记位的备份 开始时更新 ,
    reg r_tree_linkway;//标记树连接 0正常 1交错
    reg [1:0] r_floor_2; //到第几层, 对于 [1] ^ [0] = 1 第 层 , [1] ^ [0] = 0 第 层

//确定节点的顺序
    reg [1:0] l, m; //one hot  [1] 01, [2] 10
    reg [3:0] ll, mm, lm, ml; //one hot   [3] 0001, [4] 0010, [5] 0100, [6] 1000
    reg [2:0] w_lru_bufer_ll; //ll位的值

    always @( *) begin
    
        case (r_nflag_3[0])
            1'b0:begin l=2'b10; m=2'b01; end
            default:begin l=2'b01; m=2'b10; end 
        endcase
    
        //t=0正常连接
        if (r_tree_linkway==0) begin
            casez (r_nflag_3)
                3'b?11: begin ll = 4'b0001;  end 
                3'b?01: begin ll = 4'b0010;  end
                3'b1?0: begin ll = 4'b0100;  end
                default: begin ll = 4'b1000; end
                // default:begin
                //   ll = 4'b0;w_lru_bufer_ll = 3'b0;
                // end 
            endcase

            casez (r_nflag_3)
                3'b?00: begin mm = 4'b0001; end 
                3'b?10: begin mm = 4'b0010; end
                3'b0?1: begin mm = 4'b0100; end
                default: begin mm = 4'b1000; end
                //default: mm = 4'b0;
            endcase
            
            casez (r_nflag_3)
                3'b?01: begin lm = 4'b0001; end 
                3'b?11: begin lm = 4'b0010; end
                3'b0?0: begin lm = 4'b0100; end
                default: begin lm = 4'b1000; end
                //default: lm = 4'b0;
            endcase

            casez (r_nflag_3)
                3'b?10: begin ml = 4'b0001; end 
                3'b?00: begin ml = 4'b0010; end
                3'b1?1: begin ml = 4'b0100; end
                default: begin ml = 4'b1000; end
                //default: ml = 4'b0;
            endcase
        end

        //t=1交错连接
        else begin
            casez (r_nflag_3)
                3'b?10: begin ll = 4'b0001; w_lru_bufer_ll = lru_buffer[3]; end 
                3'b?00: begin ll = 4'b0010; w_lru_bufer_ll = lru_buffer[4]; end
                3'b1?1: begin ll = 4'b0100; w_lru_bufer_ll = lru_buffer[5]; end
                default: begin ll = 4'b1000; w_lru_bufer_ll = lru_buffer[6]; end
                //default:begin ll = 4'b0; w_lru_bufer_ll = 3'b0; end
            endcase

            casez (r_nflag_3)
                3'b?01: begin mm = 4'b0001; end 
                3'b?11: begin mm = 4'b0010; end
                3'b0?0: begin mm = 4'b0100; end
                default: begin mm = 4'b1000; end
                //default: mm = 4'b0;
            endcase
            
            casez (r_nflag_3)
                3'b?00: begin lm = 4'b0001; end 
                3'b?10: begin lm = 4'b0010; end
                3'b0?1: begin lm = 4'b0100; end
                default: begin lm = 4'b1000; end
                //default: lm = 4'b0;
            endcase

            casez (r_nflag_3)
                3'b?11: begin ml = 4'b0001; end 
                3'b?01: begin ml = 4'b0010; end
                3'b1?0: begin ml = 4'b0100; end
                default: begin ml = 4'b1000; end
                //default: ml = 4'b0;
            endcase
        end 
    end

    wire hit_ll, hit_mm, hit_lm, hit_ml;
    assign hit_ll = ((i_hit_way_7[6] & ll[3])|(i_hit_way_7[5] & ll[2])|(i_hit_way_7[4] & ll[1])|(i_hit_way_7[3] & ll[0]));
    assign hit_mm = ((i_hit_way_7[6] & mm[3])|(i_hit_way_7[5] & mm[2])|(i_hit_way_7[4] & mm[1])|(i_hit_way_7[3] & mm[0]));
    assign hit_lm = ((i_hit_way_7[6] & lm[3])|(i_hit_way_7[5] & lm[2])|(i_hit_way_7[4] & lm[1])|(i_hit_way_7[3] & lm[0]));
    assign hit_ml = ((i_hit_way_7[6] & ml[3])|(i_hit_way_7[5] & ml[2])|(i_hit_way_7[4] & ml[1])|(i_hit_way_7[3] & ml[0]));

//确定当前状态
    reg [2:0] w_case_number; //one hot   case0 未命中 or 命中0层 001，case1 命中1层 010，case2 命中2层 100
    //reg [1:0] w_upper_fire_2;//两位来管理下层能否触发上层  w_upper_fire_2，[2]控制 1层，[1]控制0层; case2时[0]=0，case3时[0]=[1]=0

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
    end

//LRUtree walk 遍历LRU树, 控制链 + fire
    // wire fire6, fire5, fire4, fire3, fire2, fire1, fire0, leafFire;
    wire w_fire_to_buffer0, w_fire_to_buffer1, w_fire_to_buffer2;
    wire w_fire_to_buffer3, w_fire_to_buffer4, w_fire_to_buffer5, w_fire_to_buffer6;

    assign w_fire_to_buffer0 = ( fire1 | fire2 );
    assign w_fire_to_buffer1 = fire1 | (r_tree_linkway ? ( fire3 | fire4 ) : ( fire5 | fire6 ));
    assign w_fire_to_buffer2 = fire2 | (r_tree_linkway ? ( fire5 | fire6 ) : ( fire3 | fire4 ));

    //控制链
    
        // //node 0
        //     wire w_selector0_drive_selector1, w_selector0_free_selector1;
        //     wire w_selector0_drive_selector2, w_selector0_free_selector2;
        //     wire w_selector0_drive_leafFifo, w_selector0_free_leafFifo;
            
        //     cSelector3_cache selector0(
        //         .rst          (rst          ),
        //         .i_drive      ( i_drive_treeLRU      ),.o_free       ( o_free_treeLRU       ),
        //         .o_fire       ( fire0       ),       //用于 r_nflag_3 更新

        //         .valid0       ( ( w_case_number[0] | w_case_number[1] ) & r_flag_3[0] ),  //不使用 r_nflag_3，因为该selector的fire不能用于自身valid
        //         .valid1       ( ( w_case_number[0] | w_case_number[1] ) & (~r_flag_3[0]) ), 
        //         .valid2       ( w_case_number[2]       ),

        //         .o_driveNext0 ( w_selector0_drive_selector1 ),
        //         .o_driveNext1 ( w_selector0_drive_selector2 ),
        //         .o_driveNext2 ( w_selector0_drive_leafFifo  ),

        //         .i_freeNext0  ( w_selector0_free_selector1  ),
        //         .i_freeNext1  ( w_selector0_free_selector2  ),
        //         .i_freeNext2  ( w_selector0_free_leafFifo )
        //     );

        // //node 1
        //     wire w_selector1_drive_mutex3, w_selector1_free_mutex3;
        //     wire w_selector1_drive_mutex4, w_selector1_free_mutex4;
        //     wire w_selector1_drive_mutex5, w_selector1_free_mutex5;
        //     wire w_selector1_drive_mutex6, w_selector1_free_mutex6;

        //     cSelector4_cache selector1(
        //         .rst          ( rst          ),
        //         .i_drive      ( w_selector0_drive_selector1      ),
        //         .o_free       ( w_selector0_free_selector1       ),

        //         .o_fire       ( fire1       ),

        //         .valid0       ( (~r_tree_linkway) & r_nflag_3[1]   ),   //r_tree_linkway = 0 正常连接
        //         .valid1       ( (~r_tree_linkway) & (~r_nflag_3[1])    ),
        //         .valid2       ( r_tree_linkway & r_nflag_3[2]     ),
        //         .valid3       ( r_tree_linkway & (~r_nflag_3[2])     ),

        //         .o_driveNext0 ( w_selector1_drive_mutex3 ),
        //         .o_driveNext1 ( w_selector1_drive_mutex4 ),
        //         .o_driveNext2 ( w_selector1_drive_mutex5 ),
        //         .o_driveNext3 ( w_selector1_drive_mutex6 ),

        //         .i_freeNext0  ( w_selector1_free_mutex3  ),
        //         .i_freeNext1  ( w_selector1_free_mutex4  ),
        //         .i_freeNext2  ( w_selector1_free_mutex5  ),
        //         .i_freeNext3  ( w_selector1_free_mutex6  )
        //     );
        
        // //node 2
        //     wire w_selector2_drive_mutex3, w_selector2_free_mutex3;
        //     wire w_selector2_drive_mutex4, w_selector2_free_mutex4;
        //     wire w_selector2_drive_mutex5, w_selector2_free_mutex5;
        //     wire w_selector2_drive_mutex6, w_selector2_free_mutex6;

        //     cSelector4_cache selector2(
        //         .rst          ( rst          ),
        //         .i_drive      ( w_selector0_drive_selector2      ),
        //         .o_free       ( w_selector0_free_selector2       ),

        //         .o_fire       ( fire2       ),

        //         .valid0       ( (~r_tree_linkway) & r_nflag_3[2]   ),   //r_tree_linkway = 0 正常连接
        //         .valid1       ( (~r_tree_linkway) & (~r_nflag_3[2])    ),
        //         .valid2       ( r_tree_linkway & r_nflag_3[1]     ),
        //         .valid3       ( r_tree_linkway & (~r_nflag_3[1])     ),

        //         .o_driveNext0 ( w_selector2_drive_mutex3 ),
        //         .o_driveNext1 ( w_selector2_drive_mutex4 ),
        //         .o_driveNext2 ( w_selector2_drive_mutex5 ),
        //         .o_driveNext3 ( w_selector2_drive_mutex6 ),

        //         .i_freeNext0  ( w_selector2_free_mutex3  ),
        //         .i_freeNext1  ( w_selector2_free_mutex4  ),
        //         .i_freeNext2  ( w_selector2_free_mutex5  ),
        //         .i_freeNext3  ( w_selector2_free_mutex6  )
        //     );

        // //node3
        //     wire w_mutex3_drive_fifo3, w_mutex3_free_fifo3;
        //     wire [1:0] w_mutex3_data_2;

        //     cMutexMerge2_2b_cache mutex3(
        //         .i_drive0    ( w_selector1_drive_mutex3   ),
        //         .i_drive1    ( w_selector2_drive_mutex3   ),
        //         .i_data0     ( 2'b01   ),  //node1
        //         .i_data1     ( 2'b10   ),  //node2

        //         .i_freeNext  ( w_mutex3_free_fifo3 ),
        //         .rst         ( rst         ),
        //         .o_free0     ( w_selector1_free_mutex3    ),
        //         .o_free1     ( w_selector2_free_mutex3    ),
        //         .o_driveNext ( w_mutex3_drive_fifo3 ),
        //         .o_data      ( w_mutex3_data_2    )
        //     );
            
        //     wire w_fifo3_drive_lastMutex, w_fifo3_free_lastMutex;

        //     cFifo1 Fifo3(
        //         .i_drive     ( w_mutex3_drive_fifo3     ),
        //         .i_freeNext  ( w_fifo3_free_lastMutex   ),
        //         .rst         ( rst         ),
        //         .o_free      ( w_mutex3_free_fifo3      ),
        //         .o_driveNext ( w_fifo3_drive_lastMutex  ),
        //         .o_fire_1    ( fire3    )
        //     );
        
        // //node4
        //     wire w_mutex4_drive_fifo4, w_mutex4_free_fifo4;
        //     wire [1:0] w_mutex4_data_2;

        //     cMutexMerge2_2b_cache mutex4(
        //         .i_drive0    ( w_selector1_drive_mutex4   ),
        //         .i_drive1    ( w_selector2_drive_mutex4   ),
        //         .i_data0     ( 2'b01   ),  //node1
        //         .i_data1     ( 2'b10   ),  //node2

        //         .i_freeNext  ( w_mutex4_free_fifo4 ),
        //         .rst         ( rst         ),
        //         .o_free0     ( w_selector1_free_mutex4    ),
        //         .o_free1     ( w_selector2_free_mutex4    ),
        //         .o_driveNext ( w_mutex4_drive_fifo4 ),
        //         .o_data      ( w_mutex4_data_2     )
        //     );
            
        //     wire w_fifo4_drive_lastMutex, w_fifo4_free_lastMutex;

        //     cFifo1 Fifo4(
        //         .i_drive     ( w_mutex4_drive_fifo4     ),
        //         .i_freeNext  ( w_fifo4_free_lastMutex   ),
        //         .rst         ( rst         ),
        //         .o_free      ( w_mutex4_free_fifo4      ),
        //         .o_driveNext ( w_fifo4_drive_lastMutex  ),
        //         .o_fire_1    ( fire4    )
        //     );

        // //node5
        //     wire w_mutex5_drive_fifo5, w_mutex5_free_fifo5;
        //     wire [1:0] w_mutex5_data_2;

        //     cMutexMerge2_2b_cache mutex5(
        //         .i_drive0    ( w_selector1_drive_mutex5   ),
        //         .i_drive1    ( w_selector2_drive_mutex5   ),
        //         .i_data0     ( 2'b01   ),  //node1
        //         .i_data1     ( 2'b10   ),  //node2

        //         .i_freeNext  ( w_mutex5_free_fifo5 ),
        //         .rst         ( rst         ),
        //         .o_free0     ( w_selector1_free_mutex5    ),
        //         .o_free1     ( w_selector2_free_mutex5    ),
        //         .o_driveNext ( w_mutex5_drive_fifo5 ),
        //         .o_data      ( w_mutex5_data_2     )
        //     );
            
        //     wire w_fifo5_drive_lastMutex, w_fifo5_free_lastMutex;

        //     cFifo1 Fifo5(
        //         .i_drive     ( w_mutex5_drive_fifo5     ),
        //         .i_freeNext  ( w_fifo5_free_lastMutex   ),
        //         .rst         ( rst         ),
        //         .o_free      ( w_mutex5_free_fifo5      ),
        //         .o_driveNext ( w_fifo5_drive_lastMutex  ),
        //         .o_fire_1    ( fire5    )
        //     );

        // //node6
        //     wire w_mutex6_drive_fifo6, w_mutex6_free_fifo6;
        //     wire [1:0] w_mutex6_data_2;

        //     cMutexMerge2_2b_cache mutex6(
        //         .i_drive0    ( w_selector1_drive_mutex6   ),
        //         .i_drive1    ( w_selector2_drive_mutex6   ),
        //         .i_data0     ( 2'b01   ),  //node1
        //         .i_data1     ( 2'b10   ),  //node2

        //         .i_freeNext  ( w_mutex6_free_fifo6 ),
        //         .rst         ( rst         ),
        //         .o_free0     ( w_selector1_free_mutex6    ),
        //         .o_free1     ( w_selector2_free_mutex6    ),
        //         .o_driveNext ( w_mutex6_drive_fifo6 ),
        //         .o_data      ( w_mutex6_data_2     )
        //     );
            
        //     wire w_fifo6_drive_lastMutex, w_fifo6_free_lastMutex;

        //     cFifo1 Fifo6(
        //         .i_drive     ( w_mutex6_drive_fifo6     ),
        //         .i_freeNext  ( w_fifo6_free_lastMutex   ),
        //         .rst         ( rst         ),
        //         .o_free      ( w_mutex6_free_fifo6      ),
        //         .o_driveNext ( w_fifo6_drive_lastMutex  ),
        //         .o_fire_1    ( fire6    )
        //     );

        // //leafFifo
        //     wire w_leafFifo_drive_lastMutex, w_leafFifo_free_lastMutex;

        //     cFifo1 leafFifo(
        //         .i_drive     ( w_selector0_drive_leafFifo    ),
        //         .i_freeNext  ( w_leafFifo_free_lastMutex   ),
        //         .rst         ( rst         ),
        //         .o_free      ( w_selector0_free_leafFifo      ),
        //         .o_driveNext ( w_leafFifo_drive_lastMutex  ),
        //         .o_fire_1    ( leafFire    )
        //     );

        // //lastMutex
        //     cMutexMerge5_5b u_cMutexMerge5_5b(
        //         .i_drive0    ( w_fifo3_drive_lastMutex    ),
        //         .i_drive1    ( w_fifo4_drive_lastMutex    ),
        //         .i_drive2    ( w_fifo5_drive_lastMutex    ),
        //         .i_drive3    ( w_fifo6_drive_lastMutex    ),
        //         .i_drive4    ( w_leafFifo_drive_lastMutex    ),
        //         .i_data0     ( 5'b00001     ),
        //         .i_data1     ( 5'b00010     ),
        //         .i_data2     ( 5'b00100     ),
        //         .i_data3     ( 5'b01000     ),
        //         .i_data4     ( 5'b10000     ),

        //         .i_freeNext  ( i_freeNext  ),
        //         .rst         ( rst         ),
        //         .o_free0     ( w_fifo3_free_lastMutex     ),
        //         .o_free1     ( w_fifo4_free_lastMutex     ),
        //         .o_free2     ( w_fifo5_free_lastMutex     ),
        //         .o_free3     ( w_fifo6_free_lastMutex     ),
        //         .o_free4     ( w_leafFifo_free_lastMutex     ),
        //         .o_driveNext ( o_driveNext ),
        //         .o_data      (       )
        //     );

//buffer update 缓冲更新
    wire w_nowFloor;
    wire fire_to_flag0, fire_to_flag1, fire_to_flag2, fire_to_floor, fire_to_treelink;
    assign w_nowFloor = r_floor_2[0] ^ r_floor_2[1];   // 给node1 node2使用， 0 1层, 1 2层

    //r_flag_3 更新
        
        //0层
            //r_nflag
            always @(posedge fire0 or negedge rst) begin
                if (rst==0) begin
                    r_nflag_3 <= 3'b0;
                end
                else begin
                    r_nflag_3 <= r_flag_3;
                end
            end

        //1层
            //r_flag[0]
            assign fire_to_flag0 = fire1 | fire2;
            always @(posedge fire_to_flag0 or negedge rst) begin
                if (rst==0) begin
                    r_flag_3[0] <= 1'b0;
                    r_floor_2[0] <= 1'b0;
                end
                else begin
                    r_floor_2[0] <= ~r_floor_2[0];
                    case (w_case_number[1:0])
                        2'b01:begin //case0
                          r_flag_3[0] <= ~r_flag_3[0];  
                        end
                        2'b10:begin //case1
                            //i_hit_way_7[2:1]，命中【1】 01，命中【2】 10
                            if ( (i_hit_way_7[2] & l[1]) | (i_hit_way_7[1] & l[0]) )begin   //按位与  10 & 01 = 00， 01 & 01 = 01；
                                r_flag_3[0] <= ~r_flag_3[0];
                            end  
                        end
                        default:begin end 
                    endcase
                end
            end 

        //2层
            //r_flag[1]
            assign fire_to_flag1 = fire3 | fire4 | leafFire;
            always @(posedge fire_to_flag1 or negedge rst) begin
                if (rst==0) begin
                    r_flag_3[1] <= 1'b0;
                end
                else begin
                    case (w_case_number)
                        3'b001,3'b010:begin //fire3、fire4
                          r_flag_3[1] <= ~r_flag_3[1];
                        end
                        3'b100:begin        //leafFire
                          if ( hit_ll && (i_hit_way_7[3] | i_hit_way_7[4])) begin  //命中LL，且此时flag[1]管理的节点命中
                            r_flag_3[1] <= ~r_flag_3[1];
                          end
                          else if ( hit_ml && (i_hit_way_7[3] | i_hit_way_7[4])) begin 
                            r_flag_3[1] <= ~r_flag_3[1];
                          end
                          else begin end
                        end 
                        default:begin end 
                    endcase
                end
            end

            //r_flag[2]
            assign fire_to_flag2 = fire5 | fire6 | leafFire;
            always @(posedge fire_to_flag2 or negedge rst) begin
                if (rst==0) begin
                    r_flag_3[2] <= 1'b0;
                end
                else begin
                    case (w_case_number)
                        3'b001,3'b010:begin //fire5、fire6
                          r_flag_3[2] <= ~r_flag_3[2];
                        end
                        3'b100:begin        //leafFire
                          if ( hit_ll && (i_hit_way_7[5] | i_hit_way_7[6]) ) begin 
                            r_flag_3[2] <= ~r_flag_3[2];
                          end
                          else if ( hit_ml && (i_hit_way_7[5] | i_hit_way_7[6])) begin 
                            r_flag_3[2] <= ~r_flag_3[2];
                          end
                          else begin end
                        end 
                        default:begin end 
                    endcase
                end
            end

            //r_floor[2]
            assign fire_to_floor = fire3 | fire4 | fire5 | fire6 ;
            always @(posedge fire_to_floor or negedge rst) begin  //这些fire不会同时来，可以 |
                if (rst==0) begin
                    r_floor_2[1] <= 1'b0;
                end
                else begin
                    r_floor_2[1] <= ~r_floor_2[1];
                end
            end

    //r_tree_linkway
        assign fire_to_treelink = fire1 | fire2 | leafFire;
        always @(posedge fire_to_treelink or negedge rst) begin
            if (rst==0) begin
                r_tree_linkway <= 1'b0;
            end
            else begin
                case (w_case_number[2:1])
                    2'b01:begin
                      if ( (i_hit_way_7[2] & m[1]) | (i_hit_way_7[1] & m[0]) )
                        r_tree_linkway = ~r_tree_linkway;
                    end
                    2'b10:begin
                      if ( hit_ll || hit_lm ) 
                        r_tree_linkway = ~r_tree_linkway;
                    end 
                    default:begin end 
                endcase
            end
        end
    
    //lru_buffer 更新

        //buffer0
            always @(posedge w_fire_to_buffer0 or negedge rst) begin
                if (rst==0) begin
                    lru_buffer[0] <= 3'b000;
                end
                else begin
                    case ({w_case_number[0],r_nflag_3[0]}) //仅case0时需要更改
                        2'b11:begin
                            lru_buffer[0] <= lru_buffer[1];
                        end
                        2'b10:begin
                            lru_buffer[0] <= lru_buffer[2];
                        end
                        default: begin end
                    endcase
                end
            end

        //buffer1
            reg [2:0] w_data_to_buffer1;
            always @( *) begin
                casez ({r_tree_linkway, r_flag_3[2],r_flag_3[1]})
                    3'b0?1: w_data_to_buffer1 = lru_buffer[3];
                    3'b0?0: w_data_to_buffer1 = lru_buffer[4];
                    3'b11?: w_data_to_buffer1 = lru_buffer[5];
                    default: w_data_to_buffer1 = lru_buffer[6];
                endcase
            end

            always @(posedge w_fire_to_buffer1 or negedge rst) begin
                if (rst==0) begin
                    lru_buffer[1] <= 3'b000;
                end
                else begin
                    if (w_nowFloor==0 && w_case_number[0]) begin
                        lru_buffer[1] <= lru_buffer[0];
                    end
                    else if(w_nowFloor==1)begin
                        lru_buffer[1] <= w_data_to_buffer1;
                    end
                end
            end

        //buffer2
            reg [2:0] w_data_to_buffer2;
            always @( *) begin
                casez ({r_tree_linkway, r_flag_3[2],r_flag_3[1]})
                    3'b1?1: w_data_to_buffer2 = lru_buffer[3];
                    3'b1?0: w_data_to_buffer2 = lru_buffer[4];
                    3'b01?: w_data_to_buffer2 = lru_buffer[5];
                    default: w_data_to_buffer2 = lru_buffer[6];
                endcase
            end

            always @(posedge w_fire_to_buffer2 or negedge rst) begin
                if (rst==0) begin
                    lru_buffer[2] <= 3'b000;
                end
                else begin
                    if (w_nowFloor==0 && w_case_number[0]) begin
                        lru_buffer[2] <= lru_buffer[0];
                    end
                    else if(w_nowFloor==1)begin
                        lru_buffer[2] <= w_data_to_buffer2;
                    end
                end
            end
        
        //buffer3
            assign w_fire_to_buffer3 = fire3 | (leafFire  );
            always @(posedge w_fire_to_buffer3 or negedge rst) begin
                if (rst==0) begin
                    lru_buffer[3] <= 3'b000;
                end
                else begin
                    case ({w_case_number,r_tree_linkway})
                        4'b0010, 4'b0100:begin
                          lru_buffer[3] <= lru_buffer[1];
                        end
                        4'b0011, 4'b0101:begin
                          lru_buffer[3] <= lru_buffer[2];
                        end
                        4'b1000, 4'b1001:begin
                          
                        end
                        default:begin end 
                    endcase
                end
            end
//输出
    assign buffer_out0 = lru_buffer[0];
    assign buffer_out1 = lru_buffer[1];
    assign buffer_out2 = lru_buffer[2];
    assign buffer_out3 = lru_buffer[3];
    assign buffer_out4 = lru_buffer[4];
    assign buffer_out5 = lru_buffer[5];
    assign buffer_out6 = lru_buffer[6];
    //assign buffer_out7 = lru_buffer[7];

endmodule
