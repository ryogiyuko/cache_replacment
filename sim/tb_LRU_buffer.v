`timescale  1ns / 1ps

module tb_LRU_buffer;

// LRU Parameters
parameter PERIOD    = 10;
parameter rst_cycle  = 30;
parameter run_time  = 10;

// LRU Inputs
reg   clk                                  = 0 ;
reg   rst                                  = 1 ;
reg   [7:0]  i_hit_way_8                   = 0 ;
reg   i_lru_write_enable                   = 1 ;
reg   i_hit_sig                            = 0 ;
reg   [6:0]  i_addr_7                      = 0 ;

// LRU Outputs
wire  [2:0]  buffer_out0                   ;
wire  [2:0]  buffer_out1                   ;
wire  [2:0]  buffer_out2                   ;
wire  [2:0]  buffer_out3                   ;
wire  [2:0]  buffer_out4                   ;
wire  [2:0]  buffer_out5                   ;
wire  [2:0]  buffer_out6                   ;
//wire  [2:0]  buffer_out7                   ;
wire  [7:0]  out_lru_flag                  ;  

initial
begin
    $sdf_annotate("/team/asc/zhong.jingye/zhongjingye/cache_replacement/DC/lru_buffer_40/output/LRU_buffer.sdf",u_LRU_buffer); 
end

initial
begin
    forever #(PERIOD/2)  clk=~clk;
end 

// LRU  u_LRU (
//     .clk                     ( clk                       ),
//     .rst                     ( rst                       ),
//     .i_hit_way_8             ( i_hit_way_8         [7:0] ),
//     .i_lru_write_enable      ( i_lru_write_enable        ),
//     .i_hit_sig               ( i_hit_sig                 ),

//     .buffer_out0             ( buffer_out0         [2:0] ),
//     .buffer_out1             ( buffer_out1         [2:0] ),
//     .buffer_out2             ( buffer_out2         [2:0] ),
//     .buffer_out3             ( buffer_out3         [2:0] ),
//     .buffer_out4             ( buffer_out4         [2:0] ),
//     .buffer_out5             ( buffer_out5         [2:0] ),
//     .buffer_out6             ( buffer_out6         [2:0] )
//     //,.buffer_out7             ( buffer_out7         [2:0] )
// );

LRU_buffer  u_LRU_buffer (
    .clk                     ( clk                 ),
    .rst                     ( rst                 ),
    .i_hit_way_8             ( i_hit_way_8   [7:0] ),
    .i_hit_sig               ( i_hit_sig           ),
    .i_addr_7                ( i_addr_7      [6:0] ),

    .buffer_out0             ( buffer_out0   [2:0] ),
    .buffer_out1             ( buffer_out1   [2:0] ),
    .buffer_out2             ( buffer_out2   [2:0] ),
    .buffer_out3             ( buffer_out3   [2:0] ),
    .buffer_out4             ( buffer_out4   [2:0] ),
    .buffer_out5             ( buffer_out5   [2:0] ),
    .buffer_out6             ( buffer_out6   [2:0] ),
    //.buffer_out7             ( buffer_out7   [2:0] ),
    .out_lru_flag            ( out_lru_flag  [7:0] )
);

initial
begin
    $set_toggle_region (u_LRU_buffer);
    $toggle_start();

    #5; rst = 0;
    #(PERIOD*rst_cycle-5);

    #(PERIOD*rst_cycle) rst  =  1;

    i_hit_way_8 = 8'b00100000;
    i_hit_sig = 1;
    i_addr_7 = 7'd13;
    #run_time;

    i_hit_way_8 = 8'b00000001;
    i_hit_sig = 1;
    i_addr_7 = 7'd12;
    #run_time;

    i_hit_way_8 = 8'b00000100;
    i_hit_sig = 1;
    i_addr_7 = 7'd13;
    #run_time;

    i_hit_way_8 = 8'b00000000;
    i_hit_sig = 0;
    i_addr_7 = 7'd12;
    #run_time;

    $toggle_stop;
    $toggle_report ("LRU_buffer_rtl.saif",1.0e-9,"u_LRU_buffer");

    $stop;
    $finish;
end

endmodule