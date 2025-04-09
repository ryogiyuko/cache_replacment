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
    .clk                     ( clk  &  i_lru_write_enable          ),
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

integer file_ptr;
integer line_count, cnt;
reg [10000-1:0] loadstore, hit_sig;
reg [8-1:0] hit_way_8 [10000-1:0];
reg [7-1:0] addr_7 [10000-1:0];

initial
begin
    $sdf_annotate("/team/asc/zhong.jingye/zhongjingye/cache_replacement/DC/lru_buffer_40/output/LRU_buffer.sdf",u_LRU_buffer); 
    
    $vcdpluson;

    file_ptr = $fopen("/public/zjy/output/500.txt","r");

    #5; rst = 0;
    #(PERIOD*rst_cycle-5);
    #(PERIOD*rst_cycle) rst  =  1;

    $set_toggle_region (u_LRU_buffer);
    $toggle_start();

    for (line_count=0; line_count<10000 ;line_count=line_count+1 ) begin
        loadstore[line_count] = 0;
        hit_sig[line_count] = 0;
        hit_way_8[line_count] = 0;
        addr_7[line_count] = 0; 
    end

    line_count = 0;
    while (!$feof(file_ptr)) begin
        // 将十进制值赋给 reg 类型变量，自动转换为二进制
        $fscanf(file_ptr, "%d %d %b %d",loadstore[line_count], hit_sig[line_count], hit_way_8[line_count], addr_7[line_count]);
        $display("%d %d %b %d",loadstore[line_count], hit_sig[line_count], hit_way_8[line_count], addr_7[line_count]);
        line_count=line_count+1;
    end


    cnt=0;

    while (cnt<line_count) begin
        i_lru_write_enable =  loadstore[cnt]; 
        i_hit_sig = hit_sig[cnt]; 
        i_addr_7 = addr_7[cnt];
        if (i_lru_write_enable) begin
            i_hit_way_8 = hit_way_8[cnt];
            // i_addr_7 = addr_7[cnt];
            #run_time;
        end
        

        cnt=cnt+1;     
    end

    $toggle_stop;
    $toggle_report ("LRU_buffer_rtl.saif",1.0e-9,"u_LRU_buffer");

    $stop;
    $finish;
end

endmodule