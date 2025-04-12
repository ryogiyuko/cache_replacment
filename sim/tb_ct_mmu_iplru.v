`timescale  1ns / 1ps     

module tb_ct_mmu_iplru;   

// ct_mmu_iplru Parameters
parameter PERIOD      = 10;
parameter DATA_WIDTH  = 32;
parameter rst_cycle  = 30;
parameter run_time  = 10;   


// ct_mmu_iplru Inputs
reg   cp0_mmu_icg_en                       = 1 ;
reg   cpurst_b                             = 1 ;
reg   entry0_vld                           = 0 ;
reg   entry10_vld                          = 0 ;
reg   entry11_vld                          = 0 ;
reg   entry12_vld                          = 0 ;
reg   entry13_vld                          = 0 ;
reg   entry14_vld                          = 0 ;
reg   entry15_vld                          = 0 ;
reg   entry16_vld                          = 0 ;
reg   entry17_vld                          = 0 ;
reg   entry18_vld                          = 0 ;
reg   entry19_vld                          = 0 ;
reg   entry1_vld                           = 0 ;
reg   entry20_vld                          = 0 ;
reg   entry21_vld                          = 0 ;
reg   entry22_vld                          = 0 ;
reg   entry23_vld                          = 0 ;
reg   entry24_vld                          = 0 ;
reg   entry25_vld                          = 0 ;
reg   entry26_vld                          = 0 ;
reg   entry27_vld                          = 0 ;
reg   entry28_vld                          = 0 ;
reg   entry29_vld                          = 0 ;
reg   entry2_vld                           = 0 ;
reg   entry30_vld                          = 0 ;
reg   entry31_vld                          = 0 ;
reg   entry3_vld                           = 0 ;
reg   entry4_vld                           = 0 ;
reg   entry5_vld                           = 0 ;
reg   entry6_vld                           = 0 ;
reg   entry7_vld                           = 0 ;
reg   entry8_vld                           = 0 ;
reg   entry9_vld                           = 0 ;
reg   forever_cpuclk                       = 0 ;
reg   pad_yy_icg_scan_en                   = 0 ;
reg   [31:0]  utlb_plru_read_hit           = 0 ;
reg   utlb_plru_read_hit_vld               = 0 ;
reg   utlb_plru_refill_on                  = 0 ;
reg   utlb_plru_refill_vld                 = 0 ;

// ct_mmu_iplru Outputs
wire  [31:0]  plru_iutlb_ref_num           ;


initial
begin
    forever #(PERIOD/2)  forever_cpuclk=~forever_cpuclk;
end

ct_mmu_iplru  u_ct_mmu_iplru (
    .cp0_mmu_icg_en          ( cp0_mmu_icg_en                 ),
    .cpurst_b                ( cpurst_b                       ),
    .entry0_vld              ( entry0_vld                     ),
    .entry10_vld             ( entry10_vld                    ),
    .entry11_vld             ( entry11_vld                    ),
    .entry12_vld             ( entry12_vld                    ),
    .entry13_vld             ( entry13_vld                    ),
    .entry14_vld             ( entry14_vld                    ),
    .entry15_vld             ( entry15_vld                    ),
    .entry16_vld             ( entry16_vld                    ),
    .entry17_vld             ( entry17_vld                    ),
    .entry18_vld             ( entry18_vld                    ),
    .entry19_vld             ( entry19_vld                    ),
    .entry1_vld              ( entry1_vld                     ),
    .entry20_vld             ( entry20_vld                    ),
    .entry21_vld             ( entry21_vld                    ),
    .entry22_vld             ( entry22_vld                    ),
    .entry23_vld             ( entry23_vld                    ),
    .entry24_vld             ( entry24_vld                    ),
    .entry25_vld             ( entry25_vld                    ),
    .entry26_vld             ( entry26_vld                    ),
    .entry27_vld             ( entry27_vld                    ),
    .entry28_vld             ( entry28_vld                    ),
    .entry29_vld             ( entry29_vld                    ),
    .entry2_vld              ( entry2_vld                     ),
    .entry30_vld             ( entry30_vld                    ),
    .entry31_vld             ( entry31_vld                    ),
    .entry3_vld              ( entry3_vld                     ),
    .entry4_vld              ( entry4_vld                     ),
    .entry5_vld              ( entry5_vld                     ),
    .entry6_vld              ( entry6_vld                     ),
    .entry7_vld              ( entry7_vld                     ),
    .entry8_vld              ( entry8_vld                     ),
    .entry9_vld              ( entry9_vld                     ),
    .forever_cpuclk          ( forever_cpuclk                 ),
    .pad_yy_icg_scan_en      ( pad_yy_icg_scan_en             ),
    .utlb_plru_read_hit      ( utlb_plru_read_hit      [31:0] ),
    .utlb_plru_read_hit_vld  ( utlb_plru_read_hit_vld         ),
    .utlb_plru_refill_on     ( utlb_plru_refill_on            ),
    .utlb_plru_refill_vld    ( utlb_plru_refill_vld           ),

    .plru_iutlb_ref_num      ( plru_iutlb_ref_num      [31:0] )
);

integer file_ptr;
integer line_count, cnt;
reg [10000-1:0] loadstore, hit_sig;
reg [8-1:0] hit_way_8 [10000-1:0];
reg [7-1:0] addr_7 [10000-1:0];
integer mod4;


initial
begin
    $sdf_annotate("/team/asc/zhong.jingye/zhongjingye/cache_replacement/DC/xuantie_plru_40/output/ct_mmu_iplru.sdf",u_ct_mmu_iplru); 
    $vcdpluson;

    file_ptr = $fopen("/public/zjy/output/500.txt","r");

    #5; cpurst_b = 0;
    #(PERIOD*rst_cycle-5);
    #(PERIOD*rst_cycle) cpurst_b  =  1;

    $set_toggle_region (u_plru);
    $toggle_start();

    for (line_count=0; line_count<10000 ;line_count=line_count+1 ) begin
        loadstore[line_count] = 0;
        hit_sig[line_count] = 0;
        hit_way_8[line_count] = 0;
        addr_7[line_count] = 0; 
    end

    mod4 = 0;
    line_count = 0;
    {entry31_vld, entry30_vld, entry29_vld, entry28_vld,
        entry27_vld, entry26_vld, entry25_vld, entry24_vld,
        entry23_vld, entry22_vld, entry21_vld, entry20_vld,
        entry19_vld, entry18_vld, entry17_vld, entry16_vld,
        entry15_vld, entry14_vld, entry13_vld, entry12_vld,
        entry11_vld, entry10_vld, entry9_vld,  entry8_vld,
        entry7_vld,  entry6_vld,  entry5_vld,  entry4_vld,
        entry3_vld,  entry2_vld,  entry1_vld,  entry0_vld} = {DATA_WIDTH{1'b1}};
    
    while (!$feof(file_ptr)) begin 
        // 将十进制值赋给 reg 类型变量，自动转换为二进制
        $fscanf(file_ptr, "%d %d %b %d",loadstore[line_count], hit_sig[line_count], hit_way_8[line_count], addr_7[line_count]);
        $display("%d %d %b %d",loadstore[line_count], hit_sig[line_count], hit_way_8[line_count], addr_7[line_count]);
        line_count=line_count+1;
    end
    
    cnt=0;

    while (cnt<line_count) begin
        utlb_plru_read_hit = 0;
        utlb_plru_read_hit_vld = 0;

        if (mod4<3) begin
            mod4=mod4+1;
        end
        else begin
            mod4 = 0;
        end
        
        if (loadstore[cnt]) begin
            if (hit_sig[line_count]) begin
                utlb_plru_read_hit_vld = 1'b1;
                utlb_plru_read_hit[(mod4+1)*8-1-:8] = hit_way_8[line_count]; 
                #run_time;
            end
            else begin
                #run_time;
            end
        end

        cnt = cnt+1;
    end


    $toggle_stop;
    $toggle_report ("plru.saif",1.0e-9,"u_plru");

    $stop;
    $finish;
end

endmodule