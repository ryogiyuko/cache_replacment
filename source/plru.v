module ct_mmu_iplru(
  cp0_mmu_icg_en,
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
  utlb_plru_refill_vld
);

// &Ports; @24
input           cp0_mmu_icg_en;        
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
reg     [4 :0]  hit_num_flop;          
reg     [4 :0]  hit_num_index;         
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
reg     [4 :0]  refill_num_index;      
reg     [31:0]  refill_num_onehot;     
reg     [4 :0]  write_num;             

// &Wires; @26
wire            cp0_mmu_icg_en;        
wire            cpurst_b;              
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


//==========================================================
//                  Entry sel for Refill
//==========================================================
assign vld_entry_num[31:0] = {entry31_vld, entry30_vld, entry29_vld, entry28_vld,
                              entry27_vld, entry26_vld, entry25_vld, entry24_vld,
                              entry23_vld, entry22_vld, entry21_vld, entry20_vld,
                              entry19_vld, entry18_vld, entry17_vld, entry16_vld,
                              entry15_vld, entry14_vld, entry13_vld, entry12_vld,
                              entry11_vld, entry10_vld, entry9_vld,  entry8_vld,
                              entry7_vld,  entry6_vld,  entry5_vld,  entry4_vld,
                              entry3_vld,  entry2_vld,  entry1_vld,  entry0_vld};  
// &CombBeg; @55
always @( plru_num[4:0]
       or vld_entry_num[31:0])
begin
casez(vld_entry_num[31:0])
  32'b???????????????????????????????0: write_num[4:0] = 5'b00000;
  32'b??????????????????????????????01: write_num[4:0] = 5'b00001;
  32'b?????????????????????????????011: write_num[4:0] = 5'b00010;
  32'b????????????????????????????0111: write_num[4:0] = 5'b00011;
  32'b???????????????????????????01111: write_num[4:0] = 5'b00100;
  32'b??????????????????????????011111: write_num[4:0] = 5'b00101;
  32'b?????????????????????????0111111: write_num[4:0] = 5'b00110;
  32'b????????????????????????01111111: write_num[4:0] = 5'b00111;
  32'b???????????????????????011111111: write_num[4:0] = 5'b01000;
  32'b??????????????????????0111111111: write_num[4:0] = 5'b01001;
  32'b?????????????????????01111111111: write_num[4:0] = 5'b01010;
  32'b????????????????????011111111111: write_num[4:0] = 5'b01011;
  32'b???????????????????0111111111111: write_num[4:0] = 5'b01100;
  32'b??????????????????01111111111111: write_num[4:0] = 5'b01101;
  32'b?????????????????011111111111111: write_num[4:0] = 5'b01110;
  32'b????????????????0111111111111111: write_num[4:0] = 5'b01111;
  32'b???????????????01111111111111111: write_num[4:0] = 5'b10000;
  32'b??????????????011111111111111111: write_num[4:0] = 5'b10001;
  32'b?????????????0111111111111111111: write_num[4:0] = 5'b10010;
  32'b????????????01111111111111111111: write_num[4:0] = 5'b10011;
  32'b???????????011111111111111111111: write_num[4:0] = 5'b10100;
  32'b??????????0111111111111111111111: write_num[4:0] = 5'b10101;
  32'b?????????01111111111111111111111: write_num[4:0] = 5'b10110;
  32'b????????011111111111111111111111: write_num[4:0] = 5'b10111;
  32'b???????0111111111111111111111111: write_num[4:0] = 5'b11000;
  32'b??????01111111111111111111111111: write_num[4:0] = 5'b11001;
  32'b?????011111111111111111111111111: write_num[4:0] = 5'b11010;
  32'b????0111111111111111111111111111: write_num[4:0] = 5'b11011;
  32'b???01111111111111111111111111111: write_num[4:0] = 5'b11100;
  32'b??011111111111111111111111111111: write_num[4:0] = 5'b11101;
  32'b?0111111111111111111111111111111: write_num[4:0] = 5'b11110;
  32'b01111111111111111111111111111111: write_num[4:0] = 5'b11111;
  32'b11111111111111111111111111111111: write_num[4:0] = plru_num[4:0];
  default:                              write_num[4:0] = 5'b0;
endcase
// &CombEnd; @92
end


always @(posedge lru_clk or negedge cpurst_b)
begin
  if(!cpurst_b)
    refill_num_index[4:0] <= 5'b0;
  else if(utlb_plru_refill_on)
    refill_num_index[4:0] <= write_num[4:0];
end


// &CombBeg; @104
always @( refill_num_index[4:0])
begin
case(refill_num_index[4:0])
  5'h00: refill_num_onehot[31:0] = 32'b00000000000000000000000000000001;
  5'h01: refill_num_onehot[31:0] = 32'b00000000000000000000000000000010;
  5'h02: refill_num_onehot[31:0] = 32'b00000000000000000000000000000100;
  5'h03: refill_num_onehot[31:0] = 32'b00000000000000000000000000001000;
  5'h04: refill_num_onehot[31:0] = 32'b00000000000000000000000000010000;
  5'h05: refill_num_onehot[31:0] = 32'b00000000000000000000000000100000;
  5'h06: refill_num_onehot[31:0] = 32'b00000000000000000000000001000000;
  5'h07: refill_num_onehot[31:0] = 32'b00000000000000000000000010000000;
  5'h08: refill_num_onehot[31:0] = 32'b00000000000000000000000100000000;
  5'h09: refill_num_onehot[31:0] = 32'b00000000000000000000001000000000;
  5'h0a: refill_num_onehot[31:0] = 32'b00000000000000000000010000000000;
  5'h0b: refill_num_onehot[31:0] = 32'b00000000000000000000100000000000;
  5'h0c: refill_num_onehot[31:0] = 32'b00000000000000000001000000000000;
  5'h0d: refill_num_onehot[31:0] = 32'b00000000000000000010000000000000;
  5'h0e: refill_num_onehot[31:0] = 32'b00000000000000000100000000000000;
  5'h0f: refill_num_onehot[31:0] = 32'b00000000000000001000000000000000;
  5'h10: refill_num_onehot[31:0] = 32'b00000000000000010000000000000000;
  5'h11: refill_num_onehot[31:0] = 32'b00000000000000100000000000000000;
  5'h12: refill_num_onehot[31:0] = 32'b00000000000001000000000000000000;
  5'h13: refill_num_onehot[31:0] = 32'b00000000000010000000000000000000;
  5'h14: refill_num_onehot[31:0] = 32'b00000000000100000000000000000000;
  5'h15: refill_num_onehot[31:0] = 32'b00000000001000000000000000000000;
  5'h16: refill_num_onehot[31:0] = 32'b00000000010000000000000000000000;
  5'h17: refill_num_onehot[31:0] = 32'b00000000100000000000000000000000;
  5'h18: refill_num_onehot[31:0] = 32'b00000001000000000000000000000000;
  5'h19: refill_num_onehot[31:0] = 32'b00000010000000000000000000000000;
  5'h1a: refill_num_onehot[31:0] = 32'b00000100000000000000000000000000;
  5'h1b: refill_num_onehot[31:0] = 32'b00001000000000000000000000000000;
  5'h1c: refill_num_onehot[31:0] = 32'b00010000000000000000000000000000;
  5'h1d: refill_num_onehot[31:0] = 32'b00100000000000000000000000000000;
  5'h1e: refill_num_onehot[31:0] = 32'b01000000000000000000000000000000;
  5'h1f: refill_num_onehot[31:0] = 32'b10000000000000000000000000000000;
endcase
// &CombEnd; @139
end

//==========================================================
//                  Read Update
//==========================================================

reg [30:0] plru_buffer;


    

//plru_buffer update

    //==========================================================
    //                  PLRU Path Flop
    //==========================================================
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
        parameter DATA_WIDTH = 32;

        wire [DATA_WIDTH-1:0] i_data0, i_data8, i_data16, i_data24;
        wire [DATA_WIDTH-1:0] i_data1, i_data9, i_data17, i_data25;
        wire [DATA_WIDTH-1:0] i_data2, i_data10, i_data18, i_data26;
        wire [DATA_WIDTH-1:0] i_data3, i_data11, i_data19, i_data27;
        wire [DATA_WIDTH-1:0] i_data4, i_data12, i_data20, i_data28;
        wire [DATA_WIDTH-1:0] i_data5, i_data13, i_data21, i_data29;
        wire [DATA_WIDTH-1:0] i_data6, i_data14, i_data22, i_data30;
        wire [DATA_WIDTH-1:0] i_data7, i_data15, i_data23, i_data31;

        assign i_data0  = 32'b00000000000000000000000000000001;
        assign i_data1  = 32'b00000000000000000000000000000010;
        assign i_data2  = 32'b00000000000000000000000000000100;
        assign i_data3  = 32'b00000000000000000000000000001000;
        assign i_data4  = 32'b00000000000000000000000000010000;
        assign i_data5  = 32'b00000000000000000000000000100000;
        assign i_data6  = 32'b00000000000000000000000001000000;
        assign i_data7  = 32'b00000000000000000000000010000000;
        assign i_data8  = 32'b00000000000000000000000100000000;
        assign i_data9  = 32'b00000000000000000000001000000000;
        assign i_data10 = 32'b00000000000000000000010000000000;
        assign i_data11 = 32'b00000000000000000000100000000000;
        assign i_data12 = 32'b00000000000000000001000000000000;
        assign i_data13 = 32'b00000000000000000010000000000000;
        assign i_data14 = 32'b00000000000000000100000000000000;
        assign i_data15 = 32'b00000000000000001000000000000000;
        assign i_data16 = 32'b00000000000000010000000000000000;
        assign i_data17 = 32'b00000000000000100000000000000000;
        assign i_data18 = 32'b00000000000001000000000000000000;
        assign i_data19 = 32'b00000000000010000000000000000000;
        assign i_data20 = 32'b00000000000100000000000000000000;
        assign i_data21 = 32'b00000000001000000000000000000000;
        assign i_data22 = 32'b00000000010000000000000000000000;
        assign i_data23 = 32'b00000000100000000000000000000000;
        assign i_data24 = 32'b00000001000000000000000000000000;
        assign i_data25 = 32'b00000010000000000000000000000000;
        assign i_data26 = 32'b00000100000000000000000000000000;
        assign i_data27 = 32'b00001000000000000000000000000000;
        assign i_data28 = 32'b00010000000000000000000000000000;
        assign i_data29 = 32'b00100000000000000000000000000000;
        assign i_data30 = 32'b01000000000000000000000000000000;
        assign i_data31 = 32'b10000000000000000000000000000000;

        cSelector32 u_cSelector32_cache(
            .rst         (rst         ),
            .i_drive     (i_drive     ),
            .o_free      (o_free      ),
            .o_fire      (o_fire      ),
            .valid       (valid       ),
            .o_driveNext (o_driveNext ),
            .i_freeNext  (i_freeNext  )
        );

        cMutexMerge32_32b u_cMutexMerge32_32b(
            .i_drive     (i_drive     ),
            .i_data0     (i_data0     ),.i_data8     (i_data8     ),.i_data16    (i_data16    ),.i_data24    (i_data24    ),
            .i_data1     (i_data1     ),.i_data9     (i_data9     ),.i_data17    (i_data17    ),.i_data25    (i_data25    ),
            .i_data2     (i_data2     ),.i_data10    (i_data10    ),.i_data18    (i_data18    ),.i_data26    (i_data26    ),
            .i_data3     (i_data3     ),.i_data11    (i_data11    ),.i_data19    (i_data19    ),.i_data27    (i_data27    ),
            .i_data4     (i_data4     ),.i_data12    (i_data12    ),.i_data20    (i_data20    ),.i_data28    (i_data28    ),
            .i_data5     (i_data5     ),.i_data13    (i_data13    ),.i_data21    (i_data21    ),.i_data29    (i_data29    ),
            .i_data6     (i_data6     ),.i_data14    (i_data14    ),.i_data22    (i_data22    ),.i_data30    (i_data30    ),
            .i_data7     (i_data7     ),.i_data15    (i_data15    ),.i_data23    (i_data23    ),.i_data31    (i_data31    ),
            .i_freeNext  (i_freeNext  ),
            .rst         (rst         ),
            .o_free      (o_free      ),
            .o_driveNext (o_driveNext ),
            .o_data      (o_data      )
        );

        

endmodule