module ct_mmu_iplru(
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
  i_drive_miss, i_drive_hit,o_free_miss, o_free_hit
);

// &Ports; @24             
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
  
input i_drive_miss, i_drive_hit;
output o_free_miss, o_free_hit;

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
    wire [32-1:0] w_drive_mutex_update;
    wire w_drive_update, w_free_update;

    assign w_drive_update = utlb_plru_read_hit_vld ? i_drive_hit : w_mutex_evict_driveNext;
    assign o_free_hit = utlb_plru_read_hit_vld & w_free_update;
    assign w_mutex_evict_freeNext = ~utlb_plru_read_hit_vld & w_free_update;

    genvar i;
    generate
        for ( i=0 ; i<32 ; i=i+1 ) begin:
          assign w_drive_mutex_update[i] = update_num_onehot[i] & w_drive_update;
        end
    endgenerate

    cMutexMerge2_2b_fast u_cMutex_update_40(
        .i_drive     (w_free_mutex_evict[1:0] ),
        .i_freeNext  (i_freeNext  ),
        .rst         (rst         ),
        .o_fire      (o_fire      ),
        .o_free      (o_free      ),
        .o_driveNext (o_driveNext ),
        .o_data      (o_data      )
    );
    

    
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