`timescale  1ns / 1ps        

module tb_tree_LRU_buffer;   

// tree_LRU_buffer Parameters
parameter PERIOD    = 10;
parameter rst_cycle  = 30;
parameter run_time  = 10;      


// tree_LRU_buffer Inputs
reg   rst                                  = 1 ;
reg   i_drive_treeLRU                      = 0 ;
reg   i_freeNext                           = 0 ;
reg   [6:0]  i_hit_way_7                   = 0 ;
reg   i_hit_sig                            = 0 ;
reg   [6:0]  i_addr_7                      = 0 ;

// tree_LRU_buffer Outputs
wire  o_free_treeLRU                       ;
wire  o_driveNext                          ;
wire  [2:0]  buffer_out0                   ;
wire  [2:0]  buffer_out1                   ;
wire  [2:0]  buffer_out2                   ;
wire  [2:0]  buffer_out3                   ;
wire  [2:0]  buffer_out4                   ;
wire  [2:0]  buffer_out5                   ;
wire  [2:0]  buffer_out6                   ;
wire  [2:0]  buffer_out7                   ;

initial
begin
    $sdf_annotate("/team/asc/zhong.jingye/zhongjingye/cache_replacement/DC/tree_lru_buffer_40/output/tree_LRU_buffer.sdf",u_tree_LRU_buffer); 
end

tree_LRU_buffer  u_tree_LRU_buffer (
    .rst                     ( rst                    ),
    .i_drive_treeLRU         ( i_drive_treeLRU        ),
    .i_freeNext              ( i_freeNext             ),
    .i_hit_way_7             ( i_hit_way_7      [6:0] ),
    .i_hit_sig               ( i_hit_sig              ),
    .i_addr_7                ( i_addr_7         [6:0] ),

    .o_free_treeLRU          ( o_free_treeLRU         ),
    .o_driveNext             ( o_driveNext            ),
    .buffer_out0             ( buffer_out0      [2:0] ),
    .buffer_out1             ( buffer_out1      [2:0] ),
    .buffer_out2             ( buffer_out2      [2:0] ),
    .buffer_out3             ( buffer_out3      [2:0] ),
    .buffer_out4             ( buffer_out4      [2:0] ),
    .buffer_out5             ( buffer_out5      [2:0] ),
    .buffer_out6             ( buffer_out6      [2:0] ),
    .buffer_out7             ( buffer_out7      [2:0] )
);

initial
begin
     #5; rst = 0;
    #(PERIOD*rst_cycle-5);
    #(PERIOD*rst_cycle) rst  =  1;

    //1
    i_addr_7 = 7'b0000101;
    #2.5;i_drive_treeLRU = 1'b1;
    #2.5;i_drive_treeLRU = 1'b0;

    #50;

    #2.5;i_freeNext = 1'b1;
    #2.5;i_freeNext = 1'b0;

    //2
    #2.5;i_drive_treeLRU = 1'b1;
    #2.5;i_drive_treeLRU = 1'b0;

    #50;

    #2.5;i_freeNext = 1'b1;
    #2.5;i_freeNext = 1'b0;

    /*//test2 hit:1 output:8'bz0000100    
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0000010;
    i_addr_7=7'h8;

//test3 hit:2 output:8'bz0001000    
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0000100;
    i_addr_7=7'h8;

//test4 hit:3 output:8'bz0001000 	
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0001000;
    i_addr_7=7'hf;

//test5 hit:4 output:8'bz0010000 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0010000;
    i_addr_7=7'hf;

//test6 hit:5 output:8'bz0100000 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0100000;
    i_addr_7=7'hf;

//test7 hit:6 output:8'bz0000000 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b1000000;
    i_addr_7=7'hf;


//test8 hit:0 output:8'bz0000000 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0000001;
    i_addr_7=7'h18;

//test9 hit:no output:8'bz0000010 
    #20;
    i_hit_sig=1'b0;
    i_hit_way_7=7'b0000000;
    i_addr_7=7'h18;

//test10 hit:no output:8'bz0000110 
    #20;
    i_hit_sig=1'b0;
    i_hit_way_7=7'b0000000;
    i_addr_7=7'h18;


//test11 hit:3 output:8'bz0000110 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0001000;
    i_addr_7=7'h18;

//test12 hit:1 output:8'bz0010100 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0000010;
    i_addr_7=7'h188;

//test13 hit:no output:8'bz0110100 
    #20;
    i_hit_sig=1'b0;
    i_hit_way_7=7'b0000000;
    i_addr_7=7'h188;


//test14 hit:no output:8'bz1110100 
    #20;
    i_hit_sig=1'b0;
    i_hit_way_7=7'b0000000;
    i_addr_7=7'h188;


//test15 hit:6 output:8'bz0110101 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=8'b1000000;
    i_addr_7=7'h188;

//test16 hit:2 output:8'bz0110001 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0000100;
    i_addr_7=7'h118;


//test17 hit:no output:8'bz0110001 
    #20;
    i_hit_sig=1'b0;
    i_hit_way_7=7'b0000000;
    i_addr_7=7'h118;

//test18 hit:no output:8'bz0111001 
    #20;
    i_hit_sig=1'b0;
    i_hit_way_7=7'b0000000;
    i_addr_7=7'h118;
//test19 hit:no output:8'bz0111011 
    #20;
    i_hit_sig=1'b0;
    i_hit_way_7=7'b0000000;
    i_addr_7=7'h118;

//test20 hit:1 output:8'bz0111001 
    #20;
    i_hit_sig=1'b1;
    i_hit_way_7=7'b0000010;
    i_addr_7=7'h118;
*/

    #200;
    $stop;
end

endmodule