module plru(
  cpurst_b,
  entry0_vld,
  entry10_vld,
  entry11_vld,
  entry12_vld,
  entry13_vld,
  entry14_vld,
  entry15_vld,
  entry16_vld,
  entry17_vld,
  entry18_vld,
  entry19_vld,
  entry1_vld,
  entry20_vld,
  entry21_vld,
  entry22_vld,
  entry23_vld,
  entry24_vld,
  entry25_vld,
  entry26_vld,
  entry27_vld,
  entry28_vld,
  entry29_vld,
  entry2_vld,
  entry30_vld,
  entry31_vld,
  entry3_vld,
  entry4_vld,
  entry5_vld,
  entry6_vld,
  entry7_vld,
  entry8_vld,
  entry9_vld,
  forever_cpuclk,
  pad_yy_icg_scan_en,
  plru_iutlb_ref_num,
  utlb_plru_read_hit,
  utlb_plru_read_hit_vld,
  utlb_plru_refill_on,
  utlb_plru_refill_vld,
  i_drive_miss, i_drive_hit,o_free_miss, o_free_hit, i_freeNext_end, o_driveNext_end
);

// &Ports; @24       
  input           cpurst_b;      
  input           entry0_vld;            
  input           entry10_vld;           
  input           entry11_vld;           
  input           entry12_vld;           
  input           entry13_vld;           
  input           entry14_vld;           
  input           entry15_vld;           
  input           entry16_vld;           
  input           entry17_vld;           
  input           entry18_vld;           
  input           entry19_vld;           
  input           entry1_vld;            
  input           entry20_vld;           
  input           entry21_vld;           
  input           entry22_vld;           
  input           entry23_vld;           
  input           entry24_vld;           
  input           entry25_vld;           
  input           entry26_vld;           
  input           entry27_vld;           
  input           entry28_vld;           
  input           entry29_vld;           
  input           entry2_vld;            
  input           entry30_vld;           
  input           entry31_vld;           
  input           entry3_vld;            
  input           entry4_vld;            
  input           entry5_vld;            
  input           entry6_vld;            
  input           entry7_vld;            
  input           entry8_vld;            
  input           entry9_vld;            
  input           forever_cpuclk;        
  input           pad_yy_icg_scan_en;    
  input   [31:0]  utlb_plru_read_hit;    
  input           utlb_plru_read_hit_vld; 
  input           utlb_plru_refill_on;   
  input           utlb_plru_refill_vld;  
  output  [31:0]  plru_iutlb_ref_num;   

// &Regs; @25     
  reg             p00;                  
  reg             p10;                   
  reg             p11;                   
  reg             p20;                   
  reg             p21;                   
  reg             p22;                   
  reg             p23;                   
  reg             p30;                   
  reg             p31;                   
  reg             p32;                   
  reg             p33;                   
  reg             p34;                   
  reg             p35;                   
  reg             p36;                   
  reg             p37;                   
  reg             p40;                   
  reg             p41;                   
  reg             p42;                   
  reg             p43;                   
  reg             p44;                   
  reg             p45;                   
  reg             p46;                   
  reg             p47;                   
  reg             p48;                   
  reg             p49;                   
  reg             p4a;                   
  reg             p4b;                   
  reg             p4c;                   
  reg             p4d;                   
  reg             p4e;                   
  reg             p4f;                         
  reg     [31:0]  update_num_onehot;      
  reg     [4 :0]  write_num;             

// &Wires; @2              
  wire            entry0_vld;            
  wire            entry10_vld;           
  wire            entry11_vld;           
  wire            entry12_vld;           
  wire            entry13_vld;           
  wire            entry14_vld;           
  wire            entry15_vld;           
  wire            entry16_vld;           
  wire            entry17_vld;           
  wire            entry18_vld;           
  wire            entry19_vld;           
  wire            entry1_vld;            
  wire            entry20_vld;           
  wire            entry21_vld;           
  wire            entry22_vld;           
  wire            entry23_vld;           
  wire            entry24_vld;           
  wire            entry25_vld;           
  wire            entry26_vld;           
  wire            entry27_vld;           
  wire            entry28_vld;           
  wire            entry29_vld;           
  wire            entry2_vld;            
  wire            entry30_vld;           
  wire            entry31_vld;           
  wire            entry3_vld;            
  wire            entry4_vld;            
  wire            entry5_vld;            
  wire            entry6_vld;            
  wire            entry7_vld;            
  wire            entry8_vld;            
  wire            entry9_vld;            
  wire            forever_cpuclk;        
  wire    [31:0]  hit_num_onehot;        
  wire            lru_clk;               
  wire            lru_clk_en;            
  wire            p00_read_updt_val;     
  wire            p00_write_updt_val;    
  wire            p10_read_updt;         
  wire            p10_read_updt_val;     
  wire            p10_write_updt;        
  wire            p10_write_updt_val;    
  wire            p11_read_updt;         
  wire            p11_read_updt_val;     
  wire            p11_write_updt;        
  wire            p11_write_updt_val;    
  wire            p20_read_updt;         
  wire            p20_read_updt_val;     
  wire            p20_write_updt;        
  wire            p20_write_updt_val;    
  wire            p21_read_updt;         
  wire            p21_read_updt_val;     
  wire            p21_write_updt;        
  wire            p21_write_updt_val;    
  wire            p22_read_updt;         
  wire            p22_read_updt_val;     
  wire            p22_write_updt;        
  wire            p22_write_updt_val;    
  wire            p23_read_updt;         
  wire            p23_read_updt_val;     
  wire            p23_write_updt;        
  wire            p23_write_updt_val;    
  wire            p30_read_updt;         
  wire            p30_read_updt_val;     
  wire            p30_write_updt;        
  wire            p30_write_updt_val;    
  wire            p31_read_updt;         
  wire            p31_read_updt_val;     
  wire            p31_write_updt;        
  wire            p31_write_updt_val;    
  wire            p32_read_updt;         
  wire            p32_read_updt_val;     
  wire            p32_write_updt;        
  wire            p32_write_updt_val;    
  wire            p33_read_updt;         
  wire            p33_read_updt_val;     
  wire            p33_write_updt;        
  wire            p33_write_updt_val;    
  wire            p34_read_updt;         
  wire            p34_read_updt_val;     
  wire            p34_write_updt;        
  wire            p34_write_updt_val;    
  wire            p35_read_updt;         
  wire            p35_read_updt_val;     
  wire            p35_write_updt;        
  wire            p35_write_updt_val;    
  wire            p36_read_updt;         
  wire            p36_read_updt_val;     
  wire            p36_write_updt;        
  wire            p36_write_updt_val;    
  wire            p37_read_updt;         
  wire            p37_read_updt_val;     
  wire            p37_write_updt;        
  wire            p37_write_updt_val;    
  wire            p40_read_updt;         
  wire            p40_read_updt_val;     
  wire            p40_write_updt;        
  wire            p40_write_updt_val;    
  wire            p41_read_updt;         
  wire            p41_read_updt_val;     
  wire            p41_write_updt;        
  wire            p41_write_updt_val;    
  wire            p42_read_updt;         
  wire            p42_read_updt_val;     
  wire            p42_write_updt;        
  wire            p42_write_updt_val;    
  wire            p43_read_updt;         
  wire            p43_read_updt_val;     
  wire            p43_write_updt;        
  wire            p43_write_updt_val;    
  wire            p44_read_updt;         
  wire            p44_read_updt_val;     
  wire            p44_write_updt;        
  wire            p44_write_updt_val;    
  wire            p45_read_updt;         
  wire            p45_read_updt_val;     
  wire            p45_write_updt;        
  wire            p45_write_updt_val;    
  wire            p46_read_updt;         
  wire            p46_read_updt_val;     
  wire            p46_write_updt;        
  wire            p46_write_updt_val;    
  wire            p47_read_updt;         
  wire            p47_read_updt_val;     
  wire            p47_write_updt;        
  wire            p47_write_updt_val;    
  wire            p48_read_updt;         
  wire            p48_read_updt_val;     
  wire            p48_write_updt;        
  wire            p48_write_updt_val;    
  wire            p49_read_updt;         
  wire            p49_read_updt_val;     
  wire            p49_write_updt;        
  wire            p49_write_updt_val;    
  wire            p4a_read_updt;         
  wire            p4a_read_updt_val;     
  wire            p4a_write_updt;        
  wire            p4a_write_updt_val;    
  wire            p4b_read_updt;         
  wire            p4b_read_updt_val;     
  wire            p4b_write_updt;        
  wire            p4b_write_updt_val;    
  wire            p4c_read_updt;         
  wire            p4c_read_updt_val;     
  wire            p4c_write_updt;        
  wire            p4c_write_updt_val;    
  wire            p4d_read_updt;         
  wire            p4d_read_updt_val;     
  wire            p4d_write_updt;        
  wire            p4d_write_updt_val;    
  wire            p4e_read_updt;         
  wire            p4e_read_updt_val;     
  wire            p4e_write_updt;        
  wire            p4e_write_updt_val;    
  wire            p4f_read_updt;         
  wire            p4f_read_updt_val;     
  wire            p4f_write_updt;        
  wire            p4f_write_updt_val;    
  wire            pad_yy_icg_scan_en;    
  wire    [31:0]  plru_iutlb_ref_num;    
  wire    [4 :0]  plru_num;              
  wire            plru_read_updt;        
  wire            plru_write_updt;       
  wire    [31:0]  utlb_plru_read_hit;    //hit 哪一行
  wire            utlb_plru_read_hit_vld;//是否hit
  wire            utlb_plru_refill_on;   
  wire            utlb_plru_refill_vld;  
  wire    [31:0]  vld_entry_num; 
  
input i_drive_miss, i_drive_hit, i_freeNext_end;
output o_free_miss, o_free_hit, o_driveNext_end;

parameter DATA_WIDTH = 32;
wire  [31:0]  plru_evict_onehot, plru_hit_onehot, plru_update_onehot; 

//mutex_evict
wire [DATA_WIDTH-1:0] w_drive_mutex_evict, w_free_mutex_evict;
wire w_mutex_evict_driveNext, w_mutex_evict_freeNext;
wire [DATA_WIDTH-1:0] w_mutex_data_32;

//mutex_update

assign plru_hit_onehot = utlb_plru_read_hit;
assign plru_update_onehot = utlb_plru_read_hit_vld ? plru_hit_onehot : plru_evict_onehot;


//Entry sel for Refill
  assign vld_entry_num[31:0] = {entry31_vld, entry30_vld, entry29_vld, entry28_vld,
                                entry27_vld, entry26_vld, entry25_vld, entry24_vld,
                                entry23_vld, entry22_vld, entry21_vld, entry20_vld,
                                entry19_vld, entry18_vld, entry17_vld, entry16_vld,
                                entry15_vld, entry14_vld, entry13_vld, entry12_vld,
                                entry11_vld, entry10_vld, entry9_vld,  entry8_vld,
                                entry7_vld,  entry6_vld,  entry5_vld,  entry4_vld,
                                entry3_vld,  entry2_vld,  entry1_vld,  entry0_vld};  
  // &CombBeg; @55
  always @(*)
  begin
  casez(vld_entry_num[31:0])
    32'b???????????????????????????????0: update_num_onehot[31:0] = 32'b00000000000000000000000000000001;
    32'b??????????????????????????????01: update_num_onehot[31:0] = 32'b00000000000000000000000000000010;
    32'b?????????????????????????????011: update_num_onehot[31:0] = 32'b00000000000000000000000000000100;
    32'b????????????????????????????0111: update_num_onehot[31:0] = 32'b00000000000000000000000000001000;
    32'b???????????????????????????01111: update_num_onehot[31:0] = 32'b00000000000000000000000000010000;
    32'b??????????????????????????011111: update_num_onehot[31:0] = 32'b00000000000000000000000000100000;
    32'b?????????????????????????0111111: update_num_onehot[31:0] = 32'b00000000000000000000000001000000;
    32'b????????????????????????01111111: update_num_onehot[31:0] = 32'b00000000000000000000000010000000;
    32'b???????????????????????011111111: update_num_onehot[31:0] = 32'b00000000000000000000000100000000;
    32'b??????????????????????0111111111: update_num_onehot[31:0] = 32'b00000000000000000000001000000000;
    32'b?????????????????????01111111111: update_num_onehot[31:0] = 32'b00000000000000000000010000000000;
    32'b????????????????????011111111111: update_num_onehot[31:0] = 32'b00000000000000000000100000000000;
    32'b???????????????????0111111111111: update_num_onehot[31:0] = 32'b00000000000000000001000000000000;
    32'b??????????????????01111111111111: update_num_onehot[31:0] = 32'b00000000000000000010000000000000;
    32'b?????????????????011111111111111: update_num_onehot[31:0] = 32'b00000000000000000100000000000000;
    32'b????????????????0111111111111111: update_num_onehot[31:0] = 32'b00000000000000001000000000000000;
    32'b???????????????01111111111111111: update_num_onehot[31:0] = 32'b00000000000000010000000000000000;
    32'b??????????????011111111111111111: update_num_onehot[31:0] = 32'b00000000000000100000000000000000;
    32'b?????????????0111111111111111111: update_num_onehot[31:0] = 32'b00000000000001000000000000000000;
    32'b????????????01111111111111111111: update_num_onehot[31:0] = 32'b00000000000010000000000000000000;
    32'b???????????011111111111111111111: update_num_onehot[31:0] = 32'b00000000000100000000000000000000;
    32'b??????????0111111111111111111111: update_num_onehot[31:0] = 32'b00000000001000000000000000000000;
    32'b?????????01111111111111111111111: update_num_onehot[31:0] = 32'b00000000010000000000000000000000;
    32'b????????011111111111111111111111: update_num_onehot[31:0] = 32'b00000000100000000000000000000000;
    32'b???????0111111111111111111111111: update_num_onehot[31:0] = 32'b00000001000000000000000000000000;
    32'b??????01111111111111111111111111: update_num_onehot[31:0] = 32'b00000010000000000000000000000000;
    32'b?????011111111111111111111111111: update_num_onehot[31:0] = 32'b00000100000000000000000000000000;
    32'b????0111111111111111111111111111: update_num_onehot[31:0] = 32'b00001000000000000000000000000000;
    32'b???01111111111111111111111111111: update_num_onehot[31:0] = 32'b00010000000000000000000000000000;
    32'b??011111111111111111111111111111: update_num_onehot[31:0] = 32'b00100000000000000000000000000000;
    32'b?0111111111111111111111111111111: update_num_onehot[31:0] = 32'b01000000000000000000000000000000;
    32'b01111111111111111111111111111111: update_num_onehot[31:0] = 32'b10000000000000000000000000000000;
    32'b11111111111111111111111111111111: update_num_onehot[31:0] = plru_update_onehot;
    default:                              update_num_onehot[31:0] = 32'b0;
  endcase
  // &CombEnd; @92
  end

//Final Refill Sel to uTLB
  assign plru_iutlb_ref_num[31:0] = plru_evict_onehot[31:0];

//plru_buffer update
  
  //                  PLRU Path Flop
    //                             P00
    //                             /\
    //                            /  \
    //                           /    \
    //                         0/      \1
    //                         /        \
    //                     P10            P11
    //                      /\           /\
    //                    0/  \1       0/  \1
    //                    /    \       /    \
    //                P20     P21     P22     P23
    //               /\      /\       /\       /\
    //             0/  \1  0/  \1   0/  \1   0/  \1
    //            P30 P31  P32 P33  P34 P35  P36 P37          
    //            /\            ......            /\
    //          P40 P41         ......         P4E P4F

  //控制链
    wire w_drive_update, w_free_update;
    wire [32-1:0] w_drive_mutex_update, w_free_mutex_update;
    

    assign w_drive_update = utlb_plru_read_hit_vld ? i_drive_hit : w_mutex_evict_driveNext;
    assign o_free_hit = utlb_plru_read_hit_vld & w_free_update;
    assign w_mutex_evict_freeNext = ~utlb_plru_read_hit_vld & w_free_update;

    genvar i;
    generate
        for ( i=0 ; i<32 ; i=i+1 ) begin
          assign w_drive_mutex_update[i] = update_num_onehot[i] & w_drive_update;
        end
    endgenerate
    assign w_free_update = | w_free_mutex_update;

    //4层
      wire[16-1:0] w_mutex4_drive_mutex3, w_mutex4_free_mutex3;
      wire [16-1:0] w_mutex4_fire;
      wire [32-1:0] w_mutex4_data;
      
      //控制链
        cMutexMerge2_2b_fast u_cMutex_update_40(
            .i_drive     ( w_drive_mutex_update[1:0] ),
            .o_fire      ( w_mutex4_fire[0]      ),
            .o_free      ( w_free_mutex_update[1:0]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[0]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[0]     ),
            .o_data      ( w_mutex4_data[1:0]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_41(
            .i_drive     ( w_drive_mutex_update[3:2] ),
            .o_fire      ( w_mutex4_fire[1]      ),
            .o_free      ( w_free_mutex_update[3:2]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[1]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[1]     ),
            .o_data      ( w_mutex4_data[3:2]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_42(
            .i_drive     ( w_drive_mutex_update[5:4] ),
            .o_fire      ( w_mutex4_fire[2]      ),
            .o_free      ( w_free_mutex_update[5:4]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[2]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[2]     ),
            .o_data      ( w_mutex4_data[5:4]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_43(
            .i_drive     ( w_drive_mutex_update[7:6] ),
            .o_fire      ( w_mutex4_fire[3]      ),
            .o_free      ( w_free_mutex_update[7:6]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[3]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[3]     ),
            .o_data      ( w_mutex4_data[7:6]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_44(
            .i_drive     ( w_drive_mutex_update[9:8] ),
            .o_fire      ( w_mutex4_fire[4]      ),
            .o_free      ( w_free_mutex_update[9:8]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[4]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[4]     ),
            .o_data      ( w_mutex4_data[9:8]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_45(
            .i_drive     ( w_drive_mutex_update[11:10] ),
            .o_fire      ( w_mutex4_fire[5]      ),
            .o_free      ( w_free_mutex_update[11:10]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[5]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[5]     ),
            .o_data      ( w_mutex4_data[11:10]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_46(
            .i_drive     ( w_drive_mutex_update[13:12] ),
            .o_fire      ( w_mutex4_fire[6]      ),
            .o_free      ( w_free_mutex_update[13:12]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[6]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[6]     ),
            .o_data      ( w_mutex4_data[13:12]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_47(
            .i_drive     ( w_drive_mutex_update[15:14] ),
            .o_fire      ( w_mutex4_fire[7]      ),
            .o_free      ( w_free_mutex_update[15:14]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[7]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[7]     ),
            .o_data      ( w_mutex4_data[15:14]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_48(
            .i_drive     ( w_drive_mutex_update[17:16] ),
            .o_fire      ( w_mutex4_fire[8]      ),
            .o_free      ( w_free_mutex_update[17:16]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[8]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[8]     ),
            .o_data      ( w_mutex4_data[17:16]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_49(
            .i_drive     ( w_drive_mutex_update[19:18] ),
            .o_fire      ( w_mutex4_fire[9]      ),
            .o_free      ( w_free_mutex_update[19:18]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[9]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[9]     ),
            .o_data      ( w_mutex4_data[19:18]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_4a(
            .i_drive     ( w_drive_mutex_update[21:20] ),
            .o_fire      ( w_mutex4_fire[10]      ),
            .o_free      ( w_free_mutex_update[21:20]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[10]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[10]     ),
            .o_data      ( w_mutex4_data[21:20]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_4b(
            .i_drive     ( w_drive_mutex_update[23:22] ),
            .o_fire      ( w_mutex4_fire[11]      ),
            .o_free      ( w_free_mutex_update[23:22]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[11]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[11]     ),
            .o_data      ( w_mutex4_data[23:22]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_4c(
            .i_drive     ( w_drive_mutex_update[25:24] ),
            .o_fire      ( w_mutex4_fire[12]      ),
            .o_free      ( w_free_mutex_update[25:24]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[12]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[12]     ),
            .o_data      ( w_mutex4_data[25:24]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_4d(
            .i_drive     ( w_drive_mutex_update[27:26] ),
            .o_fire      ( w_mutex4_fire[13]      ),
            .o_free      ( w_free_mutex_update[27:26]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[13]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[13]     ),
            .o_data      ( w_mutex4_data[27:26]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_4e(
            .i_drive     ( w_drive_mutex_update[29:28] ),
            .o_fire      ( w_mutex4_fire[14]      ),
            .o_free      ( w_free_mutex_update[29:28]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[14]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[14]     ),
            .o_data      ( w_mutex4_data[29:28]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_4f(
            .i_drive     ( w_drive_mutex_update[31:30] ),
            .o_fire      ( w_mutex4_fire[15]      ),
            .o_free      ( w_free_mutex_update[31:30]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex4_drive_mutex3[15]     ),
            .i_freeNext  ( w_mutex4_free_mutex3[15]     ),
            .o_data      ( w_mutex4_data[31:30]     )
        );
      
      //寄存器
        always @(posedge w_mutex4_fire[0] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p40 <= 1'b0;
          else if(w_mutex4_data[0])
            p40 <= 1'b1;
          else if(w_mutex4_data[1])
            p40 <= 1'b0;
        end

        always @(posedge w_mutex4_fire[1] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p41 <= 1'b0;
          else if(w_mutex4_data[2])
            p41 <= 1'b1;
          else if(w_mutex4_data[3])
            p41 <= 1'b0;
        end

        always @(posedge w_mutex4_fire[2] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p42 <= 1'b0;
          else if(w_mutex4_data[4])
            p42 <= 1'b1;
          else if(w_mutex4_data[5])
            p42 <= 1'b0;
        end
        
        always @(posedge w_mutex4_fire[3] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p43 <= 1'b0;
          else if(w_mutex4_data[6])
            p43 <= 1'b1;
          else if(w_mutex4_data[7])
            p43 <= 1'b0;
        end
        always @(posedge w_mutex4_fire[4] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p44 <= 1'b0;
          else if(w_mutex4_data[8])
            p44 <= 1'b1;
          else if(w_mutex4_data[9])
            p44 <= 1'b0;
        end
        always @(posedge w_mutex4_fire[5] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p45 <= 1'b0;
          else if(w_mutex4_data[10])
            p45 <= 1'b1;
          else if(w_mutex4_data[11])
            p45 <= 1'b0;
        end
        always @(posedge w_mutex4_fire[6] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p46 <= 1'b0;
          else if(w_mutex4_data[12])
            p46 <= 1'b1;
          else if(w_mutex4_data[13])
            p46 <= 1'b0;
        end
        always @(posedge w_mutex4_fire[7] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p47 <= 1'b0;
          else if(w_mutex4_data[14])
            p47 <= 1'b1;
          else if(w_mutex4_data[15])
            p47 <= 1'b0;
        end
        always @(posedge w_mutex4_fire[8] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p48 <= 1'b0;
          else if(w_mutex4_data[16])
            p48 <= 1'b1;
          else if(w_mutex4_data[17])
            p48 <= 1'b0;
        end
        always @(posedge w_mutex4_fire[9] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p49 <= 1'b0;
          else if(w_mutex4_data[18])
            p49 <= 1'b1;
          else if(w_mutex4_data[19])
            p49 <= 1'b0;
        end
        always @(posedge w_mutex4_fire[10] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p4a <= 1'b0;
          else if(w_mutex4_data[20])
            p4a <= 1'b1;
          else if(w_mutex4_data[21])
            p4a <= 1'b0;
        end
        always @(posedge w_mutex4_fire[11] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p4b <= 1'b0;
          else if(w_mutex4_data[22])
            p4b <= 1'b1;
          else if(w_mutex4_data[23])
            p4b <= 1'b0;
        end
        always @(posedge w_mutex4_fire[12] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p4c <= 1'b0;
          else if(w_mutex4_data[24])
            p4c <= 1'b1;
          else if(w_mutex4_data[25])
            p4c <= 1'b0;
        end
        always @(posedge w_mutex4_fire[13] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p4d <= 1'b0;
          else if(w_mutex4_data[26])
            p4d <= 1'b1;
          else if(w_mutex4_data[27])
            p4d <= 1'b0;
        end
        always @(posedge w_mutex4_fire[14] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p4e <= 1'b0;
          else if(w_mutex4_data[28])
            p4e <= 1'b1;
          else if(w_mutex4_data[29])
            p4e <= 1'b0;
        end
        always @(posedge w_mutex4_fire[15] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p4f <= 1'b0;
          else if(w_mutex4_data[30])
            p4f <= 1'b1;
          else if(w_mutex4_data[31])
            p4f <= 1'b0;
        end
    
    //3层
      wire [8-1:0] w_mutex3_drive_mutex2, w_mutex3_free_mutex2;
      wire [8-1:0] w_mutex3_fire;
      wire [16-1:0] w_mutex3_data;

      //control
        cMutexMerge2_2b_fast u_cMutex_update_30(
            .i_drive     ( w_mutex4_drive_mutex3[1:0] ),
            .o_fire      ( w_mutex3_fire[0]      ),
            .o_free      ( w_mutex4_free_mutex3[1:0]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[0]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[0]     ),
            .o_data      ( w_mutex3_data[1:0]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_31(
            .i_drive     ( w_mutex4_drive_mutex3[3:2] ),
            .o_fire      ( w_mutex3_fire[1]      ),
            .o_free      ( w_mutex4_free_mutex3[3:2]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[1]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[1]     ),
            .o_data      ( w_mutex3_data[3:2]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_32(
            .i_drive     ( w_mutex4_drive_mutex3[5:4] ),
            .o_fire      ( w_mutex3_fire[2]      ),
            .o_free      ( w_mutex4_free_mutex3[5:4]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[2]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[2]     ),
            .o_data      ( w_mutex3_data[5:4]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_33(
            .i_drive     ( w_mutex4_drive_mutex3[7:6] ),
            .o_fire      ( w_mutex3_fire[3]      ),
            .o_free      ( w_mutex4_free_mutex3[7:6]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[3]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[3]     ),
            .o_data      ( w_mutex3_data[7:6]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_34(
            .i_drive     ( w_mutex4_drive_mutex3[9:8] ),
            .o_fire      ( w_mutex3_fire[4]      ),
            .o_free      ( w_mutex4_free_mutex3[9:8]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[4]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[4]     ),
            .o_data      ( w_mutex3_data[9:8]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_35(
            .i_drive     ( w_mutex4_drive_mutex3[11:10] ),
            .o_fire      ( w_mutex3_fire[5]      ),
            .o_free      ( w_mutex4_free_mutex3[11:10]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[5]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[5]     ),
            .o_data      ( w_mutex3_data[11:10]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_36(
            .i_drive     ( w_mutex4_drive_mutex3[13:12] ),
            .o_fire      ( w_mutex3_fire[6]      ),
            .o_free      ( w_mutex4_free_mutex3[13:12]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[6]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[6]     ),
            .o_data      ( w_mutex3_data[13:12]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_37(
            .i_drive     ( w_mutex4_drive_mutex3[15:14] ),
            .o_fire      ( w_mutex3_fire[7]      ),
            .o_free      ( w_mutex4_free_mutex3[15:14]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex3_drive_mutex2[7]     ),
            .i_freeNext  ( w_mutex3_free_mutex2[7]     ),
            .o_data      ( w_mutex3_data[15:14]     )
        );
      
      //flip flop
        always @(posedge w_mutex3_fire[0] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p30 <= 1'b0;
          else if(w_mutex3_data[0])
            p30 <= 1'b1;
          else if(w_mutex3_data[1])
            p30 <= 1'b0;
        end

        always @(posedge w_mutex3_fire[1] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p31 <= 1'b0;
          else if(w_mutex3_data[2])
            p31 <= 1'b1;
          else if(w_mutex3_data[3])
            p31 <= 1'b0;
        end

        always @(posedge w_mutex3_fire[2] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p32 <= 1'b0;
          else if(w_mutex3_data[4])
            p32 <= 1'b1;
          else if(w_mutex3_data[5])
            p32 <= 1'b0;
        end
        
        always @(posedge w_mutex3_fire[3] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p33 <= 1'b0;
          else if(w_mutex3_data[6])
            p33 <= 1'b1;
          else if(w_mutex3_data[7])
            p33 <= 1'b0;
        end
        always @(posedge w_mutex3_fire[4] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p34 <= 1'b0;
          else if(w_mutex3_data[8])
            p34 <= 1'b1;
          else if(w_mutex3_data[9])
            p34 <= 1'b0;
        end
        always @(posedge w_mutex3_fire[5] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p35 <= 1'b0;
          else if(w_mutex3_data[10])
            p35 <= 1'b1;
          else if(w_mutex3_data[11])
            p35 <= 1'b0;
        end
        always @(posedge w_mutex3_fire[6] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p36 <= 1'b0;
          else if(w_mutex3_data[12])
            p36 <= 1'b1;
          else if(w_mutex3_data[13])
            p36 <= 1'b0;
        end
        always @(posedge w_mutex3_fire[7] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p37 <= 1'b0;
          else if(w_mutex3_data[14])
            p37 <= 1'b1;
          else if(w_mutex3_data[15])
            p37 <= 1'b0;
        end

    //2层
      wire [4-1:0] w_mutex2_drive_mutex1, w_mutex2_free_mutex1;
      wire [4-1:0] w_mutex2_fire;
      wire [8-1:0] w_mutex2_data;
      
      //control
        cMutexMerge2_2b_fast u_cMutex_update_20(
            .i_drive     ( w_mutex3_drive_mutex2[1:0] ),
            .o_fire      ( w_mutex2_fire[0]      ),
            .o_free      ( w_mutex3_free_mutex2[1:0]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex2_drive_mutex1[0]     ),
            .i_freeNext  ( w_mutex2_free_mutex1[0]     ),
            .o_data      ( w_mutex2_data[1:0]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_21(
            .i_drive     ( w_mutex3_drive_mutex2[3:2] ),
            .o_fire      ( w_mutex2_fire[1]      ),
            .o_free      ( w_mutex3_free_mutex2[3:2]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex2_drive_mutex1[1]     ),
            .i_freeNext  ( w_mutex2_free_mutex1[1]     ),
            .o_data      ( w_mutex2_data[3:2]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_22(
            .i_drive     ( w_mutex3_drive_mutex2[5:4] ),
            .o_fire      ( w_mutex2_fire[2]      ),
            .o_free      ( w_mutex3_free_mutex2[5:4]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex2_drive_mutex1[2]     ),
            .i_freeNext  ( w_mutex2_free_mutex1[2]     ),
            .o_data      ( w_mutex2_data[5:4]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_23(
            .i_drive     ( w_mutex3_drive_mutex2[7:6] ),
            .o_fire      ( w_mutex2_fire[3]      ),
            .o_free      ( w_mutex3_free_mutex2[7:6]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex2_drive_mutex1[3]     ),
            .i_freeNext  ( w_mutex2_free_mutex1[3]     ),
            .o_data      ( w_mutex2_data[7:6]     )
        );
      
      //flip flop
        always @(posedge w_mutex2_fire[0] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p20 <= 1'b0;
          else if(w_mutex2_data[0])
            p20 <= 1'b1;
          else if(w_mutex2_data[1])
            p20 <= 1'b0;
        end

        always @(posedge w_mutex2_fire[1] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p21 <= 1'b0;
          else if(w_mutex2_data[2])
            p21 <= 1'b1;
          else if(w_mutex2_data[3])
            p21 <= 1'b0;
        end

        always @(posedge w_mutex2_fire[2] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p22 <= 1'b0;
          else if(w_mutex2_data[4])
            p22 <= 1'b1;
          else if(w_mutex2_data[5])
            p22 <= 1'b0;
        end
        
        always @(posedge w_mutex2_fire[3] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p23 <= 1'b0;
          else if(w_mutex2_data[6])
            p23 <= 1'b1;
          else if(w_mutex2_data[7])
            p23 <= 1'b0;
        end 
      
    //1层
      wire [2-1:0] w_mutex1_drive_mutex0, w_mutex1_free_mutex0;
      wire [2-1:0] w_mutex1_fire;
      wire [4-1:0] w_mutex1_data;

      //control
        cMutexMerge2_2b_fast u_cMutex_update_10(
            .i_drive     ( w_mutex2_drive_mutex1[1:0] ),
            .o_fire      ( w_mutex1_fire[0]      ),
            .o_free      ( w_mutex2_free_mutex1[1:0]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex1_drive_mutex0[0]     ),
            .i_freeNext  ( w_mutex1_free_mutex0[0]     ),
            .o_data      ( w_mutex1_data[1:0]     )
        );
        cMutexMerge2_2b_fast u_cMutex_update_11(
            .i_drive     ( w_mutex2_drive_mutex1[3:2] ),
            .o_fire      ( w_mutex1_fire[1]      ),
            .o_free      ( w_mutex2_free_mutex1[3:2]      ),
            .rst         ( rst         ),
            .o_driveNext ( w_mutex1_drive_mutex0[1]     ),
            .i_freeNext  ( w_mutex1_free_mutex0[1]     ),
            .o_data      ( w_mutex1_data[3:2]     )
        );
      
      //flip flop
        always @(posedge w_mutex1_fire[0] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p10 <= 1'b0;
          else if(w_mutex1_data[0])
            p10 <= 1'b1;
          else if(w_mutex1_data[1])
            p10 <= 1'b0;
        end

        always @(posedge w_mutex1_fire[1] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p11 <= 1'b0;
          else if(w_mutex1_data[2])
            p11 <= 1'b1;
          else if(w_mutex1_data[3])
            p11 <= 1'b0;
        end

    //0层
      //wire w_mutex0_drive_end, w_mutex0_free_end;
      wire w_mutex0_fire;
      wire [2-1:0] w_mutex0_data;
      
      //control
        cMutexMerge2_2b_fast u_cMutex_update_00(
            .i_drive     ( w_mutex1_drive_mutex0[1:0] ),
            .o_fire      ( w_mutex0_fire      ),
            .o_free      ( w_mutex1_free_mutex0[1:0]      ),
            .rst         ( rst         ),
            .o_driveNext ( o_driveNext_end     ),
            .i_freeNext  ( i_freeNext_end     ),
            .o_data      ( w_mutex0_data[1:0]     )
        );
      
      //flip flop
        always @(posedge w_mutex0_fire or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p00 <= 1'b0;
          else if(w_mutex0_data[0])
            p00 <= 1'b1;
          else if(w_mutex0_data[1])
            p00 <= 1'b0;
        end

        

//----------------------------------------------------------
//                  uTLB Replacement Algorithm
//----------------------------------------------------------
    
  //控制链
    
    //事件
      wire w_p00_driveNext0,w_p00_driveNext1;
    
      wire w_p10_driveNext0,w_p10_driveNext1, w_p11_driveNext0,w_p11_driveNext1;

      wire w_p20_driveNext0,w_p20_driveNext1, w_p21_driveNext0,w_p21_driveNext1, w_p22_driveNext0,w_p22_driveNext1, w_p23_driveNext0,w_p23_driveNext1;
      
      wire w_p30_driveNext0,w_p30_driveNext1, w_p31_driveNext0,w_p31_driveNext1, w_p32_driveNext0,w_p32_driveNext1, w_p33_driveNext0,w_p33_driveNext1;
      wire w_p34_driveNext0,w_p34_driveNext1, w_p35_driveNext0,w_p35_driveNext1, w_p36_driveNext0,w_p36_driveNext1, w_p37_driveNext0,w_p37_driveNext1;

      wire w_p40_driveNext0,w_p40_driveNext1, w_p41_driveNext0,w_p41_driveNext1, w_p42_driveNext0,w_p42_driveNext1, w_p43_driveNext0,w_p43_driveNext1;
      wire w_p44_driveNext0,w_p44_driveNext1, w_p45_driveNext0,w_p45_driveNext1, w_p46_driveNext0,w_p46_driveNext1, w_p47_driveNext0,w_p47_driveNext1;
      wire w_p48_driveNext0,w_p48_driveNext1, w_p49_driveNext0,w_p49_driveNext1, w_p4a_driveNext0,w_p4a_driveNext1, w_p4b_driveNext0,w_p4b_driveNext1;
      wire w_p4c_driveNext0,w_p4c_cdriveNext1, w_p4d_driveNext0,w_p4d_driveNext1, w_p4e_driveNext0,w_p4e_driveNext1, w_p4f_driveNext0,w_p4f_driveNext1;

      //虽然事件也会随着plru树的变化改变结果，但仅有寄存器的电平翻转，其他的元件直到事件来才会发生改变
      assign w_p00_driveNext0 = i_drive_miss & ~p00;assign w_p00_driveNext1 = i_drive_miss & p00;
      
      assign w_p10_driveNext0 = w_p00_driveNext0 & ~p10;assign w_p10_driveNext1 = w_p00_driveNext0 & p10;
      assign w_p11_driveNext0 = w_p00_driveNext1 & ~p11;assign w_p11_driveNext1 = w_p00_driveNext1 & p11;

      assign w_p20_driveNext0 = w_p10_driveNext0 & ~p20;assign w_p20_driveNext1 = w_p10_driveNext0 & p20;
      assign w_p21_driveNext0 = w_p10_driveNext1 & ~p21;assign w_p21_driveNext1 = w_p10_driveNext1 & p21;
      assign w_p22_driveNext0 = w_p11_driveNext0 & ~p22;assign w_p22_driveNext1 = w_p11_driveNext0 & p22;
      assign w_p23_driveNext0 = w_p11_driveNext1 & ~p23;assign w_p23_driveNext1 = w_p11_driveNext1 & p23;
      
      
      assign w_p30_driveNext0 = w_p20_driveNext0 & ~p30;assign w_p30_driveNext1 = w_p20_driveNext0 & p30;
      assign w_p31_driveNext0 = w_p20_driveNext1 & ~p31;assign w_p31_driveNext1 = w_p20_driveNext1 & p31;
      assign w_p32_driveNext0 = w_p21_driveNext0 & ~p32;assign w_p32_driveNext1 = w_p21_driveNext0 & p32;
      assign w_p33_driveNext0 = w_p21_driveNext1 & ~p33;assign w_p33_driveNext1 = w_p21_driveNext1 & p33;
      assign w_p34_driveNext0 = w_p22_driveNext0 & ~p34;assign w_p34_driveNext1 = w_p22_driveNext0 & p34;
      assign w_p35_driveNext0 = w_p22_driveNext1 & ~p35;assign w_p35_driveNext1 = w_p22_driveNext1 & p35;
      assign w_p36_driveNext0 = w_p23_driveNext0 & ~p36;assign w_p36_driveNext1 = w_p23_driveNext0 & p36;
      assign w_p37_driveNext0 = w_p23_driveNext1 & ~p37;assign w_p37_driveNext1 = w_p23_driveNext1 & p37;

      assign w_p40_driveNext0 = w_p30_driveNext0 & ~p40;assign w_p40_driveNext1 = w_p30_driveNext0 & p40;
      assign w_p41_driveNext0 = w_p30_driveNext1 & ~p41;assign w_p41_driveNext1 = w_p30_driveNext1 & p41;
      assign w_p42_driveNext0 = w_p31_driveNext0 & ~p42;assign w_p42_driveNext1 = w_p31_driveNext0 & p42;
      assign w_p43_driveNext0 = w_p31_driveNext1 & ~p43;assign w_p43_driveNext1 = w_p31_driveNext1 & p43;
      assign w_p44_driveNext0 = w_p32_driveNext0 & ~p44;assign w_p44_driveNext1 = w_p32_driveNext0 & p44;
      assign w_p45_driveNext0 = w_p32_driveNext1 & ~p45;assign w_p45_driveNext1 = w_p32_driveNext1 & p45;
      assign w_p46_driveNext0 = w_p33_driveNext0 & ~p46;assign w_p46_driveNext1 = w_p33_driveNext0 & p46;
      assign w_p47_driveNext0 = w_p33_driveNext1 & ~p47;assign w_p47_driveNext1 = w_p33_driveNext1 & p47;

      assign w_p48_driveNext0 = w_p34_driveNext0 & ~p48;assign w_p48_driveNext1 = w_p34_driveNext0 & p48;
      assign w_p49_driveNext0 = w_p34_driveNext1 & ~p49;assign w_p49_driveNext1 = w_p34_driveNext1 & p49;
      assign w_p4a_driveNext0 = w_p35_driveNext0 & ~p4a;assign w_p4a_driveNext1 = w_p35_driveNext0 & p4a;
      assign w_p4b_driveNext0 = w_p35_driveNext1 & ~p4b;assign w_p4b_driveNext1 = w_p35_driveNext1 & p4b;
      assign w_p4c_driveNext0 = w_p36_driveNext0 & ~p4c;assign w_p4c_driveNext1 = w_p36_driveNext0 & p4c;
      assign w_p4d_driveNext0 = w_p36_driveNext1 & ~p4d;assign w_p4d_driveNext1 = w_p36_driveNext1 & p4d;
      assign w_p4e_driveNext0 = w_p37_driveNext0 & ~p4e;assign w_p4e_driveNext1 = w_p37_driveNext0 & p4e;
      assign w_p4f_driveNext0 = w_p37_driveNext1 & ~p4f;assign w_p4f_driveNext1 = w_p37_driveNext1 & p4f;

      assign w_drive_mutex_evict = {
        w_p4f_driveNext1, w_p4f_driveNext0,
        w_p4e_driveNext1, w_p4e_driveNext0,
        w_p4d_driveNext1, w_p4d_driveNext0,
        w_p4c_cdriveNext1, w_p4c_driveNext0,
        w_p4b_driveNext1, w_p4b_driveNext0,
        w_p4a_driveNext1, w_p4a_driveNext0,
        w_p49_driveNext1, w_p49_driveNext0,
        w_p48_driveNext1, w_p48_driveNext0,
        w_p47_driveNext1, w_p47_driveNext0,
        w_p46_driveNext1, w_p46_driveNext0,
        w_p45_driveNext1, w_p45_driveNext0,
        w_p44_driveNext1, w_p44_driveNext0,
        w_p43_driveNext1, w_p43_driveNext0,
        w_p42_driveNext1, w_p42_driveNext0,
        w_p41_driveNext1, w_p41_driveNext0,
        w_p40_driveNext1, w_p40_driveNext0
        };  
    //mutex1
      cMutexMerge32_32b u_cMutex_evict(
          .i_drive     (w_drive_mutex_evict     ),
          .i_freeNext  (w_mutex_evict_freeNext  ),
          .rst         (rst         ),
          .o_free      (w_free_mutex_evict ),
          .o_driveNext (w_mutex_evict_driveNext ),
          .o_data      (w_mutex_data_32  ) //由contap的req组成
      );

      assign plru_evict_onehot = w_mutex_data_32;
      assign o_free_miss = | w_free_mutex_evict;
        

endmodule