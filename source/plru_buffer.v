module plru_buffer(
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
  i_drive_miss, i_drive_hit,o_free_miss, o_free_hit, i_freeNext_end, o_driveNext_end,
  addr
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
  input   [7-1:0]addr;  
  output  [31:0]  plru_iutlb_ref_num;   

// &Regs; @25  
  parameter       BUFFER_DEEPTH = 128;
  reg     [BUFFER_DEEPTH-1:0]     p00;                  
  reg     [BUFFER_DEEPTH-1:0]     p10;                   
  reg     [BUFFER_DEEPTH-1:0]     p11;                   
  reg     [BUFFER_DEEPTH-1:0]     p20;                   
  reg     [BUFFER_DEEPTH-1:0]     p21;                   
  reg     [BUFFER_DEEPTH-1:0]     p22;                   
  reg     [BUFFER_DEEPTH-1:0]     p23;                   
  reg     [BUFFER_DEEPTH-1:0]     p30;                   
  reg     [BUFFER_DEEPTH-1:0]     p31;                   
  reg     [BUFFER_DEEPTH-1:0]     p32;                   
  reg     [BUFFER_DEEPTH-1:0]     p33;                   
  reg     [BUFFER_DEEPTH-1:0]     p34;                   
  reg     [BUFFER_DEEPTH-1:0]     p35;                   
  reg     [BUFFER_DEEPTH-1:0]     p36;                   
  reg     [BUFFER_DEEPTH-1:0]     p37;                   
  reg     [BUFFER_DEEPTH-1:0]     p40;                   
  reg     [BUFFER_DEEPTH-1:0]     p41;                   
  reg     [BUFFER_DEEPTH-1:0]     p42;                   
  reg     [BUFFER_DEEPTH-1:0]     p43;                   
  reg     [BUFFER_DEEPTH-1:0]     p44;                   
  reg     [BUFFER_DEEPTH-1:0]     p45;                   
  reg     [BUFFER_DEEPTH-1:0]     p46;                   
  reg     [BUFFER_DEEPTH-1:0]     p47;                   
  reg     [BUFFER_DEEPTH-1:0]     p48;                   
  reg     [BUFFER_DEEPTH-1:0]     p49;                   
  reg     [BUFFER_DEEPTH-1:0]     p4a;                   
  reg     [BUFFER_DEEPTH-1:0]     p4b;                   
  reg     [BUFFER_DEEPTH-1:0]     p4c;                   
  reg     [BUFFER_DEEPTH-1:0]     p4d;                   
  reg     [BUFFER_DEEPTH-1:0]     p4e;                   
  reg     [BUFFER_DEEPTH-1:0]     p4f;                         
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
    assign w_free_update = i_freeNext_end;

    wire [16-1:0] w_dff4_fire;
    wire [16-1:0] w_dff3_update;
    wire [8-1:0] w_dff3_fire;
    wire [8-1:0] w_dff2_update;
    wire [4-1:0] w_dff2_fire;
    wire [4-1:0] w_dff1_update;
    wire [1:0] w_dff1_fire;
    wire [1:0] w_dff0_update;
    wire w_dff0_fire;

    genvar i,j,k;
    generate
        for ( i=0 ; i<32 ; i=i+1 ) begin:four
          assign w_drive_mutex_update[i] = update_num_onehot[i] & w_drive_update;
        end
        for ( j=0 ; j<16; j=j+1 ) begin:three
          assign w_dff4_fire[j] = w_drive_mutex_update[2*j] | w_drive_mutex_update[2*j+1];
          assign w_dff3_update[j] = update_num_onehot[2*j] | update_num_onehot[2*j+1];
        end
        for ( k=0 ; k<8; k=k+1 ) begin:two
          assign w_dff3_fire[k] = w_dff4_fire[2*k] | w_dff4_fire[2*k+1];
          assign w_dff2_update[k] = w_dff3_update[2*k] | w_dff3_update[2*k+1];
        end
    endgenerate

    assign w_dff2_fire[0] = w_dff3_fire[0] | w_dff3_fire[1];
    assign w_dff2_fire[1] = w_dff3_fire[2] | w_dff3_fire[3];
    assign w_dff2_fire[2] = w_dff3_fire[4] | w_dff3_fire[5];
    assign w_dff2_fire[3] = w_dff3_fire[6] | w_dff3_fire[7];
    assign w_dff1_update[0] = w_dff2_update[0] | w_dff2_update[1];
    assign w_dff1_update[1] = w_dff2_update[2] | w_dff2_update[3];
    assign w_dff1_update[2] = w_dff2_update[4] | w_dff2_update[5];
    assign w_dff1_update[3] = w_dff2_update[6] | w_dff2_update[7];
    assign w_dff1_fire[0] = w_dff2_fire[0] | w_dff2_fire[1];
    assign w_dff1_fire[1] = w_dff2_fire[2] | w_dff2_fire[3];
    assign w_dff0_update[0] = w_dff1_update[0] | w_dff1_update[1];
    assign w_dff0_update[1] = w_dff1_update[0] | w_dff1_update[1];
    assign w_dff0_fire = w_dff1_fire[0] | w_dff1_fire[1];
    
    assign o_driveNext_end = w_dff0_fire;
    //assign w_free_update = | w_free_mutex_update;

    //4层 寄存器
      always @(posedge w_dff4_fire[0] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p40[addr] <= 1'b0;
        else if(update_num_onehot[0])
          p40[addr] <= 1'b1;
        else if(update_num_onehot[1])
          p40[addr] <= 1'b0;
      end

      always @(posedge w_dff4_fire[1] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p41[addr] <= 1'b0;
        else if(update_num_onehot[2])
          p41[addr] <= 1'b1;
        else if(update_num_onehot[3])
          p41[addr] <= 1'b0;
      end

      always @(posedge w_dff4_fire[2] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p42[addr] <= 1'b0;
        else if(update_num_onehot[4])
          p42[addr] <= 1'b1;
        else if(update_num_onehot[5])
          p42[addr] <= 1'b0;
      end
      
      always @(posedge w_dff4_fire[3] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p43[addr] <= 1'b0;
        else if(update_num_onehot[6])
          p43[addr] <= 1'b1;
        else if(update_num_onehot[7])
          p43[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[4] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p44[addr] <= 1'b0;
        else if(update_num_onehot[8])
          p44[addr] <= 1'b1;
        else if(update_num_onehot[9])
          p44[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[5] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p45[addr] <= 1'b0;
        else if(update_num_onehot[10])
          p45[addr] <= 1'b1;
        else if(update_num_onehot[11])
          p45[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[6] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p46[addr] <= 1'b0;
        else if(update_num_onehot[12])
          p46[addr] <= 1'b1;
        else if(update_num_onehot[13])
          p46[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[7] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p47[addr] <= 1'b0;
        else if(update_num_onehot[14])
          p47[addr] <= 1'b1;
        else if(update_num_onehot[15])
          p47[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[8] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p48[addr] <= 1'b0;
        else if(update_num_onehot[16])
          p48[addr] <= 1'b1;
        else if(update_num_onehot[17])
          p48[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[9] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p49[addr] <= 1'b0;
        else if(update_num_onehot[18])
          p49[addr] <= 1'b1;
        else if(update_num_onehot[19])
          p49[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[10] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p4a[addr] <= 1'b0;
        else if(update_num_onehot[20])
          p4a[addr] <= 1'b1;
        else if(update_num_onehot[21])
          p4a[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[11] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p4b[addr] <= 1'b0;
        else if(update_num_onehot[22])
          p4b[addr] <= 1'b1;
        else if(update_num_onehot[23])
          p4b[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[12] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p4c[addr] <= 1'b0;
        else if(update_num_onehot[24])
          p4c[addr] <= 1'b1;
        else if(update_num_onehot[25])
          p4c[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[13] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p4d[addr] <= 1'b0;
        else if(update_num_onehot[26])
          p4d[addr] <= 1'b1;
        else if(update_num_onehot[27])
          p4d[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[14] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p4e[addr] <= 1'b0;
        else if(update_num_onehot[28])
          p4e[addr] <= 1'b1;
        else if(update_num_onehot[29])
          p4e[addr] <= 1'b0;
      end
      always @(posedge w_dff4_fire[15] or negedge cpurst_b)
      begin
        if(!cpurst_b)
          p4f[addr] <= 1'b0;
        else if(update_num_onehot[30])
          p4f[addr] <= 1'b1;
        else if(update_num_onehot[31])
          p4f[addr] <= 1'b0;
      end
    //3层 flip flop
        always @(posedge w_dff3_fire[0] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p30[addr] <= 1'b0;
          else if(w_dff3_update[0])
            p30[addr] <= 1'b1;
          else if(w_dff3_update[1])
            p30[addr] <= 1'b0;
        end

        always @(posedge w_dff3_fire[1] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p31[addr] <= 1'b0;
          else if(w_dff3_update[2])
            p31[addr] <= 1'b1;
          else if(w_dff3_update[3])
            p31[addr] <= 1'b0;
        end

        always @(posedge w_dff3_fire[2] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p32[addr] <= 1'b0;
          else if(w_dff3_update[4])
            p32[addr] <= 1'b1;
          else if(w_dff3_update[5])
            p32[addr] <= 1'b0;
        end
        
        always @(posedge w_dff3_fire[3] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p33[addr] <= 1'b0;
          else if(w_dff3_update[6])
            p33[addr] <= 1'b1;
          else if(w_dff3_update[7])
            p33[addr] <= 1'b0;
        end
        always @(posedge w_dff3_fire[4] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p34[addr] <= 1'b0;
          else if(w_dff3_update[8])
            p34[addr] <= 1'b1;
          else if(w_dff3_update[9])
            p34[addr] <= 1'b0;
        end
        always @(posedge w_dff3_fire[5] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p35[addr] <= 1'b0;
          else if(w_dff3_update[10])
            p35[addr] <= 1'b1;
          else if(w_dff3_update[11])
            p35[addr] <= 1'b0;
        end
        always @(posedge w_dff3_fire[6] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p36[addr] <= 1'b0;
          else if(w_dff3_update[12])
            p36[addr] <= 1'b1;
          else if(w_dff3_update[13])
            p36[addr] <= 1'b0;
        end
        always @(posedge w_dff3_fire[7] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p37[addr] <= 1'b0;
          else if(w_dff3_update[14])
            p37[addr] <= 1'b1;
          else if(w_dff3_update[15])
            p37[addr] <= 1'b0;
        end
    //2层 flip flop
        always @(posedge w_dff2_fire[0] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p20[addr] <= 1'b0;
          else if(w_dff2_update[0])
            p20[addr] <= 1'b1;
          else if(w_dff2_update[1])
            p20[addr] <= 1'b0;
        end

        always @(posedge w_dff2_fire[1] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p21[addr] <= 1'b0;
          else if(w_dff2_update[2])
            p21[addr] <= 1'b1;
          else if(w_dff2_update[3])
            p21[addr] <= 1'b0;
        end

        always @(posedge w_dff2_fire[2] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p22[addr] <= 1'b0;
          else if(w_dff2_update[4])
            p22[addr] <= 1'b1;
          else if(w_dff2_update[5])
            p22[addr] <= 1'b0;
        end
        
        always @(posedge w_dff2_fire[3] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p23[addr] <= 1'b0;
          else if(w_dff2_update[6])
            p23[addr] <= 1'b1;
          else if(w_dff2_update[7])
            p23[addr] <= 1'b0;
        end 
    //1层 flip flop
        always @(posedge w_dff1_fire[0] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p10[addr] <= 1'b0;
          else if(w_dff1_update[0])
            p10[addr] <= 1'b1;
          else if(w_dff1_update[1])
            p10[addr] <= 1'b0;
        end

        always @(posedge w_dff1_fire[1] or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p11[addr] <= 1'b0;
          else if(w_dff1_update[2])
            p11[addr] <= 1'b1;
          else if(w_dff1_update[3])
            p11[addr] <= 1'b0;
        end
    //0层 flip flop
        always @(posedge w_dff0_fire or negedge cpurst_b)
        begin
          if(!cpurst_b)
            p00[addr] <= 1'b0;
          else if(w_dff0_update[0])
            p00[addr] <= 1'b1;
          else if(w_dff0_update[1])
            p00[addr] <= 1'b0;
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
      wire w_p4c_driveNext0,w_p4c_driveNext1, w_p4d_driveNext0,w_p4d_driveNext1, w_p4e_driveNext0,w_p4e_driveNext1, w_p4f_driveNext0,w_p4f_driveNext1;

      //虽然事件也会随着plru树的变化改变结果，但仅有寄存器的电平翻转，其他的元件直到事件来才会发生改变
      assign w_p00_driveNext0 = i_drive_miss & ~p00[addr];assign w_p00_driveNext1 = i_drive_miss & p00[addr];
      
      assign w_p10_driveNext0 = w_p00_driveNext0 & ~p10[addr];assign w_p10_driveNext1 = w_p00_driveNext0 & p10[addr];
      assign w_p11_driveNext0 = w_p00_driveNext1 & ~p11[addr];assign w_p11_driveNext1 = w_p00_driveNext1 & p11[addr];

      assign w_p20_driveNext0 = w_p10_driveNext0 & ~p20[addr];assign w_p20_driveNext1 = w_p10_driveNext0 & p20[addr];
      assign w_p21_driveNext0 = w_p10_driveNext1 & ~p21[addr];assign w_p21_driveNext1 = w_p10_driveNext1 & p21[addr];
      assign w_p22_driveNext0 = w_p11_driveNext0 & ~p22[addr];assign w_p22_driveNext1 = w_p11_driveNext0 & p22[addr];
      assign w_p23_driveNext0 = w_p11_driveNext1 & ~p23[addr];assign w_p23_driveNext1 = w_p11_driveNext1 & p23[addr];

      assign w_p30_driveNext0 = w_p20_driveNext0 & ~p30[addr];assign w_p30_driveNext1 = w_p20_driveNext0 & p30[addr];
      assign w_p31_driveNext0 = w_p20_driveNext1 & ~p31[addr];assign w_p31_driveNext1 = w_p20_driveNext1 & p31[addr];
      assign w_p32_driveNext0 = w_p21_driveNext0 & ~p32[addr];assign w_p32_driveNext1 = w_p21_driveNext0 & p32[addr];
      assign w_p33_driveNext0 = w_p21_driveNext1 & ~p33[addr];assign w_p33_driveNext1 = w_p21_driveNext1 & p33[addr];
      assign w_p34_driveNext0 = w_p22_driveNext0 & ~p34[addr];assign w_p34_driveNext1 = w_p22_driveNext0 & p34[addr];
      assign w_p35_driveNext0 = w_p22_driveNext1 & ~p35[addr];assign w_p35_driveNext1 = w_p22_driveNext1 & p35[addr];
      assign w_p36_driveNext0 = w_p23_driveNext0 & ~p36[addr];assign w_p36_driveNext1 = w_p23_driveNext0 & p36[addr];
      assign w_p37_driveNext0 = w_p23_driveNext1 & ~p37[addr];assign w_p37_driveNext1 = w_p23_driveNext1 & p37[addr];
      
      assign w_p40_driveNext0 = w_p30_driveNext0 & ~p40[addr];assign w_p40_driveNext1 = w_p30_driveNext0 & p40[addr];
      assign w_p41_driveNext0 = w_p30_driveNext1 & ~p41[addr];assign w_p41_driveNext1 = w_p30_driveNext1 & p41[addr];
      assign w_p42_driveNext0 = w_p31_driveNext0 & ~p42[addr];assign w_p42_driveNext1 = w_p31_driveNext0 & p42[addr];
      assign w_p43_driveNext0 = w_p31_driveNext1 & ~p43[addr];assign w_p43_driveNext1 = w_p31_driveNext1 & p43[addr];
      assign w_p44_driveNext0 = w_p32_driveNext0 & ~p44[addr];assign w_p44_driveNext1 = w_p32_driveNext0 & p44[addr];
      assign w_p45_driveNext0 = w_p32_driveNext1 & ~p45[addr];assign w_p45_driveNext1 = w_p32_driveNext1 & p45[addr];
      assign w_p46_driveNext0 = w_p33_driveNext0 & ~p46[addr];assign w_p46_driveNext1 = w_p33_driveNext0 & p46[addr];
      assign w_p47_driveNext0 = w_p33_driveNext1 & ~p47[addr];assign w_p47_driveNext1 = w_p33_driveNext1 & p47[addr];
      assign w_p48_driveNext0 = w_p34_driveNext0 & ~p48[addr];assign w_p48_driveNext1 = w_p34_driveNext0 & p48[addr];
      assign w_p49_driveNext0 = w_p34_driveNext1 & ~p49[addr];assign w_p49_driveNext1 = w_p34_driveNext1 & p49[addr];
      assign w_p4a_driveNext0 = w_p35_driveNext0 & ~p4a[addr];assign w_p4a_driveNext1 = w_p35_driveNext0 & p4a[addr];
      assign w_p4b_driveNext0 = w_p35_driveNext1 & ~p4b[addr];assign w_p4b_driveNext1 = w_p35_driveNext1 & p4b[addr];
      assign w_p4c_driveNext0 = w_p36_driveNext0 & ~p4c[addr];assign w_p4c_driveNext1 = w_p36_driveNext0 & p4c[addr];
      assign w_p4d_driveNext0 = w_p36_driveNext1 & ~p4d[addr];assign w_p4d_driveNext1 = w_p36_driveNext1 & p4d[addr];
      assign w_p4e_driveNext0 = w_p37_driveNext0 & ~p4e[addr];assign w_p4e_driveNext1 = w_p37_driveNext0 & p4e[addr];
      assign w_p4f_driveNext0 = w_p37_driveNext1 & ~p4f[addr];assign w_p4f_driveNext1 = w_p37_driveNext1 & p4f[addr];

      assign w_drive_mutex_evict = {
        w_p4f_driveNext1, w_p4f_driveNext0,
        w_p4e_driveNext1, w_p4e_driveNext0,
        w_p4d_driveNext1, w_p4d_driveNext0,
        w_p4c_driveNext1, w_p4c_driveNext0,
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
          .rst         (cpurst_b         ),
          .o_free      (w_free_mutex_evict ),
          .o_driveNext (w_mutex_evict_driveNext ),
          .o_data      (w_mutex_data_32  ) //由contap的req组成
      );

      assign plru_evict_onehot = w_mutex_data_32;
      assign o_free_miss = | w_free_mutex_evict;
        

endmodule