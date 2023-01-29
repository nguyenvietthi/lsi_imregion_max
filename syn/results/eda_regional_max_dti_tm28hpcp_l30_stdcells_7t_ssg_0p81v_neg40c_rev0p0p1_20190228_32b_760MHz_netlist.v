/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : P-2019.03-SP3
// Date      : Sun Jan 29 14:39:34 2023
/////////////////////////////////////////////////////////////


module eda_regional_max ( clk, pixel_in, reset_n, start, wr_addr, write_en, 
        done, .matrix_output({\matrix_output[5][5] , \matrix_output[5][4] , 
        \matrix_output[5][3] , \matrix_output[5][2] , \matrix_output[5][1] , 
        \matrix_output[5][0] , \matrix_output[4][5] , \matrix_output[4][4] , 
        \matrix_output[4][3] , \matrix_output[4][2] , \matrix_output[4][1] , 
        \matrix_output[4][0] , \matrix_output[3][5] , \matrix_output[3][4] , 
        \matrix_output[3][3] , \matrix_output[3][2] , \matrix_output[3][1] , 
        \matrix_output[3][0] , \matrix_output[2][5] , \matrix_output[2][4] , 
        \matrix_output[2][3] , \matrix_output[2][2] , \matrix_output[2][1] , 
        \matrix_output[2][0] , \matrix_output[1][5] , \matrix_output[1][4] , 
        \matrix_output[1][3] , \matrix_output[1][2] , \matrix_output[1][1] , 
        \matrix_output[1][0] , \matrix_output[0][5] , \matrix_output[0][4] , 
        \matrix_output[0][3] , \matrix_output[0][2] , \matrix_output[0][1] , 
        \matrix_output[0][0] }) );
  input [7:0] pixel_in;
  input [5:0] wr_addr;
  input clk, reset_n, start, write_en;
  output done, \matrix_output[5][5] , \matrix_output[5][4] ,
         \matrix_output[5][3] , \matrix_output[5][2] , \matrix_output[5][1] ,
         \matrix_output[5][0] , \matrix_output[4][5] , \matrix_output[4][4] ,
         \matrix_output[4][3] , \matrix_output[4][2] , \matrix_output[4][1] ,
         \matrix_output[4][0] , \matrix_output[3][5] , \matrix_output[3][4] ,
         \matrix_output[3][3] , \matrix_output[3][2] , \matrix_output[3][1] ,
         \matrix_output[3][0] , \matrix_output[2][5] , \matrix_output[2][4] ,
         \matrix_output[2][3] , \matrix_output[2][2] , \matrix_output[2][1] ,
         \matrix_output[2][0] , \matrix_output[1][5] , \matrix_output[1][4] ,
         \matrix_output[1][3] , \matrix_output[1][2] , \matrix_output[1][1] ,
         \matrix_output[1][0] , \matrix_output[0][5] , \matrix_output[0][4] ,
         \matrix_output[0][3] , \matrix_output[0][2] , \matrix_output[0][1] ,
         \matrix_output[0][0] ;
  wire   new_pixel, iterated_all, \strb_value[5][5] , \strb_value[5][4] ,
         \strb_value[5][3] , \strb_value[5][2] , \strb_value[5][1] ,
         \strb_value[5][0] , \strb_value[4][5] , \strb_value[4][4] ,
         \strb_value[4][3] , \strb_value[4][2] , \strb_value[4][1] ,
         \strb_value[4][0] , \strb_value[3][5] , \strb_value[3][4] ,
         \strb_value[3][3] , \strb_value[3][2] , \strb_value[3][1] ,
         \strb_value[3][0] , \strb_value[2][5] , \strb_value[2][4] ,
         \strb_value[2][3] , \strb_value[2][2] , \strb_value[2][1] ,
         \strb_value[2][0] , \strb_value[1][5] , \strb_value[1][3] ,
         \strb_value[1][2] , \strb_value[1][1] , \strb_value[1][0] ,
         \strb_value[0][5] , \strb_value[0][4] , \strb_value[0][3] ,
         \strb_value[0][2] , \strb_value[0][1] , \strb_value[0][0] ,
         \eda_controller/next_state[2] , \eda_fifos/sync_fifo_upleft/o_full ,
         \eda_fifos/sync_fifo_up/o_full , \eda_fifos/sync_fifo_upright/o_full ,
         \eda_fifos/sync_fifo_left/o_full , \eda_fifos/sync_fifo_right/o_full ,
         \eda_fifos/sync_fifo_downleft/o_full ,
         \eda_fifos/sync_fifo_down/o_full ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][5] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][4] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][3] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][2] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][1] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][0] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][5] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][4] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][3] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][2] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][1] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][0] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][5] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][4] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][3] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][2] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][1] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][0] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][5] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][4] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][3] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][2] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][1] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][0] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][5] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][4] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][3] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][2] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][1] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][0] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][5] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][4] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][3] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][2] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][1] ,
         \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][0] ,
         \eda_fifos/sync_fifo_upleft/comparator_inst/N53 ,
         \eda_fifos/sync_fifo_upright/comparator_inst/N53 ,
         \eda_fifos/sync_fifo_left/comparator_inst/N53 ,
         \eda_fifos/sync_fifo_right/comparator_inst/N53 ,
         \eda_fifos/sync_fifo_downleft/comparator_inst/N53 ,
         \eda_fifos/sync_fifo_down/comparator_inst/N53 ,
         \eda_img_ram/img_memory[5][5][7] , \eda_img_ram/img_memory[5][5][6] ,
         \eda_img_ram/img_memory[5][5][5] , \eda_img_ram/img_memory[5][5][4] ,
         \eda_img_ram/img_memory[5][5][3] , \eda_img_ram/img_memory[5][5][2] ,
         \eda_img_ram/img_memory[5][5][1] , \eda_img_ram/img_memory[5][5][0] ,
         \eda_img_ram/img_memory[5][4][7] , \eda_img_ram/img_memory[5][4][6] ,
         \eda_img_ram/img_memory[5][4][5] , \eda_img_ram/img_memory[5][4][4] ,
         \eda_img_ram/img_memory[5][4][3] , \eda_img_ram/img_memory[5][4][2] ,
         \eda_img_ram/img_memory[5][4][1] , \eda_img_ram/img_memory[5][4][0] ,
         \eda_img_ram/img_memory[5][3][7] , \eda_img_ram/img_memory[5][3][6] ,
         \eda_img_ram/img_memory[5][3][5] , \eda_img_ram/img_memory[5][3][4] ,
         \eda_img_ram/img_memory[5][3][3] , \eda_img_ram/img_memory[5][3][2] ,
         \eda_img_ram/img_memory[5][3][1] , \eda_img_ram/img_memory[5][3][0] ,
         \eda_img_ram/img_memory[5][2][7] , \eda_img_ram/img_memory[5][2][6] ,
         \eda_img_ram/img_memory[5][2][5] , \eda_img_ram/img_memory[5][2][4] ,
         \eda_img_ram/img_memory[5][2][3] , \eda_img_ram/img_memory[5][2][2] ,
         \eda_img_ram/img_memory[5][2][1] , \eda_img_ram/img_memory[5][2][0] ,
         \eda_img_ram/img_memory[5][1][7] , \eda_img_ram/img_memory[5][1][6] ,
         \eda_img_ram/img_memory[5][1][5] , \eda_img_ram/img_memory[5][1][4] ,
         \eda_img_ram/img_memory[5][1][3] , \eda_img_ram/img_memory[5][1][2] ,
         \eda_img_ram/img_memory[5][1][1] , \eda_img_ram/img_memory[5][1][0] ,
         \eda_img_ram/img_memory[5][0][7] , \eda_img_ram/img_memory[5][0][6] ,
         \eda_img_ram/img_memory[5][0][5] , \eda_img_ram/img_memory[5][0][4] ,
         \eda_img_ram/img_memory[5][0][3] , \eda_img_ram/img_memory[5][0][2] ,
         \eda_img_ram/img_memory[5][0][1] , \eda_img_ram/img_memory[5][0][0] ,
         \eda_img_ram/img_memory[4][5][7] , \eda_img_ram/img_memory[4][5][6] ,
         \eda_img_ram/img_memory[4][5][5] , \eda_img_ram/img_memory[4][5][4] ,
         \eda_img_ram/img_memory[4][5][3] , \eda_img_ram/img_memory[4][5][2] ,
         \eda_img_ram/img_memory[4][5][1] , \eda_img_ram/img_memory[4][5][0] ,
         \eda_img_ram/img_memory[4][4][7] , \eda_img_ram/img_memory[4][4][6] ,
         \eda_img_ram/img_memory[4][4][5] , \eda_img_ram/img_memory[4][4][4] ,
         \eda_img_ram/img_memory[4][4][3] , \eda_img_ram/img_memory[4][4][2] ,
         \eda_img_ram/img_memory[4][4][1] , \eda_img_ram/img_memory[4][4][0] ,
         \eda_img_ram/img_memory[4][3][7] , \eda_img_ram/img_memory[4][3][6] ,
         \eda_img_ram/img_memory[4][3][5] , \eda_img_ram/img_memory[4][3][4] ,
         \eda_img_ram/img_memory[4][3][3] , \eda_img_ram/img_memory[4][3][2] ,
         \eda_img_ram/img_memory[4][3][1] , \eda_img_ram/img_memory[4][3][0] ,
         \eda_img_ram/img_memory[4][2][7] , \eda_img_ram/img_memory[4][2][6] ,
         \eda_img_ram/img_memory[4][2][5] , \eda_img_ram/img_memory[4][2][4] ,
         \eda_img_ram/img_memory[4][2][3] , \eda_img_ram/img_memory[4][2][2] ,
         \eda_img_ram/img_memory[4][2][1] , \eda_img_ram/img_memory[4][2][0] ,
         \eda_img_ram/img_memory[4][1][7] , \eda_img_ram/img_memory[4][1][6] ,
         \eda_img_ram/img_memory[4][1][5] , \eda_img_ram/img_memory[4][1][4] ,
         \eda_img_ram/img_memory[4][1][3] , \eda_img_ram/img_memory[4][1][2] ,
         \eda_img_ram/img_memory[4][1][1] , \eda_img_ram/img_memory[4][1][0] ,
         \eda_img_ram/img_memory[4][0][7] , \eda_img_ram/img_memory[4][0][6] ,
         \eda_img_ram/img_memory[4][0][5] , \eda_img_ram/img_memory[4][0][4] ,
         \eda_img_ram/img_memory[4][0][3] , \eda_img_ram/img_memory[4][0][2] ,
         \eda_img_ram/img_memory[4][0][1] , \eda_img_ram/img_memory[4][0][0] ,
         \eda_img_ram/img_memory[3][5][7] , \eda_img_ram/img_memory[3][5][6] ,
         \eda_img_ram/img_memory[3][5][5] , \eda_img_ram/img_memory[3][5][4] ,
         \eda_img_ram/img_memory[3][5][3] , \eda_img_ram/img_memory[3][5][2] ,
         \eda_img_ram/img_memory[3][5][1] , \eda_img_ram/img_memory[3][5][0] ,
         \eda_img_ram/img_memory[3][4][7] , \eda_img_ram/img_memory[3][4][6] ,
         \eda_img_ram/img_memory[3][4][5] , \eda_img_ram/img_memory[3][4][4] ,
         \eda_img_ram/img_memory[3][4][3] , \eda_img_ram/img_memory[3][4][2] ,
         \eda_img_ram/img_memory[3][4][1] , \eda_img_ram/img_memory[3][4][0] ,
         \eda_img_ram/img_memory[3][3][7] , \eda_img_ram/img_memory[3][3][6] ,
         \eda_img_ram/img_memory[3][3][5] , \eda_img_ram/img_memory[3][3][4] ,
         \eda_img_ram/img_memory[3][3][3] , \eda_img_ram/img_memory[3][3][2] ,
         \eda_img_ram/img_memory[3][3][1] , \eda_img_ram/img_memory[3][3][0] ,
         \eda_img_ram/img_memory[3][2][7] , \eda_img_ram/img_memory[3][2][6] ,
         \eda_img_ram/img_memory[3][2][5] , \eda_img_ram/img_memory[3][2][4] ,
         \eda_img_ram/img_memory[3][2][3] , \eda_img_ram/img_memory[3][2][2] ,
         \eda_img_ram/img_memory[3][2][1] , \eda_img_ram/img_memory[3][2][0] ,
         \eda_img_ram/img_memory[3][1][7] , \eda_img_ram/img_memory[3][1][6] ,
         \eda_img_ram/img_memory[3][1][5] , \eda_img_ram/img_memory[3][1][4] ,
         \eda_img_ram/img_memory[3][1][3] , \eda_img_ram/img_memory[3][1][2] ,
         \eda_img_ram/img_memory[3][1][1] , \eda_img_ram/img_memory[3][1][0] ,
         \eda_img_ram/img_memory[3][0][7] , \eda_img_ram/img_memory[3][0][6] ,
         \eda_img_ram/img_memory[3][0][5] , \eda_img_ram/img_memory[3][0][4] ,
         \eda_img_ram/img_memory[3][0][3] , \eda_img_ram/img_memory[3][0][2] ,
         \eda_img_ram/img_memory[3][0][1] , \eda_img_ram/img_memory[3][0][0] ,
         \eda_img_ram/img_memory[2][5][7] , \eda_img_ram/img_memory[2][5][6] ,
         \eda_img_ram/img_memory[2][5][5] , \eda_img_ram/img_memory[2][5][4] ,
         \eda_img_ram/img_memory[2][5][3] , \eda_img_ram/img_memory[2][5][2] ,
         \eda_img_ram/img_memory[2][5][1] , \eda_img_ram/img_memory[2][5][0] ,
         \eda_img_ram/img_memory[2][4][7] , \eda_img_ram/img_memory[2][4][6] ,
         \eda_img_ram/img_memory[2][4][5] , \eda_img_ram/img_memory[2][4][4] ,
         \eda_img_ram/img_memory[2][4][3] , \eda_img_ram/img_memory[2][4][2] ,
         \eda_img_ram/img_memory[2][4][1] , \eda_img_ram/img_memory[2][3][7] ,
         \eda_img_ram/img_memory[2][3][6] , \eda_img_ram/img_memory[2][3][5] ,
         \eda_img_ram/img_memory[2][3][4] , \eda_img_ram/img_memory[2][3][3] ,
         \eda_img_ram/img_memory[2][3][2] , \eda_img_ram/img_memory[2][3][1] ,
         \eda_img_ram/img_memory[2][3][0] , \eda_img_ram/img_memory[2][2][7] ,
         \eda_img_ram/img_memory[2][2][6] , \eda_img_ram/img_memory[2][2][5] ,
         \eda_img_ram/img_memory[2][2][4] , \eda_img_ram/img_memory[2][2][3] ,
         \eda_img_ram/img_memory[2][2][2] , \eda_img_ram/img_memory[2][2][1] ,
         \eda_img_ram/img_memory[2][2][0] , \eda_img_ram/img_memory[2][1][7] ,
         \eda_img_ram/img_memory[2][1][6] , \eda_img_ram/img_memory[2][1][5] ,
         \eda_img_ram/img_memory[2][1][4] , \eda_img_ram/img_memory[2][1][3] ,
         \eda_img_ram/img_memory[2][1][2] , \eda_img_ram/img_memory[2][1][1] ,
         \eda_img_ram/img_memory[2][1][0] , \eda_img_ram/img_memory[2][0][7] ,
         \eda_img_ram/img_memory[2][0][6] , \eda_img_ram/img_memory[2][0][5] ,
         \eda_img_ram/img_memory[2][0][4] , \eda_img_ram/img_memory[2][0][3] ,
         \eda_img_ram/img_memory[2][0][2] , \eda_img_ram/img_memory[2][0][1] ,
         \eda_img_ram/img_memory[2][0][0] , \eda_img_ram/img_memory[1][5][7] ,
         \eda_img_ram/img_memory[1][5][6] , \eda_img_ram/img_memory[1][5][5] ,
         \eda_img_ram/img_memory[1][5][4] , \eda_img_ram/img_memory[1][5][3] ,
         \eda_img_ram/img_memory[1][5][2] , \eda_img_ram/img_memory[1][5][1] ,
         \eda_img_ram/img_memory[1][5][0] , \eda_img_ram/img_memory[1][4][7] ,
         \eda_img_ram/img_memory[1][4][6] , \eda_img_ram/img_memory[1][4][5] ,
         \eda_img_ram/img_memory[1][4][4] , \eda_img_ram/img_memory[1][4][3] ,
         \eda_img_ram/img_memory[1][4][2] , \eda_img_ram/img_memory[1][4][1] ,
         \eda_img_ram/img_memory[1][4][0] , \eda_img_ram/img_memory[1][3][7] ,
         \eda_img_ram/img_memory[1][3][6] , \eda_img_ram/img_memory[1][3][5] ,
         \eda_img_ram/img_memory[1][3][4] , \eda_img_ram/img_memory[1][3][3] ,
         \eda_img_ram/img_memory[1][3][2] , \eda_img_ram/img_memory[1][3][1] ,
         \eda_img_ram/img_memory[1][3][0] , \eda_img_ram/img_memory[1][2][7] ,
         \eda_img_ram/img_memory[1][2][6] , \eda_img_ram/img_memory[1][2][5] ,
         \eda_img_ram/img_memory[1][2][4] , \eda_img_ram/img_memory[1][2][3] ,
         \eda_img_ram/img_memory[1][2][2] , \eda_img_ram/img_memory[1][2][1] ,
         \eda_img_ram/img_memory[1][2][0] , \eda_img_ram/img_memory[1][1][7] ,
         \eda_img_ram/img_memory[1][1][6] , \eda_img_ram/img_memory[1][1][5] ,
         \eda_img_ram/img_memory[1][1][4] , \eda_img_ram/img_memory[1][1][3] ,
         \eda_img_ram/img_memory[1][1][2] , \eda_img_ram/img_memory[1][1][1] ,
         \eda_img_ram/img_memory[1][1][0] , \eda_img_ram/img_memory[1][0][7] ,
         \eda_img_ram/img_memory[1][0][6] , \eda_img_ram/img_memory[1][0][5] ,
         \eda_img_ram/img_memory[1][0][4] , \eda_img_ram/img_memory[1][0][3] ,
         \eda_img_ram/img_memory[1][0][2] , \eda_img_ram/img_memory[1][0][1] ,
         \eda_img_ram/img_memory[1][0][0] , \eda_img_ram/img_memory[0][5][7] ,
         \eda_img_ram/img_memory[0][5][6] , \eda_img_ram/img_memory[0][5][5] ,
         \eda_img_ram/img_memory[0][5][4] , \eda_img_ram/img_memory[0][5][3] ,
         \eda_img_ram/img_memory[0][5][2] , \eda_img_ram/img_memory[0][5][1] ,
         \eda_img_ram/img_memory[0][5][0] , \eda_img_ram/img_memory[0][4][7] ,
         \eda_img_ram/img_memory[0][4][6] , \eda_img_ram/img_memory[0][4][5] ,
         \eda_img_ram/img_memory[0][4][4] , \eda_img_ram/img_memory[0][4][3] ,
         \eda_img_ram/img_memory[0][4][2] , \eda_img_ram/img_memory[0][4][1] ,
         \eda_img_ram/img_memory[0][3][7] , \eda_img_ram/img_memory[0][3][6] ,
         \eda_img_ram/img_memory[0][3][5] , \eda_img_ram/img_memory[0][3][4] ,
         \eda_img_ram/img_memory[0][3][3] , \eda_img_ram/img_memory[0][3][2] ,
         \eda_img_ram/img_memory[0][3][1] , \eda_img_ram/img_memory[0][3][0] ,
         \eda_img_ram/img_memory[0][2][7] , \eda_img_ram/img_memory[0][2][6] ,
         \eda_img_ram/img_memory[0][2][5] , \eda_img_ram/img_memory[0][2][4] ,
         \eda_img_ram/img_memory[0][2][3] , \eda_img_ram/img_memory[0][2][2] ,
         \eda_img_ram/img_memory[0][2][1] , \eda_img_ram/img_memory[0][2][0] ,
         \eda_img_ram/img_memory[0][1][7] , \eda_img_ram/img_memory[0][1][6] ,
         \eda_img_ram/img_memory[0][1][5] , \eda_img_ram/img_memory[0][1][4] ,
         \eda_img_ram/img_memory[0][1][3] , \eda_img_ram/img_memory[0][1][2] ,
         \eda_img_ram/img_memory[0][1][1] , \eda_img_ram/img_memory[0][1][0] ,
         \eda_img_ram/img_memory[0][0][7] , \eda_img_ram/img_memory[0][0][6] ,
         \eda_img_ram/img_memory[0][0][5] , \eda_img_ram/img_memory[0][0][4] ,
         \eda_img_ram/img_memory[0][0][3] , \eda_img_ram/img_memory[0][0][2] ,
         \eda_img_ram/img_memory[0][0][1] , \eda_img_ram/img_memory[0][0][0] ,
         \eda_iterated_ram/N743 , \eda_iterated_ram/have_done ,
         \eda_iterated_ram/N741 , \eda_iterated_ram/current_row[5][5] ,
         \eda_iterated_ram/current_row[5][4] ,
         \eda_iterated_ram/current_row[5][3] ,
         \eda_iterated_ram/current_row[5][2] ,
         \eda_iterated_ram/current_row[5][1] ,
         \eda_iterated_ram/current_row[5][0] ,
         \eda_iterated_ram/current_row[4][5] ,
         \eda_iterated_ram/current_row[4][4] ,
         \eda_iterated_ram/current_row[4][3] ,
         \eda_iterated_ram/current_row[4][2] ,
         \eda_iterated_ram/current_row[4][1] ,
         \eda_iterated_ram/current_row[4][0] ,
         \eda_iterated_ram/current_row[3][5] ,
         \eda_iterated_ram/current_row[3][4] ,
         \eda_iterated_ram/current_row[3][3] ,
         \eda_iterated_ram/current_row[3][2] ,
         \eda_iterated_ram/current_row[3][1] ,
         \eda_iterated_ram/current_row[3][0] ,
         \eda_iterated_ram/current_row[2][5] ,
         \eda_iterated_ram/current_row[2][4] ,
         \eda_iterated_ram/current_row[2][3] ,
         \eda_iterated_ram/current_row[2][2] ,
         \eda_iterated_ram/current_row[2][1] ,
         \eda_iterated_ram/current_row[2][0] ,
         \eda_iterated_ram/current_row[1][5] ,
         \eda_iterated_ram/current_row[1][4] ,
         \eda_iterated_ram/current_row[1][3] ,
         \eda_iterated_ram/current_row[1][1] ,
         \eda_iterated_ram/current_row[1][0] ,
         \eda_iterated_ram/current_row[0][5] ,
         \eda_iterated_ram/current_row[0][4] ,
         \eda_iterated_ram/current_row[0][3] ,
         \eda_iterated_ram/current_row[0][2] ,
         \eda_iterated_ram/current_row[0][1] ,
         \eda_iterated_ram/current_row[0][0] , n2431, n2433, n2434, n2435,
         n2436, n2437, n2438, n2439, n2440, n2441, n2442, n2443, n2444, n2445,
         n2446, n2447, n2448, n2449, n2450, n2451, n2452, n2453, n2454, n2455,
         n2456, n2457, n2458, n2459, n2460, n2461, n2462, n2463, n2464, n2465,
         n2466, n2467, n2468, n2469, n2470, n2471, n2472, n2473, n2474, n2475,
         n2476, n2477, n2478, n2479, n2480, n2481, n2482, n2483, n2484, n2485,
         n2486, n2487, n2488, n2489, n2490, n2491, n2492, n2494, n2495, n2496,
         n2497, n2498, n2499, n2500, n2501, n2502, n2504, n2505, n2506, n2507,
         n2508, n2509, n2510, n2511, n2512, n2513, n2514, n2515, n2516, n2517,
         n2518, n2519, n2520, n2521, n2522, n2523, n2524, n2525, n2526, n2527,
         n2528, n2530, n2531, n2532, n2533, n2534, n2535, n2536, n2537, n2538,
         n2539, n2540, n2541, n2542, n2543, n2544, n2545, n2546, n2547, n2548,
         n2549, n2550, n2551, n2552, n2553, n2554, n2555, n2556, n2557, n2558,
         n2559, n2561, n2563, n2564, n2566, n2567, n2568, n2569, n2570, n2571,
         n2572, n2573, n2574, n2575, n2576, n2577, n2578, n2579, n2580, n2581,
         n2582, n2583, n2584, n2585, n2586, n2587, n2588, n2589, n2590, n2591,
         n2592, n2593, n2594, n2595, n2596, n2597, n2598, n2599, n2600, n2601,
         n2602, n2603, n2604, n2605, n2606, n2607, n2608, n2609, n2610, n2611,
         n2612, n2613, n2614, n2615, n2616, n2617, n2618, n2619, n2620, n2621,
         n2622, n2623, n2624, n2625, n2626, n2627, n2629, n2630, n2631, n2632,
         n2633, n2634, n2635, n2636, n2637, n2638, n2639, n2640, n2641, n2642,
         n2643, n2645, n2646, n2647, n2648, n2649, n2650, n2651, n2652, n2653,
         n2654, n2655, n2656, n2657, n2658, n2659, n2660, n2661, n2662, n2663,
         n2664, n2665, n2666, n2667, n2668, n2669, n2670, n2671, n2672, n2673,
         n2674, n2675, n2676, n2677, n2678, n2679, n2680, n2681, n2682, n2683,
         n2684, n2689, n2691, n2692, n2693, n2694, n2695, n2696, n2697, n2698,
         n2699, n2700, n2701, n2702, n2703, n2704, n2705, n2706, n2707, n2708,
         n2709, n2710, n2711, n2712, n2713, n2714, n2715, n2716, n2717, n2718,
         n2719, n2720, n2721, n2722, n2723, n2724, n2725, n2726, n2727, n2728,
         n2729, n2730, n2731, n2732, n2733, n2734, n2735, n2736, n2737, n2738,
         n2739, n2740, n2741, n2742, n2743, n2744, n2745, n2746, n2747, n2748,
         n2749, n2750, n2751, n2752, n2753, n2754, n2755, n2756, n2757, n2758,
         n2759, n2760, n2761, n2762, n2763, n2764, n2765, n2766, n2767, n2768,
         n2769, n2770, n2771, n2772, n2773, n2774, n2775, n2776, n2777, n2778,
         n2779, n2780, n2781, n2782, n2783, n2784, n2785, n2786, n2787, n2788,
         n2789, n2790, n2791, n2792, n2793, n2794, n2795, n2796, n2797, n2798,
         n2799, n2800, n2801, n2802, n2803, n2804, n2805, n2806, n2807, n2808,
         n2809, n2810, n2817, n2818, n2819, n2820, n2821, n2822, n2823, n2824,
         n2826, n2828, n2831, n2832, n2833, n2841, n2842, n2843, n2844, n2845,
         n2846, n2847, n2848, n2849, n2850, n2851, n2852, n2853, n2854, n2855,
         n2856, n2857, n2858, n2859, n2860, n2861, n2862, n2863, n2864, n2865,
         n2866, n2867, n2868, n2869, n2870, n2871, n2872, n2873, n2874, n2875,
         n2876, n2877, n2878, n2879, n2880, n2881, n2882, n2883, n2884, n2885,
         n2886, n2887, n2888, n2889, n2890, n2891, n2892, n2893, n2894, n2897,
         n2901, n2903, n2908, n2909, n2910, n2911, n2912, n2913, n2915, n2916,
         n2917, n2918, n2919, n2920, n2921, n2922, n2923, n2925, n2926, n2928,
         n2930, n2931, n2932, n2933, n2934, n2935, n2936, n2937, n2938, n2939,
         n2940, n2943, n2944, n2945, n2948, n2950, n2951, n2952, n2953, n2956,
         n2957, n2958, n2959, n2960, n2961, n2964, n2965, n2966, n2967, n2968,
         n2969, n2970, n2971, n2972, n2973, n2974, n2975, n2976, n2977, n2978,
         n2979, n2980, n2981, n2982, n2983, n2984, n2985, n2986, n2987, n2988,
         n2993, n2997, n2998, n2999, n3000, n3003, n3005, n3007, n3009, n3013,
         n3014, n3015, n3016, n3017, n3018, n3019, n3020, n3021, n3022, n3023,
         n3024, n3025, n3026, n3027, n3028, n3029, n3030, n3031, n3032, n3033,
         n3034, n3035, n3036, n3037, n3039, n3041, n3047, n3049, n3050, n3055,
         n3057, n3058, n3059, n3061, n3062, n3063, n3064, n3065, n3066, n3067,
         n3069, n3070, n3071, n3072, n3073, n3074, n3075, n3076, n3077, n3078,
         n3079, n3080, n3081, n3082, n3083, n3084, n3089, n3094, n3096, n3102,
         n3107, n3108, n3115, n3116, n3117, n3120, n3123, n3127, n3129, n3131,
         n3133, n3136, n3138, n3141, n3151, n3155, n3158, n3159, n3160, n3162,
         n3164, n3167, n3173, n3174, n3175, n3176, n3182, n3185, n3186, n3188,
         n3189, n3190, n3231, n3234, n3235, n3238, n3240, n3241, n3242, n3243,
         n3244, n3245, n3246, n3247, n3248, n3249, n3252, n3253, n3254, n3255,
         n3256, n3257, n3259, n3260, n3261, n3262, n3263, n3264, n3265, n3268,
         n3269, n3270, n3272, n3273, n3274, n3276, n3277, n3278, n3279, n3281,
         n3282, n3283, n3284, n3286, n3287, n3289, n3290, n3291, n3292, n3293,
         n3294, n3295, n3296, n3297, n3299, n3300, n3301, n3302, n3303, n3304,
         n3305, n3306, n3308, n3309, n3310, n3311, n3312, n3313, n3314, n3315,
         n3316, n3317, n3319, n3320, n3321, n3322, n3324, n3325, n3326, n3328,
         n3330, n3331, n3332, n3333, n3334, n3335, n3336, n3337, n3338, n3339,
         n3340, n3341, n3342, n3343, n3344, n3345, n3346, n3347, n3348, n3349,
         n3350, n3351, n3352, n3353, n3354, n3355, n3356, n3357, n3360, n3362,
         n3366, n3368, n3369, n3370, n3371, n3372, n3374, n3375, n3376, n3378,
         n3379, n3381, n3382, n3383, n3384, n3385, n3386, n3387, n3388, n3390,
         n3391, n3394, n3395, n3396, n3398, n3401, n3402, n3404, n3405, n3406,
         n3407, n3408, n3409, n3410, n3411, n3412, n3413, n3414, n3416, n3418,
         n3419, n3420, n3421, n3422, n3423, n3424, n3425, n3427, n3428, n3429,
         n3430, n3431, n3432, n3434, n3435, n3436, n3437, n3438, n3441, n3442,
         n3443, n3444, n3445, n3446, n3447, n3448, n3450, n3451, n3452, n3453,
         n3454, n3455, n3456, n3457, n3458, n3459, n3460, n3461, n3462, n3463,
         n3464, n3465, n3466, n3467, n3468, n3469, n3470, n3471, n3472, n3473,
         n3474, n3475, n3476, n3477, n3478, n3479, n3480, n3481, n3482, n3483,
         n3484, n3485, n3486, n3487, n3489, n3490, n3491, n3492, n3494, n3495,
         n3496, n3497, n3499, n3500, n3501, n3503, n3504, n3505, n3506, n3508,
         n3509, n3510, n3511, n3512, n3513, n3514, n3515, n3516, n3517, n3518,
         n3519, n3520, n3521, n3522, n3523, n3524, n3526, n3527, n3528, n3530,
         n3531, n3532, n3534, n3535, n3536, n3537, n3538, n3539, n3541, n3542,
         n3543, n3544, n3545, n3546, n3548, n3549, n3550, n3551, n3552, n3554,
         n3556, n3557, n3558, n3559, n3561, n3563, n3564, n3565, n3566, n3567,
         n3568, n3569, n3571, n3572, n3573, n3574, n3575, n3576, n3577, n3578,
         n3579, n3580, n3582, n3583, n3584, n3585, n3586, n3587, n3588, n3589,
         n3590, n3592, n3593, n3595, n3599, n3601, n3602, n3603, n3604, n3605,
         n3606, n3607, n3608, n3612, n3613, n3614, n3615, n3616, n3617, n3618,
         n3619, n3620, n3621, n3622, n3623, n3625, n3626, n3627, n3629, n3630,
         n3631, n3632, n3633, n3634, n3635, n3636, n3637, n3638, n3639, n3640,
         n3641, n3642, n3644, n3645, n3647, n3648, n3649, n3650, n3651, n3652,
         n3657, n3658, n3659, n3662, n3663, n3664, n3665, n3666, n3668, n3669,
         n3670, n3671, n3673, n3674, n3675, n3676, n3677, n3678, n3679, n3680,
         n3681, n3682, n3683, n3684, n3685, n3686, n3687, n3688, n3689, n3690,
         n3691, n3693, n3694, n3695, n3696, n3697, n3698, n3700, n3701, n3702,
         n3703, n3704, n3705, n3706, n3708, n3710, n3711, n3714, n3715, n3716,
         n3717, n3718, n3719, n3720, n3721, n3722, n3723, n3724, n3725, n3726,
         n3728, n3729, n3730, n3731, n3732, n3733, n3735, n3736, n3737, n3738,
         n3739, n3740, n3741, n3742, n3743, n3745, n3746, n3748, n3749, n3750,
         n3753, n3754, n3755, n3757, n3758, n3759, n3760, n3761, n3762, n3763,
         n3764, n3765, n3766, n3767, n3768, n3769, n3771, n3773, n3774, n3775,
         n3776, n3778, n3780, n3781, n3782, n3783, n3784, n3785, n3786, n3787,
         n3790, n3791, n3792, n3793, n3794, n3795, n3796, n3797, n3798, n3800,
         n3801, n3802, n3803, n3804, n3805, n3806, n3807, n3808, n3809, n3810,
         n3811, n3813, n3815, n3816, n3817, n3818, n3819, n3820, n3821, n3822,
         n3823, n3826, n3827, n3828, n3829, n3830, n3831, n3833, n3834, n3836,
         n3837, n3838, n3839, n3840, n3842, n3844, n3845, n3846, n3847, n3848,
         n3849, n3850, n3851, n3852, n3853, n3854, n3855, n3856, n3857, n3858,
         n3859, n3860, n3861, n3862, n3863, n3864, n3865, n3867, n3868, n3869,
         n3870, n3871, n3872, n3873, n3874, n3876, n3877, n3878, n3879, n3880,
         n3881, n3882, n3885, n3886, n3887, n3888, n3889, n3891, n3892, n3893,
         n3894, n3895, n3896, n3897, n3898, n3899, n3900, n3901, n3902, n3903,
         n3904, n3905, n3908, n3909, n3910, n3911, n3912, n3913, n3914, n3915,
         n3916, n3917, n3918, n3919, n3920, n3921, n3922, n3923, n3924, n3925,
         n3926, n3927, n3928, n3929, n3930, n3931, n3932, n3933, n3934, n3935,
         n3936, n3937, n3938, n3939, n3940, n3941, n3942, n3943, n3944, n3945,
         n3946, n3947, n3948, n3949, n3950, n3951, n3952, n3953, n3954, n3955,
         n3956, n3957, n3958, n3959, n3960, n3961, n3962, n3963, n3964, n3965,
         n3966, n3967, n3968, n3969, n3970, n3971, n3972, n3973, n3974, n3975,
         n3976, n3977, n3978, n3979, n3980, n3981, n3982, n3983, n3984, n3985,
         n3986, n3987, n3988, n3989, n3990, n3991, n3992, n3993, n3994, n3995,
         n3996, n3997, n3998, n3999, n4000, n4001, n4002, n4003, n4004, n4005,
         n4006, n4007, n4008, n4009, n4010, n4011, n4012, n4013, n4014, n4015,
         n4016, n4017, n4018, n4019, n4020, n4021, n4022, n4023, n4025, n4026,
         n4027, n4028, n4029, n4030, n4031, n4032, n4033, n4034, n4035, n4036,
         n4037, n4038, n4039, n4040, n4041, n4042, n4043, n4044, n4045, n4046,
         n4047, n4048, n4049, n4050, n4051, n4052, n4053, n4054, n4055, n4056,
         n4057, n4058, n4059, n4060, n4061, n4062, n4063, n4064, n4065, n4066,
         n4067, n4068, n4069, n4070, n4071, n4072, n4073, n4074, n4075, n4076,
         n4077, n4078, n4079, n4080, n4081, n4082, n4083, n4084, n4085, n4087,
         n4088, n4089, n4090, n4091, n4093, n4096, n4097, n4098, n4099, n4100,
         n4101, n4102, n4103, n4104, n4105, n4108, n4109, n4110, n4111, n4112,
         n4113, n4114, n4115, n4116, n4117, n4118, n4119, n4120, n4121, n4122,
         n4123, n4124, n4125, n4126, n4127, n4128, n4129, n4130, n4131, n4132,
         n4133, n4134, n4135, n4136, n4137, n4138, n4139, n4141, n4142, n4143,
         n4144, n4145, n4146, n4147, n4148, n4149, n4150, n4151, n4152, n4153,
         n4154, n4155, n4156, n4157, n4158, n4159, n4160, n4161, n4162, n4163,
         n4164, n4165, n4166, n4167, n4168, n4169, n4170, n4171, n4172, n4173,
         n4174, n4175, n4176, n4177, n4178, n4179, n4180, n4181, n4182, n4183,
         n4184, n4185, n4186, n4187, n4188, n4189, n4190, n4191, n4192, n4193,
         n4194, n4196, n4197, n4198, n4199, n4200, n4201, n4202, n4203, n4204,
         n4205, n4206, n4207, n4208, n4209, n4210, n4211, n4212, n4213, n4214,
         n4215, n4216, n4217, n4218, n4219, n4220, n4221, n4222, n4223, n4224,
         n4225, n4226, n4227, n4228, n4229, n4230, n4231, n4232, n4233, n4234,
         n4235, n4236, n4237, n4238, n4239, n4240, n4241, n4242, n4243, n4244,
         n4245, n4246, n4247, n4248, n4249, n4250, n4251, n4252, n4253, n4254,
         n4255, n4256, n4257, n4258, n4259, n4260, n4261, n4262, n4263, n4264,
         n4265, n4266, n4267, n4268, n4269, n4270, n4271, n4272, n4273, n4274,
         n4275, n4276, n4277, n4278, n4279, n4280, n4281, n4282, n4283, n4284,
         n4285, n4286, n4287, n4288, n4289, n4290, n4291, n4292, n4293, n4294,
         n4295, n4296, n4300, n4301, n4302, n4303, n4304, n4305, n4306, n4307,
         n4308, n4309, n4310, n4311, n4312, n4313, n4314, n4315, n4316, n4317,
         n4318, n4319, n4320, n4321, n4322, n4323, n4324, n4325, n4327, n4328,
         n4329, n4330, n4331, n4332, n4333, n4334, n4335, n4336, n4337, n4338,
         n4339, n4340, n4341, n4342, n4343, n4344, n4345, n4346, n4347, n4348,
         n4350, n4351, n4352, n4353, n4354, n4355, n4356, n4357, n4358, n4359,
         n4360, n4361, n4362, n4363, n4364, n4365, n4366, n4367, n4368, n4369,
         n4370, n4371, n4372, n4373, n4374, n4375, n4376, n4377, n4378, n4379,
         n4380, n4381, n4382, n4383, n4384, n4385, n4386, n4387, n4388, n4389,
         n4390, n4391, n4392, n4393, n4394, n4395, n4396, n4397, n4398, n4399,
         n4400, n4401, n4402, n4403, n4404, n4405, n4406, n4407, n4408, n4409,
         n4410, n4411, n4412, n4413, n4414, n4415, n4416, n4417, n4418, n4419,
         n4420, n4421, n4422, n4423, n4424, n4425, n4426, n4427, n4428, n4429,
         n4430, n4431, n4432, n4433, n4434, n4435, n4436, n4437, n4438, n4439,
         n4440, n4441, n4442, n4443, n4444, n4445, n4446, n4447, n4448, n4449,
         n4450, n4451, n4452, n4453, n4454, n4455, n4456, n4457, n4458, n4459,
         n4460, n4461, n4462, n4463, n4464, n4465, n4466, n4467, n4468, n4469,
         n4470, n4471, n4472, n4473, n4474, n4475, n4476, n4477, n4478, n4479,
         n4480, n4481, n4482, n4483, n4484, n4485, n4486, n4487, n4488, n4489,
         n4490, n4491, n4492, n4493, n4494, n4495, n4496, n4497, n4498, n4499,
         n4500, n4501, n4502, n4503, n4504, n4505, n4506, n4507, n4508, n4509,
         n4510, n4511, n4512, n4513, n4514, n4515, n4516, n4517, n4518, n4519,
         n4520, n4521, n4522, n4523, n4524, n4525, n4526, n4527, n4528, n4529,
         n4530, n4531, n4532, n4533, n4534, n4535, n4536, n4537, n4538, n4539,
         n4540, n4541, n4542, n4543, n4544, n4545, n4546, n4547, n4548, n4549,
         n4550, n4551, n4552, n4553, n4554, n4555, n4556, n4557, n4558, n4559,
         n4560, n4561, n4562, n4563, n4564, n4565, n4566, n4567, n4568, n4569,
         n4570, n4571, n4572, n4573, n4574, n4575, n4576, n4577, n4578, n4579,
         n4580, n4581, n4582, n4583, n4584, n4585, n4586, n4587, n4588, n4589,
         n4590, n4591, n4592, n4593, n4594, n4595, n4596, n4597, n4598, n4599,
         n4600, n4601, n4602, n4603, n4604, n4605, n4606, n4607, n4608, n4609,
         n4610, n4611, n4612, n4615, n4616, n4617, n4618, n4619, n4620, n4621,
         n4622, n4623, n4624, n4625, n4626, n4627, n4628, n4629, n4630, n4631,
         n4632, n4633, n4634, n4636, n4637, n4638, n4639, n4640, n4641, n4642,
         n4643, n4646, n4647, n4648, n4649, n4650, n4651, n4652, n4653, n4654,
         n4655, n4656, n4660, n4662, n4663, n4664, n4665, n4666, n4667, n4668,
         n4669, n4670, n4672, n4673, n4674, n4676, n4678, n4680, n4681, n4683,
         n4684, n4685, n4686, n4687, n4688, n4689, n4690, n4691, n4692, n4693,
         n4694, n4695, n4697, n4699, n4700, n4701, n4702, n4703, n4704, n4705,
         n4706, n4707, n4708, n4709, n4710, n4711, n4712, n4713, n4714, n4715,
         n4716, n4717, n4718, n4719, n4720, n4721, n4722, n4723, n4724, n4725,
         n4727, n4728, n4729, n4730, n4731, n4732, n4733, n4734, n4735, n4736,
         n4737, n4738, n4739, n4740, n4741, n4742, n4743, n4744, n4745, n4746,
         n4747, n4748, n4749, n4750, n4751, n4752, n4753, n4754, n4755, n4756,
         n4757, n4758, n4759, n4760, n4761, n4762, n4763, n4764, n4765, n4766,
         n4767, n4768, n4769, n4770, n4771, n4772, n4773, n4774, n4775, n4776,
         n4777, n4778, n4779, n4780, n4781, n4782, n4783, n4784, n4785, n4786,
         n4787, n4788, n4789, n4790, n4791, n4792, n4793, n4794, n4795, n4796,
         n4797, n4798, n4799, n4800, n4802, n4803, n4804, n4805, n4806, n4807,
         n4808, n4809, n4810, n4811, n4812, n4816, n4817, n4818, n4819, n4820,
         n4821, n4822, n4823, n4826, n4827, n4828, n4829, n4830, n4831, n4832,
         n4833, n4834, n4835, n4836, n4837, n4838, n4839, n4840, n4841, n4842,
         n4843, n4844, n4845, n4846, n4847, n4848, n4849, n4850, n4851, n4852,
         n4853, n4854, n4855, n4856, n4857, n4858, n4859, n4860, n4861, n4862,
         n4863, n4864, n4865, n4866, n4867, n4868, n4869, n4870, n4871, n4872,
         n4873, n4875, n4876, n4877, n4878, n4879, n4880, n4881, n4882, n4883,
         n4884, n4885, n4886, n4887, n4888, n4889, n4890, n4891, n4893, n4894,
         n4895, n4896, n4897, n4898, n4899, n4900, n4901, n4902, n4903, n4904,
         n4905, n4906, n4907, n4908, n4909, n4910, n4911, n4912, n4913, n4914,
         n4915, n4916, n4917, n4918, n4919, n4920, n4921, n4922, n4923, n4924,
         n4925, n4926, n4927, n4928, n4929, n4930, n4931, n4932, n4933, n4934,
         n4935, n4936, n4937, n4938, n4939, n4941, n4942, n4943, n4944, n4945,
         n4946, n4947, n4948, n4949, n4950, n4951, n4952, n4953, n4954, n4955,
         n4956, n4957, n4958, n4959, n4960, n4961, n4962, n4963, n4964, n4965,
         n4966, n4967, n4968, n4969, n4970, n4971, n4972, n4973, n4974, n4975,
         n4976, n4977, n4978, n4979, n4980, n4981, n4982, n4983, n4984, n4985,
         n4986, n4987, n4988, n4989, n4990, n4991, n4992, n4993, n4994, n4995,
         n4996, n4997, n4998, n4999, n5000, n5001, n5002, n5003, n5004, n5005,
         n5006, n5007, n5008, n5009, n5010, n5011, n5013, n5014, n5015, n5016,
         n5017, n5018, n5019, n5020, n5021, n5022, n5023, n5024, n5025, n5026,
         n5027, n5028, n5029, n5030, n5031, n5032, n5033, n5034, n5035, n5036,
         n5037, n5038, n5039, n5040, n5041, n5042, n5043, n5044, n5045, n5046,
         n5047, n5048, n5049, n5050, n5051, n5052, n5053, n5054, n5055, n5056,
         n5057, n5058, n5059, n5060, n5061, n5062, n5063, n5064, n5065, n5066,
         n5067, n5068, n5070, n5071, n5072, n5073, n5074, n5075, n5076, n5077,
         n5078, n5079, n5080, n5081, n5082, n5083, n5084, n5085, n5086, n5088,
         n5089, n5090, n5091, n5092, n5093, n5094, n5095, n5096, n5097, n5098,
         n5099, n5100, n5101, n5103, n5104, n5105, n5106, n5107, n5108, n5109,
         n5110, n5111, n5112, n5113, n5114, n5115, n5116, n5117, n5118, n5119,
         n5120, n5121, n5122, n5123, n5124, n5125, n5126, n5127, n5128, n5129,
         n5130, n5131, n5132, n5133, n5134, n5135, n5136, n5137, n5138, n5139,
         n5140, n5141, n5142, n5143, n5144, n5145, n5146, n5147, n5148, n5149,
         n5150, n5151, n5152, n5153, n5154, n5155, n5156, n5157, n5158, n5159,
         n5160, n5161, n5162, n5163, n5164, n5165, n5166, n5167, n5168, n5169,
         n5170, n5171, n5172, n5173, n5174, n5175, n5176, n5177, n5178, n5179,
         n5180, n5181, n5182, n5183, n5184, n5185, n5188, n5189, n5190, n5191,
         n5192, n5193, n5194, n5195, n5196, n5197, n5198, n5199, n5200, n5201,
         n5202, n5203, n5204, n5205, n5206, n5207, n5208, n5209, n5210, n5211,
         n5212, n5213, n5214, n5215, n5216, n5217, n5218, n5219, n5220, n5221,
         n5222, n5223, n5224, n5225, n5226, n5227, n5228, n5229, n5230, n5231,
         n5233, n5234, n5235, n5236, n5237, n5238, n5239, n5240, n5241, n5242,
         n5243, n5244, n5245, n5246, n5247, n5248, n5249, n5250, n5251, n5252,
         n5253, n5254, n5255, n5256, n5257, n5258, n5259, n5260, n5261, n5262,
         n5263, n5264, n5265, n5266, n5267, n5268, n5269, n5270, n5271, n5272,
         n5273, n5275, n5276, n5277, n5279, n5281, n5282, n5283, n5284, n5285,
         n5286, n5287, n5288, n5289, n5290, n5291, n5292, n5293, n5294, n5295,
         n5296, n5297, n5298, n5299, n5300, n5301, n5302, n5303, n5304, n5305,
         n5306, n5307, n5308, n5309, n5310, n5311, n5312, n5313, n5314, n5316,
         n5317, n5318, n5319, n5320, n5321, n5322, n5324, n5325, n5326, n5327,
         n5328, n5329, n5330, n5331, n5332, n5333, n5334, n5335, n5336, n5337,
         n5338, n5339, n5340, n5341, n5342, n5343, n5344, n5345, n5346, n5347,
         n5348, n5349, n5350, n5351, n5352, n5353, n5354, n5355, n5357, n5359,
         n5360, n5361, n5362, n5363, n5364, n5365, n5366, n5367, n5368, n5369,
         n5370, n5371, n5372, n5373, n5374, n5375, n5376, n5377, n5378, n5379,
         n5380, n5381, n5382, n5383, n5384, n5385, n5386, n5387, n5388, n5389,
         n5390, n5391, n5392, n5393, n5394, n5395, n5396, n5397, n5398, n5399,
         n5400, n5401, n5402, n5403, n5404, n5405, n5406, n5407, n5408, n5409,
         n5410, n5411, n5412, n5413, n5414, n5415, n5416, n5417, n5418, n5419,
         n5420, n5421, n5422, n5423, n5424, n5425, n5426, n5427, n5428, n5429,
         n5430, n5431, n5432, n5433, n5434, n5435, n5436, n5437, n5438, n5440,
         n5441, n5442, n5443, n5444, n5445, n5446, n5447, n5448, n5449, n5450,
         n5451, n5452, n5453, n5454, n5455, n5456, n5457, n5458, n5459, n5460,
         n5461, n5462, n5463, n5464, n5465, n5466, n5467, n5468, n5470, n5471,
         n5472, n5473, n5474, n5475, n5476, n5477, n5478, n5479, n5480, n5481,
         n5482, n5483, n5484, n5485, n5486, n5487, n5488, n5489, n5490, n5491,
         n5492, n5493, n5494, n5495, n5496, n5497, n5498, n5499, n5500, n5501,
         n5502, n5503, n5505, n5506, n5507, n5508, n5509, n5510, n5511, n5512,
         n5513, n5514, n5515, n5516, n5517, n5518, n5519, n5520, n5521, n5522,
         n5523, n5524, n5525, n5526, n5527, n5528, n5529, n5530, n5531, n5533,
         n5534, n5535, n5536, n5537, n5538, n5539, n5540, n5541, n5542, n5543,
         n5544, n5545, n5546, n5547, n5548, n5549, n5550, n5551, n5552, n5553,
         n5554, n5555, n5556, n5557, n5558, n5559, n5560, n5561, n5562, n5563,
         n5564, n5565, n5566, n5567, n5568, n5569, n5570, n5571, n5572, n5573,
         n5574, n5575, n5576, n5577, n5578, n5580, n5581, n5582, n5583, n5584,
         n5585, n5586, n5587, n5588, n5589, n5590, n5591, n5592, n5593, n5594,
         n5595, n5596, n5597, n5598, n5599, n5600, n5601, n5602, n5603, n5604,
         n5605, n5606, n5607, n5608, n5609, n5610, n5611, n5612, n5613, n5614,
         n5615, n5616, n5617, n5618, n5619, n5620, n5621, n5622, n5623, n5624,
         n5625, n5626, n5627, n5628, n5629, n5630, n5631, n5632, n5633, n5634,
         n5635, n5636, n5637, n5638, n5639, n5640, n5641, n5642, n5643, n5644,
         n5645, n5646, n5647, n5648, n5649, n5650, n5651, n5652, n5653, n5654,
         n5655, n5656, n5657, n5658, n5659, n5660, n5661, n5662, n5663, n5664,
         n5665, n5666, n5667, n5668, n5669, n5670, n5671, n5672, n5673, n5674,
         n5675, n5676, n5677, n5678, n5679, n5680, n5681, n5682, n5683, n5684,
         n5685, n5686, n5687, n5688, n5689, n5690, n5691, n5692, n5693, n5694,
         n5695, n5696, n5697, n5698, n5699, n5700, n5701, n5702, n5703, n5704,
         n5705, n5706, n5707, n5708, n5709, n5710, n5711, n5712, n5713, n5714,
         n5715, n5716, n5717, n5718, n5719, n5720, n5721, n5722, n5723, n5724,
         n5725, n5726, n5727, n5728, n5729, n5730, n5731, n5732, n5733, n5734,
         n5735, n5736, n5737, n5738, n5739, n5740, n5741, n5742, n5743, n5744,
         n5745, n5746, n5747, n5748, n5749, n5750, n5751, n5752, n5753, n5754,
         n5755, n5756, n5757, n5758, n5759, n5760, n5761, n5762, n5763, n5764,
         n5765, n5766, n5767, n5768, n5769, n5770, n5771, n5772, n5773, n5774,
         n5775, n5776, n5777, n5778, n5779, n5780, n5781, n5782, n5783, n5784,
         n5785, n5786, n5787, n5788, n5789, n5790, n5791, n5792, n5793, n5794,
         n5795, n5796, n5797, n5798, n5799, n5800, n5801, n5802, n5803, n5804,
         n5805, n5806, n5807, n5808, n5809, n5810, n5811, n5812, n5813, n5814,
         n5815, n5816, n5817, n5818, n5819, n5820, n5821, n5822, n5823, n5824,
         n5825, n5826, n5827, n5828, n5829, n5830, n5831, n5832, n5833, n5834,
         n5835, n5836, n5837, n5838, n5839, n5840, n5841, n5842, n5843, n5844,
         n5845, n5846, n5847, n5848, n5849, n5850, n5851, n5852, n5853, n5854,
         n5855, n5856, n5857, n5858, n5859, n5860, n5861, n5862, n5863, n5864,
         n5865, n5866, n5867, n5868, n5869, n5870, n5871, n5872, n5873, n5874,
         n5875, n5876, n5877, n5878, n5879, n5880, n5881, n5882, n5883, n5884,
         n5885, n5886, n5887, n5888, n5889, n5890, n5891, n5892, n5893, n5894,
         n5895, n5896, n5897, n5898, n5899, n5900, n5901, n5902, n5903, n5904,
         n5906, n5907, n5908, n5909, n5910, n5911, n5912, n5913, n5914, n5915,
         n5916, n5917, n5918, n5919, n5920, n5921, n5922, n5923, n5924, n5925,
         n5926, n5927, n5928, n5929, n5930, n5931, n5932, n5933, n5934, n5935,
         n5936, n5937, n5938, n5939, n5940, n5941, n5942, n5943, n5944, n5945,
         n5946, n5947, n5948, n5949, n5950, n5951, n5952, n5953, n5954, n5955,
         n5956, n5957, n5958, n5959, n5960, n5961, n5962, n5963, n5964, n5965,
         n5966, n5967, n5968, n5969, n5970, n5971, n5972, n5973, n5974, n5976,
         n5977, n5978, n5979, n5980, n5981, n5982, n5983, n5984, n5985, n5986,
         n5987, n5988, n5989, n5990, n5991, n5992, n5993, n5994, n5995, n5996,
         n5997, n5998, n5999, n6000, n6001, n6002, n6003, n6004, n6005, n6006,
         n6007, n6008, n6009, n6010, n6011, n6012, n6013, n6014, n6015, n6016,
         n6017, n6018, n6019, n6020, n6021, n6022, n6023, n6024, n6025, n6026,
         n6027, n6028, n6029, n6030, n6031, n6032, n6033, n6034, n6035, n6036,
         n6037, n6038, n6039, n6040, n6041, n6042, n6043, n6044, n6045, n6046,
         n6047, n6048, n6049, n6050, n6051, n6052, n6053, n6054, n6055, n6056,
         n6057, n6058, n6059, n6060, n6061, n6062, n6063, n6064, n6065, n6066,
         n6067, n6068, n6070, n6071, n6072, n6073, n6074, n6075, n6076, n6077,
         n6078, n6079, n6080, n6081, n6082, n6083, n6086, n6087, n6088, n6089,
         n6090, n6091, n6092, n6094, n6095, n6096, n6097, n6098, n6099, n6100,
         n6101, n6102, n6103, n6104, n6106, n6107, n6108, n6109, n6110, n6112,
         n6113, n6114, n6115, n6116, n6117, n6118, n6119, n6120, n6121, n6122,
         n6123, n6124, n6125, n6127, n6128, n6129, n6130, n6131, n6132, n6133,
         n6134, n6136, n6137, n6138, n6139, n6140, n6141, n6142, n6143, n6144,
         n6145, n6146, n6147, n6148, n6149, n6151, n6152, n6153, n6154, n6155,
         n6156, n6157, n6158, n6159, n6160, n6161, n6162, n6163, n6164, n6165,
         n6166, n6167, n6168, n6169, n6170, n6171, n6172, n6173, n6174, n6175,
         n6176, n6177, n6178, n6179, n6180, n6181, n6182, n6183, n6184, n6185,
         n6186, n6188, n6189, n6190, n6191, n6192, n6194, n6196, n6197, n6198,
         n6199, n6200, n6201, n6202, n6204, n6205, n6206, n6207, n6208, n6209,
         n6210, n6211, n6212, n6213, n6214, n6215, n6216, n6217, n6218, n6219,
         n6220, n6221, n6222, n6223, n6224, n6225, n6226, n6227, n6228, n6229,
         n6230, n6231, n6232, n6233, n6234, n6235, n6236, n6237, n6238, n6239,
         n6241, n6242, n6243, n6244, n6245, n6246, n6247, n6248, n6249, n6250,
         n6251, n6252, n6253, n6254, n6255, n6257, n6258, n6259, n6260, n6261,
         n6263, n6264, n6265, n6266, n6267, n6268, n6271, n6272, n6273, n6274,
         n6276, n6277, n6280, n6282, n6283, n6287, n6288, n6289, n6290, n6291,
         n6292, n6293, n6294, n6296, n6298, n6300, n6301, n6302, n6303, n6304,
         n6306, n6309, n6310, n6311, n6316, n6317, n6323, n6324, n6325, n6326,
         n6327, n6328, n6329, n6330, n6332, n6333, n6334, n6335, n6336, n6337,
         n6338, n6339, n6340, n6341, n6348, n6352, n6354, n6357, n6359, n6360,
         n6363, n6365, n6366, n6369, n6371, n6372, n6373, n6374, n6375, n6377,
         n6378, n6381, n6382, n6383, n6384, n6385, n6386, n6387, n6388, n6389,
         n6390, n6391, n6392, n6394, n6396, n6397, n6403, n6405, n6406, n6407,
         n6409, n6410, n6411, n6413, n6414, n6415, n6416, n6417, n6418, n6419,
         n6420, n6421, n6422, n6425, n6427, n6428, n6429, n6432, n6433, n6434,
         n6438, n6439, n6440, n6441, n6444, n6445, n6447, n6450, n6451, n6454,
         n6455, n6457, n6458, n6463, n6465, n6467, n6469, n6470, n6471, n6472,
         n6473, n6474, n6475, n6476, n6477, n6478, n6479, n6481, n6482, n6483,
         n6484, n6485, n6486, n6488, n6489, n6490, n6491, n6494, n6495, n6496,
         n6497, n6499, n6500, n6502, n6508, n6509, n6510, n6511, n6513, n6515,
         n6516, n6518, n6520, n6521, n6522, n6523, n6526, n6527, n6529, n6530,
         n6531, n6532, n6533, n6534, n6535, n6537, n6538, n6539, n6540, n6541,
         n6542, n6543, n6544, n6545, n6546, n6547, n6548, n6549, n6550, n6551,
         n6553, n6555, n6556, n6558, n6559, n6560, n6562, n6563, n6564, n6566,
         n6568, n6569, n6570, n6571, n6572, n6573, n6575, n6577, n6579, n6580,
         n6581, n6582, n6583, n6585, n6587, n6589, n6590, n6591, n6592, n6593,
         n6595, n6596, n6597, n6599, n6600, n6602, n6603, n6604, n6606, n6607,
         n6608, n6609, n6610, n6611, n6612, n6614, n6615, n6616, n6617, n6618,
         n6620, n6621, n6622, n6623, n6624, n6625, n6626, n6627, n6628, n6629,
         n6630, n6631, n6632, n6633, n6634, n6635, n6636, n6637, n6639, n6640,
         n6641, n6642, n6643, n6645, n6646, n6647, n6648, n6649, n6650, n6651,
         n6652, n6653, n6655, n6657, n6658, n6659, n6660, n6662, n6663, n6664,
         n6665, n6666, n6667, n6668, n6670, n6671, n6672, n6673, n6674, n6675,
         n6676, n6677, n6678, n6679, n6680, n6681, n6682, n6683, n6684, n6685,
         n6686, n6687, n6688, n6689, n6690, n6691, n6692, n6693, n6694, n6696,
         n6697, n6698, n6699, n6700, n6701, n6702, n6704, n6705, n6706, n6707,
         n6708, n6709, n6710, n6711, n6712, n6714, n6715, n6717, n6718, n6720,
         n6721, n6722, n6723, n6724, n6725, n6726, n6727, n6728, n6729, n6730,
         n6731, n6732, n6733, n6734, n6735, n6737, n6738, n6739, n6740, n6741,
         n6742, n6743, n6744, n6745, n6746, n6747, n6748, n6749, n6750, n6751,
         n6752, n6753, n6754, n6755, n6756, n6757, n6758, n6759, n6760, n6761,
         n6762, n6763, n6765, n6766, n6767, n6768, n6769, n6770, n6771, n6772,
         n6773, n6774, n6775, n6776, n6777, n6778, n6779, n6781, n6782, n6783,
         n6784, n6785, n6786, n6787, n6788, n6789, n6790, n6791, n6792, n6793,
         n6794, n6795, n6796, n6797, n6798, n6799, n6800, n6801, n6802, n6803,
         n6804, n6805, n6806, n6807, n6808, n6809, n6810, n6811, n6812, n6813,
         n6814, n6815, n6816, n6817, n6818, n6819, n6820, n6821, n6822, n6823,
         n6824, n6825, n6826, n6827, n6828, n6829, n6831, n6832, n6833, n6834,
         n6835, n6836, n6837, n6838, n6839, n6840, n6841, n6842, n6843, n6844,
         n6845, n6847, n6848, n6849, n6850, n6851, n6852, n6853, n6854, n6855,
         n6856, n6857, n6858, n6859, n6860, n6861, n6862, n6863, n6864, n6865,
         n6866, n6867, n6868, n6869, n6870, n6871, n6872, n6873, n6874, n6875,
         n6876, n6877, n6878, n6879, n6880, n6881, n6882, n6884, n6885, n6886,
         n6888, n6890, n6891, n6893, n6895, n6896, n6897, n6898, n6899, n6900,
         n6901, n6902, n6903, n6904, n6905, n6906, n6907, n6908, n6909, n6911,
         n6913, n6914, n6915, n6916, n6917, n6918, n6919, n6920, n6921, n6923,
         n6924, n6925, n6926, n6927, n6928, n6929, n6930, n6931, n6932, n6933,
         n6934, n6935, n6936, n6937, n6938, n6939, n6940, n6941, n6942, n6943,
         n6944, n6945, n6946, n6947, n6948, n6949, n6950, n6951, n6952, n6953,
         n6954, n6955, n6956, n6957, n6958, n6959, n6960, n6961, n6962, n6963,
         n6964, n6965, n6966, n6967, n6968, n6969, n6970, n6971, n6972, n6973,
         n6974, n6975, n6976, n6977, n6978, n6979, n6980, n6981, n6982, n6983,
         n6984, n6985, n6986, n6987, n6988, n6989, n6991, n6992, n6993, n6994,
         n6995, n6996, n6997, n6998, n6999, n7000, n7001, n7002, n7003, n7004,
         n7005, n7006, n7007, n7008, n7009, n7010, n7011, n7012, n7013, n7014,
         n7016, n7017, n7018, n7020, n7021, n7022, n7023, n7024, n7025, n7026,
         n7027, n7028, n7029, n7030, n7031, n7032, n7033, n7034, n7035, n7036,
         n7037, n7038, n7039, n7041, n7042, n7043, n7044, n7045, n7046, n7047,
         n7048, n7049, n7050, n7051, n7052, n7053, n7054, n7055, n7056, n7057,
         n7058, n7061, n7063, n7064, n7065, n7066, n7068, n7069, n7070, n7071,
         n7072, n7073, n7074, n7075, n7076, n7077, n7078, n7080, n7081, n7082,
         n7083, n7084, n7086, n7087, n7089, n7090, n7091, n7092, n7093, n7094,
         n7095, n7096, n7097, n7098, n7099, n7100, n7101, n7103, n7104, n7106,
         n7107, n7110, n7111, n7112, n7113, n7114, n7115, n7116, n7117, n7118,
         n7120, n7121, n7122, n7123, n7124, n7125, n7126, n7127, n7128, n7129,
         n7130, n7131, n7132, n7133, n7134, n7135, n7136, n7137, n7138, n7139,
         n7140, n7141, n7142, n7143, n7144, n7145, n7146, n7147, n7148, n7149,
         n7150, n7151, n7152, n7153, n7154, n7155, n7156, n7157, n7158, n7159,
         n7160, n7161, n7162, n7163, n7164, n7165, n7166, n7167, n7168, n7169,
         n7170, n7171, n7172, n7173, n7174, n7177, n7178, n7180, n7181, n7182,
         n7183, n7184, n7185, n7186, n7187, n7188, n7189, n7190, n7191, n7192,
         n7193, n7194, n7195, n7196, n7197, n7199, n7200, n7201, n7202, n7203,
         n7204, n7205, n7206, n7207, n7208, n7209, n7210, n7211, n7212, n7213,
         n7214, n7215, n7216, n7217, n7218, n7219, n7220, n7221, n7222, n7223,
         n7224, n7225, n7226, n7227, n7228, n7229, n7230, n7231, n7232, n7233,
         n7234, n7235, n7236, n7237, n7239, n7240, n7241, n7242, n7245, n7246,
         n7247, n7248, n7249, n7250, n7254, n7255, n7256, n7257, n7258, n7259,
         n7261, n7262, n7263, n7264, n7265, n7267, n7268, n7269, n7270, n7271,
         n7272, n7273, n7274, n7275, n7276, n7277, n7278, n7279, n7280, n7281,
         n7282, n7283, n7284, n7285, n7286, n7287, n7288, n7289, n7290, n7291,
         n7292, n7294, n7295, n7296, n7298, n7299, n7300, n7301, n7302, n7303,
         n7304, n7305, n7306, n7307, n7308, n7309, n7310, n7311, n7312, n7313,
         n7314, n7315, n7316, n7317, n7318, n7319, n7320, n7321, n7322, n7323,
         n7324, n7325, n7326, n7327, n7328, n7329, n7330, n7331, n7332, n7333,
         n7334, n7335, n7336, n7337, n7338, n7339, n7340, n7341, n7342, n7343,
         n7344, n7345, n7346, n7347, n7348, n7349, n7350, n7351, n7352, n7353,
         n7354, n7355, n7356, n7357, n7358, n7359, n7360, n7361, n7362, n7363,
         n7364, n7365, n7366, n7367, n7368, n7369, n7370, n7371, n7372, n7373,
         n7374, n7375, n7376, n7377, n7378, n7380, n7381, n7382, n7383, n7384,
         n7385, n7386, n7388, n7389, n7390, n7391, n7392, n7393, n7394, n7395,
         n7397, n7398, n7399, n7400, n7401, n7402, n7403, n7404, n7405, n7406,
         n7407, n7408, n7409, n7410, n7412, n7413, n7414, n7415, n7416, n7417,
         n7418, n7419, n7420, n7421, n7422, n7423, n7424, n7425, n7426, n7428,
         n7429, n7430, n7431, n7432, n7433, n7434, n7435, n7436, n7437, n7439,
         n7440, n7441, n7442, n7443, n7444, n7445, n7446, n7448, n7449, n7450,
         n7451, n7452, n7453, n7454, n7455, n7456, n7457, n7458, n7459, n7460,
         n7461, n7462, n7463, n7464, n7465, n7466, n7467, n7468, n7469, n7470,
         n7471, n7472, n7473, n7474, n7475, n7476, n7477, n7478, n7479, n7480,
         n7481, n7482, n7483, n7484, n7485, n7486, n7487, n7488, n7489, n7490,
         n7491, n7492, n7493, n7494, n7495, n7496, n7497, n7498, n7499, n7500,
         n7501, n7502, n7503, n7504, n7505, n7506, n7507, n7508, n7509, n7510,
         n7511, n7512, n7513, n7515, n7516, n7517, n7518, n7519, n7520, n7521,
         n7522, n7523, n7524, n7525, n7526, n7527, n7528, n7529, n7530, n7531,
         n7532, n7533, n7534, n7535, n7536, n7537, n7538, n7539, n7540, n7541,
         n7542, n7543, n7544, n7545, n7546, n7547, n7548, n7549, n7550, n7551,
         n7552, n7553, n7554, n7555, n7556, n7557, n7558, n7559, n7560, n7561,
         n7562, n7563, n7564, n7565, n7566, n7567, n7568, n7569, n7570, n7571,
         n7572, n7573, n7574, n7575, n7576, n7577, n7578, n7579, n7580, n7581,
         n7582, n7583, n7584, n7585, n7586, n7587, n7588, n7589, n7590, n7591,
         n7592, n7593, n7594, n7595, n7596, n7597, n7598, n7599, n7600, n7602,
         n7603, n7604, n7605, n7606, n7607, n7608, n7609, n7610, n7611, n7612,
         n7613, n7614, n7615, n7616, n7617, n7618, n7619, n7620, n7621, n7622,
         n7623, n7624, n7625, n7626, n7627, n7628, n7629, n7630, n7631, n7632,
         n7633, n7634, n7635, n7636, n7637, n7638, n7639, n7640, n7641, n7642,
         n7643, n7644, n7645, n7646, n7647, n7648, n7649, n7650, n7651, n7652,
         n7653, n7654, n7655, n7656, n7657, n7658, n7659, n7660, n7661, n7662,
         n7663, n7664, n7665, n7666, n7667, n7668, n7669, n7670, n7671, n7672,
         n7673, n7674, n7675, n7676, n7677, n7678, n7679, n7680, n7681, n7682,
         n7683, n7684, n7685, n7686, n7687, n7688, n7689, n7690, n7691, n7692,
         n7693, n7694, n7695, n7696, n7697, n7698, n7699, n7700, n7701, n7702,
         n7703, n7704, n7705, n7706, n7707, n7708, n7709, n7710, n7711, n7712,
         n7713, n7714, n7715, n7716, n7717, n7718, n7719, n7720, n7721, n7722,
         n7723, n7724, n7725, n7726, n7727, n7728, n7729, n7730, n7731, n7732,
         n7733, n7734, n7735, n7736, n7737, n7738, n7739, n7740, n7741, n7742,
         n7743, n7744, n7745, n7746, n7747, n7748, n7749, n7750, n7751, n7752,
         n7753, n7754, n7755, n7756, n7757, n7758, n7759, n7760, n7761, n7762,
         n7763, n7764, n7765, n7766, n7767, n7768, n7769, n7770, n7771, n7772,
         n7773, n7774, n7775, n7776, n7777, n7778, n7779, n7780, n7781, n7782,
         n7783, n7784, n7785, n7786, n7787, n7788, n7789, n7790, n7791, n7792,
         n7793, n7794, n7795, n7796, n7797, n7798, n7799, n7800, n7801, n7802,
         n7803, n7804, n7805, n7806, n7807, n7808, n7809, n7810, n7811, n7812,
         n7813, n7814, n7815, n7816, n7817, n7818, n7819, n7820, n7821, n7822,
         n7823, n7824, n7825, n7826, n7827, n7828, n7829, n7830, n7831, n7832,
         n7833;
  wire   [5:0] up_addr;
  wire   [5:0] left_addr;
  wire   [2:0] \eda_controller/current_state ;
  wire   [3:0] \eda_fifos/sync_fifo_upleft/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_upleft/wr_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_up/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_up/wr_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_upright/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_upright/wr_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_left/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_left/wr_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_right/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_right/wr_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_downleft/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_downleft/wr_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_down/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_down/wr_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_downright/rd_addr ;
  wire   [3:0] \eda_fifos/sync_fifo_downright/wr_addr ;

  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upleft/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2632), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upleft/rd_addr [0]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upleft/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2633), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upleft/rd_addr [1]) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][0][7]  ( .D(
        n3173), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][0][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][2][2]  ( .D(
        n3162), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][2][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][2][6]  ( .D(
        n3158), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][2][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][0][1]  ( .D(
        n3131), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][0][1] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][0][3]  ( .D(
        n3129), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][0][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][0][5]  ( .D(
        n3127), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][0][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][2][0]  ( .D(
        n3116), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][2][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][3][0]  ( .D(
        n3108), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][3][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][4][4]  ( .D(
        n3096), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][4][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][5][3]  ( .D(
        n3089), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][5][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][0][3]  ( .D(
        n3081), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][2][2]  ( .D(
        n3066), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][2][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][3][2]  ( .D(
        n3058), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][3][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][3][3]  ( .D(
        n3057), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][3][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][4][2]  ( .D(
        n3050), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][4][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][4][3]  ( .D(
        n3049), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][4][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][4][5]  ( .D(
        n3047), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][4][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][5][3]  ( .D(
        n3041), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][5][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][5][5]  ( .D(
        n3039), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][5][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][0][6]  ( .D(
        n3030), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][2][0]  ( .D(
        n3020), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][2][4]  ( .D(
        n3016), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][2][7]  ( .D(
        n3013), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][4][5]  ( .D(
        n2999), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][4][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][4][7]  ( .D(
        n2997), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][4][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][5][3]  ( .D(
        n2993), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][5][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][0][0]  ( .D(
        n2988), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][0][7]  ( .D(
        n2981), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][2][0]  ( .D(
        n2972), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][2][1]  ( .D(
        n2971), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][1] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][2][2]  ( .D(
        n2970), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][2][4]  ( .D(
        n2968), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][2][6]  ( .D(
        n2966), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][3][0]  ( .D(
        n2964), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][3][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][3][3]  ( .D(
        n2961), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][3][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][3][5]  ( .D(
        n2959), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][3][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][3][6]  ( .D(
        n2958), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][3][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][4][5]  ( .D(
        n2951), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][4][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][4][6]  ( .D(
        n2950), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][4][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][5][0]  ( .D(
        n2948), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][5][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][5][3]  ( .D(
        n2945), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][5][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][5][5]  ( .D(
        n2943), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][5][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][0][0]  ( .D(
        n2940), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][0][1]  ( .D(
        n2939), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][1] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][0][2]  ( .D(
        n2938), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][0][7]  ( .D(
        n2933), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][2][6]  ( .D(
        n2918), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][2][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][3][0]  ( .D(
        n2916), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][3][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][3][6]  ( .D(
        n2910), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][3][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][4][0]  ( .D(
        n2908), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][4][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][4][5]  ( .D(
        n2903), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][4][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][4][7]  ( .D(
        n2901), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][4][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][5][3]  ( .D(
        n2897), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][5][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_iterated_ram/iterated_all_reg  ( .D(
        \eda_iterated_ram/N741 ), .CK(clk), .RN(reset_n), .Q(iterated_all) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_up/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2676), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/rd_addr [0]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upright/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2720), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/rd_addr [0]) );
  dti_28hc_7t_30_ffqa01lpax4 \eda_fifos/sync_fifo_downleft/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2546), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/rd_addr [0]) );
  dti_28hc_7t_30_ffqa01x4 \eda_controller/center_addr_reg[2]  ( .D(n3189), 
        .CK(clk), .RN(reset_n), .Q(up_addr[2]) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[4][4]  ( .D(
        n2455), .CK(clk), .SN(reset_n), .Q(\matrix_output[4][4] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[4][5]  ( .D(
        n2456), .CK(clk), .SN(reset_n), .Q(\matrix_output[4][5] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[5][0]  ( .D(
        n2457), .CK(clk), .SN(reset_n), .Q(\matrix_output[5][0] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[5][1]  ( .D(
        n2458), .CK(clk), .SN(reset_n), .Q(\matrix_output[5][1] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[5][2]  ( .D(
        n2459), .CK(clk), .SN(reset_n), .Q(\matrix_output[5][2] ) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2539), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2537), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][3] ) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2540), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2665), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2666), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][2] ) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2670), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_fifos/sync_fifo_downleft/comparator_inst/o_full_reg  ( 
        .D(\eda_fifos/sync_fifo_downleft/comparator_inst/N53 ), .CK(n7449), 
        .RN(reset_n), .Q(\eda_fifos/sync_fifo_downleft/o_full ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_controller/current_state_reg[1]  ( .D(
        n3185), .CK(clk), .RN(reset_n), .Q(\eda_controller/current_state [1])
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_controller/current_state_reg[0]  ( .D(
        n3182), .CK(clk), .RN(reset_n), .Q(\eda_controller/current_state [0])
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_fifos/sync_fifo_down/comparator_inst/o_full_reg  ( 
        .D(\eda_fifos/sync_fifo_down/comparator_inst/N53 ), .CK(n7449), .RN(
        reset_n), .Q(\eda_fifos/sync_fifo_down/o_full ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_controller/done_cld_reg  ( .D(n7450), 
        .CE(n7448), .CK(clk), .RN(reset_n), .Q(done) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_controller/current_state_reg[2]  ( .D(
        \eda_controller/next_state[2] ), .CK(clk), .RN(reset_n), .Q(
        \eda_controller/current_state [2]) );
  dti_28hc_7t_30_ffqbcka01fox2 \eda_fifos/sync_fifo_downright/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2854), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/wr_addr [1]) );
  dti_28hc_7t_30_ffqbcka01fsux4 \eda_strobe_ram/strb_memory_reg[2][2]  ( .D(
        n2478), .CK(clk), .RN(reset_n), .Q(\strb_value[2][2] ) );
  dti_28hc_7t_30_ffqbcka01fsux4 \eda_strobe_ram/strb_memory_reg[3][2]  ( .D(
        n2472), .CK(clk), .RN(reset_n), .Q(\strb_value[3][2] ) );
  dti_28hc_7t_30_ffqa01x4 \eda_controller/center_addr_reg[1]  ( .D(n3190), 
        .CK(clk), .RN(reset_n), .Q(up_addr[1]) );
  dti_28hc_7t_30_ffqbcka01fsux4 \eda_strobe_ram/strb_memory_reg[2][1]  ( .D(
        n2479), .CK(clk), .RN(reset_n), .Q(\strb_value[2][1] ) );
  dti_28hc_7t_30_ffqbckx4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n2521), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][5] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][1][2]  ( .D(n3026), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][2] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][1][0]  ( .D(n3028), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][0] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][1][4]  ( .D(n3072), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][4] ) );
  dti_28hc_7t_30_ffqbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n2616), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][0][1]  ( .D(n2987), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][1] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][0][7]  ( .D(n3077), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][7] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][1][6]  ( .D(n3070), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][6] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][2][5]  ( .D(n2919), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][2][5] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][1][4]  ( .D(n2928), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][1][4] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][0][3]  ( .D(n2937), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][3] ) );
  dti_28hc_7t_30_ffqbcka01fox2 \eda_fifos/sync_fifo_up/write_control_inst/wr_addr_reg[2]  ( 
        .D(n2672), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/wr_addr [2]) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][1][2]  ( .D(n2978), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][2] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][1][1]  ( .D(n3027), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][1] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][1][6]  ( .D(n3022), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][6] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][1][4]  ( .D(n3024), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][4] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][2][5]  ( .D(n2967), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][5] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][0][7]  ( .D(n3029), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][7] ) );
  dti_28hc_7t_30_ffqa01x4 \eda_controller/center_addr_reg[0]  ( .D(n3705), 
        .CK(clk), .RN(reset_n), .Q(up_addr[0]) );
  dti_28hc_7t_30_ffqbcka01fox2 \eda_fifos/sync_fifo_down/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2588), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/rd_addr [2]) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][0][5]  ( .D(n2935), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][5] ) );
  dti_28hc_7t_30_ffqbckx4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2520), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][4] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][1][2]  ( .D(n2930), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][1][2] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][2][1]  ( .D(n3019), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][1] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_up/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2673), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/wr_addr [0]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upleft/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2634), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upleft/wr_addr [1]) );
  dti_28hc_7t_30_ffqbckx4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n2509), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqbckx4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n2508), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][4] ) );
  dti_28hc_7t_30_ffqbckx4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n2510), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][0] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_fifos/sync_fifo_upleft/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2630), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upleft/rd_addr [3]) );
  dti_28hc_7t_30_ffqa01lpax1 \eda_fifos/sync_fifo_down/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2590), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/rd_addr [1]) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][0][0]  ( .D(n3084), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][0] ) );
  dti_28hc_7t_30_ffqbcka01fox2 \eda_fifos/sync_fifo_downleft/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2891), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/wr_addr [1]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[5][1][1]  ( .D(n2931), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][1][1] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[5][2][1]  ( .D(n2923), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][2][1] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[2][0][4]  ( .D(n3080), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][4] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][2][3]  ( .D(
        n2921), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][2][3] )
         );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[2][2][1]  ( .D(n3067), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][2][1] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[5][0][4]  ( .D(n2936), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][4] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[3][0][3]  ( .D(n3033), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][3] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[4][0][4]  ( .D(n2984), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][4] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][3][3]  ( .D(
        n2913), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][3][3] )
         );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[4][1][6]  ( .D(n2974), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][6] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[2][1][0]  ( .D(n3076), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][0] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[3][2][6]  ( .D(n3014), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][6] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][0][5]  ( .D(
        n3175), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][0][5] )
         );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[4][2][7]  ( .D(n2965), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][7] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[2][2][7]  ( .D(n3061), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][2][7] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][5][7]  ( .D(
        n2893), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][5][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][4][7]  ( .D(
        n3141), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][4][7] )
         );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_downright/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2853), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/rd_addr [1]) );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_up/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2675), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/rd_addr [2]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_down/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2587), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/rd_addr [3]) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[0][0]  ( .D(
        n2438), .CK(clk), .SN(reset_n), .Q(\matrix_output[0][0] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[0][1]  ( .D(
        n2481), .CK(clk), .SN(reset_n), .Q(\matrix_output[0][1] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[0][2]  ( .D(
        n2482), .CK(clk), .SN(reset_n), .Q(\matrix_output[0][2] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[0][3]  ( .D(
        n2483), .CK(clk), .SN(reset_n), .Q(\matrix_output[0][3] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[0][4]  ( .D(
        n2484), .CK(clk), .SN(reset_n), .Q(\matrix_output[0][4] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[0][5]  ( .D(
        n2485), .CK(clk), .SN(reset_n), .Q(\matrix_output[0][5] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[1][1]  ( .D(
        n2487), .CK(clk), .SN(reset_n), .Q(\matrix_output[1][1] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[1][2]  ( .D(
        n2488), .CK(clk), .SN(reset_n), .Q(\matrix_output[1][2] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[1][3]  ( .D(
        n2489), .CK(clk), .SN(reset_n), .Q(\matrix_output[1][3] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[1][4]  ( .D(
        n2490), .CK(clk), .SN(reset_n), .Q(\matrix_output[1][4] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[2][0]  ( .D(
        n2439), .CK(clk), .SN(reset_n), .Q(\matrix_output[2][0] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[2][2]  ( .D(
        n2441), .CK(clk), .SN(reset_n), .Q(\matrix_output[2][2] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[2][3]  ( .D(
        n2442), .CK(clk), .SN(reset_n), .Q(\matrix_output[2][3] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[2][4]  ( .D(
        n2443), .CK(clk), .SN(reset_n), .Q(\matrix_output[2][4] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[2][5]  ( .D(
        n2444), .CK(clk), .SN(reset_n), .Q(\matrix_output[2][5] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[3][0]  ( .D(
        n2445), .CK(clk), .SN(reset_n), .Q(\matrix_output[3][0] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[3][1]  ( .D(
        n2446), .CK(clk), .SN(reset_n), .Q(\matrix_output[3][1] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[3][2]  ( .D(
        n2447), .CK(clk), .SN(reset_n), .Q(\matrix_output[3][2] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[3][3]  ( .D(
        n2448), .CK(clk), .SN(reset_n), .Q(\matrix_output[3][3] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[3][5]  ( .D(
        n2450), .CK(clk), .SN(reset_n), .Q(\matrix_output[3][5] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[4][0]  ( .D(
        n2451), .CK(clk), .SN(reset_n), .Q(\matrix_output[4][0] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[4][1]  ( .D(
        n2452), .CK(clk), .SN(reset_n), .Q(\matrix_output[4][1] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[4][2]  ( .D(
        n2453), .CK(clk), .SN(reset_n), .Q(\matrix_output[4][2] ) );
  dti_28hc_7t_30_muxi21x1 U3245 ( .D0(n6968), .D1(n6967), .S(n7273), .Z(n2660)
         );
  dti_28hc_7t_30_muxi21x1 U3255 ( .D0(n6913), .D1(n6967), .S(n7241), .Z(n2573)
         );
  dti_28hc_7t_30_oai112rex1 U3256 ( .C1(n7393), .C2(n3559), .A(n6044), .B(
        n5925), .Z(n2454) );
  dti_28hc_7t_30_muxi21x1 U3258 ( .D0(n3775), .D1(n7216), .S(n7215), .Z(n2772)
         );
  dti_28hc_7t_30_muxi21x1 U3261 ( .D0(n3775), .D1(n7208), .S(n7207), .Z(n2608)
         );
  dti_28hc_7t_30_muxi21x1 U3264 ( .D0(n7074), .D1(n7061), .S(n7247), .Z(n2819)
         );
  dti_28hc_7t_30_muxi21x1 U3267 ( .D0(n7074), .D1(n7073), .S(n7230), .Z(n2519)
         );
  dti_28hc_7t_30_muxi21x1 U3268 ( .D0(n7074), .D1(n7048), .S(n7268), .Z(n2649)
         );
  dti_28hc_7t_30_muxi21x1 U3269 ( .D0(n3775), .D1(n7200), .S(n7199), .Z(n2696)
         );
  dti_28hc_7t_30_muxi21x1 U3272 ( .D0(n3775), .D1(n7194), .S(n7193), .Z(n2684)
         );
  dti_28hc_7t_30_muxi21x1 U3279 ( .D0(n3565), .D1(n7441), .S(n7271), .Z(n2668)
         );
  dti_28hc_7t_30_muxi21x1 U3287 ( .D0(n7074), .D1(n6209), .S(n6234), .Z(n2705)
         );
  dti_28hc_7t_30_invx1 U3302 ( .A(pixel_in[5]), .Z(n6488) );
  dti_28hc_7t_30_invx1 U3303 ( .A(pixel_in[6]), .Z(n6304) );
  dti_28hc_7t_30_invx1 U3304 ( .A(pixel_in[7]), .Z(n6414) );
  dti_28hc_7t_30_invx1 U3305 ( .A(pixel_in[2]), .Z(n6378) );
  dti_28hc_7t_30_invx1 U3306 ( .A(n7127), .Z(n7111) );
  dti_28hc_7t_30_or2x1 U3307 ( .A(n6259), .B(n6292), .Z(n6521) );
  dti_28hc_7t_30_or2x1 U3308 ( .A(n6294), .B(n6259), .Z(n6543) );
  dti_28hc_7t_30_or2x1 U3309 ( .A(n6296), .B(n6259), .Z(n6541) );
  dti_28hc_7t_30_or2x1 U3310 ( .A(n6266), .B(n6292), .Z(n6535) );
  dti_28hc_7t_30_or2x1 U3311 ( .A(n6303), .B(n6288), .Z(n6549) );
  dti_28hc_7t_30_or2x1 U3312 ( .A(n6294), .B(n6266), .Z(n6533) );
  dti_28hc_7t_30_or2x1 U3313 ( .A(n6300), .B(n6288), .Z(n6558) );
  dti_28hc_7t_30_or2x1 U3314 ( .A(n6300), .B(n6273), .Z(n6579) );
  dti_28hc_7t_30_nor2x1 U3315 ( .A(n6296), .B(n6273), .Z(n6575) );
  dti_28hc_7t_30_nor2x1 U3316 ( .A(n6298), .B(n6273), .Z(n6573) );
  dti_28hc_7t_30_or2x1 U3318 ( .A(n6259), .B(n6300), .Z(n6545) );
  dti_28hc_7t_30_or2x1 U3319 ( .A(n6266), .B(n6303), .Z(n6529) );
  dti_28hc_7t_30_nor2x1 U3322 ( .A(n6294), .B(n6288), .Z(n6555) );
  dti_28hc_7t_30_oai112x1 U3323 ( .C1(
        \eda_fifos/sync_fifo_downleft/wr_addr [3]), .C2(n7166), .A(n6721), .B(
        n6720), .Z(n6722) );
  dti_28hc_7t_30_nor2x1 U3326 ( .A(n6294), .B(n6302), .Z(n6589) );
  dti_28hc_7t_30_invx1 U3328 ( .A(pixel_in[0]), .Z(n6593) );
  dti_28hc_7t_30_invx1 U3357 ( .A(n5440), .Z(n3254) );
  dti_28hc_7t_30_nor2x1 U3364 ( .A(n6877), .B(n6876), .Z(n6162) );
  dti_28hc_7t_30_nand3hpx1 U3381 ( .A(n5566), .B(n5506), .C(n5567), .Z(n3551)
         );
  dti_28hc_7t_30_and2hpx4 U3404 ( .A(n4445), .B(n7182), .Z(n7075) );
  dti_28hc_7t_30_and2x1 U3415 ( .A(n6652), .B(n6633), .Z(n3273) );
  dti_28hc_7t_30_nor2x1 U3416 ( .A(n3326), .B(n3325), .Z(n3324) );
  dti_28hc_7t_30_invx3 U3419 ( .A(n6971), .Z(n6801) );
  dti_28hc_7t_30_invx1 U3429 ( .A(new_pixel), .Z(n3264) );
  dti_28hc_7t_30_invx1 U3430 ( .A(n6616), .Z(n3265) );
  dti_28hc_7t_30_invx1 U3440 ( .A(n4966), .Z(n4354) );
  dti_28hc_7t_30_invx1 U3449 ( .A(n3716), .Z(n6072) );
  dti_28hc_7t_30_nor2x1 U3450 ( .A(n6181), .B(n3846), .Z(n3852) );
  dti_28hc_7t_30_invx1 U3454 ( .A(n7399), .Z(n7404) );
  dti_28hc_7t_30_nor2x1 U3455 ( .A(n3859), .B(n3801), .Z(n3800) );
  dti_28hc_7t_30_and2x1 U3462 ( .A(n5433), .B(n5237), .Z(n3767) );
  dti_28hc_7t_30_nand2x1 U3469 ( .A(n6044), .B(n5227), .Z(n7399) );
  dti_28hc_7t_30_and2x1 U3470 ( .A(n5433), .B(n3775), .Z(n3434) );
  dti_28hc_7t_30_invx1 U3471 ( .A(n3671), .Z(n3289) );
  dti_28hc_7t_30_nor2x1 U3472 ( .A(n3314), .B(n6967), .Z(n3670) );
  dti_28hc_7t_30_bufx1 U3473 ( .A(n5430), .Z(n3565) );
  dti_28hc_7t_30_and2x1 U3478 ( .A(n5283), .B(n5282), .Z(n7127) );
  dti_28hc_7t_30_nand2x2 U3481 ( .A(start), .B(n7448), .Z(n6044) );
  dti_28hc_7t_30_nor2x1 U3485 ( .A(n5161), .B(n5476), .Z(n7448) );
  dti_28hc_7t_30_nand2x1 U3493 ( .A(n7286), .B(n3481), .Z(n3480) );
  dti_28hc_7t_30_nor3px2 U3496 ( .A(n6822), .B(n4927), .C(n4926), .Z(n5352) );
  dti_28hc_7t_30_invx2 U3497 ( .A(n5279), .Z(n3649) );
  dti_28hc_7t_30_nand2x1 U3506 ( .A(n6832), .B(n3473), .Z(n3472) );
  dti_28hc_7t_30_invx1 U3510 ( .A(n4946), .Z(n3464) );
  dti_28hc_7t_30_invx1 U3514 ( .A(n4906), .Z(n4907) );
  dti_28hc_7t_30_invx1 U3515 ( .A(iterated_all), .Z(n5478) );
  dti_28hc_7t_30_nor2x2 U3518 ( .A(n6645), .B(n4664), .Z(n3849) );
  dti_28hc_7t_30_nor2px1 U3528 ( .A(n4841), .B(n3702), .Z(n3513) );
  dti_28hc_7t_30_nand2x1 U3529 ( .A(n5155), .B(n4686), .Z(n4970) );
  dti_28hc_7t_30_invx1 U3533 ( .A(n5223), .Z(n5523) );
  dti_28hc_7t_30_nand2px2 U3538 ( .A(n5501), .B(new_pixel), .Z(n6645) );
  dti_28hc_7t_30_nor3x1 U3539 ( .A(n6926), .B(n3566), .C(n3724), .Z(n3726) );
  dti_28hc_7t_30_and2x1 U3546 ( .A(n6727), .B(n6725), .Z(n4899) );
  dti_28hc_7t_30_bufx1 U3549 ( .A(n4888), .Z(n4886) );
  dti_28hc_7t_30_xor2bx1 U3563 ( .A(\eda_fifos/sync_fifo_right/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_right/wr_addr [0]), .Z(n6779) );
  dti_28hc_7t_30_and2x1 U3567 ( .A(n4936), .B(n4890), .Z(n3301) );
  dti_28hc_7t_30_xnor2bx1 U3568 ( .A(n5873), .B(n4709), .Z(n4964) );
  dti_28hc_7t_30_invx1 U3569 ( .A(n6192), .Z(n3255) );
  dti_28hc_7t_30_invx1 U3570 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [2]), 
        .Z(n6943) );
  dti_28hc_7t_30_nand4px1 U3573 ( .A(n4135), .B(n4132), .C(n4133), .D(n4134), 
        .Z(n5867) );
  dti_28hc_7t_30_or2hpx2 U3574 ( .A(n6609), .B(n4769), .Z(n3839) );
  dti_28hc_7t_30_nand2x2 U3580 ( .A(n5282), .B(n3802), .Z(n4081) );
  dti_28hc_7t_30_aoi22x3 U3591 ( .A1(\eda_iterated_ram/current_row[0][4] ), 
        .A2(n6597), .B1(\eda_iterated_ram/current_row[2][4] ), .B2(n4856), .Z(
        n3520) );
  dti_28hc_7t_30_oai22hpx1 U3596 ( .A1(n5667), .A2(n5666), .B1(n5665), .B2(
        n5737), .Z(n5778) );
  dti_28hc_7t_30_nand3hpx1 U3602 ( .A(n3375), .B(n4728), .C(n4729), .Z(n5687)
         );
  dti_28hc_7t_30_aoi22x1 U3603 ( .A1(n3593), .A2(
        \eda_img_ram/img_memory[3][3][0] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[3][2][0] ), .Z(n4449) );
  dti_28hc_7t_30_aoi22x1 U3604 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[4][0][0] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[4][1][0] ), .Z(n4460) );
  dti_28hc_7t_30_nand3hpx1 U3608 ( .A(n3792), .B(n5057), .C(n5058), .Z(n5614)
         );
  dti_28hc_7t_30_aoi22x1 U3621 ( .A1(n5105), .A2(n3321), .B1(n5103), .B2(n5589), .Z(n4849) );
  dti_28hc_7t_30_and2x1 U3624 ( .A(n4716), .B(n4717), .Z(n3231) );
  dti_28hc_7t_30_aoi22rex1 U3628 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[2][5][7] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[2][2][7] ), .Z(n4590) );
  dti_28hc_7t_30_aoi22x1 U3635 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[1][0][7] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[1][5][7] ), .Z(n3962) );
  dti_28hc_7t_30_aoi22x1 U3642 ( .A1(n5125), .A2(n4856), .B1(n5128), .B2(n4836), .Z(n4839) );
  dti_28hc_7t_30_or2x2 U3646 ( .A(n3311), .B(n7631), .Z(n6114) );
  dti_28hc_7t_30_nand4px1 U3647 ( .A(n5079), .B(n5078), .C(n5077), .D(n5076), 
        .Z(n5542) );
  dti_28hc_7t_30_invx4 U3650 ( .A(n6646), .Z(n6657) );
  dti_28hc_7t_30_bufx4 U3651 ( .A(n4681), .Z(n4856) );
  dti_28hc_7t_30_aoi22x1 U3655 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[3][4][7] ), .B1(n7517), .B2(
        \eda_img_ram/img_memory[3][1][7] ), .Z(n3986) );
  dti_28hc_7t_30_aoi22x3 U3657 ( .A1(n5096), .A2(n3319), .B1(n5094), .B2(n3321), .Z(n4161) );
  dti_28hc_7t_30_aoi22x1 U3659 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[4][3][6] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[4][5][6] ), .Z(n4225) );
  dti_28hc_7t_30_invx4 U3683 ( .A(n3311), .Z(n3321) );
  dti_28hc_7t_30_nand4px2 U3684 ( .A(n4153), .B(n4152), .C(n4151), .D(n4150), 
        .Z(n5093) );
  dti_28hc_7t_30_aoi22x1 U3697 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][5][3] ), .B1(n3608), .B2(
        \eda_img_ram/img_memory[2][2][3] ), .Z(n3935) );
  dti_28hc_7t_30_invx4 U3702 ( .A(n4154), .Z(n4855) );
  dti_28hc_7t_30_nor2i1x1 U3728 ( .A(left_addr[4]), .B(n7074), .Z(n3998) );
  dti_28hc_7t_30_aoi22hpx1 U3732 ( .A1(n3607), .A2(
        \eda_img_ram/img_memory[1][3][2] ), .B1(
        \eda_img_ram/img_memory[1][2][2] ), .B2(n4591), .Z(n3635) );
  dti_28hc_7t_30_aoi22x1 U3733 ( .A1(n3595), .A2(
        \eda_img_ram/img_memory[3][3][2] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[3][1][2] ), .Z(n4394) );
  dti_28hc_7t_30_and2x1 U3739 ( .A(n4475), .B(n4474), .Z(n3302) );
  dti_28hc_7t_30_invx2 U3753 ( .A(left_addr[4]), .Z(n7028) );
  dti_28hc_7t_30_aoi22x1 U3755 ( .A1(n4592), .A2(
        \eda_img_ram/img_memory[4][1][2] ), .B1(n3316), .B2(
        \eda_img_ram/img_memory[4][3][2] ), .Z(n3629) );
  dti_28hc_7t_30_nand2x2 U3776 ( .A(n3466), .B(n3676), .Z(n5485) );
  dti_28hc_7t_30_nand2x2 U3783 ( .A(n5471), .B(n3720), .Z(n3719) );
  dti_28hc_7t_30_nand4px1 U3792 ( .A(n4556), .B(n4554), .C(n4555), .D(n4557), 
        .Z(n5042) );
  dti_28hc_7t_30_invx1 U3800 ( .A(n5505), .Z(n3694) );
  dti_28hc_7t_30_nand4px1 U3815 ( .A(n4887), .B(n4925), .C(n4888), .D(n4889), 
        .Z(n4673) );
  dti_28hc_7t_30_nand4poptax8 U3826 ( .A(n3885), .B(n3881), .C(n3879), .D(
        n3877), .Z(n3241) );
  dti_28hc_7t_30_or2hpx2 U3828 ( .A(n6640), .B(n6724), .Z(n6599) );
  dti_28hc_7t_30_nand4px2 U3838 ( .A(n4104), .B(n4105), .C(n4102), .D(n4103), 
        .Z(n5071) );
  dti_28hc_7t_30_nand2mhzx6 U3863 ( .A(n5162), .B(n6025), .Z(n5438) );
  dti_28hc_7t_30_nand2x1 U3870 ( .A(n5149), .B(n5148), .Z(n3256) );
  dti_28hc_7t_30_nand4px1 U3902 ( .A(n4432), .B(n4431), .C(n4430), .D(n4429), 
        .Z(n5006) );
  dti_28hc_7t_30_nand4px1 U3903 ( .A(n4539), .B(n4540), .C(n4538), .D(n4537), 
        .Z(n4977) );
  dti_28hc_7t_30_xnor2optax4 U3917 ( .A(n4709), .B(n5688), .Z(n6133) );
  dti_28hc_7t_30_nor2px2 U3941 ( .A(n4670), .B(n3870), .Z(n3867) );
  dti_28hc_7t_30_nand4px1 U3960 ( .A(n4485), .B(n4484), .C(n4483), .D(n4482), 
        .Z(n5031) );
  dti_28hc_7t_30_nand4px1 U4001 ( .A(n4186), .B(n4185), .C(n4184), .D(n4183), 
        .Z(n4741) );
  dti_28hc_7t_30_invx2 U4005 ( .A(n3295), .Z(n3427) );
  dti_28hc_7t_30_or2x1 U4007 ( .A(n6225), .B(n5535), .Z(n3296) );
  dti_28hc_7t_30_nand4px1 U4009 ( .A(n4319), .B(n4318), .C(n4317), .D(n4316), 
        .Z(n4733) );
  dti_28hc_7t_30_aoi12hpx2 U4014 ( .B1(\eda_img_ram/img_memory[0][3][6] ), 
        .B2(n6086), .A(n3303), .Z(n3379) );
  dti_28hc_7t_30_aoi22x1 U4024 ( .A1(n5382), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][0] ), .B1(
        n5381), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n5353) );
  dti_28hc_7t_30_aoi22x1 U4026 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][5][7] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[5][2][7] ), .Z(n4581) );
  dti_28hc_7t_30_aoi22x1 U4029 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[5][3][0] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[5][5][0] ), .Z(n4264) );
  dti_28hc_7t_30_aoi12rexp8 U4032 ( .B1(n5341), .B2(n5415), .A(n5340), .Z(
        n3470) );
  dti_28hc_7t_30_aoi22x1 U4034 ( .A1(n5372), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][5] ), .B1(n5371), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(n4949)
         );
  dti_28hc_7t_30_aoi22x1 U4037 ( .A1(n5382), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][2] ), .B1(
        n5381), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n5268) );
  dti_28hc_7t_30_aoi22x1 U4038 ( .A1(n5397), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][2] ), .B1(
        n5996), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n5267) );
  dti_28hc_7t_30_nand2x1 U4039 ( .A(\eda_iterated_ram/current_row[3][1] ), .B(
        n5429), .Z(n3328) );
  dti_28hc_7t_30_aoi22x1 U4042 ( .A1(n5399), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][1] ), .B1(
        n5398), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n5300) );
  dti_28hc_7t_30_aoi22x1 U4043 ( .A1(n5382), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][5] ), .B1(
        n5381), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n4928) );
  dti_28hc_7t_30_aoi22x1 U4044 ( .A1(n7282), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][3] ), .B1(n5373), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(n5211)
         );
  dti_28hc_7t_30_aoi22xp5 U4045 ( .A1(n5399), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][3] ), .B1(
        n5398), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n5192) );
  dti_28hc_7t_30_aoi22x1 U4046 ( .A1(n7282), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][2] ), .B1(n5373), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(n5253)
         );
  dti_28hc_7t_30_aoi22x1 U4047 ( .A1(n5382), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][1] ), .B1(
        n5381), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n5291) );
  dti_28hc_7t_30_nand2i1x1 U4048 ( .A(\eda_fifos/sync_fifo_up/wr_addr [2]), 
        .B(\eda_fifos/sync_fifo_up/rd_addr [2]), .Z(n3508) );
  dti_28hc_7t_30_nor2x1 U4051 ( .A(n3314), .B(n7127), .Z(n5284) );
  dti_28hc_7t_30_nor3x1 U4053 ( .A(n5472), .B(n5471), .C(n3314), .Z(n5479) );
  dti_28hc_7t_30_nor2i1x1 U4055 ( .A(write_en), .B(wr_addr[1]), .Z(n6258) );
  dti_28hc_7t_30_nor2x1 U4056 ( .A(n6853), .B(
        \eda_fifos/sync_fifo_right/wr_addr [0]), .Z(n3408) );
  dti_28hc_7t_30_nand2x1 U4057 ( .A(n3702), .B(n7121), .Z(n5282) );
  dti_28hc_7t_30_invx1 U4058 ( .A(n6168), .Z(n3544) );
  dti_28hc_7t_30_aoi12rex1 U4061 ( .B1(n7404), .B2(n7312), .A(n7430), .Z(n7313) );
  dti_28hc_7t_30_aoi12rex1 U4062 ( .B1(n7432), .B2(n7431), .A(n7430), .Z(n7435) );
  dti_28hc_7t_30_or2x1 U4063 ( .A(n6296), .B(n6266), .Z(n6500) );
  dti_28hc_7t_30_or2x1 U4064 ( .A(n6298), .B(n6266), .Z(n6531) );
  dti_28hc_7t_30_or2x1 U4065 ( .A(n6266), .B(n6300), .Z(n6537) );
  dti_28hc_7t_30_or2x1 U4067 ( .A(n6259), .B(n6303), .Z(n6547) );
  dti_28hc_7t_30_nor2x1 U4068 ( .A(n6294), .B(n6273), .Z(n6577) );
  dti_28hc_7t_30_or2x1 U4069 ( .A(n6303), .B(n6273), .Z(n6581) );
  dti_28hc_7t_30_nor2x1 U4070 ( .A(n6296), .B(n6288), .Z(n6553) );
  dti_28hc_7t_30_or2x1 U4071 ( .A(n6292), .B(n6288), .Z(n6556) );
  dti_28hc_7t_30_nor2x1 U4072 ( .A(n6296), .B(n6280), .Z(n6564) );
  dti_28hc_7t_30_invx1 U4073 ( .A(pixel_in[3]), .Z(n6340) );
  dti_28hc_7t_30_invx1 U4075 ( .A(pixel_in[4]), .Z(n6451) );
  dti_28hc_7t_30_invx1 U4076 ( .A(pixel_in[1]), .Z(n6527) );
  dti_28hc_7t_30_oai112x1 U4078 ( .C1(n7368), .C2(n3559), .A(n6044), .B(n5946), 
        .Z(n2449) );
  dti_28hc_7t_30_oai112x1 U4079 ( .C1(n3475), .C2(n3559), .A(n6044), .B(n5926), 
        .Z(n2486) );
  dti_28hc_7t_30_oai112x1 U4080 ( .C1(n7422), .C2(n3559), .A(n6044), .B(n5914), 
        .Z(n2431) );
  dti_28hc_7t_30_oai22xp5 U4081 ( .A1(n6013), .A2(n3580), .B1(n6012), .B2(
        n6793), .Z(n2719) );
  dti_28hc_7t_30_and2x1 U4084 ( .A(\eda_iterated_ram/current_row[3][4] ), .B(
        n5429), .Z(n3305) );
  dti_28hc_7t_30_nand4px1 U4100 ( .A(n4860), .B(n4859), .C(n4858), .D(n4857), 
        .Z(n5664) );
  dti_28hc_7t_30_oai112rex1 U4102 ( .C1(n5169), .C2(n5522), .A(n5223), .B(
        n5177), .Z(n5176) );
  dti_28hc_7t_30_aoi22x3 U4106 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[5][4][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[5][0][3] ), .Z(n3589) );
  dti_28hc_7t_30_nand4px1 U4113 ( .A(n4496), .B(n4497), .C(n4495), .D(n4494), 
        .Z(n5016) );
  dti_28hc_7t_30_nand2px4 U4116 ( .A(n6077), .B(n6076), .Z(n6627) );
  dti_28hc_7t_30_xnor2bx1 U4122 ( .A(n6754), .B(n6755), .Z(n6759) );
  dti_28hc_7t_30_xor2x4 U4123 ( .A(\eda_fifos/sync_fifo_down/wr_addr [2]), .B(
        \eda_fifos/sync_fifo_down/rd_addr [2]), .Z(n6754) );
  dti_28hc_7t_30_nand4px1 U4124 ( .A(n4170), .B(n4168), .C(n4167), .D(n4169), 
        .Z(n4740) );
  dti_28hc_7t_30_ao12xp5 U4128 ( .B1(n3742), .B2(n6010), .A(n5971), .Z(n3580)
         );
  dti_28hc_7t_30_aoi22x1 U4131 ( .A1(n5040), .A2(n4855), .B1(n5042), .B2(n3320), .Z(n4577) );
  dti_28hc_7t_30_aoi22x1 U4141 ( .A1(n4733), .A2(n4855), .B1(n4732), .B2(n4856), .Z(n4738) );
  dti_28hc_7t_30_nand4px1 U4154 ( .A(n4307), .B(n4306), .C(n4305), .D(n4304), 
        .Z(n4735) );
  dti_28hc_7t_30_aoi12x1 U4160 ( .B1(n5808), .B2(n5893), .A(n5807), .Z(n5815)
         );
  dti_28hc_7t_30_oai12rex1 U4165 ( .B1(n6048), .B2(n6047), .A(n7203), .Z(n2634) );
  dti_28hc_7t_30_muxi21x1 U4169 ( .D0(n3775), .D1(n7210), .S(n7209), .Z(n2626)
         );
  dti_28hc_7t_30_muxi21x1 U4170 ( .D0(n3775), .D1(n7202), .S(n7201), .Z(n2614)
         );
  dti_28hc_7t_30_muxi21x1 U4171 ( .D0(n7070), .D1(n7074), .S(n6871), .Z(n2531)
         );
  dti_28hc_7t_30_muxi21x1 U4172 ( .D0(n5767), .D1(n5766), .S(n5778), .Z(n5768)
         );
  dti_28hc_7t_30_aoi12rex1 U4173 ( .B1(n6734), .B2(n6733), .A(n6732), .Z(
        \eda_fifos/sync_fifo_downleft/comparator_inst/N53 ) );
  dti_28hc_7t_30_oai112rex1 U4177 ( .C1(n5715), .C2(n5714), .A(n5713), .B(
        n5712), .Z(n5717) );
  dti_28hc_7t_30_oai112rex1 U4179 ( .C1(n5659), .C2(n5658), .A(n5657), .B(
        n5656), .Z(n5661) );
  dti_28hc_7t_30_nand2i1x1 U4180 ( .A(n3552), .B(n5644), .Z(n5642) );
  dti_28hc_7t_30_nand2x1 U4189 ( .A(n4615), .B(n5154), .Z(n5501) );
  dti_28hc_7t_30_nand3xp5 U4193 ( .A(n5401), .B(n5402), .C(n5400), .Z(n3764)
         );
  dti_28hc_7t_30_aoi22rex1 U4194 ( .A1(\eda_iterated_ram/current_row[3][0] ), 
        .A2(n3320), .B1(\eda_iterated_ram/current_row[4][0] ), .B2(n4836), .Z(
        n4367) );
  dti_28hc_7t_30_nand3xp5 U4196 ( .A(n5376), .B(n5377), .C(n5375), .Z(n3458)
         );
  dti_28hc_7t_30_nand3xp5 U4197 ( .A(n5369), .B(n5368), .C(n5370), .Z(n3738)
         );
  dti_28hc_7t_30_nand2x1 U4198 ( .A(n4666), .B(n4863), .Z(n6926) );
  dti_28hc_7t_30_aoi22rex1 U4199 ( .A1(n5406), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][5] ), 
        .B1(n5405), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n4901) );
  dti_28hc_7t_30_aoi22rex1 U4200 ( .A1(n5367), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][2] ), .B1(
        n5366), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n5238) );
  dti_28hc_7t_30_aoi22rexp5 U4201 ( .A1(n5406), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][3] ), 
        .B1(n5405), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n5196) );
  dti_28hc_7t_30_aoi22rex1 U4203 ( .A1(n5406), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][0] ), 
        .B1(n5405), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n5343) );
  dti_28hc_7t_30_aoi22rex1 U4204 ( .A1(n5406), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][4] ), 
        .B1(n5405), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n5409) );
  dti_28hc_7t_30_nand3xp5 U4206 ( .A(n6848), .B(n6847), .C(
        \eda_fifos/sync_fifo_upright/wr_addr [1]), .Z(n6849) );
  dti_28hc_7t_30_xnor2bx1 U4207 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [2]), 
        .B(\eda_fifos/sync_fifo_upright/rd_addr [2]), .Z(n4933) );
  dti_28hc_7t_30_nand2i1x1 U4209 ( .A(\eda_controller/current_state [2]), .B(
        \eda_controller/current_state [1]), .Z(n6019) );
  dti_28hc_7t_30_nand2i1x1 U4210 ( .A(\eda_controller/current_state [2]), .B(
        \eda_controller/current_state [0]), .Z(n5476) );
  dti_28hc_7t_30_nand3x1 U4211 ( .A(wr_addr[4]), .B(wr_addr[3]), .C(n6282), 
        .Z(n6273) );
  dti_28hc_7t_30_invx1 U4212 ( .A(wr_addr[3]), .Z(n6290) );
  dti_28hc_7t_30_invx1 U4213 ( .A(wr_addr[5]), .Z(n6282) );
  dti_28hc_7t_30_muxi21x1 U4219 ( .D0(n3484), .D1(n7147), .S(n3563), .Z(n2745)
         );
  dti_28hc_7t_30_muxi21x1 U4220 ( .D0(n3804), .D1(n7033), .S(n3563), .Z(n2743)
         );
  dti_28hc_7t_30_muxi21x1 U4221 ( .D0(n3484), .D1(n7150), .S(n3564), .Z(n2757)
         );
  dti_28hc_7t_30_oai12rex1 U4222 ( .B1(n5625), .B2(n5624), .A(n5623), .Z(n5626) );
  dti_28hc_7t_30_nand2px4 U4228 ( .A(n6949), .B(n6948), .Z(n7209) );
  dti_28hc_7t_30_nand2x1 U4230 ( .A(n3409), .B(n3408), .Z(n3407) );
  dti_28hc_7t_30_nor2px2 U4238 ( .A(n4355), .B(n4354), .Z(n4356) );
  dti_28hc_7t_30_nor2x1 U4241 ( .A(n3446), .B(n3442), .Z(n3441) );
  dti_28hc_7t_30_oai112xp5 U4243 ( .C1(n5750), .C2(n5748), .A(n5702), .B(n5705), .Z(n5714) );
  dti_28hc_7t_30_oai22xp5 U4246 ( .A1(n6917), .A2(n5957), .B1(n6915), .B2(
        n5956), .Z(n5991) );
  dti_28hc_7t_30_aoi22xp8 U4248 ( .A1(n5655), .A2(n5776), .B1(n5739), .B2(
        n5654), .Z(n5657) );
  dti_28hc_7t_30_nand2x1 U4252 ( .A(n6180), .B(n3847), .Z(n3846) );
  dti_28hc_7t_30_nand2x1 U4253 ( .A(n7286), .B(n3459), .Z(n5295) );
  dti_28hc_7t_30_nand4px1 U4257 ( .A(n4190), .B(n4187), .C(n4188), .D(n4189), 
        .Z(n5843) );
  dti_28hc_7t_30_aoi12rex1 U4258 ( .B1(n5452), .B2(n5459), .A(n7312), .Z(n5453) );
  dti_28hc_7t_30_aoi22rex1 U4262 ( .A1(n4741), .A2(n6604), .B1(n4740), .B2(
        n6657), .Z(n4749) );
  dti_28hc_7t_30_aoi12rehpx1 U4268 ( .B1(n3802), .B2(n5283), .A(n4603), .Z(
        n4387) );
  dti_28hc_7t_30_nand4x1 U4271 ( .A(n4412), .B(n4411), .C(n4410), .D(n4409), 
        .Z(n5009) );
  dti_28hc_7t_30_and2x1 U4279 ( .A(n7121), .B(n3775), .Z(n4973) );
  dti_28hc_7t_30_aoi22x3 U4281 ( .A1(\eda_iterated_ram/current_row[5][0] ), 
        .A2(n4836), .B1(\eda_iterated_ram/current_row[3][0] ), .B2(n3319), .Z(
        n3736) );
  dti_28hc_7t_30_nand2x1 U4287 ( .A(n5994), .B(
        \eda_fifos/sync_fifo_right/wr_addr [1]), .Z(n4887) );
  dti_28hc_7t_30_xor2bx1 U4289 ( .A(n4939), .B(n4925), .Z(n6822) );
  dti_28hc_7t_30_nand2i1x2 U4290 ( .A(\eda_fifos/sync_fifo_left/wr_addr [1]), 
        .B(\eda_fifos/sync_fifo_left/rd_addr [1]), .Z(n4925) );
  dti_28hc_7t_30_nand2i1x1 U4292 ( .A(\eda_fifos/sync_fifo_down/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_down/rd_addr [0]), .Z(n6243) );
  dti_28hc_7t_30_nand3x1 U4294 ( .A(n6258), .B(wr_addr[2]), .C(wr_addr[0]), 
        .Z(n6296) );
  dti_28hc_7t_30_aoi13rehpx1 U4295 ( .B1(n5865), .B2(n5864), .B3(n5863), .A(
        n5862), .Z(n5903) );
  dti_28hc_7t_30_oai12rex1 U4303 ( .B1(n5816), .B2(n5815), .A(n5814), .Z(n5825) );
  dti_28hc_7t_30_muxi21x1 U4305 ( .D0(n5801), .D1(n5800), .S(n5900), .Z(n5872)
         );
  dti_28hc_7t_30_aoi13x1 U4308 ( .B1(n5795), .B2(n5794), .B3(n5793), .A(n5792), 
        .Z(n5796) );
  dti_28hc_7t_30_oai13rex1 U4311 ( .B1(n5827), .B2(n5631), .B3(n5616), .A(
        n5826), .Z(n5617) );
  dti_28hc_7t_30_nor2px2 U4312 ( .A(n7132), .B(n6682), .Z(n3388) );
  dti_28hc_7t_30_aoi12x1 U4313 ( .B1(n5610), .B2(n5609), .A(n5608), .Z(n5629)
         );
  dti_28hc_7t_30_aoi12x1 U4315 ( .B1(n5764), .B2(n5809), .A(n5763), .Z(n5769)
         );
  dti_28hc_7t_30_muxi21x1 U4317 ( .D0(n3775), .D1(n7206), .S(n7205), .Z(n2596)
         );
  dti_28hc_7t_30_muxi21x1 U4319 ( .D0(n3775), .D1(n6172), .S(n7161), .Z(n2510)
         );
  dti_28hc_7t_30_muxi21x1 U4320 ( .D0(n6967), .D1(n6959), .S(n3891), .Z(n2636)
         );
  dti_28hc_7t_30_invx1 U4321 ( .A(n3808), .Z(n6057) );
  dti_28hc_7t_30_muxi21x1 U4324 ( .D0(n3702), .D1(n7270), .S(n3891), .Z(n2640)
         );
  dti_28hc_7t_30_muxi21x1 U4326 ( .D0(n3702), .D1(n7269), .S(n7268), .Z(n2652)
         );
  dti_28hc_7t_30_nor2x2 U4334 ( .A(n4656), .B(n3774), .Z(n4651) );
  dti_28hc_7t_30_aoi12x1 U4335 ( .B1(n5741), .B2(n5711), .A(n5710), .Z(n5712)
         );
  dti_28hc_7t_30_invx1 U4338 ( .A(n4967), .Z(n3326) );
  dti_28hc_7t_30_nand2x1 U4340 ( .A(n3390), .B(n3810), .Z(n3809) );
  dti_28hc_7t_30_nor2x1 U4344 ( .A(n3445), .B(n3444), .Z(n3443) );
  dti_28hc_7t_30_bufx2 U4347 ( .A(n3733), .Z(n3390) );
  dti_28hc_7t_30_nand2x1 U4348 ( .A(n3794), .B(n3431), .Z(n3430) );
  dti_28hc_7t_30_or2x1 U4350 ( .A(n3860), .B(n5503), .Z(n3859) );
  dti_28hc_7t_30_nor2x1 U4357 ( .A(n6645), .B(n6646), .Z(n3366) );
  dti_28hc_7t_30_and2xp8 U4360 ( .A(n6136), .B(n6134), .Z(n3794) );
  dti_28hc_7t_30_or2x1 U4361 ( .A(n3465), .B(n3463), .Z(n3468) );
  dti_28hc_7t_30_nor2x1 U4364 ( .A(n6645), .B(n3496), .Z(n3495) );
  dti_28hc_7t_30_aoi22hpx1 U4367 ( .A1(n4763), .A2(n4856), .B1(n4762), .B2(
        n6657), .Z(n3370) );
  dti_28hc_7t_30_aoi22rex1 U4368 ( .A1(n5125), .A2(n3320), .B1(n3321), .B2(
        n5124), .Z(n5133) );
  dti_28hc_7t_30_aoi22x1 U4369 ( .A1(n4711), .A2(n5589), .B1(n4715), .B2(n4836), .Z(n4619) );
  dti_28hc_7t_30_aoi22hpx1 U4374 ( .A1(n5043), .A2(n4855), .B1(n5042), .B2(
        n3319), .Z(n4807) );
  dti_28hc_7t_30_aoi12x1 U4376 ( .B1(n5415), .B2(n5249), .A(n5248), .Z(n5260)
         );
  dti_28hc_7t_30_nand2x3 U4378 ( .A(n5074), .B(n3319), .Z(n3877) );
  dti_28hc_7t_30_nand2x1 U4379 ( .A(n4734), .B(n4855), .Z(n4653) );
  dti_28hc_7t_30_aoi22hpx1 U4380 ( .A1(n4733), .A2(n3321), .B1(n4730), .B2(
        n6633), .Z(n4654) );
  dti_28hc_7t_30_aoi22x1 U4381 ( .A1(n4710), .A2(n3320), .B1(n4714), .B2(n3317), .Z(n4068) );
  dti_28hc_7t_30_nand2x1 U4390 ( .A(n4615), .B(n4973), .Z(n4375) );
  dti_28hc_7t_30_nand4px1 U4392 ( .A(n4586), .B(n4585), .C(n4584), .D(n4583), 
        .Z(n5052) );
  dti_28hc_7t_30_aoi22x1 U4395 ( .A1(n3316), .A2(
        \eda_img_ram/img_memory[4][1][5] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[4][3][5] ), .Z(n4303) );
  dti_28hc_7t_30_aoi22x1 U4397 ( .A1(n3604), .A2(
        \eda_img_ram/img_memory[4][3][0] ), .B1(n7613), .B2(
        \eda_img_ram/img_memory[4][2][0] ), .Z(n4461) );
  dti_28hc_7t_30_nand3x1 U4400 ( .A(n4881), .B(n4880), .C(n4879), .Z(n4920) );
  dti_28hc_7t_30_nor3hpx1 U4401 ( .A(n4673), .B(n6779), .C(n4674), .Z(n4861)
         );
  dti_28hc_7t_30_nand3x1 U4402 ( .A(n5302), .B(n5301), .C(n5300), .Z(n5303) );
  dti_28hc_7t_30_nand3x1 U4405 ( .A(n5267), .B(n5266), .C(n5265), .Z(n5272) );
  dti_28hc_7t_30_invx1 U4406 ( .A(n6954), .Z(n3343) );
  dti_28hc_7t_30_nand3x1 U4408 ( .A(n5395), .B(n5394), .C(n5393), .Z(n5428) );
  dti_28hc_7t_30_aoi22x1 U4416 ( .A1(n5390), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][3] ), .B1(
        n5389), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n5191) );
  dti_28hc_7t_30_and2x1 U4417 ( .A(\eda_fifos/sync_fifo_down/wr_addr [2]), .B(
        n6235), .Z(n3383) );
  dti_28hc_7t_30_invx1 U4418 ( .A(n6958), .Z(n3342) );
  dti_28hc_7t_30_aoi22x1 U4419 ( .A1(n5390), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][4] ), .B1(
        n5389), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n5395) );
  dti_28hc_7t_30_aoi22xp5 U4420 ( .A1(n6747), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][2] ), 
        .B1(n5420), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][2] ), 
        .Z(n5246) );
  dti_28hc_7t_30_nand4px1 U4423 ( .A(n6829), .B(n4891), .C(n4939), .D(n4933), 
        .Z(n4665) );
  dti_28hc_7t_30_nor2hpx1 U4424 ( .A(n3746), .B(n3745), .Z(n3868) );
  dti_28hc_7t_30_nand2x1 U4426 ( .A(\eda_fifos/sync_fifo_left/wr_addr [0]), 
        .B(n5506), .Z(n3404) );
  dti_28hc_7t_30_xor2bx1 U4427 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [1]), .B(\eda_fifos/sync_fifo_downright/rd_addr [1]), .Z(n3745) );
  dti_28hc_7t_30_xor2bx1 U4429 ( .A(\eda_fifos/sync_fifo_downright/rd_addr [0]), .B(\eda_fifos/sync_fifo_downright/wr_addr [0]), .Z(n3870) );
  dti_28hc_7t_30_invx1 U4430 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [1]), 
        .Z(n3666) );
  dti_28hc_7t_30_invshzx8 U4432 ( .A(left_addr[3]), .Z(n7057) );
  dti_28hc_7t_30_invshzx6 U4433 ( .A(n6597), .Z(n3311) );
  dti_28hc_7t_30_oai112rex1 U4438 ( .C1(n3748), .C2(n3559), .A(n6044), .B(
        n5913), .Z(n2456) );
  dti_28hc_7t_30_oai112rex1 U4439 ( .C1(n7444), .C2(n3559), .A(n6044), .B(
        n5931), .Z(n2438) );
  dti_28hc_7t_30_oai112rex1 U4440 ( .C1(n7316), .C2(n3559), .A(n6044), .B(
        n5912), .Z(n2489) );
  dti_28hc_7t_30_oai112rex1 U4441 ( .C1(n7408), .C2(n3559), .A(n6044), .B(
        n5936), .Z(n2457) );
  dti_28hc_7t_30_oai112rex1 U4442 ( .C1(n7388), .C2(n3559), .A(n6044), .B(
        n5930), .Z(n2453) );
  dti_28hc_7t_30_oai112rex1 U4443 ( .C1(n7350), .C2(n3559), .A(n6044), .B(
        n5932), .Z(n2444) );
  dti_28hc_7t_30_oai112rex1 U4444 ( .C1(n7374), .C2(n3559), .A(n6044), .B(
        n5947), .Z(n2450) );
  dti_28hc_7t_30_oai112rex1 U4445 ( .C1(n7364), .C2(n3559), .A(n6044), .B(
        n5945), .Z(n2448) );
  dti_28hc_7t_30_oai112rex1 U4446 ( .C1(n7412), .C2(n3559), .A(n6044), .B(
        n5919), .Z(n2458) );
  dti_28hc_7t_30_oai112rex1 U4447 ( .C1(n3374), .C2(n3559), .A(n6044), .B(
        n5948), .Z(n2481) );
  dti_28hc_7t_30_oai112rex1 U4449 ( .C1(n6052), .C2(n3559), .A(n6044), .B(
        n5943), .Z(n2447) );
  dti_28hc_7t_30_oai112rex1 U4450 ( .C1(n7418), .C2(n3559), .A(n6044), .B(
        n5937), .Z(n2459) );
  dti_28hc_7t_30_oai112rex1 U4451 ( .C1(n7445), .C2(n3559), .A(n6044), .B(
        n5938), .Z(n2490) );
  dti_28hc_7t_30_oai112rex1 U4452 ( .C1(n7298), .C2(n3559), .A(n6044), .B(
        n5928), .Z(n2484) );
  dti_28hc_7t_30_oai112rex1 U4453 ( .C1(n7303), .C2(n3559), .A(n6044), .B(
        n5929), .Z(n2485) );
  dti_28hc_7t_30_oai112rex1 U4454 ( .C1(n3437), .C2(n3559), .A(n6044), .B(
        n5917), .Z(n2488) );
  dti_28hc_7t_30_oai112rex1 U4455 ( .C1(n7428), .C2(n3559), .A(n6044), .B(
        n5944), .Z(n2433) );
  dti_28hc_7t_30_oai112rex1 U4456 ( .C1(n7397), .C2(n3559), .A(n6044), .B(
        n5942), .Z(n2455) );
  dti_28hc_7t_30_oai112rex1 U4457 ( .C1(n7330), .C2(n3559), .A(n6044), .B(
        n5918), .Z(n2440) );
  dti_28hc_7t_30_oai112rex1 U4458 ( .C1(n7355), .C2(n3559), .A(n6044), .B(
        n5933), .Z(n2445) );
  dti_28hc_7t_30_oai112rex1 U4459 ( .C1(n7335), .C2(n3559), .A(n6044), .B(
        n5921), .Z(n2441) );
  dti_28hc_7t_30_oai112rex1 U4460 ( .C1(n3347), .C2(n3559), .A(n6044), .B(
        n5934), .Z(n2452) );
  dti_28hc_7t_30_oai112rex1 U4461 ( .C1(n6232), .C2(n3559), .A(n6044), .B(
        n5922), .Z(n2482) );
  dti_28hc_7t_30_oai112rex1 U4463 ( .C1(n3499), .C2(n3559), .A(n6044), .B(
        n5920), .Z(n2434) );
  dti_28hc_7t_30_oai112rex1 U4464 ( .C1(n3402), .C2(n3559), .A(n6044), .B(
        n5939), .Z(n2491) );
  dti_28hc_7t_30_oai112rex1 U4465 ( .C1(n6155), .C2(n3559), .A(n6044), .B(
        n5923), .Z(n2483) );
  dti_28hc_7t_30_oai112rex1 U4466 ( .C1(n7339), .C2(n3559), .A(n6044), .B(
        n5935), .Z(n2442) );
  dti_28hc_7t_30_oai112rex1 U4467 ( .C1(n7325), .C2(n3559), .A(n6044), .B(
        n5924), .Z(n2439) );
  dti_28hc_7t_30_oai112rex1 U4468 ( .C1(n7359), .C2(n3559), .A(n6044), .B(
        n5940), .Z(n2446) );
  dti_28hc_7t_30_oai112rex1 U4469 ( .C1(n7344), .C2(n3559), .A(n6044), .B(
        n5927), .Z(n2443) );
  dti_28hc_7t_30_bufmhzx6 U4470 ( .A(n5916), .Z(n3559) );
  dti_28hc_7t_30_oai112rex1 U4472 ( .C1(n5904), .C2(n5903), .A(n5902), .B(
        n5901), .Z(n5906) );
  dti_28hc_7t_30_oai112rex1 U4473 ( .C1(n5894), .C2(n5903), .A(n5893), .B(
        n5901), .Z(n5895) );
  dti_28hc_7t_30_oai12rex1 U4474 ( .B1(n5903), .B2(n5890), .A(n5889), .Z(n5892) );
  dti_28hc_7t_30_oai112rex1 U4475 ( .C1(n5897), .C2(n5903), .A(n5896), .B(
        n5901), .Z(n6036) );
  dti_28hc_7t_30_oai22x1 U4477 ( .A1(n5877), .A2(n5861), .B1(n5860), .B2(n5859), .Z(n5862) );
  dti_28hc_7t_30_aoi12rexp8 U4499 ( .B1(n5901), .B2(n5872), .A(n5871), .Z(
        n6033) );
  dti_28hc_7t_30_nand2x1 U4510 ( .A(n3541), .B(\strb_value[3][0] ), .Z(n3728)
         );
  dti_28hc_7t_30_aoi22rex1 U4511 ( .A1(n5822), .A2(n5860), .B1(n5821), .B2(
        n5820), .Z(n5824) );
  dti_28hc_7t_30_oai22x1 U4512 ( .A1(n5893), .A2(n5808), .B1(n5872), .B2(n5813), .Z(n5816) );
  dti_28hc_7t_30_invx1 U4514 ( .A(n3541), .Z(n3729) );
  dti_28hc_7t_30_muxi21x1 U4516 ( .D0(new_pixel), .D1(n5483), .S(n5482), .Z(
        n5484) );
  dti_28hc_7t_30_aoi12x1 U4517 ( .B1(n6024), .B2(n6023), .A(n6022), .Z(n6029)
         );
  dti_28hc_7t_30_aoi12x1 U4519 ( .B1(n5860), .B2(n5897), .A(n5637), .Z(n5865)
         );
  dti_28hc_7t_30_oai112rex1 U4520 ( .C1(n6019), .C2(n6024), .A(n5481), .B(
        n5480), .Z(n5482) );
  dti_28hc_7t_30_aoi12x1 U4523 ( .B1(n7404), .B2(n7318), .A(n7430), .Z(n7320)
         );
  dti_28hc_7t_30_aoi12x1 U4524 ( .B1(n7431), .B2(n7410), .A(n7430), .Z(n7413)
         );
  dti_28hc_7t_30_aoi12x1 U4525 ( .B1(n7420), .B2(n7431), .A(n7430), .Z(n7423)
         );
  dti_28hc_7t_30_aoi12x1 U4527 ( .B1(n7358), .B2(n7357), .A(n7430), .Z(n7360)
         );
  dti_28hc_7t_30_aoi12x1 U4528 ( .B1(n7353), .B2(n7352), .A(n7430), .Z(n7356)
         );
  dti_28hc_7t_30_aoi12x1 U4530 ( .B1(n7322), .B2(n7321), .A(n7430), .Z(n7326)
         );
  dti_28hc_7t_30_aoi12x1 U4531 ( .B1(n7315), .B2(n7314), .A(n7430), .Z(n7317)
         );
  dti_28hc_7t_30_aoi12x1 U4533 ( .B1(n7333), .B2(n7332), .A(n7430), .Z(n7336)
         );
  dti_28hc_7t_30_aoi12x1 U4534 ( .B1(n6153), .B2(n6152), .A(n7430), .Z(n6156)
         );
  dti_28hc_7t_30_muxi21x1 U4535 ( .D0(n5812), .D1(n5811), .S(n5900), .Z(n5856)
         );
  dti_28hc_7t_30_oai112rex2 U4536 ( .C1(n5630), .C2(n5629), .A(n5628), .B(
        n5627), .Z(n5900) );
  dti_28hc_7t_30_oai12rex1 U4540 ( .B1(n5829), .B2(n5828), .A(n5827), .Z(n5840) );
  dti_28hc_7t_30_aoi12x1 U4541 ( .B1(n5760), .B2(n5761), .A(n5759), .Z(n5795)
         );
  dti_28hc_7t_30_muxi21x1 U4548 ( .D0(n7181), .D1(n7168), .S(n7230), .Z(n2521)
         );
  dti_28hc_7t_30_xnor2bx1 U4549 ( .A(
        \eda_fifos/sync_fifo_downright/wr_addr [3]), .B(n6056), .Z(n2847) );
  dti_28hc_7t_30_oai22x1 U4550 ( .A1(n5782), .A2(n5781), .B1(n5804), .B2(n5806), .Z(n5788) );
  dti_28hc_7t_30_nor2px2 U4552 ( .A(n3698), .B(n3310), .Z(n3816) );
  dti_28hc_7t_30_aoi12hpx1 U4556 ( .B1(n7820), .B2(n6779), .A(n6778), .Z(
        \eda_fifos/sync_fifo_right/comparator_inst/N53 ) );
  dti_28hc_7t_30_oai22x1 U4558 ( .A1(n5730), .A2(n5729), .B1(n5728), .B2(n5727), .Z(n5731) );
  dti_28hc_7t_30_nor2i1x1 U4564 ( .A(n6938), .B(n6937), .Z(n2629) );
  dti_28hc_7t_30_muxi21x1 U4566 ( .D0(n7090), .D1(n7127), .S(n7228), .Z(n2511)
         );
  dti_28hc_7t_30_muxi21x1 U4570 ( .D0(n7127), .D1(n7114), .S(n7205), .Z(n2591)
         );
  dti_28hc_7t_30_oai22x1 U4571 ( .A1(n5602), .A2(n5601), .B1(n5600), .B2(n5599), .Z(n5638) );
  dti_28hc_7t_30_muxi21x1 U4572 ( .D0(n6148), .D1(n7121), .S(n6242), .Z(n2641)
         );
  dti_28hc_7t_30_muxi21x1 U4574 ( .D0(n7181), .D1(n7162), .S(n7161), .Z(n2509)
         );
  dti_28hc_7t_30_muxi21x1 U4575 ( .D0(n7021), .D1(n7003), .S(n7161), .Z(n2508)
         );
  dti_28hc_7t_30_muxi21x1 U4576 ( .D0(n7181), .D1(n7167), .S(n7166), .Z(n2539)
         );
  dti_28hc_7t_30_muxi21x1 U4577 ( .D0(n7127), .D1(n7087), .S(n7161), .Z(n2505)
         );
  dti_28hc_7t_30_muxi21x1 U4578 ( .D0(n4081), .D1(n6869), .S(n7161), .Z(n2506)
         );
  dti_28hc_7t_30_nor2px2 U4579 ( .A(n5538), .B(n6943), .Z(n5539) );
  dti_28hc_7t_30_muxi21x1 U4580 ( .D0(n6878), .D1(n4081), .S(n7228), .Z(n2512)
         );
  dti_28hc_7t_30_muxi21x1 U4582 ( .D0(n4081), .D1(n6944), .S(n7205), .Z(n2592)
         );
  dti_28hc_7t_30_muxi21x1 U4583 ( .D0(n7127), .D1(n7117), .S(n7211), .Z(n2615)
         );
  dti_28hc_7t_30_muxi21x1 U4588 ( .D0(n6872), .D1(n4081), .S(n6871), .Z(n2530)
         );
  dti_28hc_7t_30_muxi21x1 U4590 ( .D0(n7158), .D1(n3484), .S(n7219), .Z(n2801)
         );
  dti_28hc_7t_30_muxi21x1 U4591 ( .D0(n4081), .D1(n6952), .S(n7211), .Z(n2616)
         );
  dti_28hc_7t_30_muxi21x1 U4596 ( .D0(n6967), .D1(n6955), .S(n7268), .Z(n2648)
         );
  dti_28hc_7t_30_muxi21x1 U4597 ( .D0(n3702), .D1(n7272), .S(n7271), .Z(n2670)
         );
  dti_28hc_7t_30_muxi21x1 U4598 ( .D0(n3775), .D1(n7248), .S(n7247), .Z(n2822)
         );
  dti_28hc_7t_30_muxi21x1 U4599 ( .D0(n7121), .D1(n7118), .S(n7268), .Z(n2647)
         );
  dti_28hc_7t_30_or2x1 U4608 ( .A(n6936), .B(n5494), .Z(n5495) );
  dti_28hc_7t_30_muxi21x1 U4609 ( .D0(n7242), .D1(n3702), .S(n7241), .Z(n2577)
         );
  dti_28hc_7t_30_nor2px2 U4613 ( .A(n6881), .B(n6880), .Z(n3850) );
  dti_28hc_7t_30_muxi21x1 U4615 ( .D0(n6960), .D1(n6967), .S(n7000), .Z(n2654)
         );
  dti_28hc_7t_30_muxi21x1 U4616 ( .D0(n6159), .D1(n7121), .S(n7000), .Z(n2653)
         );
  dti_28hc_7t_30_muxi21x1 U4619 ( .D0(n6896), .D1(n6890), .S(n7247), .Z(n2818)
         );
  dti_28hc_7t_30_invx1 U4621 ( .A(n6852), .Z(n3409) );
  dti_28hc_7t_30_muxi21x1 U4623 ( .D0(n6967), .D1(n6905), .S(n7235), .Z(n2549)
         );
  dti_28hc_7t_30_ioa12hpx1 U4630 ( .B1(n6784), .B2(n6781), .A(n7615), .Z(n6785) );
  dti_28hc_7t_30_oai12rex1 U4632 ( .B1(n5567), .B2(n5568), .A(n5566), .Z(n5572) );
  dti_28hc_7t_30_oai22x1 U4633 ( .A1(n5648), .A2(n5647), .B1(n5646), .B2(n5656), .Z(n5662) );
  dti_28hc_7t_30_or2x1 U4634 ( .A(n5570), .B(n5569), .Z(n5571) );
  dti_28hc_7t_30_invx1 U4640 ( .A(n3839), .Z(n6143) );
  dti_28hc_7t_30_oai22xp5 U4642 ( .A1(n6003), .A2(n6002), .B1(n6001), .B2(
        n6769), .Z(n2807) );
  dti_28hc_7t_30_oai22xp5 U4644 ( .A1(n5991), .A2(n5990), .B1(n6915), .B2(
        n5989), .Z(n2631) );
  dti_28hc_7t_30_aoi22rex1 U4645 ( .A1(n5555), .A2(n5554), .B1(n5553), .B2(
        n5576), .Z(n5556) );
  dti_28hc_7t_30_invx1 U4648 ( .A(n6599), .Z(n3332) );
  dti_28hc_7t_30_oai22xp5 U4649 ( .A1(n5674), .A2(n5652), .B1(n5651), .B2(
        n5669), .Z(n5658) );
  dti_28hc_7t_30_oai22rexp5 U4650 ( .A1(n6810), .A2(n6809), .B1(n6808), .B2(
        n6807), .Z(n2763) );
  dti_28hc_7t_30_nand2x1 U4651 ( .A(n3443), .B(n3368), .Z(n3442) );
  dti_28hc_7t_30_ioa22xp5 U4653 ( .A1(n6769), .A2(n6766), .B1(
        \eda_fifos/sync_fifo_right/rd_addr [1]), .B2(n6767), .Z(n2809) );
  dti_28hc_7t_30_and2xp58 U4654 ( .A(n6652), .B(n6616), .Z(n3398) );
  dti_28hc_7t_30_and2x1 U4660 ( .A(n5733), .B(n5735), .Z(n5716) );
  dti_28hc_7t_30_ioa22xp5 U4661 ( .A1(n6793), .A2(n6790), .B1(
        \eda_fifos/sync_fifo_upright/rd_addr [1]), .B2(n6791), .Z(n2721) );
  dti_28hc_7t_30_invx1 U4662 ( .A(n6095), .Z(n3523) );
  dti_28hc_7t_30_or2x1 U4667 ( .A(n5613), .B(n5612), .Z(n5633) );
  dti_28hc_7t_30_and2x1 U4668 ( .A(n7383), .B(n5536), .Z(n3428) );
  dti_28hc_7t_30_ioa13hpx1 U4669 ( .B1(n4895), .B2(n4894), .B3(n4893), .A(
        n6000), .Z(n4919) );
  dti_28hc_7t_30_ioa13hpx1 U4677 ( .B1(n5293), .B2(n5292), .B3(n5291), .A(
        n6806), .Z(n5294) );
  dti_28hc_7t_30_nand2x1 U4679 ( .A(n6199), .B(n4974), .Z(n6082) );
  dti_28hc_7t_30_oai22x1 U4680 ( .A1(n7414), .A2(n5449), .B1(
        \eda_iterated_ram/current_row[2][2] ), .B2(n5448), .Z(n5456) );
  dti_28hc_7t_30_nand3x1 U4682 ( .A(n3876), .B(n3873), .C(n6097), .Z(n3872) );
  dti_28hc_7t_30_nand4px1 U4686 ( .A(n4492), .B(n4491), .C(n4493), .D(n4490), 
        .Z(n5706) );
  dti_28hc_7t_30_nand2px2 U4688 ( .A(n6136), .B(n4683), .Z(n6060) );
  dti_28hc_7t_30_and2x1 U4690 ( .A(n4244), .B(n4243), .Z(n3830) );
  dti_28hc_7t_30_and2x1 U4691 ( .A(n5055), .B(n5056), .Z(n3792) );
  dti_28hc_7t_30_aoi22x1 U4697 ( .A1(n5065), .A2(n6657), .B1(n3617), .B2(n5589), .Z(n4859) );
  dti_28hc_7t_30_nand2x1 U4698 ( .A(n7333), .B(
        \eda_iterated_ram/current_row[2][2] ), .Z(n7337) );
  dti_28hc_7t_30_nand2x1 U4699 ( .A(n6050), .B(n3378), .Z(n7361) );
  dti_28hc_7t_30_invx1 U4701 ( .A(n6179), .Z(n6180) );
  dti_28hc_7t_30_nand2x1 U4702 ( .A(n7405), .B(n7420), .Z(n3368) );
  dti_28hc_7t_30_bufmhzx6 U4709 ( .A(n4387), .Z(n6896) );
  dti_28hc_7t_30_or3x1 U4711 ( .A(n6131), .B(
        \eda_fifos/sync_fifo_downleft/o_full ), .C(n3264), .Z(n6132) );
  dti_28hc_7t_30_nand2px2 U4712 ( .A(n3882), .B(n4089), .Z(n5070) );
  dti_28hc_7t_30_invx1 U4714 ( .A(n6178), .Z(n3847) );
  dti_28hc_7t_30_ioa13hpx1 U4715 ( .B1(n5418), .B2(n5417), .B3(n5416), .A(
        n5415), .Z(n5427) );
  dti_28hc_7t_30_aoi22x1 U4718 ( .A1(n4761), .A2(n3309), .B1(n4760), .B2(n6604), .Z(n4768) );
  dti_28hc_7t_30_ioa13hpx1 U4719 ( .B1(n5257), .B2(n5256), .B3(n5255), .A(
        n5985), .Z(n5258) );
  dti_28hc_7t_30_ioa13hpx1 U4722 ( .B1(n4910), .B2(n4909), .B3(n4908), .A(
        n5415), .Z(n4917) );
  dti_28hc_7t_30_ioa13hpx1 U4723 ( .B1(n4902), .B2(n4901), .B3(n4900), .A(
        n5985), .Z(n4918) );
  dti_28hc_7t_30_ioa13hpx1 U4724 ( .B1(n5344), .B2(n5343), .B3(n5342), .A(
        n5985), .Z(n5345) );
  dti_28hc_7t_30_and2x1 U4728 ( .A(n4077), .B(n4080), .Z(n3715) );
  dti_28hc_7t_30_nand4px2 U4731 ( .A(n4296), .B(n4295), .C(n4294), .D(n4293), 
        .Z(n5141) );
  dti_28hc_7t_30_oai22xp5 U4737 ( .A1(n7309), .A2(
        \eda_iterated_ram/current_row[1][1] ), .B1(n7535), .B2(n5530), .Z(
        n5531) );
  dti_28hc_7t_30_and2x1 U4741 ( .A(n5491), .B(n5492), .Z(n3344) );
  dti_28hc_7t_30_nand4x1 U4742 ( .A(n3899), .B(n3898), .C(n3897), .D(n3896), 
        .Z(n4753) );
  dti_28hc_7t_30_ioa12hpx1 U4746 ( .B1(n3316), .B2(
        \eda_img_ram/img_memory[1][3][5] ), .A(n3412), .Z(n3411) );
  dti_28hc_7t_30_aoi22x1 U4750 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[5][3][0] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[5][1][0] ), .Z(n4456) );
  dti_28hc_7t_30_aoi22x1 U4752 ( .A1(n3593), .A2(
        \eda_img_ram/img_memory[2][1][3] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[2][3][3] ), .Z(n3911) );
  dti_28hc_7t_30_aoi22x1 U4757 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[3][1][3] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[3][3][3] ), .Z(n3899) );
  dti_28hc_7t_30_aoi22rex1 U4758 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[5][0][5] ), .B1(n3604), .B2(
        \eda_img_ram/img_memory[5][3][5] ), .Z(n4569) );
  dti_28hc_7t_30_nand2x1 U4760 ( .A(n4559), .B(n4558), .Z(n3413) );
  dti_28hc_7t_30_aoi22x1 U4764 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[4][5][5] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[4][2][5] ), .Z(n4552) );
  dti_28hc_7t_30_aoi22x1 U4767 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[1][5][7] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[1][2][7] ), .Z(n4601) );
  dti_28hc_7t_30_aoi22x1 U4769 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[5][4][1] ), .B1(n3603), .B2(
        \eda_img_ram/img_memory[5][1][1] ), .Z(n4127) );
  dti_28hc_7t_30_aoi22rex1 U4770 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[1][0][0] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[1][2][0] ), .Z(n4440) );
  dti_28hc_7t_30_aoi22rex1 U4774 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][5][3] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[5][2][3] ), .Z(n4477) );
  dti_28hc_7t_30_aoi22x1 U4776 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[2][5][3] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[2][1][3] ), .Z(n4481) );
  dti_28hc_7t_30_aoi22x1 U4780 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[5][4][6] ), .B1(n3595), .B2(
        \eda_img_ram/img_memory[5][1][6] ), .Z(n4238) );
  dti_28hc_7t_30_aoi22x1 U4785 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][4][5] ), .B1(n3603), .B2(
        \eda_img_ram/img_memory[3][1][5] ), .Z(n4307) );
  dti_28hc_7t_30_aoi22rex1 U4793 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[3][0][1] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[3][1][1] ), .Z(n4431) );
  dti_28hc_7t_30_aoi22x1 U4797 ( .A1(n3608), .A2(
        \eda_img_ram/img_memory[5][1][5] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[5][3][5] ), .Z(n4319) );
  dti_28hc_7t_30_xnor2bx1 U4803 ( .A(n4866), .B(n4865), .Z(n6928) );
  dti_28hc_7t_30_oa22x1 U4805 ( .A1(n3592), .A2(n6382), .B1(n6124), .B2(n7728), 
        .Z(n4606) );
  dti_28hc_7t_30_nor2i1x1 U4806 ( .A(n5478), .B(n7399), .Z(n3720) );
  dti_28hc_7t_30_aoi12x1 U4811 ( .B1(n6018), .B2(n5478), .A(n6016), .Z(n5183)
         );
  dti_28hc_7t_30_nand3xp5 U4812 ( .A(n5410), .B(n5409), .C(n5408), .Z(n3765)
         );
  dti_28hc_7t_30_invx1 U4814 ( .A(n5282), .Z(n4686) );
  dti_28hc_7t_30_aoi22x1 U4815 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[0][3][6] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[0][5][6] ), .Z(n4241) );
  dti_28hc_7t_30_nand3x1 U4817 ( .A(n5351), .B(n5350), .C(n5349), .Z(n5357) );
  dti_28hc_7t_30_aoi22x1 U4818 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[5][3][4] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[5][5][4] ), .Z(n4181) );
  dti_28hc_7t_30_aoi22rex1 U4821 ( .A1(n7282), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][5] ), .B1(n5373), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(n4948)
         );
  dti_28hc_7t_30_aoi22rex1 U4822 ( .A1(n5397), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][5] ), .B1(
        n5996), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n4894) );
  dti_28hc_7t_30_aoi22rex1 U4825 ( .A1(n6747), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][4] ), 
        .B1(n5420), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][4] ), 
        .Z(n5424) );
  dti_28hc_7t_30_aoi22rex1 U4826 ( .A1(n5399), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][0] ), .B1(
        n5398), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n5349) );
  dti_28hc_7t_30_aoi22rex1 U4827 ( .A1(n5397), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][0] ), .B1(
        n5996), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n5351) );
  dti_28hc_7t_30_aoi22rex1 U4828 ( .A1(n5397), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][3] ), .B1(
        n5996), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n5193) );
  dti_28hc_7t_30_aoi22rexp5 U4833 ( .A1(n6747), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][3] ), 
        .B1(n5420), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][3] ), 
        .Z(n5199) );
  dti_28hc_7t_30_aoi22rex1 U4836 ( .A1(n7282), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][4] ), .B1(n5373), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(n5376)
         );
  dti_28hc_7t_30_aoi22rex1 U4838 ( .A1(n5399), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][2] ), .B1(
        n5398), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n5265) );
  dti_28hc_7t_30_aoi22rex1 U4840 ( .A1(n5382), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][3] ), .B1(
        n5381), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n5216) );
  dti_28hc_7t_30_aoi22rex1 U4841 ( .A1(n5397), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][1] ), .B1(
        n5996), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n5302) );
  dti_28hc_7t_30_aoi22rex1 U4843 ( .A1(n5382), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][4] ), .B1(
        n5381), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n5383) );
  dti_28hc_7t_30_aoi22rex1 U4844 ( .A1(n6747), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][1] ), 
        .B1(n5420), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][1] ), 
        .Z(n5312) );
  dti_28hc_7t_30_invx1 U4845 ( .A(n6633), .Z(n3496) );
  dti_28hc_7t_30_aoi22rex1 U4846 ( .A1(n5399), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][4] ), .B1(
        n5398), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n5400) );
  dti_28hc_7t_30_invx1 U4848 ( .A(n4867), .Z(n3724) );
  dti_28hc_7t_30_aoi22rex1 U4849 ( .A1(n5372), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][0] ), .B1(n5371), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(n5332)
         );
  dti_28hc_7t_30_aoi22rex1 U4850 ( .A1(n5372), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][1] ), .B1(n5371), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(n5290)
         );
  dti_28hc_7t_30_aoi22rex1 U4852 ( .A1(n5372), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][3] ), .B1(n5371), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(n5212)
         );
  dti_28hc_7t_30_aoi22rex1 U4853 ( .A1(n5372), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][4] ), .B1(n5371), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][4] ), .Z(n5377)
         );
  dti_28hc_7t_30_nand2x2 U4855 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [1]), 
        .B(n3673), .Z(n4936) );
  dti_28hc_7t_30_and2x1 U4856 ( .A(n5493), .B(n4869), .Z(n3678) );
  dti_28hc_7t_30_aoi22rex1 U4857 ( .A1(n5372), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][2] ), .B1(n5371), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(n5251)
         );
  dti_28hc_7t_30_invx1 U4858 ( .A(n5493), .Z(n3345) );
  dti_28hc_7t_30_bufx1 U4859 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [0]), 
        .Z(n6128) );
  dti_28hc_7t_30_xnor2bx1 U4860 ( .A(\eda_fifos/sync_fifo_up/rd_addr [2]), .B(
        \eda_fifos/sync_fifo_up/wr_addr [2]), .Z(n4869) );
  dti_28hc_7t_30_invx1 U4862 ( .A(\eda_fifos/sync_fifo_up/wr_addr [1]), .Z(
        n6239) );
  dti_28hc_7t_30_xor2bx1 U4863 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [3]), 
        .B(\eda_fifos/sync_fifo_upright/rd_addr [3]), .Z(n4672) );
  dti_28hc_7t_30_xnor2bx1 U4864 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [2]), 
        .B(\eda_fifos/sync_fifo_upleft/rd_addr [2]), .Z(n4864) );
  dti_28hc_7t_30_nor2x1 U4866 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [1]), 
        .B(\eda_fifos/sync_fifo_upright/wr_addr [0]), .Z(n3538) );
  dti_28hc_7t_30_invx1 U4870 ( .A(left_addr[5]), .Z(n3484) );
  dti_28hc_7t_30_nand3x1 U4871 ( .A(wr_addr[1]), .B(write_en), .C(n6257), .Z(
        n6292) );
  dti_28hc_7t_30_nand3x1 U4872 ( .A(wr_addr[2]), .B(n6258), .C(n6252), .Z(
        n6294) );
  dti_28hc_7t_30_xor2bx1 U4873 ( .A(n5134), .B(n5707), .Z(n4612) );
  dti_28hc_7t_30_nand4px2 U4877 ( .A(n4344), .B(n4343), .C(n4341), .D(n4342), 
        .Z(n5129) );
  dti_28hc_7t_30_nand4px2 U4886 ( .A(n4101), .B(n4100), .C(n4099), .D(n4098), 
        .Z(n5072) );
  dti_28hc_7t_30_oai12rehplm2x2 U4888 ( .B1(n3333), .B2(n7446), .A(n3732), .Z(
        n7433) );
  dti_28hc_7t_30_nor2i1x2 U4898 ( .A(n7820), .B(n5277), .Z(n5431) );
  dti_28hc_7t_30_aoi22rehpx1 U4901 ( .A1(n6597), .A2(n5117), .B1(n5140), .B2(
        n5116), .Z(n5122) );
  dti_28hc_7t_30_xnor2bx1 U4915 ( .A(n5613), .B(n5663), .Z(n4795) );
  dti_28hc_7t_30_nand4px1 U4931 ( .A(n4174), .B(n4171), .C(n4172), .D(n4173), 
        .Z(n4744) );
  dti_28hc_7t_30_or2hpx2 U4933 ( .A(n6627), .B(n6658), .Z(n6603) );
  dti_28hc_7t_30_nand3x1 U4947 ( .A(n7305), .B(n5229), .C(
        \eda_iterated_ram/current_row[1][0] ), .Z(n7309) );
  dti_28hc_7t_30_aoi22x1 U4948 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][4][6] ), .B1(n3316), .B2(
        \eda_img_ram/img_memory[4][1][6] ), .Z(n4226) );
  dti_28hc_7t_30_aoi22x1 U4949 ( .A1(n6191), .A2(n3556), .B1(n3601), .B2(
        \eda_img_ram/img_memory[2][1][0] ), .Z(n4258) );
  dti_28hc_7t_30_bufx1 U4959 ( .A(\eda_iterated_ram/current_row[3][2] ), .Z(
        n3378) );
  dti_28hc_7t_30_aoi22x1 U4961 ( .A1(n5073), .A2(n6604), .B1(n5071), .B2(n3319), .Z(n4831) );
  dti_28hc_7t_30_aoi22x1 U4971 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[2][3][0] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[2][5][0] ), .Z(n4257) );
  dti_28hc_7t_30_or2hpx2 U4972 ( .A(n3797), .B(n3522), .Z(n6109) );
  dti_28hc_7t_30_nand4px1 U4976 ( .A(n3749), .B(n3894), .C(n3750), .D(n3893), 
        .Z(n5149) );
  dti_28hc_7t_30_aoi22x1 U4980 ( .A1(n3618), .A2(n3320), .B1(n4977), .B2(n3309), .Z(n4983) );
  dti_28hc_7t_30_nand4px1 U4985 ( .A(n4545), .B(n4544), .C(n4543), .D(n4542), 
        .Z(n4978) );
  dti_28hc_7t_30_nand3hpx1 U4987 ( .A(n6933), .B(n6932), .C(n6931), .Z(n6934)
         );
  dti_28hc_7t_30_ioa13hpx1 U4993 ( .B1(n5197), .B2(n5196), .B3(n5195), .A(
        n5985), .Z(n5206) );
  dti_28hc_7t_30_nand4px1 U4994 ( .A(n5207), .B(n5206), .C(n5205), .D(n5204), 
        .Z(n5208) );
  dti_28hc_7t_30_aoi22x3 U4995 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[3][2][7] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[3][0][7] ), .Z(n3985) );
  dti_28hc_7t_30_aoi22x1 U4996 ( .A1(n5054), .A2(n5589), .B1(n5049), .B2(n6657), .Z(n4780) );
  dti_28hc_7t_30_aoi22x1 U4999 ( .A1(n4710), .A2(n3319), .B1(n4712), .B2(n3320), .Z(n4620) );
  dti_28hc_7t_30_nand4px1 U5010 ( .A(n4465), .B(n4464), .C(n4463), .D(n4462), 
        .Z(n5722) );
  dti_28hc_7t_30_xor2bx2 U5014 ( .A(n6212), .B(n6188), .Z(n2803) );
  dti_28hc_7t_30_muxi21x1 U5016 ( .D0(n7159), .D1(n3484), .S(n3848), .Z(n2789)
         );
  dti_28hc_7t_30_and2hpx2 U5018 ( .A(n4969), .B(n4970), .Z(n6067) );
  dti_28hc_7t_30_invx1 U5032 ( .A(n5463), .Z(n3444) );
  dti_28hc_7t_30_nor2xp8 U5033 ( .A(n7390), .B(
        \eda_iterated_ram/current_row[4][3] ), .Z(n3445) );
  dti_28hc_7t_30_nor2px2 U5036 ( .A(n5520), .B(n5523), .Z(n5458) );
  dti_28hc_7t_30_nand2x2 U5037 ( .A(n7353), .B(
        \eda_iterated_ram/current_row[3][5] ), .Z(n5520) );
  dti_28hc_7t_30_and3hpx2 U5039 ( .A(n3476), .B(n4950), .C(n4919), .Z(n3453)
         );
  dti_28hc_7t_30_invx1 U5040 ( .A(n4861), .Z(n3455) );
  dti_28hc_7t_30_nand3x1 U5043 ( .A(n5211), .B(n5212), .C(n5210), .Z(n3460) );
  dti_28hc_7t_30_xnor2optax4 U5044 ( .A(\eda_fifos/sync_fifo_down/rd_addr [3]), 
        .B(\eda_fifos/sync_fifo_down/wr_addr [3]), .Z(n6753) );
  dti_28hc_7t_30_xnor2optax4 U5045 ( .A(\eda_fifos/sync_fifo_down/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_down/wr_addr [0]), .Z(n6751) );
  dti_28hc_7t_30_nand2x1 U5046 ( .A(n4946), .B(n3469), .Z(n3463) );
  dti_28hc_7t_30_nand2x2 U5047 ( .A(n3467), .B(n3315), .Z(n6823) );
  dti_28hc_7t_30_invx1 U5048 ( .A(n5415), .Z(n6244) );
  dti_28hc_7t_30_nand3x1 U5049 ( .A(n5331), .B(n5332), .C(n5330), .Z(n3469) );
  dti_28hc_7t_30_and2x1 U5054 ( .A(n4917), .B(n4916), .Z(n3479) );
  dti_28hc_7t_30_xor2bx2 U5062 ( .A(n3506), .B(
        \eda_fifos/sync_fifo_up/wr_addr [3]), .Z(n3505) );
  dti_28hc_7t_30_xnor2optax4 U5064 ( .A(n5674), .B(n6064), .Z(n6094) );
  dti_28hc_7t_30_muxi21x1 U5065 ( .D0(n7181), .D1(n7169), .S(n3526), .Z(n2558)
         );
  dti_28hc_7t_30_muxi21x1 U5067 ( .D0(n6967), .D1(n6899), .S(n3526), .Z(n2555)
         );
  dti_28hc_7t_30_muxi21x1 U5068 ( .D0(n7121), .D1(n7099), .S(n3526), .Z(n2554)
         );
  dti_28hc_7t_30_muxi21x1 U5069 ( .D0(n3702), .D1(n7232), .S(n3526), .Z(n2559)
         );
  dti_28hc_7t_30_muxi21x1 U5070 ( .D0(n7074), .D1(n7064), .S(n3526), .Z(n2556)
         );
  dti_28hc_7t_30_xor2bx2 U5073 ( .A(\eda_fifos/sync_fifo_right/wr_addr [3]), 
        .B(\eda_fifos/sync_fifo_right/rd_addr [3]), .Z(n3531) );
  dti_28hc_7t_30_invx1 U5077 ( .A(n3538), .Z(n3536) );
  dti_28hc_7t_30_nand2x1 U5078 ( .A(n3538), .B(
        \eda_fifos/sync_fifo_upright/wr_addr [2]), .Z(n3537) );
  dti_28hc_7t_30_xnor2optax4 U5079 ( .A(\eda_fifos/sync_fifo_left/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_left/wr_addr [2]), .Z(n4939) );
  dti_28hc_7t_30_nand4px2 U5088 ( .A(n4611), .B(n4610), .C(n4609), .D(n4608), 
        .Z(n5733) );
  dti_28hc_7t_30_and2xp58 U5092 ( .A(n6652), .B(n6657), .Z(n3826) );
  dti_28hc_7t_30_nand4px2 U5094 ( .A(n4214), .B(n4213), .C(n4212), .D(n4211), 
        .Z(n5106) );
  dti_28hc_7t_30_invx1 U5095 ( .A(n5739), .Z(n3546) );
  dti_28hc_7t_30_aoi22x1 U5104 ( .A1(n5064), .A2(n6597), .B1(n5063), .B2(n3319), .Z(n4860) );
  dti_28hc_7t_30_xor2bx1 U5108 ( .A(n5691), .B(n3241), .Z(n6185) );
  dti_28hc_7t_30_nand4px1 U5112 ( .A(n4234), .B(n4233), .C(n4232), .D(n4231), 
        .Z(n4704) );
  dti_28hc_7t_30_invx1 U5115 ( .A(n5766), .Z(n3552) );
  dti_28hc_7t_30_nand2x1 U5118 ( .A(n4765), .B(n6616), .Z(n3557) );
  dti_28hc_7t_30_nand2x1 U5119 ( .A(n4762), .B(n6597), .Z(n3558) );
  dti_28hc_7t_30_and2x1 U5120 ( .A(n3557), .B(n3558), .Z(n4273) );
  dti_28hc_7t_30_nand4px1 U5121 ( .A(n4253), .B(n4254), .C(n4252), .D(n4251), 
        .Z(n4762) );
  dti_28hc_7t_30_xnor2x1 U5122 ( .A(n4871), .B(n4870), .Z(n5486) );
  dti_28hc_7t_30_muxi21x1 U5128 ( .D0(n6896), .D1(n6211), .S(n6234), .Z(n2704)
         );
  dti_28hc_7t_30_nand4px1 U5129 ( .A(n5004), .B(n5001), .C(n5002), .D(n5003), 
        .Z(n5594) );
  dti_28hc_7t_30_aoi22x1 U5131 ( .A1(n4988), .A2(n3320), .B1(n4987), .B2(n5589), .Z(n4407) );
  dti_28hc_7t_30_xor2bx1 U5133 ( .A(n6753), .B(n6752), .Z(n6760) );
  dti_28hc_7t_30_aoi22x3 U5135 ( .A1(n3603), .A2(
        \eda_img_ram/img_memory[3][2][1] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[3][1][1] ), .Z(n4105) );
  dti_28hc_7t_30_nand2x1 U5147 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][4][2] ), .Z(n4393) );
  dti_28hc_7t_30_or2x1 U5150 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [0]), 
        .B(\eda_fifos/sync_fifo_upleft/wr_addr [1]), .Z(n3886) );
  dti_28hc_7t_30_invx1 U5151 ( .A(n6814), .Z(n4927) );
  dti_28hc_7t_30_nor3i1x1 U5153 ( .A(left_addr[4]), .B(left_addr[5]), .C(
        left_addr[3]), .Z(n3892) );
  dti_28hc_7t_30_muxi21xp5 U5154 ( .D0(n5723), .D1(n6063), .S(n5773), .Z(n5726) );
  dti_28hc_7t_30_aoi22x1 U5155 ( .A1(n4723), .A2(n3309), .B1(n4722), .B2(n6657), .Z(n4728) );
  dti_28hc_7t_30_aoi22x1 U5157 ( .A1(n4445), .A2(
        \eda_img_ram/img_memory[4][0][7] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[4][5][7] ), .Z(n3958) );
  dti_28hc_7t_30_aoi22x1 U5158 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[4][2][5] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[4][0][5] ), .Z(n4302) );
  dti_28hc_7t_30_aoi22x1 U5159 ( .A1(n4996), .A2(n3309), .B1(n4995), .B2(n3320), .Z(n5004) );
  dti_28hc_7t_30_nand4px1 U5160 ( .A(n4469), .B(n4468), .C(n4467), .D(n4466), 
        .Z(n5029) );
  dti_28hc_7t_30_aoi22rex1 U5161 ( .A1(n3601), .A2(
        \eda_img_ram/img_memory[5][3][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[5][1][3] ), .Z(n4476) );
  dti_28hc_7t_30_aoi22x1 U5163 ( .A1(n3608), .A2(
        \eda_img_ram/img_memory[2][3][2] ), .B1(
        \eda_img_ram/img_memory[2][2][2] ), .B2(n7517), .Z(n3632) );
  dti_28hc_7t_30_nand4px1 U5171 ( .A(n3637), .B(n4404), .C(n4403), .D(n3636), 
        .Z(n4989) );
  dti_28hc_7t_30_and2x1 U5172 ( .A(n4425), .B(n4426), .Z(n3585) );
  dti_28hc_7t_30_aoi22x1 U5173 ( .A1(n5073), .A2(n3317), .B1(n5072), .B2(n6633), .Z(n5078) );
  dti_28hc_7t_30_aoi22x1 U5175 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[5][4][4] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[5][0][4] ), .Z(n4182) );
  dti_28hc_7t_30_nand3x1 U5176 ( .A(n5328), .B(n5327), .C(n5329), .Z(n3737) );
  dti_28hc_7t_30_nand2x1 U5177 ( .A(n4986), .B(n4856), .Z(n3630) );
  dti_28hc_7t_30_aoi22x1 U5181 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][4][6] ), .B1(n3604), .B2(
        \eda_img_ram/img_memory[3][1][6] ), .Z(n4222) );
  dti_28hc_7t_30_nand3xp5 U5184 ( .A(n5307), .B(n5306), .C(n5305), .Z(n5316)
         );
  dti_28hc_7t_30_and2x1 U5186 ( .A(n4378), .B(n4377), .Z(n3773) );
  dti_28hc_7t_30_nand2x1 U5187 ( .A(n5155), .B(n5148), .Z(n6200) );
  dti_28hc_7t_30_nand2x1 U5188 ( .A(n6198), .B(n6197), .Z(n3844) );
  dti_28hc_7t_30_nand2x1 U5189 ( .A(n5499), .B(n5500), .Z(n3860) );
  dti_28hc_7t_30_nand3x1 U5191 ( .A(n5286), .B(n5285), .C(n5287), .Z(n3740) );
  dti_28hc_7t_30_muxi21x1 U5192 ( .D0(n5835), .D1(n5834), .S(n5833), .Z(n5836)
         );
  dti_28hc_7t_30_nand3x1 U5193 ( .A(n4942), .B(n4941), .C(n4943), .Z(n3739) );
  dti_28hc_7t_30_nand3x1 U5194 ( .A(n4929), .B(n4930), .C(n4928), .Z(n3679) );
  dti_28hc_7t_30_nand3x1 U5196 ( .A(n5214), .B(n5213), .C(n5215), .Z(n3741) );
  dti_28hc_7t_30_nand3x1 U5197 ( .A(n5239), .B(n5238), .C(n5240), .Z(n3865) );
  dti_28hc_7t_30_nor3x1 U5198 ( .A(n3889), .B(
        \eda_fifos/sync_fifo_upleft/o_full ), .C(n3888), .Z(n3887) );
  dti_28hc_7t_30_invx1 U5199 ( .A(n4960), .Z(n3888) );
  dti_28hc_7t_30_nor2x1 U5202 ( .A(n7385), .B(
        \eda_iterated_ram/current_row[4][2] ), .Z(n3758) );
  dti_28hc_7t_30_xor2bx1 U5204 ( .A(\eda_fifos/sync_fifo_left/wr_addr [0]), 
        .B(\eda_fifos/sync_fifo_left/rd_addr [0]), .Z(n6817) );
  dti_28hc_7t_30_and2x1 U5205 ( .A(n7603), .B(n6128), .Z(n6744) );
  dti_28hc_7t_30_nor2i1x1 U5208 ( .A(n6957), .B(n6953), .Z(n6954) );
  dti_28hc_7t_30_nand2x1 U5209 ( .A(n5160), .B(left_addr[5]), .Z(n7153) );
  dti_28hc_7t_30_nor2x1 U5211 ( .A(n5429), .B(n3320), .Z(n5430) );
  dti_28hc_7t_30_nor2i1x1 U5212 ( .A(n6957), .B(n6956), .Z(n6958) );
  dti_28hc_7t_30_invx1 U5213 ( .A(n6901), .Z(n3864) );
  dti_28hc_7t_30_and2x1 U5215 ( .A(n6885), .B(n6886), .Z(n3798) );
  dti_28hc_7t_30_nand2i1x1 U5217 ( .A(n6235), .B(
        \eda_fifos/sync_fifo_down/wr_addr [2]), .Z(n3862) );
  dti_28hc_7t_30_oai112xp5 U5220 ( .C1(n5845), .C2(n5683), .A(n5724), .B(n5681), .Z(n5678) );
  dti_28hc_7t_30_oai112xp5 U5221 ( .C1(n5845), .C2(n5781), .A(n5726), .B(n5724), .Z(n5725) );
  dti_28hc_7t_30_oai112xp5 U5222 ( .C1(n5844), .C2(n5683), .A(n5899), .B(n5681), .Z(n5682) );
  dti_28hc_7t_30_aoi22x1 U5223 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[2][4][2] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[2][5][2] ), .Z(n4053) );
  dti_28hc_7t_30_aoi22x1 U5226 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[0][2][5] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[0][0][5] ), .Z(n4322) );
  dti_28hc_7t_30_aoi22x1 U5227 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[3][3][5] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[3][5][5] ), .Z(n4306) );
  dti_28hc_7t_30_aoi22x1 U5229 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][3][2] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[5][5][2] ), .Z(n4060) );
  dti_28hc_7t_30_muxi21xp5 U5230 ( .D0(n5676), .D1(n5675), .S(n5778), .Z(n5677) );
  dti_28hc_7t_30_muxi21xp5 U5231 ( .D0(n5669), .D1(n5668), .S(n5778), .Z(n5670) );
  dti_28hc_7t_30_muxi21xp5 U5232 ( .D0(n5739), .D1(n5738), .S(n5778), .Z(n5740) );
  dti_28hc_7t_30_muxi21xp5 U5233 ( .D0(n5780), .D1(n5779), .S(n5778), .Z(n5806) );
  dti_28hc_7t_30_muxi21xp5 U5234 ( .D0(n5607), .D1(n5606), .S(n5605), .Z(n5671) );
  dti_28hc_7t_30_aoi22x1 U5237 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][5][5] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[5][2][5] ), .Z(n4568) );
  dti_28hc_7t_30_nand4px1 U5238 ( .A(n4581), .B(n4580), .C(n4579), .D(n4578), 
        .Z(n5053) );
  dti_28hc_7t_30_aoi22x1 U5239 ( .A1(n5095), .A2(n5429), .B1(n5140), .B2(n3548), .Z(n5100) );
  dti_28hc_7t_30_aoi22x1 U5243 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[4][3][1] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[4][5][1] ), .Z(n4114) );
  dti_28hc_7t_30_aoi22x1 U5244 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[2][2][3] ), .B1(n7517), .B2(
        \eda_img_ram/img_memory[2][0][3] ), .Z(n3910) );
  dti_28hc_7t_30_oai112xp5 U5247 ( .C1(n5852), .C2(n5851), .A(n5868), .B(n5853), .Z(n5850) );
  dti_28hc_7t_30_invx1 U5248 ( .A(n6131), .Z(n5700) );
  dti_28hc_7t_30_nand2x1 U5249 ( .A(n3584), .B(n5140), .Z(n5011) );
  dti_28hc_7t_30_nand2x1 U5253 ( .A(n5031), .B(n3317), .Z(n5032) );
  dti_28hc_7t_30_aoi22x1 U5254 ( .A1(n5029), .A2(n6616), .B1(n5028), .B2(n6633), .Z(n5034) );
  dti_28hc_7t_30_nand2x1 U5257 ( .A(n4703), .B(n6657), .Z(n4706) );
  dti_28hc_7t_30_nand2x1 U5260 ( .A(n3584), .B(n6597), .Z(n4434) );
  dti_28hc_7t_30_muxi21xp5 U5264 ( .D0(n5845), .D1(n5844), .S(n5900), .Z(n5882) );
  dti_28hc_7t_30_nand4px2 U5267 ( .A(n3588), .B(n3949), .C(n3589), .D(n3948), 
        .Z(n5084) );
  dti_28hc_7t_30_nand2x1 U5268 ( .A(n4603), .B(
        \eda_img_ram/img_memory[5][3][3] ), .Z(n3949) );
  dti_28hc_7t_30_nand3xp5 U5269 ( .A(n5874), .B(n5858), .C(n5873), .Z(n5859)
         );
  dti_28hc_7t_30_nand3xp5 U5270 ( .A(n5896), .B(n5858), .C(n5874), .Z(n5861)
         );
  dti_28hc_7t_30_nor2i1x1 U5272 ( .A(n5185), .B(n7399), .Z(n3721) );
  dti_28hc_7t_30_nand4xp5 U5274 ( .A(n4954), .B(n4955), .C(n4953), .D(n6104), 
        .Z(n4956) );
  dti_28hc_7t_30_invx1 U5275 ( .A(n4961), .Z(n3889) );
  dti_28hc_7t_30_nor3x1 U5276 ( .A(n6119), .B(n3264), .C(n3874), .Z(n3873) );
  dti_28hc_7t_30_nand2x1 U5277 ( .A(n6098), .B(n5150), .Z(n3876) );
  dti_28hc_7t_30_nand2xp5 U5278 ( .A(n7737), .B(
        \eda_fifos/sync_fifo_down/wr_addr [0]), .Z(n3874) );
  dti_28hc_7t_30_nor2x1 U5279 ( .A(wr_addr[4]), .B(n6282), .Z(n6248) );
  dti_28hc_7t_30_nor2x1 U5280 ( .A(wr_addr[4]), .B(wr_addr[5]), .Z(n6291) );
  dti_28hc_7t_30_nor2x1 U5281 ( .A(wr_addr[2]), .B(wr_addr[0]), .Z(n6257) );
  dti_28hc_7t_30_nand2x1 U5282 ( .A(n6928), .B(n3726), .Z(n3725) );
  dti_28hc_7t_30_nand2x1 U5283 ( .A(n6177), .B(n3576), .Z(n3828) );
  dti_28hc_7t_30_nor2px2 U5284 ( .A(n4612), .B(n3766), .Z(n6186) );
  dti_28hc_7t_30_and3xp58 U5288 ( .A(n5299), .B(n5298), .C(n5297), .Z(n5319)
         );
  dti_28hc_7t_30_xor2bx1 U5289 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [3]), .B(\eda_fifos/sync_fifo_downright/rd_addr [3]), .Z(n4670) );
  dti_28hc_7t_30_aoi13xp5 U5290 ( .B1(n5475), .B2(n5474), .B3(start), .A(n7448), .Z(n6020) );
  dti_28hc_7t_30_and3xp58 U5292 ( .A(n5263), .B(n5264), .C(n5262), .Z(n3831)
         );
  dti_28hc_7t_30_nand3xp5 U5293 ( .A(n5253), .B(n5252), .C(n5251), .Z(n5254)
         );
  dti_28hc_7t_30_nand4xp5 U5294 ( .A(n5244), .B(n5243), .C(n5242), .D(n5241), 
        .Z(n5249) );
  dti_28hc_7t_30_invx1 U5295 ( .A(n6891), .Z(n3810) );
  dti_28hc_7t_30_nand2x1 U5297 ( .A(n5496), .B(new_pixel), .Z(n3801) );
  dti_28hc_7t_30_nor2x1 U5298 ( .A(n6645), .B(n6612), .Z(n3791) );
  dti_28hc_7t_30_nand3x1 U5300 ( .A(wr_addr[4]), .B(n6290), .C(n6282), .Z(
        n6288) );
  dti_28hc_7t_30_nand2x1 U5301 ( .A(wr_addr[3]), .B(n6291), .Z(n6280) );
  dti_28hc_7t_30_nand3x1 U5302 ( .A(wr_addr[1]), .B(write_en), .C(n6254), .Z(
        n6298) );
  dti_28hc_7t_30_invx1 U5305 ( .A(n4938), .Z(n6828) );
  dti_28hc_7t_30_invx1 U5307 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [2]), 
        .Z(n3761) );
  dti_28hc_7t_30_xnor2bx1 U5308 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [0]), .B(\eda_fifos/sync_fifo_downleft/wr_addr [0]), .Z(n6725) );
  dti_28hc_7t_30_nand2x1 U5312 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [0]), 
        .B(\eda_fifos/sync_fifo_upleft/wr_addr [1]), .Z(n3689) );
  dti_28hc_7t_30_nor2x1 U5313 ( .A(n6298), .B(n6288), .Z(n6551) );
  dti_28hc_7t_30_nor2x1 U5314 ( .A(n6294), .B(n6280), .Z(n6566) );
  dti_28hc_7t_30_nor2x1 U5315 ( .A(n6303), .B(n6280), .Z(n6560) );
  dti_28hc_7t_30_nor2x1 U5316 ( .A(n6298), .B(n6302), .Z(n6585) );
  dti_28hc_7t_30_nor2x1 U5317 ( .A(n6300), .B(n6302), .Z(n6592) );
  dti_28hc_7t_30_muxi21x1 U5325 ( .D0(n7104), .D1(n7121), .S(n7241), .Z(n2572)
         );
  dti_28hc_7t_30_nand4xp5 U5328 ( .A(n6777), .B(n6776), .C(n6775), .D(n6774), 
        .Z(n6778) );
  dti_28hc_7t_30_invx1 U5329 ( .A(\eda_fifos/sync_fifo_left/wr_addr [3]), .Z(
        n3686) );
  dti_28hc_7t_30_invx1 U5330 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n3685) );
  dti_28hc_7t_30_muxi21x1 U5331 ( .D0(n7121), .D1(n7103), .S(n7239), .Z(n2578)
         );
  dti_28hc_7t_30_muxi21x1 U5332 ( .D0(n7181), .D1(n7173), .S(n7239), .Z(n2582)
         );
  dti_28hc_7t_30_ioa12hpx1 U5333 ( .B1(n6834), .B2(n6799), .A(n7191), .Z(n2716) );
  dti_28hc_7t_30_or2x1 U5335 ( .A(n5456), .B(n5455), .Z(n3575) );
  dti_28hc_7t_30_xnor2bxp5 U5337 ( .A(
        \eda_fifos/sync_fifo_downright/rd_addr [3]), .B(n5950), .Z(n2850) );
  dti_28hc_7t_30_nand3xp5 U5338 ( .A(n6745), .B(
        \eda_fifos/sync_fifo_downright/rd_addr [2]), .C(
        \eda_fifos/sync_fifo_downright/rd_addr [1]), .Z(n5950) );
  dti_28hc_7t_30_muxi21x2 U5339 ( .D0(n7442), .D1(n7074), .S(n7249), .Z(n2831)
         );
  dti_28hc_7t_30_nand4xp5 U5340 ( .A(n6040), .B(n6039), .C(n6038), .D(n6037), 
        .Z(n6042) );
  dti_28hc_7t_30_nand4xp5 U5341 ( .A(n6823), .B(n6814), .C(n6822), .D(n6813), 
        .Z(n6815) );
  dti_28hc_7t_30_nor2x1 U5342 ( .A(n6744), .B(n3648), .Z(n2849) );
  dti_28hc_7t_30_nand4xp5 U5345 ( .A(n6760), .B(n6761), .C(n6759), .D(n6758), 
        .Z(n6762) );
  dti_28hc_7t_30_muxi21x1 U5346 ( .D0(n7074), .D1(n7068), .S(n7239), .Z(n2580)
         );
  dti_28hc_7t_30_muxi21x1 U5347 ( .D0(n7051), .D1(n7074), .S(n7273), .Z(n2661)
         );
  dti_28hc_7t_30_muxi21x1 U5348 ( .D0(n6160), .D1(n7074), .S(n7000), .Z(n2655)
         );
  dti_28hc_7t_30_muxi21x1 U5350 ( .D0(n7074), .D1(n7037), .S(n7191), .Z(n2699)
         );
  dti_28hc_7t_30_muxi21x1 U5352 ( .D0(n7127), .D1(n7125), .S(n7262), .Z(n2735)
         );
  dti_28hc_7t_30_muxi21x1 U5353 ( .D0(n4081), .D1(n6980), .S(n7262), .Z(n2736)
         );
  dti_28hc_7t_30_muxi21x1 U5354 ( .D0(n3804), .D1(n7034), .S(n7262), .Z(n2737)
         );
  dti_28hc_7t_30_muxi21x1 U5355 ( .D0(n7028), .D1(n6995), .S(n7262), .Z(n2738)
         );
  dti_28hc_7t_30_muxi21x1 U5356 ( .D0(n3775), .D1(n7263), .S(n7262), .Z(n2740)
         );
  dti_28hc_7t_30_muxi21x1 U5357 ( .D0(n3565), .D1(n6985), .S(n7209), .Z(n2624)
         );
  dti_28hc_7t_30_muxi21x1 U5358 ( .D0(n7127), .D1(n7115), .S(n7207), .Z(n2603)
         );
  dti_28hc_7t_30_muxi21x1 U5359 ( .D0(n4081), .D1(n6946), .S(n7207), .Z(n2604)
         );
  dti_28hc_7t_30_muxi21x1 U5360 ( .D0(n7074), .D1(n7045), .S(n7207), .Z(n2605)
         );
  dti_28hc_7t_30_muxi21x1 U5361 ( .D0(n7127), .D1(n7112), .S(n7201), .Z(n2609)
         );
  dti_28hc_7t_30_muxi21x1 U5362 ( .D0(n4081), .D1(n6939), .S(n7201), .Z(n2610)
         );
  dti_28hc_7t_30_muxi21x1 U5363 ( .D0(n7074), .D1(n7042), .S(n7201), .Z(n2611)
         );
  dti_28hc_7t_30_muxi21x1 U5364 ( .D0(n7127), .D1(n7089), .S(n7226), .Z(n2523)
         );
  dti_28hc_7t_30_muxi21x1 U5365 ( .D0(n7229), .D1(n3775), .S(n7228), .Z(n2516)
         );
  dti_28hc_7t_30_muxi21x1 U5366 ( .D0(n3775), .D1(n7227), .S(n7226), .Z(n2528)
         );
  dti_28hc_7t_30_muxi21x1 U5368 ( .D0(n6896), .D1(n6895), .S(n7254), .Z(n2842)
         );
  dti_28hc_7t_30_muxi21x1 U5369 ( .D0(n3804), .D1(n7052), .S(n7213), .Z(n2793)
         );
  dti_28hc_7t_30_muxi21x1 U5371 ( .D0(n3484), .D1(n7155), .S(n7213), .Z(n2795)
         );
  dti_28hc_7t_30_muxi21x1 U5372 ( .D0(n7121), .D1(n7100), .S(n7233), .Z(n2566)
         );
  dti_28hc_7t_30_muxi21x1 U5373 ( .D0(n7006), .D1(n7021), .S(n7228), .Z(n2514)
         );
  dti_28hc_7t_30_muxi21x1 U5374 ( .D0(n7165), .D1(n7181), .S(n7228), .Z(n2515)
         );
  dti_28hc_7t_30_muxi21x1 U5375 ( .D0(n7074), .D1(n7071), .S(n7226), .Z(n2525)
         );
  dti_28hc_7t_30_muxi21x1 U5376 ( .D0(n7021), .D1(n7010), .S(n7233), .Z(n2569)
         );
  dti_28hc_7t_30_muxi21x1 U5378 ( .D0(n7074), .D1(n7063), .S(n7254), .Z(n2843)
         );
  dti_28hc_7t_30_muxi21x1 U5379 ( .D0(n6843), .D1(n6896), .S(n7195), .Z(n2710)
         );
  dti_28hc_7t_30_muxi21x1 U5380 ( .D0(n7039), .D1(n7074), .S(n7195), .Z(n2711)
         );
  dti_28hc_7t_30_muxi21x1 U5381 ( .D0(n6896), .D1(n6851), .S(n7199), .Z(n2692)
         );
  dti_28hc_7t_30_muxi21x1 U5382 ( .D0(n7074), .D1(n7041), .S(n7199), .Z(n2693)
         );
  dti_28hc_7t_30_muxi21x1 U5384 ( .D0(n6896), .D1(n6838), .S(n7191), .Z(n2698)
         );
  dti_28hc_7t_30_muxi21x1 U5387 ( .D0(n7127), .D1(n7116), .S(n7209), .Z(n2621)
         );
  dti_28hc_7t_30_muxi21x1 U5388 ( .D0(n4081), .D1(n6950), .S(n7209), .Z(n2622)
         );
  dti_28hc_7t_30_muxi21x1 U5389 ( .D0(n7074), .D1(n7046), .S(n7209), .Z(n2623)
         );
  dti_28hc_7t_30_muxi21x1 U5391 ( .D0(n6967), .D1(n6900), .S(n7233), .Z(n2567)
         );
  dti_28hc_7t_30_muxi21x1 U5392 ( .D0(n7021), .D1(n7020), .S(n7254), .Z(n2844)
         );
  dti_28hc_7t_30_muxi21x1 U5393 ( .D0(n7074), .D1(n7065), .S(n7233), .Z(n2568)
         );
  dti_28hc_7t_30_muxi21x1 U5394 ( .D0(n3775), .D1(n7212), .S(n7211), .Z(n2620)
         );
  dti_28hc_7t_30_muxi21x1 U5395 ( .D0(n7074), .D1(n7044), .S(n7205), .Z(n2593)
         );
  dti_28hc_7t_30_muxi21x1 U5396 ( .D0(n6896), .D1(n6839), .S(n7193), .Z(n2680)
         );
  dti_28hc_7t_30_muxi21x1 U5399 ( .D0(n3804), .D1(n7035), .S(n7264), .Z(n2749)
         );
  dti_28hc_7t_30_muxi21x1 U5400 ( .D0(n3775), .D1(n7265), .S(n7264), .Z(n2752)
         );
  dti_28hc_7t_30_muxi21x1 U5401 ( .D0(n7225), .D1(n3775), .S(n6871), .Z(n2534)
         );
  dti_28hc_7t_30_muxi21x1 U5402 ( .D0(n6967), .D1(n6964), .S(n7271), .Z(n2666)
         );
  dti_28hc_7t_30_muxi21x1 U5403 ( .D0(n7121), .D1(n7120), .S(n7271), .Z(n2665)
         );
  dti_28hc_7t_30_muxi21x1 U5404 ( .D0(n7153), .D1(n7152), .S(n7271), .Z(n2669)
         );
  dti_28hc_7t_30_muxi21x1 U5405 ( .D0(n7004), .D1(n7021), .S(n6871), .Z(n2532)
         );
  dti_28hc_7t_30_muxi21x1 U5406 ( .D0(n7163), .D1(n7181), .S(n6871), .Z(n2533)
         );
  dti_28hc_7t_30_muxi21x1 U5407 ( .D0(n7074), .D1(n7066), .S(n7235), .Z(n2550)
         );
  dti_28hc_7t_30_muxi21x1 U5408 ( .D0(n6149), .D1(n7074), .S(n6242), .Z(n2643)
         );
  dti_28hc_7t_30_muxi21x1 U5410 ( .D0(n6896), .D1(n6858), .S(n7215), .Z(n2768)
         );
  dti_28hc_7t_30_muxi21x1 U5411 ( .D0(n3804), .D1(n7053), .S(n7215), .Z(n2769)
         );
  dti_28hc_7t_30_muxi21x1 U5413 ( .D0(n3484), .D1(n7156), .S(n7215), .Z(n2771)
         );
  dti_28hc_7t_30_muxi21x1 U5414 ( .D0(n7074), .D1(n7038), .S(n7193), .Z(n2681)
         );
  dti_28hc_7t_30_muxi21x1 U5416 ( .D0(n7028), .D1(n6993), .S(n7258), .Z(n2726)
         );
  dti_28hc_7t_30_muxi21x1 U5417 ( .D0(n3775), .D1(n7259), .S(n7258), .Z(n2728)
         );
  dti_28hc_7t_30_muxi21x1 U5419 ( .D0(n7028), .D1(n6994), .S(n3563), .Z(n2744)
         );
  dti_28hc_7t_30_muxi21x1 U5420 ( .D0(n3775), .D1(n7261), .S(n3563), .Z(n2746)
         );
  dti_28hc_7t_30_muxi21x1 U5421 ( .D0(n7127), .D1(n7113), .S(n7203), .Z(n2597)
         );
  dti_28hc_7t_30_muxi21x1 U5422 ( .D0(n4081), .D1(n6940), .S(n7203), .Z(n2598)
         );
  dti_28hc_7t_30_muxi21x1 U5423 ( .D0(n7074), .D1(n7043), .S(n7203), .Z(n2599)
         );
  dti_28hc_7t_30_muxi21x1 U5424 ( .D0(n3565), .D1(n6982), .S(n7203), .Z(n2600)
         );
  dti_28hc_7t_30_muxi21x1 U5425 ( .D0(n7074), .D1(n7047), .S(n7211), .Z(n2617)
         );
  dti_28hc_7t_30_muxi21x1 U5426 ( .D0(n4081), .D1(n6882), .S(n7230), .Z(n2518)
         );
  dti_28hc_7t_30_muxi21x1 U5428 ( .D0(n7127), .D1(n7092), .S(n7230), .Z(n2517)
         );
  dti_28hc_7t_30_muxi21x1 U5429 ( .D0(n7127), .D1(n7091), .S(n7166), .Z(n2535)
         );
  dti_28hc_7t_30_muxi21x1 U5430 ( .D0(n3775), .D1(n7231), .S(n7230), .Z(n2522)
         );
  dti_28hc_7t_30_muxi21x1 U5431 ( .D0(n3775), .D1(n6166), .S(n7166), .Z(n2540)
         );
  dti_28hc_7t_30_muxi21x1 U5433 ( .D0(n6896), .D1(n6862), .S(n7217), .Z(n2780)
         );
  dti_28hc_7t_30_muxi21x1 U5434 ( .D0(n6863), .D1(n6896), .S(n7219), .Z(n2798)
         );
  dti_28hc_7t_30_muxi21x1 U5435 ( .D0(n3702), .D1(n7236), .S(n7235), .Z(n2553)
         );
  dti_28hc_7t_30_muxi21x1 U5438 ( .D0(n7074), .D1(n7049), .S(n3891), .Z(n2637)
         );
  dti_28hc_7t_30_muxi21x1 U5439 ( .D0(n7074), .D1(n7050), .S(n7271), .Z(n2667)
         );
  dti_28hc_7t_30_muxi21x1 U5440 ( .D0(n7121), .D1(n7101), .S(n7235), .Z(n2548)
         );
  dti_28hc_7t_30_muxi21x1 U5441 ( .D0(n7074), .D1(n6167), .S(n7166), .Z(n2537)
         );
  dti_28hc_7t_30_muxi21x1 U5442 ( .D0(n7021), .D1(n7007), .S(n7166), .Z(n2538)
         );
  dti_28hc_7t_30_muxi21x1 U5443 ( .D0(n7021), .D1(n7008), .S(n7230), .Z(n2520)
         );
  dti_28hc_7t_30_muxi21x1 U5444 ( .D0(n7181), .D1(n7177), .S(n7247), .Z(n2821)
         );
  dti_28hc_7t_30_muxi21x1 U5445 ( .D0(n7021), .D1(n7011), .S(n7235), .Z(n2551)
         );
  dti_28hc_7t_30_muxi21x1 U5446 ( .D0(n7069), .D1(n7074), .S(n7241), .Z(n2574)
         );
  dti_28hc_7t_30_ioa12hpx1 U5450 ( .B1(\eda_fifos/sync_fifo_down/wr_addr [3]), 
        .B2(n3723), .A(n6237), .Z(n6127) );
  dti_28hc_7t_30_xor2bx1 U5453 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [0]), 
        .B(\eda_fifos/sync_fifo_upleft/rd_addr [0]), .Z(n3566) );
  dti_28hc_7t_30_or3xp5 U5454 ( .A(n6828), .B(n6826), .C(n6827), .Z(n3568) );
  dti_28hc_7t_30_or2x1 U5455 ( .A(n3314), .B(n3565), .Z(n3569) );
  dti_28hc_7t_30_invx1 U5457 ( .A(\eda_img_ram/img_memory[1][0][0] ), .Z(n3871) );
  dti_28hc_7t_30_nor3x1 U5459 ( .A(n6174), .B(
        \eda_fifos/sync_fifo_right/o_full ), .C(n3264), .Z(n3576) );
  dti_28hc_7t_30_or2x1 U5460 ( .A(n3314), .B(n7153), .Z(n3578) );
  dti_28hc_7t_30_or2x1 U5461 ( .A(n4340), .B(n3871), .Z(n3579) );
  dti_28hc_7t_30_invx1 U5462 ( .A(\eda_fifos/sync_fifo_downright/rd_addr [2]), 
        .Z(n3869) );
  dti_28hc_7t_30_nand4px1 U5467 ( .A(n3904), .B(n3905), .C(n3903), .D(n3902), 
        .Z(n4754) );
  dti_28hc_7t_30_invx1 U5471 ( .A(\eda_img_ram/img_memory[0][3][7] ), .Z(n6382) );
  dti_28hc_7t_30_nand4px1 U5473 ( .A(n3952), .B(n3950), .C(n3951), .D(n3953), 
        .Z(n3612) );
  dti_28hc_7t_30_aoi22x1 U5479 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[0][4][7] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[0][5][7] ), .Z(n3974) );
  dti_28hc_7t_30_aoi22x1 U5481 ( .A1(n5020), .A2(n4855), .B1(n5017), .B2(n4856), .Z(n4799) );
  dti_28hc_7t_30_aoi13rehpx2 U5482 ( .B1(n3980), .B2(n3981), .B3(n3982), .A(
        n5589), .Z(n5881) );
  dti_28hc_7t_30_aoi22x1 U5484 ( .A1(n3608), .A2(
        \eda_img_ram/img_memory[1][3][3] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[1][2][3] ), .Z(n4485) );
  dti_28hc_7t_30_nand4x1 U5491 ( .A(n4545), .B(n4544), .C(n4543), .D(n4542), 
        .Z(n3618) );
  dti_28hc_7t_30_nand2x2 U5494 ( .A(\eda_iterated_ram/current_row[5][2] ), .B(
        n4855), .Z(n4688) );
  dti_28hc_7t_30_aoi22x1 U5496 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[5][4][1] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[5][1][1] ), .Z(n4428) );
  dti_28hc_7t_30_xor2bx1 U5498 ( .A(n5733), .B(n5613), .Z(n3766) );
  dti_28hc_7t_30_invx1 U5501 ( .A(n6740), .Z(n3647) );
  dti_28hc_7t_30_xnor2optax4 U5503 ( .A(
        \eda_fifos/sync_fifo_upright/wr_addr [0]), .B(
        \eda_fifos/sync_fifo_upright/rd_addr [0]), .Z(n6829) );
  dti_28hc_7t_30_invx1 U5506 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [2]), 
        .Z(n6847) );
  dti_28hc_7t_30_xor2bx1 U5509 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [2]), .B(\eda_fifos/sync_fifo_downright/rd_addr [2]), .Z(n3746) );
  dti_28hc_7t_30_muxi21x1 U5512 ( .D0(n3565), .D1(n6981), .S(n7201), .Z(n2612)
         );
  dti_28hc_7t_30_muxi21x1 U5513 ( .D0(n3775), .D1(n3685), .S(n6234), .Z(n2708)
         );
  dti_28hc_7t_30_aoi22x1 U5517 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[1][5][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[1][1][3] ), .Z(n4484) );
  dti_28hc_7t_30_aoi22x1 U5518 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[0][5][7] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[0][2][7] ), .Z(n4607) );
  dti_28hc_7t_30_aoi22x1 U5519 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[4][4][5] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[4][1][5] ), .Z(n4339) );
  dti_28hc_7t_30_muxi21x1 U5520 ( .D0(n3565), .D1(n6984), .S(n7207), .Z(n2606)
         );
  dti_28hc_7t_30_muxi21x1 U5523 ( .D0(n3702), .D1(n7240), .S(n7239), .Z(n2583)
         );
  dti_28hc_7t_30_aoi22hpx1 U5526 ( .A1(n5139), .A2(n5589), .B1(n5138), .B2(
        n4856), .Z(n4835) );
  dti_28hc_7t_30_muxi21x2 U5539 ( .D0(n6888), .D1(n6896), .S(n7245), .Z(n2824)
         );
  dti_28hc_7t_30_nand3x1 U5541 ( .A(n5347), .B(n5348), .C(n5346), .Z(n3722) );
  dti_28hc_7t_30_nand2x2 U5542 ( .A(n3723), .B(
        \eda_fifos/sync_fifo_down/rd_addr [1]), .Z(n6755) );
  dti_28hc_7t_30_invx2 U5543 ( .A(\eda_fifos/sync_fifo_down/wr_addr [1]), .Z(
        n3723) );
  dti_28hc_7t_30_nand2x1 U5545 ( .A(n4946), .B(n3725), .Z(n4873) );
  dti_28hc_7t_30_nand2x1 U5549 ( .A(n3742), .B(n3740), .Z(n5296) );
  dti_28hc_7t_30_nand2xp5 U5551 ( .A(n3742), .B(n6011), .Z(n6793) );
  dti_28hc_7t_30_nand2x1 U5552 ( .A(n3742), .B(
        \eda_fifos/sync_fifo_upright/rd_addr [0]), .Z(n6791) );
  dti_28hc_7t_30_xor2bx2 U5555 ( .A(\eda_fifos/sync_fifo_downleft/wr_addr [3]), 
        .B(\eda_fifos/sync_fifo_downleft/rd_addr [3]), .Z(n3759) );
  dti_28hc_7t_30_nand3hpx1 U5556 ( .A(n3763), .B(n5426), .C(n5427), .Z(n3762)
         );
  dti_28hc_7t_30_nand4px1 U5563 ( .A(n4238), .B(n4237), .C(n4236), .D(n4235), 
        .Z(n4702) );
  dti_28hc_7t_30_aoi22x1 U5566 ( .A1(n4761), .A2(n6604), .B1(n4765), .B2(n3320), .Z(n4633) );
  dti_28hc_7t_30_muxi21x1 U5570 ( .D0(n7055), .D1(n3804), .S(n7219), .Z(n2799)
         );
  dti_28hc_7t_30_nand4px1 U5576 ( .A(n4624), .B(n4623), .C(n4622), .D(n4621), 
        .Z(n5591) );
  dti_28hc_7t_30_nand2i1x2 U5586 ( .A(\eda_fifos/sync_fifo_right/wr_addr [1]), 
        .B(\eda_fifos/sync_fifo_right/rd_addr [1]), .Z(n4888) );
  dti_28hc_7t_30_nand4px1 U5587 ( .A(n4056), .B(n4055), .C(n4057), .D(n4054), 
        .Z(n4714) );
  dti_28hc_7t_30_muxi21x1 U5590 ( .D0(n3804), .D1(n7054), .S(n7217), .Z(n2781)
         );
  dti_28hc_7t_30_invx2 U5605 ( .A(n4709), .Z(n5875) );
  dti_28hc_7t_30_aoi22x1 U5607 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[1][3][6] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[1][5][6] ), .Z(n4233) );
  dti_28hc_7t_30_muxi21x1 U5610 ( .D0(n3565), .D1(n6983), .S(n7205), .Z(n2594)
         );
  dti_28hc_7t_30_muxi21x1 U5611 ( .D0(n3565), .D1(n6986), .S(n7211), .Z(n2618)
         );
  dti_28hc_7t_30_muxi21x1 U5613 ( .D0(n3702), .D1(n7234), .S(n7233), .Z(n2571)
         );
  dti_28hc_7t_30_muxi21x1 U5614 ( .D0(n7181), .D1(n7170), .S(n7233), .Z(n2570)
         );
  dti_28hc_7t_30_nand4px1 U5619 ( .A(n4780), .B(n4777), .C(n4778), .D(n4779), 
        .Z(n5663) );
  dti_28hc_7t_30_muxi21x1 U5620 ( .D0(n7111), .D1(n6208), .S(n6234), .Z(n2703)
         );
  dti_28hc_7t_30_aoi22x1 U5621 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[1][3][0] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[1][5][0] ), .Z(n4260) );
  dti_28hc_7t_30_aoi22x1 U5624 ( .A1(n5008), .A2(n6633), .B1(n5005), .B2(n4836), .Z(n4435) );
  dti_28hc_7t_30_aoi22x1 U5625 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[1][3][2] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[1][5][2] ), .Z(n4056) );
  dti_28hc_7t_30_muxi21x1 U5628 ( .D0(n7097), .D1(n7111), .S(n3848), .Z(n2785)
         );
  dti_28hc_7t_30_nand4px1 U5630 ( .A(n4607), .B(n4606), .C(n4605), .D(n4604), 
        .Z(n5051) );
  dti_28hc_7t_30_aoi22x1 U5631 ( .A1(n5031), .A2(n5589), .B1(n5026), .B2(n6657), .Z(n4784) );
  dti_28hc_7t_30_aoi22x1 U5633 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[5][4][7] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[5][5][7] ), .Z(n3966) );
  dti_28hc_7t_30_aoi22x1 U5634 ( .A1(n4725), .A2(n6597), .B1(n4722), .B2(n4836), .Z(n4642) );
  dti_28hc_7t_30_muxi21x1 U5635 ( .D0(n3484), .D1(n7146), .S(n7258), .Z(n2727)
         );
  dti_28hc_7t_30_nand4px1 U5638 ( .A(n4444), .B(n4443), .C(n4442), .D(n4441), 
        .Z(n4997) );
  dti_28hc_7t_30_muxi21x1 U5639 ( .D0(n7181), .D1(n7180), .S(n7254), .Z(n2845)
         );
  dti_28hc_7t_30_muxi21x1 U5642 ( .D0(n7021), .D1(n7005), .S(n7226), .Z(n2526)
         );
  dti_28hc_7t_30_muxi21x1 U5643 ( .D0(n3484), .D1(n7149), .S(n7264), .Z(n2751)
         );
  dti_28hc_7t_30_aoi22x1 U5651 ( .A1(n5030), .A2(n6597), .B1(n5027), .B2(n3319), .Z(n4492) );
  dti_28hc_7t_30_muxi21x1 U5654 ( .D0(n4081), .D1(n6974), .S(n7256), .Z(n2730)
         );
  dti_28hc_7t_30_muxi21x1 U5656 ( .D0(n7021), .D1(n7013), .S(n7239), .Z(n2581)
         );
  dti_28hc_7t_30_nand4px1 U5658 ( .A(n4788), .B(n4785), .C(n4786), .D(n4787), 
        .Z(n5673) );
  dti_28hc_7t_30_aoi22x1 U5662 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[1][0][4] ), .B1(n6174), .B2(
        \eda_img_ram/img_memory[1][4][4] ), .Z(n4186) );
  dti_28hc_7t_30_aoi22x1 U5664 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[0][0][7] ), .B1(n6086), .B2(
        \eda_img_ram/img_memory[0][2][7] ), .Z(n3975) );
  dti_28hc_7t_30_aoi22x1 U5665 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[3][2][5] ), .B1(
        \eda_img_ram/img_memory[3][5][5] ), .B2(n4582), .Z(n4556) );
  dti_28hc_7t_30_nand2x3 U5666 ( .A(n5073), .B(n6633), .Z(n3879) );
  dti_28hc_7t_30_iao12x1 U5669 ( .B1(n6979), .B2(
        \eda_fifos/sync_fifo_left/wr_addr [0]), .A(n6975), .Z(n2761) );
  dti_28hc_7t_30_muxi21x1 U5678 ( .D0(n6967), .D1(n6909), .S(n7239), .Z(n2579)
         );
  dti_28hc_7t_30_muxi21x1 U5680 ( .D0(n7181), .D1(n7164), .S(n7226), .Z(n2527)
         );
  dti_28hc_7t_30_muxi21x2 U5681 ( .D0(n7246), .D1(n3775), .S(n7245), .Z(n2828)
         );
  dti_28hc_7t_30_muxi21x2 U5682 ( .D0(n3775), .D1(n7222), .S(n7221), .Z(n2790)
         );
  dti_28hc_7t_30_xnor2bx1 U5685 ( .A(n5542), .B(n3241), .Z(n5090) );
  dti_28hc_7t_30_muxi21x2 U5686 ( .D0(n3775), .D1(n7224), .S(n7223), .Z(n2778)
         );
  dti_28hc_7t_30_muxi21x2 U5687 ( .D0(n3484), .D1(n7160), .S(n7223), .Z(n2777)
         );
  dti_28hc_7t_30_muxi21x2 U5688 ( .D0(n6896), .D1(n6868), .S(n7223), .Z(n2774)
         );
  dti_28hc_7t_30_muxi21x1 U5689 ( .D0(n3484), .D1(n7145), .S(n7256), .Z(n2733)
         );
  dti_28hc_7t_30_muxi21x1 U5691 ( .D0(n3804), .D1(n7031), .S(n7256), .Z(n2731)
         );
  dti_28hc_7t_30_muxi21x1 U5692 ( .D0(n7028), .D1(n6992), .S(n7256), .Z(n2732)
         );
  dti_28hc_7t_30_muxi21x1 U5693 ( .D0(n3775), .D1(n7257), .S(n7256), .Z(n2734)
         );
  dti_28hc_7t_30_muxi21x1 U5694 ( .D0(n7074), .D1(n6173), .S(n7161), .Z(n2507)
         );
  dti_28hc_7t_30_nand2x2 U5697 ( .A(n6755), .B(n4668), .Z(n6757) );
  dti_28hc_7t_30_aoi22x1 U5701 ( .A1(n5040), .A2(n6597), .B1(n5039), .B2(n3320), .Z(n5048) );
  dti_28hc_7t_30_xor2bx1 U5702 ( .A(n5871), .B(n5706), .Z(n6182) );
  dti_28hc_7t_30_xnor2bx1 U5703 ( .A(n5871), .B(n5588), .Z(n5089) );
  dti_28hc_7t_30_aoi22x1 U5704 ( .A1(n5050), .A2(n3320), .B1(n5049), .B2(n3309), .Z(n5058) );
  dti_28hc_7t_30_or2hpx4 U5708 ( .A(left_addr[4]), .B(left_addr[5]), .Z(n3900)
         );
  dti_28hc_7t_30_xor2bx1 U5710 ( .A(n5881), .B(n5613), .Z(n4012) );
  dti_28hc_7t_30_nand2px4 U5711 ( .A(n6949), .B(n4362), .Z(n7201) );
  dti_28hc_7t_30_nand3i1x1 U5712 ( .A(n6777), .B(n5304), .C(n5303), .Z(n5318)
         );
  dti_28hc_7t_30_aoi22x1 U5716 ( .A1(n5063), .A2(n5429), .B1(n3615), .B2(n3320), .Z(n5068) );
  dti_28hc_7t_30_aoi22x1 U5717 ( .A1(n6738), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][5] ), 
        .B1(n5419), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][5] ), 
        .Z(n4915) );
  dti_28hc_7t_30_ioa13xp5 U5719 ( .B1(n5203), .B2(n5202), .B3(n5201), .A(n5415), .Z(n5204) );
  dti_28hc_7t_30_xor2bx1 U5722 ( .A(n5134), .B(n5701), .Z(n6129) );
  dti_28hc_7t_30_xor2bx1 U5723 ( .A(n5871), .B(n4759), .Z(n6609) );
  dti_28hc_7t_30_nor2x1 U5724 ( .A(wr_addr[2]), .B(n6252), .Z(n6254) );
  dti_28hc_7t_30_nor2x1 U5728 ( .A(n6298), .B(n6280), .Z(n6562) );
  dti_28hc_7t_30_nor2x1 U5729 ( .A(n6292), .B(n6280), .Z(n6568) );
  dti_28hc_7t_30_nor2x1 U5730 ( .A(n6300), .B(n6280), .Z(n6570) );
  dti_28hc_7t_30_nor2x1 U5731 ( .A(n6292), .B(n6302), .Z(n6590) );
  dti_28hc_7t_30_nor2x1 U5732 ( .A(n6303), .B(n6302), .Z(n6583) );
  dti_28hc_7t_30_muxi21x1 U5733 ( .D0(n6157), .D1(n3702), .S(n7000), .Z(n2658)
         );
  dti_28hc_7t_30_muxi21x1 U5734 ( .D0(n3484), .D1(n7148), .S(n7262), .Z(n2739)
         );
  dti_28hc_7t_30_muxi21x1 U5735 ( .D0(n4081), .D1(n6875), .S(n7226), .Z(n2524)
         );
  dti_28hc_7t_30_muxi21x1 U5736 ( .D0(n6896), .D1(n6856), .S(n7213), .Z(n2792)
         );
  dti_28hc_7t_30_muxi21x1 U5737 ( .D0(n7072), .D1(n7074), .S(n7228), .Z(n2513)
         );
  dti_28hc_7t_30_muxi21x1 U5738 ( .D0(n7275), .D1(n3702), .S(n7273), .Z(n2664)
         );
  dti_28hc_7t_30_muxi21x1 U5739 ( .D0(n3565), .D1(n6210), .S(n6234), .Z(n2706)
         );
  dti_28hc_7t_30_muxi21x1 U5740 ( .D0(n7028), .D1(n6996), .S(n7264), .Z(n2750)
         );
  dti_28hc_7t_30_muxi21x1 U5741 ( .D0(n6151), .D1(n6967), .S(n6242), .Z(n2642)
         );
  dti_28hc_7t_30_muxi21x1 U5742 ( .D0(n3804), .D1(n7032), .S(n7258), .Z(n2725)
         );
  dti_28hc_7t_30_muxi21x1 U5743 ( .D0(n3775), .D1(n7204), .S(n7203), .Z(n2602)
         );
  dti_28hc_7t_30_muxi21x1 U5745 ( .D0(n3484), .D1(n7157), .S(n7217), .Z(n2783)
         );
  dti_28hc_7t_30_ioa12hpx1 U5746 ( .B1(n6127), .B2(
        \eda_fifos/sync_fifo_down/wr_addr [2]), .A(n7233), .Z(n2585) );
  dti_28hc_7t_30_invx1 U5747 ( .A(n7436), .Z(\matrix_output[4][3] ) );
  dti_28hc_7t_30_nand2x1 U5749 ( .A(\eda_iterated_ram/current_row[5][2] ), .B(
        n5140), .Z(n3894) );
  dti_28hc_7t_30_invx2 U5750 ( .A(n3892), .Z(n6626) );
  dti_28hc_7t_30_nand2x1 U5752 ( .A(\eda_iterated_ram/current_row[4][2] ), .B(
        n6597), .Z(n3893) );
  dti_28hc_7t_30_nand2x1 U5753 ( .A(n5149), .B(n5154), .Z(n4961) );
  dti_28hc_7t_30_nand2x1 U5754 ( .A(n6595), .B(
        \eda_img_ram/img_memory[3][5][3] ), .Z(n3897) );
  dti_28hc_7t_30_nand2x1 U5755 ( .A(n6191), .B(
        \eda_img_ram/img_memory[3][4][3] ), .Z(n3896) );
  dti_28hc_7t_30_nand2x1 U5757 ( .A(n6174), .B(
        \eda_img_ram/img_memory[4][4][3] ), .Z(n3902) );
  dti_28hc_7t_30_aoi22x1 U5758 ( .A1(n4753), .A2(n6616), .B1(n4754), .B2(n3309), .Z(n3928) );
  dti_28hc_7t_30_nand2x1 U5759 ( .A(n6595), .B(
        \eda_img_ram/img_memory[2][5][3] ), .Z(n3909) );
  dti_28hc_7t_30_nand2x1 U5760 ( .A(n6174), .B(
        \eda_img_ram/img_memory[2][4][3] ), .Z(n3908) );
  dti_28hc_7t_30_nand2x1 U5762 ( .A(n6595), .B(
        \eda_img_ram/img_memory[1][5][3] ), .Z(n3913) );
  dti_28hc_7t_30_nand2x1 U5763 ( .A(n6174), .B(
        \eda_img_ram/img_memory[1][4][3] ), .Z(n3912) );
  dti_28hc_7t_30_nand2x1 U5765 ( .A(n6174), .B(
        \eda_img_ram/img_memory[5][4][3] ), .Z(n3916) );
  dti_28hc_7t_30_nand2x1 U5766 ( .A(n4755), .B(n5140), .Z(n3926) );
  dti_28hc_7t_30_nand2x1 U5767 ( .A(n6595), .B(
        \eda_img_ram/img_memory[0][5][3] ), .Z(n3922) );
  dti_28hc_7t_30_nand2x1 U5768 ( .A(n6191), .B(
        \eda_img_ram/img_memory[0][4][3] ), .Z(n3921) );
  dti_28hc_7t_30_nand2x1 U5769 ( .A(n5696), .B(n6633), .Z(n3925) );
  dti_28hc_7t_30_nand2x1 U5771 ( .A(n3931), .B(
        \eda_img_ram/img_memory[2][0][3] ), .Z(n3933) );
  dti_28hc_7t_30_nand2x1 U5772 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][3][3] ), .Z(n3932) );
  dti_28hc_7t_30_nand2x1 U5773 ( .A(n4603), .B(
        \eda_img_ram/img_memory[4][3][3] ), .Z(n3937) );
  dti_28hc_7t_30_nand2x1 U5774 ( .A(n6174), .B(
        \eda_img_ram/img_memory[4][5][3] ), .Z(n3936) );
  dti_28hc_7t_30_nand2x1 U5775 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][3][3] ), .Z(n3941) );
  dti_28hc_7t_30_nand2x1 U5776 ( .A(n6174), .B(
        \eda_img_ram/img_memory[3][5][3] ), .Z(n3940) );
  dti_28hc_7t_30_nand2x1 U5778 ( .A(n6191), .B(
        \eda_img_ram/img_memory[5][5][3] ), .Z(n3948) );
  dti_28hc_7t_30_nand2x1 U5783 ( .A(n3599), .B(
        \eda_img_ram/img_memory[4][1][7] ), .Z(n3956) );
  dti_28hc_7t_30_nand2x1 U5785 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][2][7] ), .Z(n3961) );
  dti_28hc_7t_30_nand2x1 U5786 ( .A(n3316), .B(
        \eda_img_ram/img_memory[1][1][7] ), .Z(n3960) );
  dti_28hc_7t_30_aoi22x1 U5787 ( .A1(n4722), .A2(n6597), .B1(n4724), .B2(n3317), .Z(n3982) );
  dti_28hc_7t_30_nand2x1 U5789 ( .A(n3602), .B(
        \eda_img_ram/img_memory[5][1][7] ), .Z(n3965) );
  dti_28hc_7t_30_nand2x1 U5790 ( .A(n4541), .B(
        \eda_img_ram/img_memory[5][3][7] ), .Z(n3964) );
  dti_28hc_7t_30_nand2x1 U5797 ( .A(n4541), .B(
        \eda_img_ram/img_memory[0][3][7] ), .Z(n3972) );
  dti_28hc_7t_30_aoi22rex1 U5798 ( .A1(n4597), .A2(
        \eda_img_ram/img_memory[2][0][7] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[2][5][7] ), .Z(n3978) );
  dti_28hc_7t_30_nand2x1 U5801 ( .A(n6174), .B(
        \eda_img_ram/img_memory[3][5][7] ), .Z(n3984) );
  dti_28hc_7t_30_nand2x1 U5804 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][3][7] ), .Z(n3987) );
  dti_28hc_7t_30_nand2x1 U5809 ( .A(n3931), .B(
        \eda_img_ram/img_memory[0][0][7] ), .Z(n3999) );
  dti_28hc_7t_30_nand2x1 U5816 ( .A(n3607), .B(
        \eda_img_ram/img_memory[4][2][2] ), .Z(n4018) );
  dti_28hc_7t_30_nand2x1 U5827 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][2][2] ), .Z(n4043) );
  dti_28hc_7t_30_nand2x1 U5830 ( .A(n4603), .B(
        \eda_img_ram/img_memory[4][2][2] ), .Z(n4047) );
  dti_28hc_7t_30_nand2x1 U5831 ( .A(n6191), .B(
        \eda_img_ram/img_memory[4][4][2] ), .Z(n4046) );
  dti_28hc_7t_30_aoi22x1 U5832 ( .A1(n4712), .A2(n6616), .B1(n4715), .B2(n3321), .Z(n4069) );
  dti_28hc_7t_30_aoi22rex1 U5833 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[2][3][2] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[2][0][2] ), .Z(n4052) );
  dti_28hc_7t_30_nand2x1 U5834 ( .A(n3606), .B(
        \eda_img_ram/img_memory[2][1][2] ), .Z(n4051) );
  dti_28hc_7t_30_nand2x1 U5835 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][2][2] ), .Z(n4050) );
  dti_28hc_7t_30_nand4px1 U5836 ( .A(n4052), .B(n4050), .C(n4051), .D(n4053), 
        .Z(n4710) );
  dti_28hc_7t_30_nand2x1 U5837 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][2][2] ), .Z(n4055) );
  dti_28hc_7t_30_nand2x1 U5838 ( .A(n6191), .B(
        \eda_img_ram/img_memory[1][4][2] ), .Z(n4054) );
  dti_28hc_7t_30_nand2x1 U5840 ( .A(n4603), .B(
        \eda_img_ram/img_memory[5][2][2] ), .Z(n4059) );
  dti_28hc_7t_30_nand4px1 U5842 ( .A(n4061), .B(n4060), .C(n4059), .D(n4058), 
        .Z(n4713) );
  dti_28hc_7t_30_nand2x1 U5843 ( .A(n4713), .B(n5140), .Z(n4067) );
  dti_28hc_7t_30_nand2x1 U5845 ( .A(n3608), .B(
        \eda_img_ram/img_memory[0][1][2] ), .Z(n4063) );
  dti_28hc_7t_30_nand2x1 U5846 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][2][2] ), .Z(n4062) );
  dti_28hc_7t_30_nand4px1 U5847 ( .A(n4065), .B(n4064), .C(n4063), .D(n4062), 
        .Z(n4711) );
  dti_28hc_7t_30_nand2x1 U5848 ( .A(n4711), .B(n6633), .Z(n4066) );
  dti_28hc_7t_30_nand2x1 U5849 ( .A(n6635), .B(new_pixel), .Z(n6192) );
  dti_28hc_7t_30_nor2x1 U5850 ( .A(n6192), .B(n4592), .Z(n4960) );
  dti_28hc_7t_30_aoi22x1 U5851 ( .A1(\eda_iterated_ram/current_row[3][0] ), 
        .A2(n5429), .B1(\eda_iterated_ram/current_row[4][0] ), .B2(n3309), .Z(
        n4073) );
  dti_28hc_7t_30_nand2x1 U5853 ( .A(\eda_iterated_ram/current_row[1][0] ), .B(
        n3317), .Z(n4070) );
  dti_28hc_7t_30_nand2x1 U5861 ( .A(\eda_iterated_ram/current_row[5][3] ), .B(
        n5140), .Z(n4083) );
  dti_28hc_7t_30_nand2x1 U5862 ( .A(\eda_iterated_ram/current_row[3][3] ), .B(
        n5429), .Z(n4082) );
  dti_28hc_7t_30_invx1 U5866 ( .A(\eda_img_ram/img_memory[4][0][1] ), .Z(n6526) );
  dti_28hc_7t_30_nand2x1 U5868 ( .A(n5150), .B(
        \eda_img_ram/img_memory[5][0][1] ), .Z(n4090) );
  dti_28hc_7t_30_nand2x1 U5871 ( .A(n6191), .B(
        \eda_img_ram/img_memory[0][5][1] ), .Z(n4099) );
  dti_28hc_7t_30_nand2x1 U5876 ( .A(n4445), .B(
        \eda_img_ram/img_memory[3][0][1] ), .Z(n4109) );
  dti_28hc_7t_30_nand2x1 U5877 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][2][1] ), .Z(n4108) );
  dti_28hc_7t_30_nand2x1 U5879 ( .A(n4445), .B(
        \eda_img_ram/img_memory[4][0][1] ), .Z(n4113) );
  dti_28hc_7t_30_nand2x1 U5880 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][2][1] ), .Z(n4112) );
  dti_28hc_7t_30_nand2x1 U5881 ( .A(n4602), .B(
        \eda_img_ram/img_memory[2][0][1] ), .Z(n4117) );
  dti_28hc_7t_30_nand2x1 U5883 ( .A(n4602), .B(
        \eda_img_ram/img_memory[1][0][1] ), .Z(n4121) );
  dti_28hc_7t_30_nand2x1 U5884 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][2][1] ), .Z(n4120) );
  dti_28hc_7t_30_nand2x1 U5887 ( .A(n4445), .B(
        \eda_img_ram/img_memory[5][0][1] ), .Z(n4125) );
  dti_28hc_7t_30_nand2x1 U5888 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][2][1] ), .Z(n4124) );
  dti_28hc_7t_30_nand2x1 U5890 ( .A(n4693), .B(n5140), .Z(n4133) );
  dti_28hc_7t_30_nand2x1 U5892 ( .A(n4445), .B(
        \eda_img_ram/img_memory[0][0][1] ), .Z(n4129) );
  dti_28hc_7t_30_nand2x1 U5893 ( .A(n4603), .B(
        \eda_img_ram/img_memory[0][2][1] ), .Z(n4128) );
  dti_28hc_7t_30_nand2x1 U5895 ( .A(n4694), .B(n6633), .Z(n4132) );
  dti_28hc_7t_30_nand2x1 U5897 ( .A(n4582), .B(
        \eda_img_ram/img_memory[1][4][4] ), .Z(n4136) );
  dti_28hc_7t_30_invx1 U5901 ( .A(\eda_img_ram/img_memory[5][0][4] ), .Z(n6444) );
  dti_28hc_7t_30_nand2x1 U5906 ( .A(n4602), .B(
        \eda_img_ram/img_memory[2][0][4] ), .Z(n4163) );
  dti_28hc_7t_30_nand4px1 U5907 ( .A(n4166), .B(n4165), .C(n4164), .D(n4163), 
        .Z(n4742) );
  dti_28hc_7t_30_aoi22rex1 U5908 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][4][4] ), .B1(n7613), .B2(
        \eda_img_ram/img_memory[4][0][4] ), .Z(n4170) );
  dti_28hc_7t_30_nand2x1 U5910 ( .A(n4603), .B(
        \eda_img_ram/img_memory[4][2][4] ), .Z(n4168) );
  dti_28hc_7t_30_nand2x1 U5911 ( .A(n3606), .B(
        \eda_img_ram/img_memory[4][1][4] ), .Z(n4167) );
  dti_28hc_7t_30_nand2x1 U5915 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][2][4] ), .Z(n4172) );
  dti_28hc_7t_30_nand2x1 U5916 ( .A(n3599), .B(
        \eda_img_ram/img_memory[3][1][4] ), .Z(n4171) );
  dti_28hc_7t_30_aoi22rex1 U5917 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[0][4][4] ), .B1(n3606), .B2(
        \eda_img_ram/img_memory[0][1][4] ), .Z(n4178) );
  dti_28hc_7t_30_nand2x1 U5919 ( .A(n6080), .B(
        \eda_img_ram/img_memory[0][3][4] ), .Z(n4176) );
  dti_28hc_7t_30_nand2x1 U5922 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][2][4] ), .Z(n4180) );
  dti_28hc_7t_30_nand2x1 U5923 ( .A(n3316), .B(
        \eda_img_ram/img_memory[5][1][4] ), .Z(n4179) );
  dti_28hc_7t_30_nand2x1 U5924 ( .A(n4743), .B(n5140), .Z(n4188) );
  dti_28hc_7t_30_nand2x1 U5925 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][2][4] ), .Z(n4184) );
  dti_28hc_7t_30_nand2x1 U5926 ( .A(n3606), .B(
        \eda_img_ram/img_memory[1][1][4] ), .Z(n4183) );
  dti_28hc_7t_30_nand2x1 U5927 ( .A(n4741), .B(n3317), .Z(n4187) );
  dti_28hc_7t_30_nand2x1 U5934 ( .A(n3607), .B(
        \eda_img_ram/img_memory[4][2][6] ), .Z(n4206) );
  dti_28hc_7t_30_nand2x1 U5935 ( .A(n6174), .B(
        \eda_img_ram/img_memory[5][5][6] ), .Z(n4212) );
  dti_28hc_7t_30_nand2x1 U5938 ( .A(n4602), .B(
        \eda_img_ram/img_memory[3][0][6] ), .Z(n4220) );
  dti_28hc_7t_30_nand2x1 U5939 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][2][6] ), .Z(n4219) );
  dti_28hc_7t_30_nand2x1 U5941 ( .A(n4445), .B(
        \eda_img_ram/img_memory[4][0][6] ), .Z(n4224) );
  dti_28hc_7t_30_nand2x1 U5942 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][2][6] ), .Z(n4223) );
  dti_28hc_7t_30_aoi22x1 U5944 ( .A1(n4700), .A2(n6616), .B1(n4703), .B2(n6597), .Z(n4246) );
  dti_28hc_7t_30_nand2x1 U5945 ( .A(n4445), .B(
        \eda_img_ram/img_memory[2][0][6] ), .Z(n4228) );
  dti_28hc_7t_30_nand2x1 U5946 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][2][6] ), .Z(n4227) );
  dti_28hc_7t_30_aoi22rex1 U5947 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[1][4][6] ), .B1(n3606), .B2(
        \eda_img_ram/img_memory[1][1][6] ), .Z(n4234) );
  dti_28hc_7t_30_nand2x1 U5948 ( .A(n4445), .B(
        \eda_img_ram/img_memory[1][0][6] ), .Z(n4232) );
  dti_28hc_7t_30_nand2x1 U5949 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][2][6] ), .Z(n4231) );
  dti_28hc_7t_30_aoi22x1 U5950 ( .A1(n4699), .A2(n3320), .B1(n4704), .B2(n3317), .Z(n4245) );
  dti_28hc_7t_30_nand2x1 U5952 ( .A(n6122), .B(
        \eda_img_ram/img_memory[5][0][6] ), .Z(n4236) );
  dti_28hc_7t_30_nand2x1 U5953 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][2][6] ), .Z(n4235) );
  dti_28hc_7t_30_nand2x1 U5956 ( .A(n7613), .B(
        \eda_img_ram/img_memory[0][0][6] ), .Z(n4240) );
  dti_28hc_7t_30_nand2x1 U5959 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][2][0] ), .Z(n4248) );
  dti_28hc_7t_30_nand2x1 U5960 ( .A(n4602), .B(
        \eda_img_ram/img_memory[3][0][0] ), .Z(n4247) );
  dti_28hc_7t_30_nand2x1 U5961 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][2][0] ), .Z(n4252) );
  dti_28hc_7t_30_nand2x1 U5962 ( .A(n7613), .B(
        \eda_img_ram/img_memory[4][0][0] ), .Z(n4251) );
  dti_28hc_7t_30_nand2x1 U5963 ( .A(n7613), .B(
        \eda_img_ram/img_memory[2][0][0] ), .Z(n4256) );
  dti_28hc_7t_30_nand2x1 U5964 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][2][0] ), .Z(n4255) );
  dti_28hc_7t_30_aoi22rex1 U5966 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[1][4][0] ), .B1(n3606), .B2(
        \eda_img_ram/img_memory[1][1][0] ), .Z(n4261) );
  dti_28hc_7t_30_nand2x1 U5967 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][2][0] ), .Z(n4259) );
  dti_28hc_7t_30_aoi22x1 U5969 ( .A1(n4763), .A2(n3320), .B1(n4760), .B2(n3317), .Z(n4272) );
  dti_28hc_7t_30_nand2x1 U5971 ( .A(n7613), .B(
        \eda_img_ram/img_memory[5][0][0] ), .Z(n4263) );
  dti_28hc_7t_30_nand2x1 U5972 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][2][0] ), .Z(n4262) );
  dti_28hc_7t_30_nand2x1 U5974 ( .A(n4764), .B(n5140), .Z(n4271) );
  dti_28hc_7t_30_aoi22x1 U5975 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[0][3][0] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[0][5][0] ), .Z(n4268) );
  dti_28hc_7t_30_nand2x1 U5976 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][2][0] ), .Z(n4267) );
  dti_28hc_7t_30_nand2x1 U5977 ( .A(n3606), .B(
        \eda_img_ram/img_memory[0][1][0] ), .Z(n4266) );
  dti_28hc_7t_30_nand2x1 U5979 ( .A(n4761), .B(n6633), .Z(n4270) );
  dti_28hc_7t_30_nand2x1 U5980 ( .A(n3607), .B(
        \eda_img_ram/img_memory[1][2][0] ), .Z(n4275) );
  dti_28hc_7t_30_nand2x1 U5981 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][3][0] ), .Z(n4274) );
  dti_28hc_7t_30_nand2x1 U5985 ( .A(n4603), .B(
        \eda_img_ram/img_memory[0][3][0] ), .Z(n4286) );
  dti_28hc_7t_30_nand2x1 U5988 ( .A(n3599), .B(
        \eda_img_ram/img_memory[4][2][0] ), .Z(n4290) );
  dti_28hc_7t_30_nand2x1 U5992 ( .A(n6595), .B(
        \eda_img_ram/img_memory[4][5][5] ), .Z(n4301) );
  dti_28hc_7t_30_nand2x1 U5993 ( .A(n6191), .B(
        \eda_img_ram/img_memory[4][4][5] ), .Z(n4300) );
  dti_28hc_7t_30_nand2x1 U5994 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][2][5] ), .Z(n4305) );
  dti_28hc_7t_30_aoi22x1 U5996 ( .A1(n4734), .A2(n3309), .B1(n4735), .B2(n6616), .Z(n4327) );
  dti_28hc_7t_30_nand2x1 U5998 ( .A(n6595), .B(
        \eda_img_ram/img_memory[2][5][5] ), .Z(n4309) );
  dti_28hc_7t_30_nand2x1 U5999 ( .A(n6191), .B(
        \eda_img_ram/img_memory[2][4][5] ), .Z(n4308) );
  dti_28hc_7t_30_nand4px1 U6000 ( .A(n4311), .B(n4310), .C(n4309), .D(n4308), 
        .Z(n4732) );
  dti_28hc_7t_30_nand2x1 U6002 ( .A(n4602), .B(
        \eda_img_ram/img_memory[1][0][5] ), .Z(n4312) );
  dti_28hc_7t_30_nand2x1 U6004 ( .A(n6595), .B(
        \eda_img_ram/img_memory[5][5][5] ), .Z(n4317) );
  dti_28hc_7t_30_nand2x1 U6005 ( .A(n6191), .B(
        \eda_img_ram/img_memory[5][4][5] ), .Z(n4316) );
  dti_28hc_7t_30_nand2x1 U6006 ( .A(n4733), .B(n5140), .Z(n4325) );
  dti_28hc_7t_30_nand2x1 U6007 ( .A(n6595), .B(
        \eda_img_ram/img_memory[0][5][5] ), .Z(n4321) );
  dti_28hc_7t_30_nand2x1 U6008 ( .A(n6191), .B(
        \eda_img_ram/img_memory[0][4][5] ), .Z(n4320) );
  dti_28hc_7t_30_nand2x1 U6009 ( .A(n4731), .B(n6633), .Z(n4324) );
  dti_28hc_7t_30_nand2x1 U6010 ( .A(n6174), .B(
        \eda_img_ram/img_memory[3][5][5] ), .Z(n4329) );
  dti_28hc_7t_30_nand2x1 U6017 ( .A(n6191), .B(
        \eda_img_ram/img_memory[1][5][5] ), .Z(n4342) );
  dti_28hc_7t_30_invx1 U6018 ( .A(\eda_img_ram/img_memory[2][1][5] ), .Z(n6483) );
  dti_28hc_7t_30_invx1 U6021 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [0]), 
        .Z(n4358) );
  dti_28hc_7t_30_and4x1 U6023 ( .A(n4967), .B(n4360), .C(n4971), .D(n4970), 
        .Z(n4361) );
  dti_28hc_7t_30_nand2i1x1 U6024 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [2]), 
        .B(\eda_fifos/sync_fifo_upleft/wr_addr [0]), .Z(n6045) );
  dti_28hc_7t_30_nor2x1 U6025 ( .A(n6045), .B(n3666), .Z(n4362) );
  dti_28hc_7t_30_invx1 U6026 ( .A(\eda_controller/current_state [1]), .Z(n5161) );
  dti_28hc_7t_30_nand2x1 U6027 ( .A(\eda_iterated_ram/current_row[1][0] ), .B(
        n6633), .Z(n4365) );
  dti_28hc_7t_30_nand2x1 U6030 ( .A(\eda_iterated_ram/current_row[5][3] ), .B(
        n3309), .Z(n4371) );
  dti_28hc_7t_30_nand2x1 U6032 ( .A(\eda_iterated_ram/current_row[2][3] ), .B(
        n3319), .Z(n4369) );
  dti_28hc_7t_30_nand2x1 U6034 ( .A(\eda_iterated_ram/current_row[5][2] ), .B(
        n6597), .Z(n4374) );
  dti_28hc_7t_30_nand2x1 U6035 ( .A(n3543), .B(n6633), .Z(n4373) );
  dti_28hc_7t_30_nand2x1 U6036 ( .A(\eda_iterated_ram/current_row[3][1] ), .B(
        n3320), .Z(n4378) );
  dti_28hc_7t_30_nor2x1 U6038 ( .A(n6191), .B(n3264), .Z(n4774) );
  dti_28hc_7t_30_nand2x1 U6040 ( .A(\eda_iterated_ram/current_row[5][4] ), .B(
        n3309), .Z(n4383) );
  dti_28hc_7t_30_aoi22x1 U6041 ( .A1(\eda_iterated_ram/current_row[0][4] ), 
        .A2(n5589), .B1(\eda_iterated_ram/current_row[4][4] ), .B2(n4836), .Z(
        n4382) );
  dti_28hc_7t_30_nand2x1 U6043 ( .A(\eda_iterated_ram/current_row[0][5] ), .B(
        n5589), .Z(n4386) );
  dti_28hc_7t_30_invx1 U6044 ( .A(n5154), .Z(n5283) );
  dti_28hc_7t_30_nand2x1 U6046 ( .A(n4408), .B(
        \eda_img_ram/img_memory[1][0][2] ), .Z(n4388) );
  dti_28hc_7t_30_nand2x1 U6047 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][4][2] ), .Z(n4391) );
  dti_28hc_7t_30_nand2x1 U6048 ( .A(n4408), .B(
        \eda_img_ram/img_memory[2][0][2] ), .Z(n4390) );
  dti_28hc_7t_30_nand2x1 U6049 ( .A(n4408), .B(
        \eda_img_ram/img_memory[3][0][2] ), .Z(n4392) );
  dti_28hc_7t_30_nand2x1 U6053 ( .A(n4603), .B(
        \eda_img_ram/img_memory[4][4][2] ), .Z(n4401) );
  dti_28hc_7t_30_nand2x1 U6054 ( .A(n4408), .B(
        \eda_img_ram/img_memory[4][0][2] ), .Z(n4400) );
  dti_28hc_7t_30_nand2x1 U6055 ( .A(n4985), .B(n4855), .Z(n4406) );
  dti_28hc_7t_30_nand2x1 U6056 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][4][2] ), .Z(n4404) );
  dti_28hc_7t_30_nand2x1 U6057 ( .A(n4408), .B(
        \eda_img_ram/img_memory[5][0][2] ), .Z(n4403) );
  dti_28hc_7t_30_nand2x1 U6058 ( .A(n4989), .B(n6597), .Z(n4405) );
  dti_28hc_7t_30_nand2x1 U6059 ( .A(n3606), .B(
        \eda_img_ram/img_memory[0][3][1] ), .Z(n4410) );
  dti_28hc_7t_30_nand2x1 U6060 ( .A(n4541), .B(
        \eda_img_ram/img_memory[0][5][1] ), .Z(n4409) );
  dti_28hc_7t_30_nand2x1 U6061 ( .A(n3602), .B(
        \eda_img_ram/img_memory[2][3][1] ), .Z(n4414) );
  dti_28hc_7t_30_nand2x1 U6062 ( .A(n4582), .B(
        \eda_img_ram/img_memory[2][5][1] ), .Z(n4413) );
  dti_28hc_7t_30_nand2x1 U6064 ( .A(n3606), .B(
        \eda_img_ram/img_memory[1][3][1] ), .Z(n4418) );
  dti_28hc_7t_30_nand2x1 U6065 ( .A(n4582), .B(
        \eda_img_ram/img_memory[1][5][1] ), .Z(n4417) );
  dti_28hc_7t_30_nand2x1 U6068 ( .A(n3606), .B(
        \eda_img_ram/img_memory[4][3][1] ), .Z(n4422) );
  dti_28hc_7t_30_nand2x1 U6069 ( .A(n4541), .B(
        \eda_img_ram/img_memory[4][5][1] ), .Z(n4421) );
  dti_28hc_7t_30_nand2x1 U6071 ( .A(n3316), .B(
        \eda_img_ram/img_memory[5][3][1] ), .Z(n4426) );
  dti_28hc_7t_30_nand2x1 U6072 ( .A(n6080), .B(
        \eda_img_ram/img_memory[5][5][1] ), .Z(n4425) );
  dti_28hc_7t_30_nand2x1 U6073 ( .A(n3601), .B(
        \eda_img_ram/img_memory[3][3][1] ), .Z(n4430) );
  dti_28hc_7t_30_nand2x1 U6074 ( .A(n6080), .B(
        \eda_img_ram/img_memory[3][5][1] ), .Z(n4429) );
  dti_28hc_7t_30_nand2x1 U6075 ( .A(n5006), .B(n3320), .Z(n4433) );
  dti_28hc_7t_30_aoi22rex1 U6076 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[1][3][0] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[1][1][0] ), .Z(n4439) );
  dti_28hc_7t_30_nand2x1 U6077 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][4][0] ), .Z(n4438) );
  dti_28hc_7t_30_nand2x1 U6078 ( .A(n4582), .B(
        \eda_img_ram/img_memory[1][5][0] ), .Z(n4437) );
  dti_28hc_7t_30_nand2x1 U6080 ( .A(n6086), .B(n3554), .Z(n4442) );
  dti_28hc_7t_30_nand2x1 U6081 ( .A(n4582), .B(
        \eda_img_ram/img_memory[0][5][0] ), .Z(n4441) );
  dti_28hc_7t_30_aoi22x1 U6082 ( .A1(n5000), .A2(n6633), .B1(n4997), .B2(n6604), .Z(n4465) );
  dti_28hc_7t_30_nand2x1 U6083 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][4][0] ), .Z(n4447) );
  dti_28hc_7t_30_nand2x1 U6084 ( .A(n6080), .B(
        \eda_img_ram/img_memory[3][5][0] ), .Z(n4446) );
  dti_28hc_7t_30_aoi22rex1 U6085 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[2][0][0] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[2][2][0] ), .Z(n4453) );
  dti_28hc_7t_30_nand2x1 U6087 ( .A(n4541), .B(
        \eda_img_ram/img_memory[2][5][0] ), .Z(n4450) );
  dti_28hc_7t_30_aoi22x1 U6088 ( .A1(n4998), .A2(n3320), .B1(n4995), .B2(n3319), .Z(n4464) );
  dti_28hc_7t_30_aoi22rex1 U6089 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[5][0][0] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[5][2][0] ), .Z(n4457) );
  dti_28hc_7t_30_nand2x1 U6090 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][4][0] ), .Z(n4455) );
  dti_28hc_7t_30_nand2x1 U6091 ( .A(n4582), .B(
        \eda_img_ram/img_memory[5][5][0] ), .Z(n4454) );
  dti_28hc_7t_30_nand2x1 U6093 ( .A(n4999), .B(n6597), .Z(n4463) );
  dti_28hc_7t_30_nand2x1 U6094 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][4][0] ), .Z(n4459) );
  dti_28hc_7t_30_nand2x1 U6095 ( .A(n4541), .B(
        \eda_img_ram/img_memory[4][5][0] ), .Z(n4458) );
  dti_28hc_7t_30_nand2x1 U6096 ( .A(n4996), .B(n4855), .Z(n4462) );
  dti_28hc_7t_30_nand2x1 U6097 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][4][3] ), .Z(n4467) );
  dti_28hc_7t_30_nand2x1 U6098 ( .A(n4408), .B(
        \eda_img_ram/img_memory[3][0][3] ), .Z(n4466) );
  dti_28hc_7t_30_nand2x1 U6101 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][4][3] ), .Z(n4475) );
  dti_28hc_7t_30_nand2x1 U6103 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][4][3] ), .Z(n4479) );
  dti_28hc_7t_30_nand2x1 U6104 ( .A(n4408), .B(
        \eda_img_ram/img_memory[2][0][3] ), .Z(n4478) );
  dti_28hc_7t_30_nand2x1 U6105 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][4][3] ), .Z(n4483) );
  dti_28hc_7t_30_nand2x1 U6106 ( .A(n4408), .B(
        \eda_img_ram/img_memory[1][0][3] ), .Z(n4482) );
  dti_28hc_7t_30_nand2x1 U6107 ( .A(n5031), .B(n6633), .Z(n4491) );
  dti_28hc_7t_30_nand2x1 U6108 ( .A(n4603), .B(
        \eda_img_ram/img_memory[4][4][3] ), .Z(n4487) );
  dti_28hc_7t_30_nand2x1 U6109 ( .A(n4408), .B(
        \eda_img_ram/img_memory[4][0][3] ), .Z(n4486) );
  dti_28hc_7t_30_nand2x1 U6110 ( .A(n5026), .B(n4855), .Z(n4490) );
  dti_28hc_7t_30_aoi22rex1 U6111 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[4][0][6] ), .B1(n3316), .B2(
        \eda_img_ram/img_memory[4][3][6] ), .Z(n4497) );
  dti_28hc_7t_30_nand2x1 U6112 ( .A(n5150), .B(
        \eda_img_ram/img_memory[4][1][6] ), .Z(n4495) );
  dti_28hc_7t_30_aoi22rex1 U6114 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[0][0][6] ), .B1(n3593), .B2(
        \eda_img_ram/img_memory[0][3][6] ), .Z(n4501) );
  dti_28hc_7t_30_nand2x1 U6115 ( .A(n4592), .B(
        \eda_img_ram/img_memory[0][1][6] ), .Z(n4499) );
  dti_28hc_7t_30_nand2x1 U6116 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][4][6] ), .Z(n4498) );
  dti_28hc_7t_30_nand2x1 U6119 ( .A(n4592), .B(
        \eda_img_ram/img_memory[1][1][6] ), .Z(n4503) );
  dti_28hc_7t_30_nand2x1 U6120 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][4][6] ), .Z(n4502) );
  dti_28hc_7t_30_nand2x1 U6122 ( .A(n4408), .B(
        \eda_img_ram/img_memory[3][0][6] ), .Z(n4506) );
  dti_28hc_7t_30_nand2x1 U6124 ( .A(n5150), .B(
        \eda_img_ram/img_memory[2][1][6] ), .Z(n4510) );
  dti_28hc_7t_30_aoi22rex1 U6128 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[5][0][6] ), .B1(n3595), .B2(
        \eda_img_ram/img_memory[5][3][6] ), .Z(n4516) );
  dti_28hc_7t_30_aoi22x1 U6129 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][5][6] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[5][2][6] ), .Z(n4515) );
  dti_28hc_7t_30_nand2x1 U6130 ( .A(n4592), .B(
        \eda_img_ram/img_memory[5][1][6] ), .Z(n4514) );
  dti_28hc_7t_30_nand2x1 U6131 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][4][6] ), .Z(n4513) );
  dti_28hc_7t_30_nand2x1 U6133 ( .A(n5020), .B(n6597), .Z(n4517) );
  dti_28hc_7t_30_aoi22rex1 U6134 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][5][4] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[5][2][4] ), .Z(n4524) );
  dti_28hc_7t_30_nand2x1 U6135 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][4][4] ), .Z(n4522) );
  dti_28hc_7t_30_nand2x1 U6136 ( .A(n4408), .B(
        \eda_img_ram/img_memory[5][0][4] ), .Z(n4521) );
  dti_28hc_7t_30_nand4px1 U6137 ( .A(n4524), .B(n4521), .C(n4522), .D(n4523), 
        .Z(n4979) );
  dti_28hc_7t_30_nand2x1 U6139 ( .A(n4603), .B(
        \eda_img_ram/img_memory[0][4][4] ), .Z(n4526) );
  dti_28hc_7t_30_nand4px1 U6141 ( .A(n4527), .B(n4528), .C(n4526), .D(n4525), 
        .Z(n4975) );
  dti_28hc_7t_30_nand2x1 U6143 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][4][4] ), .Z(n4530) );
  dti_28hc_7t_30_nand2x1 U6144 ( .A(n4408), .B(
        \eda_img_ram/img_memory[1][0][4] ), .Z(n4529) );
  dti_28hc_7t_30_invx1 U6147 ( .A(\eda_img_ram/img_memory[3][1][4] ), .Z(n6432) );
  dti_28hc_7t_30_iao22x2 U6148 ( .A1(n3607), .A2(
        \eda_img_ram/img_memory[3][3][4] ), .B1(n6124), .B2(n6432), .Z(n4535)
         );
  dti_28hc_7t_30_nand2x1 U6153 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][4][4] ), .Z(n4538) );
  dti_28hc_7t_30_nand2x1 U6154 ( .A(n4408), .B(
        \eda_img_ram/img_memory[4][0][4] ), .Z(n4537) );
  dti_28hc_7t_30_nand2x1 U6155 ( .A(n4977), .B(n4855), .Z(n4547) );
  dti_28hc_7t_30_invx1 U6156 ( .A(\eda_img_ram/img_memory[2][1][4] ), .Z(n6438) );
  dti_28hc_7t_30_nand2x1 U6157 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][4][4] ), .Z(n4543) );
  dti_28hc_7t_30_nand2x1 U6158 ( .A(n4408), .B(
        \eda_img_ram/img_memory[2][0][4] ), .Z(n4542) );
  dti_28hc_7t_30_nand2x1 U6159 ( .A(n3618), .B(n3319), .Z(n4546) );
  dti_28hc_7t_30_nand2x1 U6161 ( .A(n3931), .B(
        \eda_img_ram/img_memory[4][1][5] ), .Z(n4551) );
  dti_28hc_7t_30_nand2x1 U6162 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][4][5] ), .Z(n4550) );
  dti_28hc_7t_30_nand2x1 U6164 ( .A(n4592), .B(
        \eda_img_ram/img_memory[3][1][5] ), .Z(n4555) );
  dti_28hc_7t_30_nand2x1 U6165 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][4][5] ), .Z(n4554) );
  dti_28hc_7t_30_aoi22rex1 U6166 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[1][5][5] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[1][2][5] ), .Z(n4560) );
  dti_28hc_7t_30_nand2x1 U6168 ( .A(n4408), .B(
        \eda_img_ram/img_memory[1][0][5] ), .Z(n4558) );
  dti_28hc_7t_30_nand2x1 U6170 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][4][5] ), .Z(n4562) );
  dti_28hc_7t_30_nand2x1 U6171 ( .A(n4408), .B(
        \eda_img_ram/img_memory[2][0][5] ), .Z(n4561) );
  dti_28hc_7t_30_nand2x1 U6172 ( .A(n3931), .B(
        \eda_img_ram/img_memory[5][1][5] ), .Z(n4567) );
  dti_28hc_7t_30_nand2x1 U6173 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][4][5] ), .Z(n4566) );
  dti_28hc_7t_30_nand2x1 U6175 ( .A(n5043), .B(n3309), .Z(n4575) );
  dti_28hc_7t_30_nand2x1 U6177 ( .A(n4603), .B(
        \eda_img_ram/img_memory[0][4][5] ), .Z(n4571) );
  dti_28hc_7t_30_nand2x1 U6178 ( .A(n4408), .B(
        \eda_img_ram/img_memory[0][0][5] ), .Z(n4570) );
  dti_28hc_7t_30_nand2x1 U6179 ( .A(n5041), .B(n5589), .Z(n4574) );
  dti_28hc_7t_30_nand2x1 U6180 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][4][7] ), .Z(n4579) );
  dti_28hc_7t_30_nand2x1 U6183 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][4][7] ), .Z(n4584) );
  dti_28hc_7t_30_nand2x1 U6184 ( .A(n4408), .B(
        \eda_img_ram/img_memory[3][0][7] ), .Z(n4583) );
  dti_28hc_7t_30_aoi22rex1 U6185 ( .A1(n3607), .A2(
        \eda_img_ram/img_memory[2][3][7] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[2][1][7] ), .Z(n4589) );
  dti_28hc_7t_30_nand2x1 U6186 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][4][7] ), .Z(n4588) );
  dti_28hc_7t_30_nand2x1 U6189 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][4][7] ), .Z(n4594) );
  dti_28hc_7t_30_nand2x1 U6191 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][4][7] ), .Z(n4599) );
  dti_28hc_7t_30_nand2x1 U6192 ( .A(n4408), .B(
        \eda_img_ram/img_memory[1][0][7] ), .Z(n4598) );
  dti_28hc_7t_30_nand2x1 U6193 ( .A(n5054), .B(n6633), .Z(n4609) );
  dti_28hc_7t_30_nand2x1 U6194 ( .A(n4603), .B(
        \eda_img_ram/img_memory[0][4][7] ), .Z(n4605) );
  dti_28hc_7t_30_nand2x1 U6196 ( .A(n5051), .B(n5589), .Z(n4608) );
  dti_28hc_7t_30_nand2x1 U6198 ( .A(n4713), .B(n6597), .Z(n4618) );
  dti_28hc_7t_30_nand2x1 U6199 ( .A(n4714), .B(n6633), .Z(n4617) );
  dti_28hc_7t_30_nand2x1 U6200 ( .A(n4753), .B(n3320), .Z(n4622) );
  dti_28hc_7t_30_nand2x1 U6201 ( .A(n4752), .B(n3319), .Z(n4621) );
  dti_28hc_7t_30_nand2x1 U6203 ( .A(n4693), .B(n3309), .Z(n4628) );
  dti_28hc_7t_30_nand2x1 U6204 ( .A(n4691), .B(n6633), .Z(n4627) );
  dti_28hc_7t_30_aoi22x1 U6205 ( .A1(n4762), .A2(n4836), .B1(n4760), .B2(n6633), .Z(n4634) );
  dti_28hc_7t_30_nand2x1 U6206 ( .A(n4764), .B(n3309), .Z(n4632) );
  dti_28hc_7t_30_nand2x1 U6207 ( .A(n4763), .B(n3319), .Z(n4631) );
  dti_28hc_7t_30_aoi22x1 U6209 ( .A1(n4703), .A2(n4836), .B1(n4699), .B2(n3319), .Z(n4638) );
  dti_28hc_7t_30_nand2x1 U6210 ( .A(n4704), .B(n6633), .Z(n4637) );
  dti_28hc_7t_30_nand2x1 U6211 ( .A(n4700), .B(n3320), .Z(n4636) );
  dti_28hc_7t_30_nand2x1 U6213 ( .A(n4723), .B(n6604), .Z(n4640) );
  dti_28hc_7t_30_aoi22x1 U6214 ( .A1(n4731), .A2(n5589), .B1(n4732), .B2(n3319), .Z(n4655) );
  dti_28hc_7t_30_nand2x1 U6215 ( .A(n4735), .B(n3320), .Z(n4652) );
  dti_28hc_7t_30_and4xp5 U6216 ( .A(n4655), .B(n4654), .C(n4653), .D(n4652), 
        .Z(n5586) );
  dti_28hc_7t_30_aoi22x1 U6217 ( .A1(n4743), .A2(n3309), .B1(n4742), .B2(n3319), .Z(n4648) );
  dti_28hc_7t_30_nand2x1 U6219 ( .A(n4744), .B(n3320), .Z(n4646) );
  dti_28hc_7t_30_nand2x1 U6221 ( .A(n4662), .B(n6122), .Z(n5500) );
  dti_28hc_7t_30_nand2x1 U6222 ( .A(n4663), .B(n4686), .Z(n5502) );
  dti_28hc_7t_30_nand2x1 U6223 ( .A(n5500), .B(n5502), .Z(n4664) );
  dti_28hc_7t_30_nand2i1x1 U6224 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_upleft/wr_addr [1]), .Z(n4666) );
  dti_28hc_7t_30_nand2i1x1 U6225 ( .A(\eda_fifos/sync_fifo_up/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_up/wr_addr [1]), .Z(n4667) );
  dti_28hc_7t_30_nand2i1x1 U6227 ( .A(\eda_fifos/sync_fifo_down/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_down/wr_addr [1]), .Z(n4668) );
  dti_28hc_7t_30_nand2i1x1 U6229 ( .A(\eda_fifos/sync_fifo_left/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_left/wr_addr [1]), .Z(n4924) );
  dti_28hc_7t_30_or2x1 U6235 ( .A(n3320), .B(n3484), .Z(n4680) );
  dti_28hc_7t_30_nor2i1x1 U6236 ( .A(n7074), .B(n7631), .Z(n4681) );
  dti_28hc_7t_30_nand2x1 U6240 ( .A(n6114), .B(n5496), .Z(n6131) );
  dti_28hc_7t_30_nor2x1 U6241 ( .A(n6131), .B(n3264), .Z(n4683) );
  dti_28hc_7t_30_nand2x1 U6242 ( .A(\eda_iterated_ram/current_row[5][3] ), .B(
        n4855), .Z(n4685) );
  dti_28hc_7t_30_nand2x1 U6243 ( .A(\eda_iterated_ram/current_row[3][3] ), .B(
        n3319), .Z(n4684) );
  dti_28hc_7t_30_nand2x1 U6244 ( .A(\eda_iterated_ram/current_row[4][2] ), .B(
        n6657), .Z(n4687) );
  dti_28hc_7t_30_nand2x1 U6245 ( .A(n4823), .B(n3608), .Z(n6134) );
  dti_28hc_7t_30_aoi22x1 U6247 ( .A1(n4692), .A2(n6657), .B1(n4691), .B2(n5589), .Z(n4697) );
  dti_28hc_7t_30_nand2x1 U6249 ( .A(n4694), .B(n3309), .Z(n4695) );
  dti_28hc_7t_30_aoi22x1 U6250 ( .A1(n4700), .A2(n3319), .B1(n4699), .B2(n4856), .Z(n4708) );
  dti_28hc_7t_30_aoi22x1 U6251 ( .A1(n4702), .A2(n4855), .B1(n4701), .B2(n3309), .Z(n4707) );
  dti_28hc_7t_30_nand2x1 U6252 ( .A(n4704), .B(n6604), .Z(n4705) );
  dti_28hc_7t_30_nand2x1 U6255 ( .A(n4714), .B(n5589), .Z(n4717) );
  dti_28hc_7t_30_nand2x1 U6256 ( .A(n4715), .B(n6657), .Z(n4716) );
  dti_28hc_7t_30_nand2x1 U6257 ( .A(n4724), .B(n5589), .Z(n4727) );
  dti_28hc_7t_30_aoi22x1 U6259 ( .A1(n4731), .A2(n3309), .B1(n4730), .B2(n5589), .Z(n4739) );
  dti_28hc_7t_30_nand2x1 U6260 ( .A(n4734), .B(n6657), .Z(n4737) );
  dti_28hc_7t_30_nand2x1 U6261 ( .A(n4735), .B(n3319), .Z(n4736) );
  dti_28hc_7t_30_nand4px1 U6262 ( .A(n4738), .B(n4736), .C(n4737), .D(n4739), 
        .Z(n5701) );
  dti_28hc_7t_30_aoi22x1 U6263 ( .A1(n4743), .A2(n4855), .B1(n4742), .B2(n4856), .Z(n4748) );
  dti_28hc_7t_30_nand2x1 U6264 ( .A(n4744), .B(n3319), .Z(n4747) );
  dti_28hc_7t_30_nand2x1 U6265 ( .A(n4745), .B(n6597), .Z(n4746) );
  dti_28hc_7t_30_aoi22x1 U6266 ( .A1(n4753), .A2(n3319), .B1(n4752), .B2(n4856), .Z(n5698) );
  dti_28hc_7t_30_nor2x1 U6268 ( .A(n4756), .B(n3484), .Z(n4757) );
  dti_28hc_7t_30_nand2x1 U6269 ( .A(n4764), .B(n4855), .Z(n4767) );
  dti_28hc_7t_30_nand2x1 U6270 ( .A(n4765), .B(n3319), .Z(n4766) );
  dti_28hc_7t_30_invx1 U6272 ( .A(n6723), .Z(n4770) );
  dti_28hc_7t_30_invx1 U6273 ( .A(n4774), .Z(n4775) );
  dti_28hc_7t_30_nor2x1 U6274 ( .A(n4775), .B(n6119), .Z(n4776) );
  dti_28hc_7t_30_nand2x1 U6275 ( .A(n5052), .B(n3319), .Z(n4778) );
  dti_28hc_7t_30_nand2x1 U6277 ( .A(n5029), .B(n3319), .Z(n4782) );
  dti_28hc_7t_30_nand2x1 U6278 ( .A(n5027), .B(n4856), .Z(n4781) );
  dti_28hc_7t_30_aoi22x1 U6279 ( .A1(n5000), .A2(n6604), .B1(n4997), .B2(n3309), .Z(n4788) );
  dti_28hc_7t_30_nand2x1 U6281 ( .A(n4999), .B(n4855), .Z(n4786) );
  dti_28hc_7t_30_nand2x1 U6286 ( .A(n5019), .B(n3309), .Z(n4796) );
  dti_28hc_7t_30_nand2x1 U6288 ( .A(n4987), .B(n6597), .Z(n4800) );
  dti_28hc_7t_30_nand2x1 U6289 ( .A(n5040), .B(n6657), .Z(n4805) );
  dti_28hc_7t_30_nand2x1 U6290 ( .A(n5039), .B(n4856), .Z(n4804) );
  dti_28hc_7t_30_aoi22x1 U6292 ( .A1(n4979), .A2(n4855), .B1(n4978), .B2(n4856), .Z(n4810) );
  dti_28hc_7t_30_nand2x1 U6293 ( .A(n4977), .B(n6657), .Z(n4809) );
  dti_28hc_7t_30_invx1 U6296 ( .A(n4820), .Z(n4821) );
  dti_28hc_7t_30_nand2x1 U6300 ( .A(n5072), .B(n6597), .Z(n4828) );
  dti_28hc_7t_30_nand2x1 U6302 ( .A(n5141), .B(n4855), .Z(n4832) );
  dti_28hc_7t_30_aoi22x1 U6303 ( .A1(n5127), .A2(n3319), .B1(n5129), .B2(n6604), .Z(n4840) );
  dti_28hc_7t_30_nand2x1 U6304 ( .A(n5124), .B(n6657), .Z(n4838) );
  dti_28hc_7t_30_nand2x1 U6309 ( .A(n5107), .B(n6657), .Z(n4848) );
  dti_28hc_7t_30_nand2x1 U6311 ( .A(n5084), .B(n4855), .Z(n4852) );
  dti_28hc_7t_30_nand2x1 U6313 ( .A(n5061), .B(n4855), .Z(n4858) );
  dti_28hc_7t_30_nand2x1 U6314 ( .A(n3615), .B(n4856), .Z(n4857) );
  dti_28hc_7t_30_invx1 U6315 ( .A(n4863), .Z(n4866) );
  dti_28hc_7t_30_invx1 U6316 ( .A(n4864), .Z(n4865) );
  dti_28hc_7t_30_invx1 U6317 ( .A(n5488), .Z(n4872) );
  dti_28hc_7t_30_nand2i1x1 U6318 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_upleft/rd_addr [1]), .Z(n4876) );
  dti_28hc_7t_30_nor2x1 U6319 ( .A(n4876), .B(
        \eda_fifos/sync_fifo_upleft/rd_addr [0]), .Z(n5390) );
  dti_28hc_7t_30_nand2i1x1 U6320 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_upleft/rd_addr [2]), .Z(n4877) );
  dti_28hc_7t_30_nor2x1 U6321 ( .A(n4877), .B(
        \eda_fifos/sync_fifo_upleft/rd_addr [0]), .Z(n5389) );
  dti_28hc_7t_30_aoi22x1 U6322 ( .A1(n5390), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][5] ), .B1(
        n5389), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n4881) );
  dti_28hc_7t_30_invx1 U6323 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [0]), 
        .Z(n6914) );
  dti_28hc_7t_30_nor2x1 U6324 ( .A(n4876), .B(n6914), .Z(n5988) );
  dti_28hc_7t_30_or2x1 U6325 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_upleft/rd_addr [2]), .Z(n4878) );
  dti_28hc_7t_30_nor2x1 U6326 ( .A(n6914), .B(n4878), .Z(n5391) );
  dti_28hc_7t_30_nor2x1 U6328 ( .A(n4877), .B(n6914), .Z(n5955) );
  dti_28hc_7t_30_nor2x1 U6329 ( .A(n4878), .B(
        \eda_fifos/sync_fifo_upleft/rd_addr [0]), .Z(n5392) );
  dti_28hc_7t_30_aoi22x1 U6330 ( .A1(n5955), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][5] ), .B1(
        n5392), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n4879) );
  dti_28hc_7t_30_nand2i1x1 U6331 ( .A(\eda_fifos/sync_fifo_right/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_right/rd_addr [1]), .Z(n4882) );
  dti_28hc_7t_30_invx1 U6332 ( .A(\eda_fifos/sync_fifo_right/rd_addr [0]), .Z(
        n6770) );
  dti_28hc_7t_30_aoi22x1 U6335 ( .A1(n5997), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][5] ), .B1(
        n5396), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][5] ), .Z(
        n4895) );
  dti_28hc_7t_30_nand2i1x1 U6336 ( .A(\eda_fifos/sync_fifo_right/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_right/rd_addr [0]), .Z(n6766) );
  dti_28hc_7t_30_nor2x1 U6337 ( .A(n6766), .B(
        \eda_fifos/sync_fifo_right/rd_addr [2]), .Z(n5397) );
  dti_28hc_7t_30_invx1 U6338 ( .A(\eda_fifos/sync_fifo_right/rd_addr [2]), .Z(
        n4883) );
  dti_28hc_7t_30_nor2x1 U6339 ( .A(n6766), .B(n4883), .Z(n5996) );
  dti_28hc_7t_30_nor3i1x1 U6340 ( .A(\eda_fifos/sync_fifo_right/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_right/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_right/rd_addr [0]), .Z(n5399) );
  dti_28hc_7t_30_or2x1 U6341 ( .A(\eda_fifos/sync_fifo_right/rd_addr [1]), .B(
        \eda_fifos/sync_fifo_right/rd_addr [2]), .Z(n4884) );
  dti_28hc_7t_30_nand2i1x1 U6343 ( .A(
        \eda_fifos/sync_fifo_downleft/rd_addr [2]), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [0]), .Z(n4897) );
  dti_28hc_7t_30_nor2x1 U6344 ( .A(n4897), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [1]), .Z(n5404) );
  dti_28hc_7t_30_invx1 U6345 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [1]), 
        .Z(n5953) );
  dti_28hc_7t_30_or2x1 U6346 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_downleft/rd_addr [2]), .Z(n4896) );
  dti_28hc_7t_30_nor2x1 U6347 ( .A(n5953), .B(n4896), .Z(n5403) );
  dti_28hc_7t_30_aoi22x1 U6348 ( .A1(n5404), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][5] ), 
        .B1(n5403), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][5] ), .Z(
        n4902) );
  dti_28hc_7t_30_nor2x1 U6349 ( .A(n4896), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [1]), .Z(n5406) );
  dti_28hc_7t_30_nor3i1x1 U6350 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [2]), .B(\eda_fifos/sync_fifo_downleft/rd_addr [0]), .C(
        \eda_fifos/sync_fifo_downleft/rd_addr [1]), .Z(n5405) );
  dti_28hc_7t_30_nand2x1 U6352 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_downleft/rd_addr [2]), .Z(n4898) );
  dti_28hc_7t_30_nor2x1 U6353 ( .A(n4898), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [1]), .Z(n5951) );
  dti_28hc_7t_30_aoi22x1 U6354 ( .A1(n5407), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][5] ), 
        .B1(n5951), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n4900) );
  dti_28hc_7t_30_invx1 U6355 ( .A(\eda_fifos/sync_fifo_down/rd_addr [1]), .Z(
        n7277) );
  dti_28hc_7t_30_or2x1 U6356 ( .A(\eda_fifos/sync_fifo_down/rd_addr [0]), .B(
        \eda_fifos/sync_fifo_down/rd_addr [2]), .Z(n4905) );
  dti_28hc_7t_30_nor2x1 U6357 ( .A(n7277), .B(n4905), .Z(n5412) );
  dti_28hc_7t_30_nor3i1x1 U6358 ( .A(\eda_fifos/sync_fifo_down/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_down/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_down/rd_addr [0]), .Z(n5411) );
  dti_28hc_7t_30_aoi22x1 U6359 ( .A1(n5412), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][5] ), .B1(
        n5411), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n4910) );
  dti_28hc_7t_30_invx1 U6360 ( .A(\eda_fifos/sync_fifo_down/rd_addr [2]), .Z(
        n4903) );
  dti_28hc_7t_30_nor2x1 U6361 ( .A(n6243), .B(n4903), .Z(n6246) );
  dti_28hc_7t_30_aoi22x1 U6363 ( .A1(n6246), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][5] ), .B1(
        n5413), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n4909) );
  dti_28hc_7t_30_invx1 U6365 ( .A(n4904), .Z(n7278) );
  dti_28hc_7t_30_nor2x1 U6366 ( .A(n4905), .B(
        \eda_fifos/sync_fifo_down/rd_addr [1]), .Z(n5414) );
  dti_28hc_7t_30_aoi22x1 U6367 ( .A1(n7278), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][5] ), .B1(
        n5414), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n4908) );
  dti_28hc_7t_30_invx1 U6368 ( .A(\eda_fifos/sync_fifo_downright/rd_addr [1]), 
        .Z(n6746) );
  dti_28hc_7t_30_nand2x1 U6369 ( .A(n6746), .B(
        \eda_fifos/sync_fifo_downright/rd_addr [0]), .Z(n6735) );
  dti_28hc_7t_30_nor2x1 U6371 ( .A(n6735), .B(
        \eda_fifos/sync_fifo_downright/rd_addr [2]), .Z(n5419) );
  dti_28hc_7t_30_nand2x1 U6372 ( .A(\eda_fifos/sync_fifo_downright/rd_addr [0]), .B(\eda_fifos/sync_fifo_downright/rd_addr [1]), .Z(n4911) );
  dti_28hc_7t_30_nor2x1 U6373 ( .A(n4911), .B(
        \eda_fifos/sync_fifo_downright/rd_addr [2]), .Z(n6747) );
  dti_28hc_7t_30_or2x1 U6374 ( .A(\eda_fifos/sync_fifo_downright/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_downright/rd_addr [1]), .Z(n4912) );
  dti_28hc_7t_30_nor2x1 U6375 ( .A(n4912), .B(
        \eda_fifos/sync_fifo_downright/rd_addr [2]), .Z(n5420) );
  dti_28hc_7t_30_nor2i1x1 U6376 ( .A(
        \eda_fifos/sync_fifo_downright/rd_addr [2]), .B(n4912), .Z(n5422) );
  dti_28hc_7t_30_nor3i1x1 U6377 ( .A(
        \eda_fifos/sync_fifo_downright/rd_addr [1]), .B(
        \eda_fifos/sync_fifo_downright/rd_addr [2]), .C(
        \eda_fifos/sync_fifo_downright/rd_addr [0]), .Z(n5421) );
  dti_28hc_7t_30_aoi22xp5 U6378 ( .A1(n5422), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][5] ), 
        .B1(n5421), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][5] ), 
        .Z(n4913) );
  dti_28hc_7t_30_ioa13xp8 U6379 ( .B1(n4915), .B2(n4914), .B3(n4913), .A(n6761), .Z(n4916) );
  dti_28hc_7t_30_nand2x1 U6380 ( .A(\eda_fifos/sync_fifo_left/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_left/rd_addr [2]), .Z(n4921) );
  dti_28hc_7t_30_nor2x1 U6381 ( .A(n4921), .B(
        \eda_fifos/sync_fifo_left/rd_addr [1]), .Z(n5969) );
  dti_28hc_7t_30_nor3i1x1 U6382 ( .A(\eda_fifos/sync_fifo_left/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_left/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_left/rd_addr [0]), .Z(n5378) );
  dti_28hc_7t_30_aoi22x1 U6383 ( .A1(n5969), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][5] ), .B1(
        n5378), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n4930) );
  dti_28hc_7t_30_nand2i1x1 U6384 ( .A(\eda_fifos/sync_fifo_left/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_left/rd_addr [1]), .Z(n6808) );
  dti_28hc_7t_30_nor2x1 U6385 ( .A(n6808), .B(
        \eda_fifos/sync_fifo_left/rd_addr [0]), .Z(n5380) );
  dti_28hc_7t_30_invx1 U6386 ( .A(\eda_fifos/sync_fifo_left/rd_addr [0]), .Z(
        n4922) );
  dti_28hc_7t_30_nor2x1 U6387 ( .A(n6808), .B(n4922), .Z(n5379) );
  dti_28hc_7t_30_aoi22x1 U6388 ( .A1(n5380), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][5] ), .B1(
        n5379), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][5] ), .Z(
        n4929) );
  dti_28hc_7t_30_nor3i1x1 U6389 ( .A(\eda_fifos/sync_fifo_left/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_left/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_left/rd_addr [2]), .Z(n5382) );
  dti_28hc_7t_30_or2x1 U6390 ( .A(\eda_fifos/sync_fifo_left/rd_addr [0]), .B(
        \eda_fifos/sync_fifo_left/rd_addr [2]), .Z(n4923) );
  dti_28hc_7t_30_nor2x1 U6391 ( .A(n4923), .B(
        \eda_fifos/sync_fifo_left/rd_addr [1]), .Z(n5381) );
  dti_28hc_7t_30_and2x1 U6392 ( .A(n4925), .B(n4924), .Z(n6812) );
  dti_28hc_7t_30_invx1 U6393 ( .A(n6812), .Z(n6821) );
  dti_28hc_7t_30_or2x1 U6394 ( .A(n6821), .B(n6817), .Z(n4926) );
  dti_28hc_7t_30_invx1 U6395 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [1]), 
        .Z(n6007) );
  dti_28hc_7t_30_or2x1 U6396 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_upright/rd_addr [2]), .Z(n4931) );
  dti_28hc_7t_30_nor2x1 U6397 ( .A(n6007), .B(n4931), .Z(n5364) );
  dti_28hc_7t_30_nor3i1x1 U6398 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_upright/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_upright/rd_addr [0]), .Z(n5363) );
  dti_28hc_7t_30_aoi22x1 U6399 ( .A1(n5364), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][5] ), .B1(
        n5363), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n4943) );
  dti_28hc_7t_30_nand2i1x1 U6400 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [1]), .B(\eda_fifos/sync_fifo_upright/rd_addr [0]), .Z(n6790) );
  dti_28hc_7t_30_invx1 U6401 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [2]), 
        .Z(n5971) );
  dti_28hc_7t_30_nor2x1 U6402 ( .A(n6790), .B(n5971), .Z(n6009) );
  dti_28hc_7t_30_nor2x1 U6403 ( .A(n6790), .B(
        \eda_fifos/sync_fifo_upright/rd_addr [2]), .Z(n5365) );
  dti_28hc_7t_30_aoi22x1 U6404 ( .A1(n6009), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][5] ), .B1(
        n5365), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n4942) );
  dti_28hc_7t_30_nand3i1x1 U6405 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [2]), .B(\eda_fifos/sync_fifo_upright/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_upright/rd_addr [0]), .Z(n6012) );
  dti_28hc_7t_30_invx1 U6406 ( .A(n6012), .Z(n5367) );
  dti_28hc_7t_30_nor2x1 U6407 ( .A(n4931), .B(
        \eda_fifos/sync_fifo_upright/rd_addr [1]), .Z(n5366) );
  dti_28hc_7t_30_aoi22x1 U6408 ( .A1(n5367), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][5] ), .B1(
        n5366), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n4941) );
  dti_28hc_7t_30_invx1 U6409 ( .A(n6817), .Z(n4932) );
  dti_28hc_7t_30_invx1 U6411 ( .A(n4936), .Z(n4935) );
  dti_28hc_7t_30_and2x1 U6413 ( .A(n4937), .B(n4936), .Z(n6825) );
  dti_28hc_7t_30_nor3i1x1 U6414 ( .A(\eda_fifos/sync_fifo_up/rd_addr [2]), .B(
        \eda_fifos/sync_fifo_up/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_up/rd_addr [0]), .Z(n5372) );
  dti_28hc_7t_30_nor3i1x1 U6415 ( .A(\eda_fifos/sync_fifo_up/rd_addr [0]), .B(
        \eda_fifos/sync_fifo_up/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_up/rd_addr [2]), .Z(n5371) );
  dti_28hc_7t_30_nand2xp5 U6416 ( .A(\eda_fifos/sync_fifo_up/rd_addr [1]), .B(
        \eda_fifos/sync_fifo_up/rd_addr [0]), .Z(n5960) );
  dti_28hc_7t_30_nor2x1 U6417 ( .A(n5960), .B(
        \eda_fifos/sync_fifo_up/rd_addr [2]), .Z(n7282) );
  dti_28hc_7t_30_or2x1 U6418 ( .A(\eda_fifos/sync_fifo_up/rd_addr [2]), .B(
        \eda_fifos/sync_fifo_up/rd_addr [0]), .Z(n4944) );
  dti_28hc_7t_30_nor2x1 U6419 ( .A(n4944), .B(
        \eda_fifos/sync_fifo_up/rd_addr [1]), .Z(n5373) );
  dti_28hc_7t_30_invx1 U6420 ( .A(\eda_fifos/sync_fifo_up/rd_addr [1]), .Z(
        n5963) );
  dti_28hc_7t_30_nor2x1 U6421 ( .A(n5963), .B(n4944), .Z(n5374) );
  dti_28hc_7t_30_nand2x1 U6422 ( .A(\eda_fifos/sync_fifo_up/rd_addr [2]), .B(
        \eda_fifos/sync_fifo_up/rd_addr [0]), .Z(n4945) );
  dti_28hc_7t_30_nor2x1 U6423 ( .A(n4945), .B(
        \eda_fifos/sync_fifo_up/rd_addr [1]), .Z(n5958) );
  dti_28hc_7t_30_aoi22x1 U6424 ( .A1(n5374), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][5] ), .B1(n5958), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(n4947)
         );
  dti_28hc_7t_30_invx1 U6426 ( .A(n4952), .Z(n4953) );
  dti_28hc_7t_30_nand2x1 U6428 ( .A(n5149), .B(n4973), .Z(n6199) );
  dti_28hc_7t_30_nor2x1 U6429 ( .A(n6192), .B(n6191), .Z(n4974) );
  dti_28hc_7t_30_nand2x1 U6431 ( .A(n4979), .B(n5140), .Z(n4982) );
  dti_28hc_7t_30_nand2x1 U6432 ( .A(n4980), .B(n3317), .Z(n4981) );
  dti_28hc_7t_30_aoi22x1 U6434 ( .A1(n4986), .A2(n3320), .B1(n4985), .B2(n3309), .Z(n4994) );
  dti_28hc_7t_30_nand2x1 U6435 ( .A(n4989), .B(n5140), .Z(n4992) );
  dti_28hc_7t_30_nand2x1 U6436 ( .A(n4990), .B(n3317), .Z(n4991) );
  dti_28hc_7t_30_nand2x1 U6437 ( .A(n4999), .B(n5140), .Z(n5002) );
  dti_28hc_7t_30_nand2x1 U6438 ( .A(n5000), .B(n3317), .Z(n5001) );
  dti_28hc_7t_30_aoi22x1 U6439 ( .A1(n5006), .A2(n6616), .B1(n5005), .B2(n3309), .Z(n5013) );
  dti_28hc_7t_30_nand2x1 U6440 ( .A(n3616), .B(n6633), .Z(n5010) );
  dti_28hc_7t_30_bufx2 U6441 ( .A(n6196), .Z(n5037) );
  dti_28hc_7t_30_nand2x1 U6443 ( .A(n5020), .B(n5140), .Z(n5023) );
  dti_28hc_7t_30_nand2x1 U6444 ( .A(n5021), .B(n3317), .Z(n5022) );
  dti_28hc_7t_30_nand2x1 U6446 ( .A(n5043), .B(n5140), .Z(n5046) );
  dti_28hc_7t_30_nand2x1 U6447 ( .A(n5044), .B(n3317), .Z(n5045) );
  dti_28hc_7t_30_aoi22x1 U6448 ( .A1(n5052), .A2(n6616), .B1(n5051), .B2(n6633), .Z(n5057) );
  dti_28hc_7t_30_nand2x1 U6449 ( .A(n5053), .B(n5140), .Z(n5056) );
  dti_28hc_7t_30_nand2x1 U6450 ( .A(n5054), .B(n3317), .Z(n5055) );
  dti_28hc_7t_30_nand2x1 U6451 ( .A(n5064), .B(n6633), .Z(n5067) );
  dti_28hc_7t_30_nand2x1 U6452 ( .A(n5065), .B(n6597), .Z(n5066) );
  dti_28hc_7t_30_nand2x1 U6453 ( .A(n5074), .B(n3320), .Z(n5077) );
  dti_28hc_7t_30_nand2x1 U6454 ( .A(n5075), .B(n5140), .Z(n5076) );
  dti_28hc_7t_30_nand2x1 U6457 ( .A(n5084), .B(n5140), .Z(n5086) );
  dti_28hc_7t_30_nand2x1 U6460 ( .A(n5097), .B(n3317), .Z(n5098) );
  dti_28hc_7t_30_nand2x1 U6461 ( .A(n5107), .B(n3321), .Z(n5110) );
  dti_28hc_7t_30_nand2x1 U6464 ( .A(n3590), .B(n3317), .Z(n5121) );
  dti_28hc_7t_30_nand2x1 U6467 ( .A(n5128), .B(n5140), .Z(n5131) );
  dti_28hc_7t_30_nand2x1 U6468 ( .A(n5129), .B(n3317), .Z(n5130) );
  dti_28hc_7t_30_nand2x1 U6471 ( .A(n5142), .B(n6597), .Z(n5145) );
  dti_28hc_7t_30_or2x1 U6474 ( .A(n6019), .B(\eda_controller/current_state [0]), .Z(n5179) );
  dti_28hc_7t_30_invx1 U6475 ( .A(n5476), .Z(n6021) );
  dti_28hc_7t_30_nand2x1 U6476 ( .A(n6021), .B(n5161), .Z(n5178) );
  dti_28hc_7t_30_nand2x1 U6477 ( .A(n5179), .B(n5178), .Z(n5977) );
  dti_28hc_7t_30_nor2x1 U6479 ( .A(\eda_controller/current_state [0]), .B(
        \eda_controller/current_state [1]), .Z(n5475) );
  dti_28hc_7t_30_nand2x1 U6480 ( .A(n5475), .B(
        \eda_controller/current_state [2]), .Z(n6025) );
  dti_28hc_7t_30_nand2x1 U6482 ( .A(\eda_iterated_ram/current_row[5][0] ), .B(
        \eda_iterated_ram/current_row[5][1] ), .Z(n5446) );
  dti_28hc_7t_30_or2x1 U6484 ( .A(n5446), .B(n5163), .Z(n5462) );
  dti_28hc_7t_30_nor2x1 U6486 ( .A(n5462), .B(n5164), .Z(n6220) );
  dti_28hc_7t_30_nand2x1 U6487 ( .A(n6220), .B(
        \eda_iterated_ram/current_row[5][4] ), .Z(n5522) );
  dti_28hc_7t_30_nand2x1 U6488 ( .A(\eda_iterated_ram/current_row[3][0] ), .B(
        \eda_iterated_ram/current_row[3][1] ), .Z(n5450) );
  dti_28hc_7t_30_nand2x1 U6491 ( .A(\eda_iterated_ram/current_row[4][4] ), .B(
        \eda_iterated_ram/current_row[4][5] ), .Z(n5167) );
  dti_28hc_7t_30_or2x1 U6493 ( .A(n5167), .B(n5515), .Z(n6221) );
  dti_28hc_7t_30_nand2x1 U6494 ( .A(\eda_iterated_ram/current_row[4][2] ), .B(
        \eda_iterated_ram/current_row[4][1] ), .Z(n5168) );
  dti_28hc_7t_30_invx1 U6496 ( .A(n5457), .Z(n5516) );
  dti_28hc_7t_30_nor2x1 U6497 ( .A(n6221), .B(n5516), .Z(n5177) );
  dti_28hc_7t_30_nand2x1 U6498 ( .A(\eda_iterated_ram/current_row[1][0] ), .B(
        \eda_iterated_ram/current_row[1][3] ), .Z(n5171) );
  dti_28hc_7t_30_nand2x1 U6499 ( .A(\eda_iterated_ram/current_row[1][1] ), .B(
        n3543), .Z(n5230) );
  dti_28hc_7t_30_nand2x1 U6500 ( .A(\eda_iterated_ram/current_row[0][5] ), .B(
        \eda_iterated_ram/current_row[0][3] ), .Z(n5174) );
  dti_28hc_7t_30_nand2x1 U6501 ( .A(\eda_iterated_ram/current_row[0][4] ), .B(
        \eda_iterated_ram/current_row[0][0] ), .Z(n5173) );
  dti_28hc_7t_30_nand2x1 U6503 ( .A(\eda_iterated_ram/current_row[2][4] ), .B(
        \eda_iterated_ram/current_row[2][5] ), .Z(n5175) );
  dti_28hc_7t_30_or2x1 U6504 ( .A(n5524), .B(n5175), .Z(n5441) );
  dti_28hc_7t_30_invx1 U6505 ( .A(n7405), .Z(n5449) );
  dti_28hc_7t_30_invx1 U6506 ( .A(n5177), .Z(n5517) );
  dti_28hc_7t_30_nand2x1 U6507 ( .A(n5178), .B(n6025), .Z(n6018) );
  dti_28hc_7t_30_invx1 U6508 ( .A(n5179), .Z(n6016) );
  dti_28hc_7t_30_invx1 U6509 ( .A(n5183), .Z(n5184) );
  dti_28hc_7t_30_nand2x1 U6510 ( .A(n5184), .B(iterated_all), .Z(n5185) );
  dti_28hc_7t_30_aoi22x1 U6511 ( .A1(n5988), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][3] ), .B1(
        n5391), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n5190) );
  dti_28hc_7t_30_aoi22x1 U6512 ( .A1(n5955), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][3] ), .B1(
        n5392), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n5189) );
  dti_28hc_7t_30_aoi22xp5 U6513 ( .A1(n5997), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][3] ), .B1(
        n5396), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(
        n5194) );
  dti_28hc_7t_30_aoi22x1 U6514 ( .A1(n5404), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][3] ), 
        .B1(n5403), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(
        n5197) );
  dti_28hc_7t_30_aoi22xp5 U6515 ( .A1(n5407), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][3] ), 
        .B1(n5951), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n5195) );
  dti_28hc_7t_30_aoi22x1 U6516 ( .A1(n6738), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][3] ), 
        .B1(n5419), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][3] ), 
        .Z(n5200) );
  dti_28hc_7t_30_aoi22xp5 U6517 ( .A1(n5422), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][3] ), 
        .B1(n5421), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][3] ), 
        .Z(n5198) );
  dti_28hc_7t_30_ioa13xp5 U6518 ( .B1(n5200), .B2(n5199), .B3(n5198), .A(n6761), .Z(n5205) );
  dti_28hc_7t_30_aoi22xp5 U6519 ( .A1(n5412), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][3] ), .B1(
        n5411), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n5203) );
  dti_28hc_7t_30_aoi22x1 U6520 ( .A1(n6246), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][3] ), .B1(
        n5413), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n5202) );
  dti_28hc_7t_30_aoi22x1 U6521 ( .A1(n7278), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][3] ), .B1(
        n5414), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n5201) );
  dti_28hc_7t_30_aoi22x1 U6522 ( .A1(n5374), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][3] ), .B1(n5958), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(n5210)
         );
  dti_28hc_7t_30_aoi22x1 U6523 ( .A1(n5364), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][3] ), .B1(
        n5363), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n5215) );
  dti_28hc_7t_30_aoi22x1 U6524 ( .A1(n6009), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][3] ), .B1(
        n5365), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n5214) );
  dti_28hc_7t_30_aoi22x1 U6525 ( .A1(n5367), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][3] ), .B1(
        n5366), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n5213) );
  dti_28hc_7t_30_aoi22x1 U6526 ( .A1(n5969), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][3] ), .B1(
        n5378), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n5218) );
  dti_28hc_7t_30_aoi22x1 U6527 ( .A1(n5380), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][3] ), .B1(
        n5379), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][3] ), .Z(
        n5217) );
  dti_28hc_7t_30_nand2i1x1 U6528 ( .A(n5228), .B(n7305), .Z(n5225) );
  dti_28hc_7t_30_nor2i1x1 U6529 ( .A(new_pixel), .B(iterated_all), .Z(n5227)
         );
  dti_28hc_7t_30_invx1 U6530 ( .A(n5228), .Z(n5229) );
  dti_28hc_7t_30_nor2x1 U6531 ( .A(n7309), .B(n5230), .Z(n7315) );
  dti_28hc_7t_30_nand2x1 U6532 ( .A(n7315), .B(
        \eda_iterated_ram/current_row[1][3] ), .Z(n6217) );
  dti_28hc_7t_30_nor3x1 U6533 ( .A(n6217), .B(
        \eda_iterated_ram/current_row[1][4] ), .C(n7399), .Z(n5231) );
  dti_28hc_7t_30_nor2x1 U6534 ( .A(n7430), .B(n5231), .Z(n5440) );
  dti_28hc_7t_30_invx1 U6536 ( .A(n4081), .Z(n5237) );
  dti_28hc_7t_30_aoi22x1 U6538 ( .A1(n6009), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][2] ), .B1(
        n5365), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(
        n5239) );
  dti_28hc_7t_30_aoi22x1 U6539 ( .A1(n7278), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][2] ), .B1(
        n5414), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n5244) );
  dti_28hc_7t_30_aoi22x1 U6540 ( .A1(n5412), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][2] ), .B1(
        n5411), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n5243) );
  dti_28hc_7t_30_nand2xp5 U6541 ( .A(n6246), .B(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n5242) );
  dti_28hc_7t_30_nand2xp5 U6542 ( .A(n5413), .B(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(
        n5241) );
  dti_28hc_7t_30_aoi22x1 U6543 ( .A1(n6738), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][2] ), 
        .B1(n5419), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][2] ), 
        .Z(n5247) );
  dti_28hc_7t_30_aoi22xp5 U6544 ( .A1(n5422), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][2] ), 
        .B1(n5421), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][2] ), 
        .Z(n5245) );
  dti_28hc_7t_30_aoi13rex1 U6545 ( .B1(n5247), .B2(n5246), .B3(n5245), .A(
        n7789), .Z(n5248) );
  dti_28hc_7t_30_aoi22x1 U6546 ( .A1(n5374), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][2] ), .B1(n5958), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(n5252)
         );
  dti_28hc_7t_30_nand3i1x1 U6547 ( .A(n5485), .B(n5250), .C(n5254), .Z(n5259)
         );
  dti_28hc_7t_30_aoi22xp5 U6548 ( .A1(n5404), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][2] ), 
        .B1(n5403), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(
        n5257) );
  dti_28hc_7t_30_aoi22xp5 U6549 ( .A1(n5406), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][2] ), 
        .B1(n5405), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n5256) );
  dti_28hc_7t_30_aoi22xp5 U6550 ( .A1(n5407), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][2] ), 
        .B1(n5951), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n5255) );
  dti_28hc_7t_30_aoi22x1 U6551 ( .A1(n5390), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][2] ), .B1(
        n5389), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n5264) );
  dti_28hc_7t_30_aoi22x1 U6552 ( .A1(n5988), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][2] ), .B1(
        n5391), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(
        n5263) );
  dti_28hc_7t_30_aoi22x1 U6553 ( .A1(n5955), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][2] ), .B1(
        n5392), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n5262) );
  dti_28hc_7t_30_aoi22x1 U6554 ( .A1(n5997), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][2] ), .B1(
        n5396), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(
        n5266) );
  dti_28hc_7t_30_aoi22x1 U6555 ( .A1(n5380), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][2] ), .B1(
        n5379), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][2] ), .Z(
        n5270) );
  dti_28hc_7t_30_aoi22x1 U6556 ( .A1(n5969), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][2] ), .B1(
        n5378), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n5269) );
  dti_28hc_7t_30_ao13x1 U6557 ( .B1(n5270), .B2(n5269), .B3(n5268), .A(n5352), 
        .Z(n5271) );
  dti_28hc_7t_30_invx1 U6558 ( .A(n6896), .Z(n5281) );
  dti_28hc_7t_30_aoi22x1 U6559 ( .A1(n5364), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][1] ), .B1(
        n5363), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n5287) );
  dti_28hc_7t_30_aoi22x1 U6560 ( .A1(n6009), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][1] ), .B1(
        n5365), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(
        n5286) );
  dti_28hc_7t_30_aoi22x1 U6561 ( .A1(n5367), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][1] ), .B1(
        n5366), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n5285) );
  dti_28hc_7t_30_aoi22x1 U6562 ( .A1(n5374), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][1] ), .B1(n5958), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(n5288)
         );
  dti_28hc_7t_30_aoi22x1 U6563 ( .A1(n5969), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][1] ), .B1(
        n5378), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n5293) );
  dti_28hc_7t_30_aoi22x1 U6564 ( .A1(n5380), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][1] ), .B1(
        n5379), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][1] ), .Z(
        n5292) );
  dti_28hc_7t_30_nand3x1 U6565 ( .A(n5296), .B(n5295), .C(n5294), .Z(n5321) );
  dti_28hc_7t_30_aoi22x1 U6566 ( .A1(n5390), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][1] ), .B1(
        n5389), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n5299) );
  dti_28hc_7t_30_aoi22x1 U6567 ( .A1(n5988), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][1] ), .B1(
        n5391), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(
        n5298) );
  dti_28hc_7t_30_aoi22x1 U6568 ( .A1(n5955), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][1] ), .B1(
        n5392), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n5297) );
  dti_28hc_7t_30_aoi22x1 U6569 ( .A1(n5997), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][1] ), .B1(
        n5396), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][1] ), .Z(
        n5301) );
  dti_28hc_7t_30_aoi22x1 U6570 ( .A1(n5404), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][1] ), 
        .B1(n5403), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][1] ), .Z(
        n5307) );
  dti_28hc_7t_30_aoi22x1 U6571 ( .A1(n5407), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][1] ), 
        .B1(n5951), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n5306) );
  dti_28hc_7t_30_aoi22x1 U6572 ( .A1(n5406), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][1] ), 
        .B1(n5405), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n5305) );
  dti_28hc_7t_30_aoi22x1 U6573 ( .A1(n5412), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][1] ), .B1(
        n5411), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n5310) );
  dti_28hc_7t_30_aoi22x1 U6574 ( .A1(n6246), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][1] ), .B1(
        n5413), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(
        n5309) );
  dti_28hc_7t_30_aoi22x1 U6575 ( .A1(n7278), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][1] ), .B1(
        n5414), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n5308) );
  dti_28hc_7t_30_aoi22x1 U6576 ( .A1(n6738), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][1] ), 
        .B1(n5419), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][1] ), 
        .Z(n5313) );
  dti_28hc_7t_30_aoi22x1 U6577 ( .A1(n5422), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][1] ), 
        .B1(n5421), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][1] ), 
        .Z(n5311) );
  dti_28hc_7t_30_aoi13rex1 U6578 ( .B1(n5313), .B2(n5312), .B3(n5311), .A(
        n7789), .Z(n5314) );
  dti_28hc_7t_30_aoi22x1 U6579 ( .A1(n5364), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][0] ), .B1(
        n5363), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n5329) );
  dti_28hc_7t_30_aoi22x1 U6580 ( .A1(n6009), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][0] ), .B1(
        n5365), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n5328) );
  dti_28hc_7t_30_aoi22x1 U6581 ( .A1(n5367), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][0] ), .B1(
        n5366), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n5327) );
  dti_28hc_7t_30_aoi22x1 U6582 ( .A1(n5374), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][0] ), .B1(n5958), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(n5330)
         );
  dti_28hc_7t_30_aoi22x1 U6583 ( .A1(n7278), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][0] ), .B1(
        n5414), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n5336) );
  dti_28hc_7t_30_aoi22x1 U6584 ( .A1(n5412), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][0] ), .B1(
        n5411), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n5335) );
  dti_28hc_7t_30_nand2xp5 U6585 ( .A(n6246), .B(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n5334) );
  dti_28hc_7t_30_nand2xp5 U6586 ( .A(n5413), .B(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n5333) );
  dti_28hc_7t_30_nand4xp5 U6587 ( .A(n5336), .B(n5335), .C(n5334), .D(n5333), 
        .Z(n5341) );
  dti_28hc_7t_30_aoi22x1 U6588 ( .A1(n6738), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][0] ), 
        .B1(n5419), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][0] ), 
        .Z(n5339) );
  dti_28hc_7t_30_aoi22x1 U6589 ( .A1(n5422), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][0] ), 
        .B1(n5421), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][0] ), 
        .Z(n5337) );
  dti_28hc_7t_30_aoi13rex1 U6590 ( .B1(n5339), .B2(n5338), .B3(n5337), .A(
        n7789), .Z(n5340) );
  dti_28hc_7t_30_aoi22x1 U6591 ( .A1(n5404), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][0] ), 
        .B1(n5403), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][0] ), .Z(
        n5344) );
  dti_28hc_7t_30_aoi22x1 U6592 ( .A1(n5407), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][0] ), 
        .B1(n5951), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n5342) );
  dti_28hc_7t_30_aoi22x1 U6593 ( .A1(n5390), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][0] ), .B1(
        n5389), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n5348) );
  dti_28hc_7t_30_aoi22x1 U6594 ( .A1(n5988), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][0] ), .B1(
        n5391), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n5347) );
  dti_28hc_7t_30_aoi22x1 U6595 ( .A1(n5955), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][0] ), .B1(
        n5392), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n5346) );
  dti_28hc_7t_30_aoi22x1 U6596 ( .A1(n5997), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][0] ), .B1(
        n5396), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][0] ), .Z(
        n5350) );
  dti_28hc_7t_30_aoi22x1 U6597 ( .A1(n5380), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][0] ), .B1(
        n5379), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][0] ), .Z(
        n5355) );
  dti_28hc_7t_30_aoi22x1 U6598 ( .A1(n5969), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][0] ), .B1(
        n5378), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n5354) );
  dti_28hc_7t_30_aoi22x1 U6600 ( .A1(n5364), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][4] ), .B1(
        n5363), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n5370) );
  dti_28hc_7t_30_aoi22x1 U6601 ( .A1(n6009), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][4] ), .B1(
        n5365), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][4] ), .Z(
        n5369) );
  dti_28hc_7t_30_aoi22x1 U6602 ( .A1(n5367), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][4] ), .B1(
        n5366), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n5368) );
  dti_28hc_7t_30_aoi22x1 U6603 ( .A1(n5374), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][4] ), .B1(n5958), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(n5375)
         );
  dti_28hc_7t_30_aoi22x1 U6604 ( .A1(n5969), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][4] ), .B1(
        n5378), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n5385) );
  dti_28hc_7t_30_aoi22x1 U6605 ( .A1(n5380), .A2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][4] ), .B1(
        n5379), .B2(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][4] ), .Z(
        n5384) );
  dti_28hc_7t_30_aoi22x1 U6607 ( .A1(n5988), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][4] ), .B1(
        n5391), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][4] ), .Z(
        n5394) );
  dti_28hc_7t_30_aoi22x1 U6608 ( .A1(n5955), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][4] ), .B1(
        n5392), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n5393) );
  dti_28hc_7t_30_aoi22x1 U6609 ( .A1(n5997), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][4] ), .B1(
        n5396), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(
        n5402) );
  dti_28hc_7t_30_aoi22x1 U6610 ( .A1(n5404), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][4] ), 
        .B1(n5403), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(
        n5410) );
  dti_28hc_7t_30_aoi22x1 U6611 ( .A1(n5407), .A2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][4] ), 
        .B1(n5951), .B2(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n5408) );
  dti_28hc_7t_30_aoi22x1 U6612 ( .A1(n5412), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][4] ), .B1(
        n5411), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n5418) );
  dti_28hc_7t_30_aoi22x1 U6614 ( .A1(n7278), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][4] ), .B1(
        n5414), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n5416) );
  dti_28hc_7t_30_aoi22x1 U6615 ( .A1(n6738), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][4] ), 
        .B1(n5419), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][4] ), 
        .Z(n5425) );
  dti_28hc_7t_30_aoi22x1 U6616 ( .A1(n5422), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][4] ), 
        .B1(n5421), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][4] ), 
        .Z(n5423) );
  dti_28hc_7t_30_ioa13xp5 U6617 ( .B1(n5425), .B2(n5424), .B3(n5423), .A(n6761), .Z(n5426) );
  dti_28hc_7t_30_invx1 U6618 ( .A(n5431), .Z(n5432) );
  dti_28hc_7t_30_invx1 U6620 ( .A(n7322), .Z(n5443) );
  dti_28hc_7t_30_nand2x1 U6622 ( .A(n7383), .B(
        \eda_iterated_ram/current_row[4][1] ), .Z(n7385) );
  dti_28hc_7t_30_or2xp58 U6623 ( .A(n5446), .B(
        \eda_iterated_ram/current_row[5][2] ), .Z(n7414) );
  dti_28hc_7t_30_invx1 U6627 ( .A(n7333), .Z(n5448) );
  dti_28hc_7t_30_invx1 U6628 ( .A(n6050), .Z(n5454) );
  dti_28hc_7t_30_nand2x1 U6629 ( .A(\eda_iterated_ram/current_row[0][1] ), .B(
        \eda_iterated_ram/current_row[0][0] ), .Z(n6229) );
  dti_28hc_7t_30_invx1 U6630 ( .A(n6229), .Z(n5452) );
  dti_28hc_7t_30_nor3x1 U6633 ( .A(n7309), .B(n3543), .C(n5451), .Z(n7312) );
  dti_28hc_7t_30_oai12x1 U6634 ( .B1(n5454), .B2(n3378), .A(n5453), .Z(n5455)
         );
  dti_28hc_7t_30_nand2x1 U6635 ( .A(n5458), .B(n5457), .Z(n7390) );
  dti_28hc_7t_30_nor2x1 U6637 ( .A(n6229), .B(n5459), .Z(n6153) );
  dti_28hc_7t_30_aoi22x1 U6639 ( .A1(n7315), .A2(n5461), .B1(n6153), .B2(n5460), .Z(n5463) );
  dti_28hc_7t_30_invx1 U6641 ( .A(n5465), .Z(n5467) );
  dti_28hc_7t_30_nor2i1x1 U6642 ( .A(n6044), .B(\strb_value[0][0] ), .Z(n5466)
         );
  dti_28hc_7t_30_invx1 U6643 ( .A(n5468), .Z(n7437) );
  dti_28hc_7t_30_nand2x1 U6645 ( .A(wr_addr[3]), .B(n6248), .Z(n6266) );
  dti_28hc_7t_30_nand2i1xp5 U6646 ( .A(\eda_controller/current_state [2]), .B(
        n5475), .Z(n5470) );
  dti_28hc_7t_30_oai12x1 U6647 ( .B1(done), .B2(n7448), .A(n5470), .Z(n5483)
         );
  dti_28hc_7t_30_invx1 U6648 ( .A(n5479), .Z(n5473) );
  dti_28hc_7t_30_nand2x1 U6649 ( .A(n5473), .B(n5478), .Z(n6024) );
  dti_28hc_7t_30_invx1 U6650 ( .A(\eda_controller/current_state [2]), .Z(n5474) );
  dti_28hc_7t_30_nor2i1x1 U6652 ( .A(n6020), .B(n5477), .Z(n5481) );
  dti_28hc_7t_30_or2x1 U6654 ( .A(n6027), .B(n6025), .Z(n5480) );
  dti_28hc_7t_30_nor2x1 U6655 ( .A(n5485), .B(n3464), .Z(n6936) );
  dti_28hc_7t_30_invx1 U6656 ( .A(n5486), .Z(n5492) );
  dti_28hc_7t_30_nor2i1x1 U6657 ( .A(\eda_fifos/sync_fifo_up/wr_addr [0]), .B(
        \eda_fifos/sync_fifo_up/rd_addr [0]), .Z(n5487) );
  dti_28hc_7t_30_xor2bxp5 U6658 ( .A(n5488), .B(n5487), .Z(n5489) );
  dti_28hc_7t_30_and2xp5 U6659 ( .A(n5490), .B(n5489), .Z(n5491) );
  dti_28hc_7t_30_invx1 U6662 ( .A(\eda_fifos/sync_fifo_left/o_full ), .Z(n5506) );
  dti_28hc_7t_30_or2x1 U6663 ( .A(\eda_fifos/sync_fifo_left/wr_addr [0]), .B(
        \eda_fifos/sync_fifo_left/wr_addr [1]), .Z(n5509) );
  dti_28hc_7t_30_nor2x1 U6664 ( .A(n5509), .B(
        \eda_fifos/sync_fifo_left/wr_addr [2]), .Z(n5507) );
  dti_28hc_7t_30_muxi21x1 U6666 ( .D0(n7127), .D1(n5508), .S(n7258), .Z(n2723)
         );
  dti_28hc_7t_30_nor2x1 U6668 ( .A(n6969), .B(n5509), .Z(n5510) );
  dti_28hc_7t_30_muxi21x1 U6669 ( .D0(n7127), .D1(n5511), .S(n7264), .Z(n2747)
         );
  dti_28hc_7t_30_invx1 U6670 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n5512) );
  dti_28hc_7t_30_muxi21x1 U6671 ( .D0(n4081), .D1(n5512), .S(n7258), .Z(n2724)
         );
  dti_28hc_7t_30_muxi21x1 U6673 ( .D0(n4081), .D1(n5513), .S(n7264), .Z(n2748)
         );
  dti_28hc_7t_30_nor2x1 U6676 ( .A(n6217), .B(n5514), .Z(n7318) );
  dti_28hc_7t_30_nor2x1 U6677 ( .A(n5516), .B(n5515), .Z(n6218) );
  dti_28hc_7t_30_nand4i1x1 U6678 ( .A(n5523), .B(
        \eda_iterated_ram/current_row[4][4] ), .C(n6218), .D(n5517), .Z(n5519)
         );
  dti_28hc_7t_30_nand2x1 U6679 ( .A(n6153), .B(
        \eda_iterated_ram/current_row[0][3] ), .Z(n7295) );
  dti_28hc_7t_30_or3xp8 U6681 ( .A(n7295), .B(
        \eda_iterated_ram/current_row[0][5] ), .C(n5518), .Z(n7300) );
  dti_28hc_7t_30_oai12rexp5 U6682 ( .B1(n5520), .B2(n5519), .A(n7300), .Z(
        n5521) );
  dti_28hc_7t_30_nor2x1 U6683 ( .A(n7318), .B(n5521), .Z(n5528) );
  dti_28hc_7t_30_invx1 U6684 ( .A(n5522), .Z(n7432) );
  dti_28hc_7t_30_nand2x1 U6685 ( .A(n7405), .B(n7432), .Z(n5527) );
  dti_28hc_7t_30_or2x1 U6686 ( .A(n6215), .B(n5523), .Z(n7370) );
  dti_28hc_7t_30_invx1 U6687 ( .A(n5524), .Z(n5525) );
  dti_28hc_7t_30_nand2x1 U6688 ( .A(n7322), .B(n5525), .Z(n7341) );
  dti_28hc_7t_30_or2x1 U6690 ( .A(n7341), .B(n5526), .Z(n7346) );
  dti_28hc_7t_30_and2xp58 U6692 ( .A(n5529), .B(
        \eda_iterated_ram/current_row[5][0] ), .Z(n7410) );
  dti_28hc_7t_30_and2x1 U6693 ( .A(n7353), .B(
        \eda_iterated_ram/current_row[3][0] ), .Z(n7358) );
  dti_28hc_7t_30_ioa12hpx1 U6697 ( .B1(n7405), .B2(n7410), .A(n5534), .Z(n5535) );
  dti_28hc_7t_30_invx1 U6700 ( .A(n7439), .Z(n6041) );
  dti_28hc_7t_30_nand2x1 U6701 ( .A(new_pixel), .B(n6041), .Z(n5887) );
  dti_28hc_7t_30_nand2x1 U6702 ( .A(n5542), .B(n6635), .Z(n5607) );
  dti_28hc_7t_30_iao12x1 U6703 ( .B1(n5607), .B2(n5540), .A(n5595), .Z(n5546)
         );
  dti_28hc_7t_30_invx1 U6704 ( .A(n5540), .Z(n5606) );
  dti_28hc_7t_30_invx1 U6705 ( .A(n5541), .Z(n5600) );
  dti_28hc_7t_30_oai22xp5 U6706 ( .A1(n5606), .A2(n5542), .B1(n5598), .B2(
        n5600), .Z(n5545) );
  dti_28hc_7t_30_invx1 U6707 ( .A(n5587), .Z(n5543) );
  dti_28hc_7t_30_oai12x1 U6708 ( .B1(n5546), .B2(n5545), .A(n5544), .Z(n5551)
         );
  dti_28hc_7t_30_invx1 U6709 ( .A(n5547), .Z(n5584) );
  dti_28hc_7t_30_invx1 U6711 ( .A(n5562), .Z(n5552) );
  dti_28hc_7t_30_nand3x1 U6712 ( .A(n5551), .B(n5555), .C(n5550), .Z(n5557) );
  dti_28hc_7t_30_invx1 U6713 ( .A(n5575), .Z(n5553) );
  dti_28hc_7t_30_nand2x1 U6714 ( .A(n5557), .B(n5556), .Z(n5560) );
  dti_28hc_7t_30_invx1 U6715 ( .A(n5614), .Z(n5558) );
  dti_28hc_7t_30_invx1 U6716 ( .A(n5605), .Z(n5599) );
  dti_28hc_7t_30_nand2x1 U6717 ( .A(n5599), .B(n6635), .Z(n5602) );
  dti_28hc_7t_30_invx1 U6718 ( .A(n5602), .Z(n5577) );
  dti_28hc_7t_30_invx1 U6719 ( .A(n5620), .Z(n5812) );
  dti_28hc_7t_30_nand2x1 U6721 ( .A(n5574), .B(n3614), .Z(n5811) );
  dti_28hc_7t_30_invx1 U6722 ( .A(n5811), .Z(n5611) );
  dti_28hc_7t_30_invx1 U6724 ( .A(n5829), .Z(n5581) );
  dti_28hc_7t_30_nand2x1 U6725 ( .A(n5680), .B(n5578), .Z(n5580) );
  dti_28hc_7t_30_nand2x1 U6726 ( .A(n5580), .B(n5875), .Z(n5621) );
  dti_28hc_7t_30_invx1 U6727 ( .A(n5621), .Z(n5827) );
  dti_28hc_7t_30_aoi22x1 U6728 ( .A1(n5812), .A2(n5611), .B1(n5581), .B2(n5827), .Z(n5593) );
  dti_28hc_7t_30_invx1 U6729 ( .A(n5582), .Z(n5583) );
  dti_28hc_7t_30_muxi21x1 U6730 ( .D0(n5584), .D1(n5583), .S(n5605), .Z(n5585)
         );
  dti_28hc_7t_30_nand2x1 U6731 ( .A(n5585), .B(n6635), .Z(n5632) );
  dti_28hc_7t_30_muxi21x1 U6732 ( .D0(n3774), .D1(n5586), .S(n5680), .Z(n5622)
         );
  dti_28hc_7t_30_nor2x1 U6733 ( .A(n5632), .B(n5622), .Z(n5625) );
  dti_28hc_7t_30_invx1 U6734 ( .A(n5625), .Z(n5618) );
  dti_28hc_7t_30_nor2x1 U6736 ( .A(n5590), .B(n5589), .Z(n5801) );
  dti_28hc_7t_30_aoi12xp5 U6737 ( .B1(n5680), .B2(n5591), .A(n5871), .Z(n5799)
         );
  dti_28hc_7t_30_muxi21x1 U6740 ( .D0(n5595), .D1(n5594), .S(n5605), .Z(n5596)
         );
  dti_28hc_7t_30_nor2x1 U6741 ( .A(n5596), .B(n6604), .Z(n5672) );
  dti_28hc_7t_30_muxi21x1 U6742 ( .D0(n3241), .D1(n5597), .S(n5680), .Z(n5844)
         );
  dti_28hc_7t_30_invx1 U6743 ( .A(n5598), .Z(n5601) );
  dti_28hc_7t_30_muxi21x1 U6744 ( .D0(n5604), .D1(n5603), .S(n5680), .Z(n5639)
         );
  dti_28hc_7t_30_aoi22x1 U6745 ( .A1(n5672), .A2(n5844), .B1(n5638), .B2(n5639), .Z(n5610) );
  dti_28hc_7t_30_oai12x1 U6746 ( .B1(n5672), .B2(n5844), .A(n5671), .Z(n5609)
         );
  dti_28hc_7t_30_oai22rex1 U6747 ( .A1(n5799), .A2(n5801), .B1(n5639), .B2(
        n5638), .Z(n5608) );
  dti_28hc_7t_30_nor3x1 U6748 ( .A(n5812), .B(n5611), .C(n5827), .Z(n5619) );
  dti_28hc_7t_30_invx1 U6749 ( .A(n5622), .Z(n5631) );
  dti_28hc_7t_30_invx1 U6750 ( .A(n5632), .Z(n5616) );
  dti_28hc_7t_30_nand2x1 U6751 ( .A(n5633), .B(n5634), .Z(n5826) );
  dti_28hc_7t_30_aoi12rex1 U6752 ( .B1(n5619), .B2(n5618), .A(n5617), .Z(n5628) );
  dti_28hc_7t_30_nand2x1 U6753 ( .A(n5620), .B(n5811), .Z(n5624) );
  dti_28hc_7t_30_aoi12rex1 U6754 ( .B1(n5632), .B2(n5622), .A(n5621), .Z(n5623) );
  dti_28hc_7t_30_nand2x1 U6755 ( .A(n5626), .B(n5829), .Z(n5627) );
  dti_28hc_7t_30_invx1 U6756 ( .A(n5858), .Z(n5897) );
  dti_28hc_7t_30_invx1 U6757 ( .A(n5633), .Z(n5635) );
  dti_28hc_7t_30_nand2x1 U6758 ( .A(n5635), .B(n5634), .Z(n5880) );
  dti_28hc_7t_30_invx1 U6759 ( .A(n5881), .Z(n5636) );
  dti_28hc_7t_30_nand2x1 U6760 ( .A(n5880), .B(n5636), .Z(n5874) );
  dti_28hc_7t_30_invx1 U6761 ( .A(n5874), .Z(n5637) );
  dti_28hc_7t_30_invx1 U6762 ( .A(n5638), .Z(n5640) );
  dti_28hc_7t_30_oa12x1 U6763 ( .B1(n5900), .B2(n5640), .A(n5639), .Z(n5893)
         );
  dti_28hc_7t_30_invx1 U6764 ( .A(n5650), .Z(n5669) );
  dti_28hc_7t_30_invx1 U6765 ( .A(n5651), .Z(n5668) );
  dti_28hc_7t_30_invx1 U6766 ( .A(n5654), .Z(n5738) );
  dti_28hc_7t_30_ioa12hpx1 U6768 ( .B1(n5738), .B2(n3546), .A(n5643), .Z(n5648) );
  dti_28hc_7t_30_nand2x1 U6769 ( .A(n5641), .B(n6114), .Z(n5747) );
  dti_28hc_7t_30_oai12rexp5 U6770 ( .B1(n5645), .B2(n5747), .A(n5642), .Z(
        n5647) );
  dti_28hc_7t_30_nand2x1 U6771 ( .A(n5643), .B(n5642), .Z(n5646) );
  dti_28hc_7t_30_invx1 U6772 ( .A(n5644), .Z(n5767) );
  dti_28hc_7t_30_aoi22rex1 U6773 ( .A1(n5747), .A2(n5645), .B1(n5767), .B2(
        n3552), .Z(n5656) );
  dti_28hc_7t_30_nand2x1 U6774 ( .A(n5649), .B(n6114), .Z(n5776) );
  dti_28hc_7t_30_nor2xp5 U6775 ( .A(n5776), .B(n5655), .Z(n5659) );
  dti_28hc_7t_30_nor2i1x1 U6776 ( .A(n5651), .B(n5650), .Z(n5652) );
  dti_28hc_7t_30_invx1 U6777 ( .A(n5653), .Z(n5739) );
  dti_28hc_7t_30_invx1 U6778 ( .A(n5660), .Z(n5756) );
  dti_28hc_7t_30_nand2x1 U6780 ( .A(n5663), .B(n6114), .Z(n5736) );
  dti_28hc_7t_30_nor2x1 U6781 ( .A(n5664), .B(n5736), .Z(n5666) );
  dti_28hc_7t_30_invx1 U6782 ( .A(n5736), .Z(n5665) );
  dti_28hc_7t_30_invx1 U6785 ( .A(n5771), .Z(n5683) );
  dti_28hc_7t_30_invx1 U6786 ( .A(n5671), .Z(n5845) );
  dti_28hc_7t_30_invx1 U6787 ( .A(n5672), .Z(n5724) );
  dti_28hc_7t_30_invx1 U6788 ( .A(n5673), .Z(n5676) );
  dti_28hc_7t_30_invx1 U6789 ( .A(n5674), .Z(n5675) );
  dti_28hc_7t_30_nand2x1 U6790 ( .A(n5677), .B(n6114), .Z(n5782) );
  dti_28hc_7t_30_invx1 U6791 ( .A(n5782), .Z(n5681) );
  dti_28hc_7t_30_ioa12hpx1 U6792 ( .B1(n5683), .B2(n5845), .A(n5678), .Z(n5685) );
  dti_28hc_7t_30_aoi12xp5 U6793 ( .B1(n5680), .B2(n5679), .A(n6064), .Z(n5899)
         );
  dti_28hc_7t_30_ioa12hpx1 U6794 ( .B1(n5683), .B2(n5844), .A(n5682), .Z(n5684) );
  dti_28hc_7t_30_muxi21x1 U6795 ( .D0(n5685), .D1(n5684), .S(n5900), .Z(n5798)
         );
  dti_28hc_7t_30_invx1 U6796 ( .A(n5691), .Z(n5721) );
  dti_28hc_7t_30_nand2x1 U6797 ( .A(n5686), .B(n5700), .Z(n5720) );
  dti_28hc_7t_30_nand2x1 U6798 ( .A(n5687), .B(n5700), .Z(n5735) );
  dti_28hc_7t_30_or2x1 U6799 ( .A(n5733), .B(n5735), .Z(n5719) );
  dti_28hc_7t_30_nand2x1 U6800 ( .A(n5688), .B(n5700), .Z(n5752) );
  dti_28hc_7t_30_nand2x1 U6802 ( .A(n5689), .B(n5700), .Z(n5774) );
  dti_28hc_7t_30_oai12x1 U6805 ( .B1(n5720), .B2(n5691), .A(n6063), .Z(n5692)
         );
  dti_28hc_7t_30_and2x1 U6806 ( .A(n5693), .B(n5692), .Z(n5715) );
  dti_28hc_7t_30_nand2x1 U6807 ( .A(n5694), .B(n5700), .Z(n5748) );
  dti_28hc_7t_30_invx1 U6808 ( .A(n5706), .Z(n5745) );
  dti_28hc_7t_30_iao22x1 U6809 ( .A1(n5745), .A2(n5743), .B1(n5774), .B2(n5772), .Z(n5702) );
  dti_28hc_7t_30_nand2x1 U6810 ( .A(n5701), .B(n5700), .Z(n5741) );
  dti_28hc_7t_30_or2x1 U6811 ( .A(n5707), .B(n5741), .Z(n5705) );
  dti_28hc_7t_30_invx1 U6812 ( .A(n5750), .Z(n5703) );
  dti_28hc_7t_30_oai12x1 U6813 ( .B1(n5745), .B2(n5743), .A(n5703), .Z(n5704)
         );
  dti_28hc_7t_30_nand3x1 U6814 ( .A(n5705), .B(n5748), .C(n5704), .Z(n5713) );
  dti_28hc_7t_30_nand2x1 U6815 ( .A(n5750), .B(n5706), .Z(n5709) );
  dti_28hc_7t_30_invx1 U6816 ( .A(n5707), .Z(n5742) );
  dti_28hc_7t_30_oai12x1 U6817 ( .B1(n5709), .B2(n5743), .A(n5742), .Z(n5711)
         );
  dti_28hc_7t_30_oai13x1 U6819 ( .B1(n5742), .B2(n5743), .B3(n5709), .A(n5708), 
        .Z(n5710) );
  dti_28hc_7t_30_muxi21x1 U6820 ( .D0(n5721), .D1(n5720), .S(n5773), .Z(n5781)
         );
  dti_28hc_7t_30_invx1 U6821 ( .A(n5722), .Z(n5723) );
  dti_28hc_7t_30_ioa12hpx1 U6822 ( .B1(n5845), .B2(n5781), .A(n5725), .Z(n5732) );
  dti_28hc_7t_30_invx1 U6824 ( .A(n5781), .Z(n5729) );
  dti_28hc_7t_30_invx1 U6825 ( .A(n5726), .Z(n5728) );
  dti_28hc_7t_30_nand2xp5 U6826 ( .A(n5844), .B(n5899), .Z(n5727) );
  dti_28hc_7t_30_muxi21x1 U6827 ( .D0(n5732), .D1(n5731), .S(n5900), .Z(n5797)
         );
  dti_28hc_7t_30_invx1 U6828 ( .A(n5733), .Z(n5734) );
  dti_28hc_7t_30_and2x1 U6829 ( .A(n5735), .B(n5734), .Z(n5830) );
  dti_28hc_7t_30_nand2x1 U6830 ( .A(n5737), .B(n5736), .Z(n5831) );
  dti_28hc_7t_30_nand2x1 U6831 ( .A(n5740), .B(n6114), .Z(n5803) );
  dti_28hc_7t_30_muxi21x1 U6832 ( .D0(n5742), .D1(n5741), .S(n5773), .Z(n5817)
         );
  dti_28hc_7t_30_invxp5 U6833 ( .A(n5743), .Z(n5744) );
  dti_28hc_7t_30_muxi21x1 U6834 ( .D0(n5745), .D1(n5744), .S(n5773), .Z(n5784)
         );
  dti_28hc_7t_30_nor3x1 U6835 ( .A(n5803), .B(n5817), .C(n5784), .Z(n5760) );
  dti_28hc_7t_30_muxi21xp5 U6836 ( .D0(n5747), .D1(n5746), .S(n5778), .Z(n5764) );
  dti_28hc_7t_30_invx1 U6837 ( .A(n5748), .Z(n5749) );
  dti_28hc_7t_30_muxi21x1 U6838 ( .D0(n5750), .D1(n5749), .S(n5773), .Z(n5809)
         );
  dti_28hc_7t_30_nor2x1 U6839 ( .A(n5764), .B(n5809), .Z(n5785) );
  dti_28hc_7t_30_invx1 U6840 ( .A(n5785), .Z(n5761) );
  dti_28hc_7t_30_invx1 U6841 ( .A(n5751), .Z(n5753) );
  dti_28hc_7t_30_muxi21x1 U6842 ( .D0(n5753), .D1(n5752), .S(n5773), .Z(n5834)
         );
  dti_28hc_7t_30_nand2x1 U6845 ( .A(n5757), .B(n6114), .Z(n5790) );
  dti_28hc_7t_30_invx1 U6846 ( .A(n5764), .Z(n5810) );
  dti_28hc_7t_30_invx1 U6847 ( .A(n5817), .Z(n5763) );
  dti_28hc_7t_30_oai22rex1 U6849 ( .A1(n5834), .A2(n5790), .B1(n5810), .B2(
        n5758), .Z(n5759) );
  dti_28hc_7t_30_invx1 U6850 ( .A(n5803), .Z(n5762) );
  dti_28hc_7t_30_invx1 U6851 ( .A(n5784), .Z(n5802) );
  dti_28hc_7t_30_nand3x1 U6852 ( .A(n5762), .B(n5761), .C(n5802), .Z(n5770) );
  dti_28hc_7t_30_invx1 U6853 ( .A(n5765), .Z(n5766) );
  dti_28hc_7t_30_nand2x1 U6854 ( .A(n5768), .B(n6114), .Z(n5783) );
  dti_28hc_7t_30_invx1 U6855 ( .A(n5783), .Z(n5818) );
  dti_28hc_7t_30_ioa12hpx1 U6856 ( .B1(n5770), .B2(n5769), .A(n5818), .Z(n5794) );
  dti_28hc_7t_30_aoi12rex1 U6857 ( .B1(n5782), .B2(n5781), .A(n5771), .Z(n5789) );
  dti_28hc_7t_30_invx1 U6858 ( .A(n5772), .Z(n5775) );
  dti_28hc_7t_30_invx1 U6860 ( .A(n5776), .Z(n5780) );
  dti_28hc_7t_30_invx1 U6861 ( .A(n5777), .Z(n5779) );
  dti_28hc_7t_30_aoi22x1 U6862 ( .A1(n5803), .A2(n5784), .B1(n5783), .B2(n5817), .Z(n5787) );
  dti_28hc_7t_30_oai112x1 U6863 ( .C1(n5789), .C2(n5788), .A(n5787), .B(n5786), 
        .Z(n5793) );
  dti_28hc_7t_30_invx1 U6864 ( .A(n5790), .Z(n5835) );
  dti_28hc_7t_30_invx1 U6865 ( .A(n5834), .Z(n5791) );
  dti_28hc_7t_30_nor2x1 U6866 ( .A(n5835), .B(n5791), .Z(n5792) );
  dti_28hc_7t_30_muxi21x1 U6868 ( .D0(n5798), .D1(n5797), .S(n5833), .Z(n5808)
         );
  dti_28hc_7t_30_invx1 U6869 ( .A(n5799), .Z(n5800) );
  dti_28hc_7t_30_invx1 U6871 ( .A(n5804), .Z(n5805) );
  dti_28hc_7t_30_muxi21x1 U6872 ( .D0(n5806), .D1(n5805), .S(n5833), .Z(n5807)
         );
  dti_28hc_7t_30_muxi21x1 U6873 ( .D0(n5810), .D1(n5809), .S(n5833), .Z(n5819)
         );
  dti_28hc_7t_30_aoi22x1 U6874 ( .A1(n5819), .A2(n5856), .B1(n5813), .B2(n5872), .Z(n5814) );
  dti_28hc_7t_30_muxi21x1 U6875 ( .D0(n5818), .D1(n5817), .S(n5833), .Z(n5822)
         );
  dti_28hc_7t_30_invx1 U6876 ( .A(n5819), .Z(n5821) );
  dti_28hc_7t_30_invx1 U6877 ( .A(n5856), .Z(n5820) );
  dti_28hc_7t_30_invx1 U6878 ( .A(n5860), .Z(n5896) );
  dti_28hc_7t_30_invxp8 U6879 ( .A(n5822), .Z(n5823) );
  dti_28hc_7t_30_aoi22x1 U6880 ( .A1(n5825), .A2(n5824), .B1(n5896), .B2(n5823), .Z(n5837) );
  dti_28hc_7t_30_invx1 U6881 ( .A(n5826), .Z(n5828) );
  dti_28hc_7t_30_invx1 U6882 ( .A(n5830), .Z(n5832) );
  dti_28hc_7t_30_nor2x1 U6883 ( .A(n5832), .B(n5831), .Z(n5878) );
  dti_28hc_7t_30_aoi22x1 U6884 ( .A1(n5837), .A2(n5840), .B1(n5878), .B2(n5880), .Z(n5839) );
  dti_28hc_7t_30_nand2x2 U6885 ( .A(n5839), .B(n5838), .Z(n5901) );
  dti_28hc_7t_30_invx1 U6886 ( .A(n5840), .Z(n5841) );
  dti_28hc_7t_30_nand2x1 U6887 ( .A(n5901), .B(n5841), .Z(n5877) );
  dti_28hc_7t_30_invx1 U6888 ( .A(n5873), .Z(n5842) );
  dti_28hc_7t_30_nand2x1 U6889 ( .A(n5877), .B(n5842), .Z(n5864) );
  dti_28hc_7t_30_invx1 U6890 ( .A(n5843), .Z(n5890) );
  dti_28hc_7t_30_nand2x1 U6892 ( .A(n5882), .B(n5846), .Z(n5852) );
  dti_28hc_7t_30_invx1 U6893 ( .A(n5893), .Z(n5848) );
  dti_28hc_7t_30_invx1 U6894 ( .A(n5847), .Z(n5894) );
  dti_28hc_7t_30_nor2x1 U6895 ( .A(n5848), .B(n5894), .Z(n5851) );
  dti_28hc_7t_30_nand2x1 U6896 ( .A(n5848), .B(n5894), .Z(n5853) );
  dti_28hc_7t_30_invx1 U6897 ( .A(n5872), .Z(n5849) );
  dti_28hc_7t_30_nand2x1 U6898 ( .A(n5850), .B(n5849), .Z(n5855) );
  dti_28hc_7t_30_ao112x1 U6899 ( .C1(n5853), .C2(n5852), .A(n5868), .B(n5851), 
        .Z(n5854) );
  dti_28hc_7t_30_nand2x1 U6901 ( .A(n5901), .B(n5856), .Z(n5888) );
  dti_28hc_7t_30_fadderox1 U6902 ( .A(n5890), .B(n5857), .CI(n5888), .CON(
        n5863) );
  dti_28hc_7t_30_invx1 U6903 ( .A(n5871), .Z(n5869) );
  dti_28hc_7t_30_nor2x1 U6905 ( .A(n5903), .B(n5870), .Z(n6035) );
  dti_28hc_7t_30_and2xp58 U6906 ( .A(n5873), .B(n5874), .Z(n5876) );
  dti_28hc_7t_30_invx1 U6907 ( .A(n5878), .Z(n5879) );
  dti_28hc_7t_30_oai13rexp5 U6908 ( .B1(n5880), .B2(n5881), .B3(n5879), .A(
        n3793), .Z(n6030) );
  dti_28hc_7t_30_nor2i1x1 U6909 ( .A(n6030), .B(n5887), .Z(n5885) );
  dti_28hc_7t_30_invx1 U6910 ( .A(n5882), .Z(n5883) );
  dti_28hc_7t_30_nand2x1 U6911 ( .A(n5901), .B(n5883), .Z(n5884) );
  dti_28hc_7t_30_nand2xp5 U6912 ( .A(n5884), .B(n5866), .Z(n6031) );
  dti_28hc_7t_30_nand4i1x1 U6913 ( .A(n6033), .B(n6032), .C(n5885), .D(n6031), 
        .Z(n5886) );
  dti_28hc_7t_30_invx1 U6914 ( .A(n5888), .Z(n5889) );
  dti_28hc_7t_30_nand2xp5 U6915 ( .A(n5892), .B(n3614), .Z(n6039) );
  dti_28hc_7t_30_nand2xp8 U6916 ( .A(n5895), .B(n3391), .Z(n6037) );
  dti_28hc_7t_30_ioa12hpx1 U6917 ( .B1(n6039), .B2(n6037), .A(n3706), .Z(n5910) );
  dti_28hc_7t_30_nand3x1 U6918 ( .A(n3706), .B(n3774), .C(n6036), .Z(n5909) );
  dti_28hc_7t_30_invx1 U6919 ( .A(n5898), .Z(n5904) );
  dti_28hc_7t_30_and2x1 U6920 ( .A(n5900), .B(n5899), .Z(n5902) );
  dti_28hc_7t_30_nand2xp5 U6922 ( .A(n5906), .B(n7633), .Z(n6038) );
  dti_28hc_7t_30_invx1 U6923 ( .A(n6038), .Z(n5907) );
  dti_28hc_7t_30_nand2x1 U6924 ( .A(n3706), .B(n5907), .Z(n5908) );
  dti_28hc_7t_30_nand4px1 U6925 ( .A(n5911), .B(n5910), .C(n5909), .D(n5908), 
        .Z(n5916) );
  dti_28hc_7t_30_ioa12hpx1 U6926 ( .B1(\strb_value[1][3] ), .B2(new_pixel), 
        .A(\matrix_output[1][3] ), .Z(n5912) );
  dti_28hc_7t_30_ioa12hpx1 U6927 ( .B1(\strb_value[4][5] ), .B2(new_pixel), 
        .A(\matrix_output[4][5] ), .Z(n5913) );
  dti_28hc_7t_30_ioa12hpx1 U6930 ( .B1(\strb_value[1][1] ), .B2(new_pixel), 
        .A(\matrix_output[1][1] ), .Z(n5915) );
  dti_28hc_7t_30_invx1 U6932 ( .A(\strb_value[2][1] ), .Z(n7330) );
  dti_28hc_7t_30_ioa12hpx1 U6933 ( .B1(\strb_value[2][1] ), .B2(new_pixel), 
        .A(\matrix_output[2][1] ), .Z(n5918) );
  dti_28hc_7t_30_ioa12hpx1 U6935 ( .B1(\strb_value[5][1] ), .B2(new_pixel), 
        .A(\matrix_output[5][1] ), .Z(n5919) );
  dti_28hc_7t_30_ioa12hpx1 U6936 ( .B1(\strb_value[5][5] ), .B2(new_pixel), 
        .A(\matrix_output[5][5] ), .Z(n5920) );
  dti_28hc_7t_30_invx1 U6937 ( .A(\strb_value[2][2] ), .Z(n7335) );
  dti_28hc_7t_30_ioa12hpx1 U6938 ( .B1(\strb_value[2][2] ), .B2(new_pixel), 
        .A(\matrix_output[2][2] ), .Z(n5921) );
  dti_28hc_7t_30_ioa12hpx1 U6940 ( .B1(\strb_value[0][2] ), .B2(new_pixel), 
        .A(\matrix_output[0][2] ), .Z(n5922) );
  dti_28hc_7t_30_ioa12hpx1 U6942 ( .B1(\strb_value[0][3] ), .B2(new_pixel), 
        .A(\matrix_output[0][3] ), .Z(n5923) );
  dti_28hc_7t_30_ioa12hpx1 U6944 ( .B1(\strb_value[2][0] ), .B2(new_pixel), 
        .A(\matrix_output[2][0] ), .Z(n5924) );
  dti_28hc_7t_30_ioa12hpx1 U6946 ( .B1(\strb_value[4][3] ), .B2(new_pixel), 
        .A(\matrix_output[4][3] ), .Z(n5925) );
  dti_28hc_7t_30_ioa12hpx1 U6949 ( .B1(\strb_value[2][4] ), .B2(new_pixel), 
        .A(\matrix_output[2][4] ), .Z(n5927) );
  dti_28hc_7t_30_ioa12hpx1 U6951 ( .B1(\strb_value[0][4] ), .B2(new_pixel), 
        .A(\matrix_output[0][4] ), .Z(n5928) );
  dti_28hc_7t_30_ioa12hpx1 U6953 ( .B1(\strb_value[0][5] ), .B2(new_pixel), 
        .A(\matrix_output[0][5] ), .Z(n5929) );
  dti_28hc_7t_30_ioa12hpx1 U6955 ( .B1(\strb_value[4][2] ), .B2(new_pixel), 
        .A(\matrix_output[4][2] ), .Z(n5930) );
  dti_28hc_7t_30_ioa12hpx1 U6956 ( .B1(\strb_value[0][0] ), .B2(new_pixel), 
        .A(\matrix_output[0][0] ), .Z(n5931) );
  dti_28hc_7t_30_ioa12hpx1 U6958 ( .B1(\strb_value[2][5] ), .B2(new_pixel), 
        .A(\matrix_output[2][5] ), .Z(n5932) );
  dti_28hc_7t_30_invx1 U6959 ( .A(\strb_value[3][0] ), .Z(n7355) );
  dti_28hc_7t_30_ioa12hpx1 U6960 ( .B1(\strb_value[3][0] ), .B2(new_pixel), 
        .A(\matrix_output[3][0] ), .Z(n5933) );
  dti_28hc_7t_30_ioa12hpx1 U6961 ( .B1(\strb_value[4][1] ), .B2(new_pixel), 
        .A(\matrix_output[4][1] ), .Z(n5934) );
  dti_28hc_7t_30_ioa12hpx1 U6963 ( .B1(\strb_value[2][3] ), .B2(new_pixel), 
        .A(\matrix_output[2][3] ), .Z(n5935) );
  dti_28hc_7t_30_ioa12hpx1 U6964 ( .B1(\strb_value[5][0] ), .B2(new_pixel), 
        .A(\matrix_output[5][0] ), .Z(n5936) );
  dti_28hc_7t_30_ioa12hpx1 U6966 ( .B1(\strb_value[5][2] ), .B2(new_pixel), 
        .A(\matrix_output[5][2] ), .Z(n5937) );
  dti_28hc_7t_30_ioa12hpx1 U6967 ( .B1(n3253), .B2(new_pixel), .A(
        \matrix_output[1][4] ), .Z(n5938) );
  dti_28hc_7t_30_ioa12hpx1 U6968 ( .B1(\strb_value[1][5] ), .B2(new_pixel), 
        .A(\matrix_output[1][5] ), .Z(n5939) );
  dti_28hc_7t_30_ioa12hpx1 U6970 ( .B1(\strb_value[3][1] ), .B2(new_pixel), 
        .A(\matrix_output[3][1] ), .Z(n5940) );
  dti_28hc_7t_30_ioa12hpx1 U6972 ( .B1(\strb_value[4][0] ), .B2(new_pixel), 
        .A(\matrix_output[4][0] ), .Z(n5941) );
  dti_28hc_7t_30_ioa12hpx1 U6974 ( .B1(\strb_value[4][4] ), .B2(new_pixel), 
        .A(\matrix_output[4][4] ), .Z(n5942) );
  dti_28hc_7t_30_invx1 U6975 ( .A(\strb_value[3][2] ), .Z(n6052) );
  dti_28hc_7t_30_ioa12hpx1 U6976 ( .B1(\strb_value[3][2] ), .B2(new_pixel), 
        .A(\matrix_output[3][2] ), .Z(n5943) );
  dti_28hc_7t_30_ioa12hpx1 U6978 ( .B1(\strb_value[5][4] ), .B2(new_pixel), 
        .A(\matrix_output[5][4] ), .Z(n5944) );
  dti_28hc_7t_30_ioa12hpx1 U6982 ( .B1(\strb_value[3][4] ), .B2(new_pixel), 
        .A(\matrix_output[3][4] ), .Z(n5946) );
  dti_28hc_7t_30_ioa12hpx1 U6984 ( .B1(\strb_value[3][5] ), .B2(new_pixel), 
        .A(\matrix_output[3][5] ), .Z(n5947) );
  dti_28hc_7t_30_ioa12hpx1 U6985 ( .B1(\strb_value[0][1] ), .B2(new_pixel), 
        .A(\matrix_output[0][1] ), .Z(n5948) );
  dti_28hc_7t_30_invx1 U6986 ( .A(\eda_fifos/sync_fifo_downright/rd_addr [0]), 
        .Z(n5949) );
  dti_28hc_7t_30_nor2x1 U6987 ( .A(n7789), .B(n5949), .Z(n6745) );
  dti_28hc_7t_30_nand2x1 U6988 ( .A(n5985), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [0]), .Z(n5987) );
  dti_28hc_7t_30_nor2x1 U6989 ( .A(n5987), .B(n5953), .Z(n5980) );
  dti_28hc_7t_30_nor2i1xp5 U6990 ( .A(n5951), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [3]), .Z(n5952) );
  dti_28hc_7t_30_nand2xp5 U6991 ( .A(n5985), .B(n5952), .Z(n5979) );
  dti_28hc_7t_30_ioa12xp5 U6992 ( .B1(n5987), .B2(n5953), .A(n5979), .Z(n5954)
         );
  dti_28hc_7t_30_nor2x1 U6993 ( .A(n5980), .B(n5954), .Z(n2547) );
  dti_28hc_7t_30_invx1 U6994 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [1]), 
        .Z(n5957) );
  dti_28hc_7t_30_or2x1 U6995 ( .A(n6915), .B(n6914), .Z(n6917) );
  dti_28hc_7t_30_invx1 U6996 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [3]), 
        .Z(n6006) );
  dti_28hc_7t_30_nand2xp5 U6997 ( .A(n5955), .B(n6006), .Z(n5956) );
  dti_28hc_7t_30_aoi12rex1 U6998 ( .B1(n5957), .B2(n6917), .A(n5991), .Z(n2633) );
  dti_28hc_7t_30_nand2xp5 U6999 ( .A(n5958), .B(n3506), .Z(n7283) );
  dti_28hc_7t_30_nand2xp5 U7000 ( .A(n7286), .B(n7283), .Z(n7290) );
  dti_28hc_7t_30_invx1 U7001 ( .A(\eda_fifos/sync_fifo_up/rd_addr [0]), .Z(
        n5959) );
  dti_28hc_7t_30_or2x1 U7002 ( .A(n7290), .B(n5959), .Z(n5964) );
  dti_28hc_7t_30_invx1 U7003 ( .A(n5960), .Z(n5961) );
  dti_28hc_7t_30_nand2x1 U7004 ( .A(n7286), .B(n5961), .Z(n7287) );
  dti_28hc_7t_30_invx1 U7005 ( .A(n7287), .Z(n5962) );
  dti_28hc_7t_30_aoi12rex1 U7006 ( .B1(n5964), .B2(n5963), .A(n5962), .Z(n2677) );
  dti_28hc_7t_30_invx1 U7007 ( .A(start), .Z(n7450) );
  dti_28hc_7t_30_nand2x1 U7008 ( .A(n5980), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [2]), .Z(n5982) );
  dti_28hc_7t_30_xnor2bxp5 U7009 ( .A(
        \eda_fifos/sync_fifo_downleft/rd_addr [3]), .B(n5982), .Z(n2544) );
  dti_28hc_7t_30_invx1 U7010 ( .A(\eda_fifos/sync_fifo_up/rd_addr [2]), .Z(
        n7284) );
  dti_28hc_7t_30_nor2x1 U7011 ( .A(n7287), .B(n7284), .Z(n5965) );
  dti_28hc_7t_30_xor2bxp5 U7012 ( .A(n5965), .B(
        \eda_fifos/sync_fifo_up/rd_addr [3]), .Z(n2674) );
  dti_28hc_7t_30_nand2x1 U7013 ( .A(n3697), .B(
        \eda_fifos/sync_fifo_right/rd_addr [0]), .Z(n6767) );
  dti_28hc_7t_30_nand2xp5 U7014 ( .A(\eda_fifos/sync_fifo_right/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_right/rd_addr [2]), .Z(n5966) );
  dti_28hc_7t_30_xor2bxp5 U7016 ( .A(n5967), .B(
        \eda_fifos/sync_fifo_right/rd_addr [3]), .Z(n2806) );
  dti_28hc_7t_30_nand2x1 U7017 ( .A(n6806), .B(
        \eda_fifos/sync_fifo_left/rd_addr [0]), .Z(n5993) );
  dti_28hc_7t_30_invx1 U7018 ( .A(\eda_fifos/sync_fifo_left/rd_addr [3]), .Z(
        n5968) );
  dti_28hc_7t_30_and2xp5 U7019 ( .A(n5969), .B(n5968), .Z(n6805) );
  dti_28hc_7t_30_or2x1 U7020 ( .A(n5993), .B(n6805), .Z(n6807) );
  dti_28hc_7t_30_invx1 U7021 ( .A(\eda_fifos/sync_fifo_left/rd_addr [1]), .Z(
        n5970) );
  dti_28hc_7t_30_nor2x1 U7022 ( .A(n5993), .B(n5970), .Z(n6810) );
  dti_28hc_7t_30_aoi12rex1 U7023 ( .B1(n6807), .B2(n5970), .A(n6810), .Z(n2765) );
  dti_28hc_7t_30_nor3x1 U7024 ( .A(n6791), .B(n6007), .C(n5971), .Z(n5972) );
  dti_28hc_7t_30_xor2bxp5 U7025 ( .A(n5972), .B(
        \eda_fifos/sync_fifo_upright/rd_addr [3]), .Z(n2718) );
  dti_28hc_7t_30_nor3x1 U7026 ( .A(n5973), .B(n7322), .C(n3264), .Z(n5974) );
  dti_28hc_7t_30_nand4i1x1 U7027 ( .A(n7405), .B(n7376), .C(n5974), .D(n6215), 
        .Z(n5976) );
  dti_28hc_7t_30_invx1 U7028 ( .A(n5977), .Z(n5978) );
  dti_28hc_7t_30_nor2x1 U7029 ( .A(n6024), .B(n5978), .Z(
        \eda_controller/next_state[2] ) );
  dti_28hc_7t_30_oai12xp5 U7030 ( .B1(n5980), .B2(
        \eda_fifos/sync_fifo_downleft/rd_addr [2]), .A(n5979), .Z(n5981) );
  dti_28hc_7t_30_nor2i1x1 U7031 ( .A(n5982), .B(n5981), .Z(n2545) );
  dti_28hc_7t_30_invx1 U7032 ( .A(\eda_fifos/sync_fifo_down/rd_addr [0]), .Z(
        n5983) );
  dti_28hc_7t_30_nor2x1 U7033 ( .A(n6244), .B(n5983), .Z(n7276) );
  dti_28hc_7t_30_nand3xp5 U7034 ( .A(n7276), .B(
        \eda_fifos/sync_fifo_down/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_down/rd_addr [2]), .Z(n5984) );
  dti_28hc_7t_30_xnor2bxp5 U7035 ( .A(\eda_fifos/sync_fifo_down/rd_addr [3]), 
        .B(n5984), .Z(n2587) );
  dti_28hc_7t_30_nor2x1 U7036 ( .A(n5985), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [0]), .Z(n5986) );
  dti_28hc_7t_30_nor2i1x1 U7037 ( .A(n5987), .B(n5986), .Z(n2546) );
  dti_28hc_7t_30_invx1 U7038 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [2]), 
        .Z(n5990) );
  dti_28hc_7t_30_invx1 U7039 ( .A(n5988), .Z(n5989) );
  dti_28hc_7t_30_nor2x1 U7040 ( .A(n6806), .B(
        \eda_fifos/sync_fifo_left/rd_addr [0]), .Z(n5992) );
  dti_28hc_7t_30_nor2i1x1 U7041 ( .A(n5993), .B(n5992), .Z(n2764) );
  dti_28hc_7t_30_nor2x1 U7043 ( .A(n6767), .B(n5994), .Z(n6003) );
  dti_28hc_7t_30_invx1 U7044 ( .A(\eda_fifos/sync_fifo_right/rd_addr [3]), .Z(
        n5995) );
  dti_28hc_7t_30_and2xp5 U7045 ( .A(n5996), .B(n5995), .Z(n5998) );
  dti_28hc_7t_30_ioa12xp5 U7046 ( .B1(n3697), .B2(n5998), .A(
        \eda_fifos/sync_fifo_right/rd_addr [2]), .Z(n6002) );
  dti_28hc_7t_30_invx1 U7047 ( .A(n5997), .Z(n6001) );
  dti_28hc_7t_30_invx1 U7048 ( .A(n5998), .Z(n5999) );
  dti_28hc_7t_30_nand2xp5 U7050 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [1]), 
        .B(\eda_fifos/sync_fifo_upleft/rd_addr [2]), .Z(n6004) );
  dti_28hc_7t_30_nor2x1 U7051 ( .A(n6917), .B(n6004), .Z(n6005) );
  dti_28hc_7t_30_xnor2bx1 U7052 ( .A(n6006), .B(n6005), .Z(n2630) );
  dti_28hc_7t_30_nor2x1 U7053 ( .A(n6791), .B(n6007), .Z(n6013) );
  dti_28hc_7t_30_invx1 U7054 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [3]), 
        .Z(n6008) );
  dti_28hc_7t_30_and2xp5 U7055 ( .A(n6009), .B(n6008), .Z(n6010) );
  dti_28hc_7t_30_invx1 U7056 ( .A(n6010), .Z(n6011) );
  dti_28hc_7t_30_nand2xp5 U7057 ( .A(n6810), .B(
        \eda_fifos/sync_fifo_left/rd_addr [2]), .Z(n6014) );
  dti_28hc_7t_30_invx1 U7059 ( .A(n7448), .Z(n6015) );
  dti_28hc_7t_30_iao22x1 U7060 ( .A1(n6016), .A2(iterated_all), .B1(start), 
        .B2(n6015), .Z(n6017) );
  dti_28hc_7t_30_ioa12hpx1 U7061 ( .B1(n6024), .B2(n6018), .A(n6017), .Z(n3185) );
  dti_28hc_7t_30_invx1 U7062 ( .A(n6019), .Z(n6023) );
  dti_28hc_7t_30_ioa12hpx1 U7063 ( .B1(n6021), .B2(iterated_all), .A(n6020), 
        .Z(n6022) );
  dti_28hc_7t_30_invx1 U7064 ( .A(n6025), .Z(n6026) );
  dti_28hc_7t_30_nand2x1 U7065 ( .A(n6027), .B(n6026), .Z(n6028) );
  dti_28hc_7t_30_nand2x1 U7066 ( .A(n6029), .B(n6028), .Z(n3182) );
  dti_28hc_7t_30_nand4i1x1 U7067 ( .A(n6033), .B(n6032), .C(n6031), .D(n6030), 
        .Z(n6034) );
  dti_28hc_7t_30_aoi112rex1 U7068 ( .C1(n6036), .C2(n3774), .A(n6035), .B(
        n6034), .Z(n6040) );
  dti_28hc_7t_30_ioa12hpx1 U7069 ( .B1(n6042), .B2(new_pixel), .A(n6041), .Z(
        n6043) );
  dti_28hc_7t_30_and2x1 U7070 ( .A(n6938), .B(n3666), .Z(n6047) );
  dti_28hc_7t_30_nor2x1 U7071 ( .A(n6045), .B(
        \eda_fifos/sync_fifo_upleft/wr_addr [1]), .Z(n6046) );
  dti_28hc_7t_30_nand2px4 U7072 ( .A(n6949), .B(n6046), .Z(n7203) );
  dti_28hc_7t_30_nor2x1 U7073 ( .A(n3378), .B(n7399), .Z(n6049) );
  dti_28hc_7t_30_nand2x1 U7074 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [1]), .B(\eda_fifos/sync_fifo_downright/wr_addr [0]), .Z(n6891) );
  dti_28hc_7t_30_invx1 U7076 ( .A(n7790), .Z(n6893) );
  dti_28hc_7t_30_nand2i1x1 U7077 ( .A(
        \eda_fifos/sync_fifo_downright/wr_addr [1]), .B(n6128), .Z(n6740) );
  dti_28hc_7t_30_ioa12hpx1 U7078 ( .B1(n6893), .B2(n6057), .A(n6056), .Z(n6058) );
  dti_28hc_7t_30_invx1 U7080 ( .A(n7128), .Z(n6717) );
  dti_28hc_7t_30_nor2x1 U7081 ( .A(n6060), .B(n6059), .Z(n6062) );
  dti_28hc_7t_30_nand2x1 U7082 ( .A(n6062), .B(n6061), .Z(n6724) );
  dti_28hc_7t_30_nand2x1 U7089 ( .A(n6086), .B(n7182), .Z(n7081) );
  dti_28hc_7t_30_invx1 U7091 ( .A(\eda_fifos/sync_fifo_up/o_full ), .Z(n6918)
         );
  dti_28hc_7t_30_and2x1 U7092 ( .A(\eda_fifos/sync_fifo_up/wr_addr [0]), .B(
        n6918), .Z(n6961) );
  dti_28hc_7t_30_or2x1 U7093 ( .A(\eda_fifos/sync_fifo_up/wr_addr [2]), .B(
        n6239), .Z(n6953) );
  dti_28hc_7t_30_invx1 U7094 ( .A(n6953), .Z(n6089) );
  dti_28hc_7t_30_nand2x1 U7095 ( .A(n6961), .B(n6089), .Z(n6090) );
  dti_28hc_7t_30_nand2x1 U7096 ( .A(\eda_fifos/sync_fifo_up/wr_addr [2]), .B(
        n6239), .Z(n6965) );
  dti_28hc_7t_30_invx1 U7097 ( .A(n6965), .Z(n6091) );
  dti_28hc_7t_30_invx1 U7106 ( .A(n6616), .Z(n6612) );
  dti_28hc_7t_30_or2x1 U7107 ( .A(n6114), .B(n3264), .Z(n6117) );
  dti_28hc_7t_30_nor2i1x1 U7111 ( .A(n6235), .B(
        \eda_fifos/sync_fifo_down/wr_addr [2]), .Z(n6906) );
  dti_28hc_7t_30_invx1 U7112 ( .A(\eda_fifos/sync_fifo_downleft/wr_addr [0]), 
        .Z(n6169) );
  dti_28hc_7t_30_nand2x1 U7113 ( .A(n6138), .B(n6137), .Z(n6139) );
  dti_28hc_7t_30_invx1 U7115 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(n6146)
         );
  dti_28hc_7t_30_or2x1 U7116 ( .A(\eda_fifos/sync_fifo_up/wr_addr [2]), .B(
        n7570), .Z(n6956) );
  dti_28hc_7t_30_nor2i1x1 U7117 ( .A(n6961), .B(n6956), .Z(n6145) );
  dti_28hc_7t_30_invx1 U7118 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(n6148)
         );
  dti_28hc_7t_30_invx1 U7119 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(n6149)
         );
  dti_28hc_7t_30_invx1 U7121 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(n6151)
         );
  dti_28hc_7t_30_nor2x1 U7122 ( .A(\eda_iterated_ram/current_row[0][3] ), .B(
        n7399), .Z(n6152) );
  dti_28hc_7t_30_invx1 U7123 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][0] ), .Z(n6157)
         );
  dti_28hc_7t_30_invx1 U7124 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][5] ), .Z(n6158)
         );
  dti_28hc_7t_30_invx1 U7125 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][1] ), .Z(n6159)
         );
  dti_28hc_7t_30_invx1 U7126 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][3] ), .Z(n6160)
         );
  dti_28hc_7t_30_nand2x1 U7127 ( .A(\eda_fifos/sync_fifo_downleft/wr_addr [0]), 
        .B(n6880), .Z(n6876) );
  dti_28hc_7t_30_nand2i1xp5 U7128 ( .A(
        \eda_fifos/sync_fifo_downleft/wr_addr [3]), .B(n3544), .Z(n6161) );
  dti_28hc_7t_30_invx1 U7130 ( .A(n6718), .Z(n6163) );
  dti_28hc_7t_30_invx1 U7131 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n6166) );
  dti_28hc_7t_30_invx1 U7132 ( .A(n6876), .Z(n6164) );
  dti_28hc_7t_30_nand2x1 U7133 ( .A(n3544), .B(n6164), .Z(n6165) );
  dti_28hc_7t_30_invx1 U7134 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n6167) );
  dti_28hc_7t_30_invx1 U7135 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n6172) );
  dti_28hc_7t_30_invx1 U7136 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n6173) );
  dti_28hc_7t_30_nand2i1x1 U7138 ( .A(\eda_fifos/sync_fifo_right/wr_addr [1]), 
        .B(\eda_fifos/sync_fifo_right/wr_addr [2]), .Z(n6854) );
  dti_28hc_7t_30_oai112rex1 U7141 ( .C1(\eda_fifos/sync_fifo_right/wr_addr [2]), .C2(n6786), .A(n6788), .B(n6212), .Z(n6189) );
  dti_28hc_7t_30_invx1 U7142 ( .A(n6189), .Z(n2804) );
  dti_28hc_7t_30_invx1 U7143 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n6207) );
  dti_28hc_7t_30_nand2x1 U7145 ( .A(n6200), .B(n6199), .Z(n6202) );
  dti_28hc_7t_30_invx1 U7146 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n6208) );
  dti_28hc_7t_30_invx1 U7147 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n6209) );
  dti_28hc_7t_30_invx1 U7148 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n6210) );
  dti_28hc_7t_30_invx1 U7149 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n6211) );
  dti_28hc_7t_30_invx1 U7150 ( .A(n6213), .Z(n6214) );
  dti_28hc_7t_30_or2x1 U7151 ( .A(n6215), .B(n6214), .Z(n7366) );
  dti_28hc_7t_30_or2x1 U7152 ( .A(n7295), .B(
        \eda_iterated_ram/current_row[0][4] ), .Z(n6216) );
  dti_28hc_7t_30_nand4xp5 U7153 ( .A(n7366), .B(n6217), .C(n7341), .D(n6216), 
        .Z(n6223) );
  dti_28hc_7t_30_invx1 U7154 ( .A(n6218), .Z(n6219) );
  dti_28hc_7t_30_or2x1 U7155 ( .A(n7376), .B(n6219), .Z(n7401) );
  dti_28hc_7t_30_invx1 U7156 ( .A(n6220), .Z(n7424) );
  dti_28hc_7t_30_or4x1 U7157 ( .A(n7390), .B(
        \eda_iterated_ram/current_row[5][4] ), .C(n7424), .D(n6221), .Z(n6222)
         );
  dti_28hc_7t_30_nand3i1x1 U7158 ( .A(n6223), .B(n7401), .C(n6222), .Z(n6226)
         );
  dti_28hc_7t_30_nor2x1 U7162 ( .A(n7430), .B(n6230), .Z(n6233) );
  dti_28hc_7t_30_invx1 U7163 ( .A(n3723), .Z(n6235) );
  dti_28hc_7t_30_mux21optax1 U7164 ( .D0(n3775), .D1(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][0] ), .S(n6238), 
        .Z(n2646) );
  dti_28hc_7t_30_nand2i1x1 U7167 ( .A(n6242), .B(n6241), .Z(n2678) );
  dti_28hc_7t_30_invx1 U7168 ( .A(n6243), .Z(n6247) );
  dti_28hc_7t_30_invx1 U7169 ( .A(\eda_fifos/sync_fifo_down/rd_addr [3]), .Z(
        n6245) );
  dti_28hc_7t_30_ioa22xp5 U7171 ( .A1(n7276), .A2(n7277), .B1(n6247), .B2(
        n7279), .Z(n2590) );
  dti_28hc_7t_30_invx1 U7172 ( .A(clk), .Z(n7449) );
  dti_28hc_7t_30_invxp5 U7173 ( .A(\eda_img_ram/img_memory[4][2][0] ), .Z(
        n6249) );
  dti_28hc_7t_30_nand2x1 U7174 ( .A(n6248), .B(n6290), .Z(n6259) );
  dti_28hc_7t_30_muxi21xp5 U7175 ( .D0(n6593), .D1(n6249), .S(n6521), .Z(n2972) );
  dti_28hc_7t_30_and2xp5 U7176 ( .A(done), .B(n7182), .Z(
        \eda_iterated_ram/N743 ) );
  dti_28hc_7t_30_invxp5 U7177 ( .A(\eda_img_ram/img_memory[4][2][6] ), .Z(
        n6250) );
  dti_28hc_7t_30_muxi21xp5 U7178 ( .D0(n6304), .D1(n6250), .S(n6521), .Z(n2966) );
  dti_28hc_7t_30_invxp5 U7179 ( .A(\eda_img_ram/img_memory[4][3][6] ), .Z(
        n6251) );
  dti_28hc_7t_30_invx1 U7180 ( .A(wr_addr[0]), .Z(n6252) );
  dti_28hc_7t_30_muxi21xp5 U7181 ( .D0(n6251), .D1(n6304), .S(n6539), .Z(n2958) );
  dti_28hc_7t_30_invx1 U7182 ( .A(\eda_img_ram/img_memory[4][4][6] ), .Z(n6253) );
  dti_28hc_7t_30_muxi21xp5 U7183 ( .D0(n6304), .D1(n6253), .S(n6543), .Z(n2950) );
  dti_28hc_7t_30_invx1 U7184 ( .A(\eda_img_ram/img_memory[4][1][6] ), .Z(n6255) );
  dti_28hc_7t_30_nand2x1 U7185 ( .A(n6258), .B(n6254), .Z(n6303) );
  dti_28hc_7t_30_muxi21xp5 U7186 ( .D0(n6304), .D1(n6255), .S(n6547), .Z(n2974) );
  dti_28hc_7t_30_nand2x1 U7190 ( .A(n6258), .B(n6257), .Z(n6300) );
  dti_28hc_7t_30_muxi21xp5 U7191 ( .D0(n6304), .D1(n6260), .S(n6545), .Z(n2982) );
  dti_28hc_7t_30_invxp5 U7192 ( .A(\eda_img_ram/img_memory[5][2][6] ), .Z(
        n6261) );
  dti_28hc_7t_30_muxi21xp5 U7193 ( .D0(n6304), .D1(n6261), .S(n6535), .Z(n2918) );
  dti_28hc_7t_30_invxp5 U7196 ( .A(\eda_img_ram/img_memory[5][0][6] ), .Z(
        n6263) );
  dti_28hc_7t_30_muxi21xp5 U7197 ( .D0(n6304), .D1(n6263), .S(n6537), .Z(n2934) );
  dti_28hc_7t_30_invxp5 U7198 ( .A(\eda_img_ram/img_memory[5][1][6] ), .Z(
        n6264) );
  dti_28hc_7t_30_muxi21xp5 U7199 ( .D0(n6304), .D1(n6264), .S(n6529), .Z(n2926) );
  dti_28hc_7t_30_muxi21xp5 U7201 ( .D0(n6304), .D1(n6265), .S(n6500), .Z(n2894) );
  dti_28hc_7t_30_invxp5 U7202 ( .A(\eda_img_ram/img_memory[5][3][6] ), .Z(
        n6267) );
  dti_28hc_7t_30_muxi21xp5 U7203 ( .D0(n6304), .D1(n6267), .S(n6531), .Z(n2910) );
  dti_28hc_7t_30_invx1 U7204 ( .A(\eda_img_ram/img_memory[3][2][6] ), .Z(n6268) );
  dti_28hc_7t_30_or2x1 U7205 ( .A(n6292), .B(n6273), .Z(n6571) );
  dti_28hc_7t_30_muxi21xp5 U7206 ( .D0(n6304), .D1(n6268), .S(n6571), .Z(n3014) );
  dti_28hc_7t_30_invxp5 U7211 ( .A(\eda_img_ram/img_memory[3][0][6] ), .Z(
        n6271) );
  dti_28hc_7t_30_muxi21xp5 U7212 ( .D0(n6304), .D1(n6271), .S(n6579), .Z(n3030) );
  dti_28hc_7t_30_muxi21xp5 U7214 ( .D0(n6272), .D1(n6304), .S(n6577), .Z(n2998) );
  dti_28hc_7t_30_invx1 U7215 ( .A(\eda_img_ram/img_memory[3][1][6] ), .Z(n6274) );
  dti_28hc_7t_30_muxi21xp5 U7216 ( .D0(n6304), .D1(n6274), .S(n6581), .Z(n3022) );
  dti_28hc_7t_30_muxi21xp5 U7220 ( .D0(n6276), .D1(n6304), .S(n6566), .Z(n3094) );
  dti_28hc_7t_30_muxi21xp5 U7222 ( .D0(n6277), .D1(n6304), .S(n6562), .Z(n3102) );
  dti_28hc_7t_30_invxp5 U7229 ( .A(\eda_img_ram/img_memory[2][2][6] ), .Z(
        n6283) );
  dti_28hc_7t_30_muxi21xp5 U7230 ( .D0(n6304), .D1(n6283), .S(n6556), .Z(n3062) );
  dti_28hc_7t_30_invx1 U7237 ( .A(\eda_img_ram/img_memory[2][1][6] ), .Z(n6287) );
  dti_28hc_7t_30_muxi21xp5 U7238 ( .D0(n6304), .D1(n6287), .S(n6549), .Z(n3070) );
  dti_28hc_7t_30_invx1 U7239 ( .A(\eda_img_ram/img_memory[2][0][6] ), .Z(n6289) );
  dti_28hc_7t_30_muxi21xp5 U7240 ( .D0(n6304), .D1(n6289), .S(n6558), .Z(n3078) );
  dti_28hc_7t_30_invxp5 U7241 ( .A(\eda_img_ram/img_memory[0][2][6] ), .Z(
        n6293) );
  dti_28hc_7t_30_muxi21xp5 U7242 ( .D0(n6293), .D1(n6304), .S(n6590), .Z(n3158) );
  dti_28hc_7t_30_invxp5 U7249 ( .A(\eda_img_ram/img_memory[0][0][6] ), .Z(
        n6301) );
  dti_28hc_7t_30_muxi21xp5 U7250 ( .D0(n6301), .D1(n6304), .S(n6592), .Z(n3174) );
  dti_28hc_7t_30_invx1 U7253 ( .A(\eda_img_ram/img_memory[5][2][3] ), .Z(n6306) );
  dti_28hc_7t_30_muxi21xp5 U7254 ( .D0(n6340), .D1(n6306), .S(n6535), .Z(n2921) );
  dti_28hc_7t_30_muxi21xp5 U7260 ( .D0(n6340), .D1(n6309), .S(n6531), .Z(n2913) );
  dti_28hc_7t_30_invx1 U7261 ( .A(\eda_img_ram/img_memory[5][0][3] ), .Z(n6310) );
  dti_28hc_7t_30_muxi21xp5 U7262 ( .D0(n6340), .D1(n6310), .S(n6537), .Z(n2937) );
  dti_28hc_7t_30_invxp5 U7263 ( .A(\eda_img_ram/img_memory[5][5][3] ), .Z(
        n6311) );
  dti_28hc_7t_30_muxi21xp5 U7264 ( .D0(n6340), .D1(n6311), .S(n6500), .Z(n2897) );
  dti_28hc_7t_30_muxi21xp5 U7274 ( .D0(n6316), .D1(n6340), .S(n6570), .Z(n3129) );
  dti_28hc_7t_30_invxp5 U7275 ( .A(\eda_img_ram/img_memory[1][5][3] ), .Z(
        n6317) );
  dti_28hc_7t_30_muxi21xp5 U7276 ( .D0(n6317), .D1(n6340), .S(n6564), .Z(n3089) );
  dti_28hc_7t_30_invxp5 U7288 ( .A(\eda_img_ram/img_memory[4][2][3] ), .Z(
        n6323) );
  dti_28hc_7t_30_muxi21xp5 U7289 ( .D0(n6340), .D1(n6323), .S(n6521), .Z(n2969) );
  dti_28hc_7t_30_invx1 U7290 ( .A(\eda_img_ram/img_memory[4][1][3] ), .Z(n6324) );
  dti_28hc_7t_30_muxi21xp5 U7291 ( .D0(n6340), .D1(n6324), .S(n6547), .Z(n2977) );
  dti_28hc_7t_30_invx1 U7292 ( .A(\eda_img_ram/img_memory[4][4][3] ), .Z(n6325) );
  dti_28hc_7t_30_muxi21xp5 U7293 ( .D0(n6340), .D1(n6325), .S(n6543), .Z(n2953) );
  dti_28hc_7t_30_invxp5 U7294 ( .A(\eda_img_ram/img_memory[4][3][3] ), .Z(
        n6326) );
  dti_28hc_7t_30_muxi21xp5 U7295 ( .D0(n6326), .D1(n6340), .S(n6539), .Z(n2961) );
  dti_28hc_7t_30_invx1 U7296 ( .A(\eda_img_ram/img_memory[4][0][3] ), .Z(n6327) );
  dti_28hc_7t_30_muxi21xp5 U7297 ( .D0(n6340), .D1(n6327), .S(n6545), .Z(n2985) );
  dti_28hc_7t_30_invx1 U7298 ( .A(\eda_img_ram/img_memory[4][5][3] ), .Z(n6328) );
  dti_28hc_7t_30_muxi21xp5 U7299 ( .D0(n6340), .D1(n6328), .S(n6541), .Z(n2945) );
  dti_28hc_7t_30_invxp5 U7300 ( .A(\eda_img_ram/img_memory[3][2][3] ), .Z(
        n6329) );
  dti_28hc_7t_30_muxi21xp5 U7301 ( .D0(n6340), .D1(n6329), .S(n6571), .Z(n3017) );
  dti_28hc_7t_30_muxi21xp5 U7303 ( .D0(n6340), .D1(n6330), .S(n6581), .Z(n3025) );
  dti_28hc_7t_30_invxp5 U7306 ( .A(\eda_img_ram/img_memory[3][3][3] ), .Z(
        n6332) );
  dti_28hc_7t_30_muxi21xp5 U7307 ( .D0(n6332), .D1(n6340), .S(n6573), .Z(n3009) );
  dti_28hc_7t_30_invx1 U7308 ( .A(\eda_img_ram/img_memory[3][0][3] ), .Z(n6333) );
  dti_28hc_7t_30_muxi21xp5 U7309 ( .D0(n6340), .D1(n6333), .S(n6579), .Z(n3033) );
  dti_28hc_7t_30_invxp5 U7310 ( .A(\eda_img_ram/img_memory[3][5][3] ), .Z(
        n6334) );
  dti_28hc_7t_30_muxi21xp5 U7311 ( .D0(n6334), .D1(n6340), .S(n6575), .Z(n2993) );
  dti_28hc_7t_30_invxp5 U7312 ( .A(\eda_img_ram/img_memory[2][2][3] ), .Z(
        n6335) );
  dti_28hc_7t_30_muxi21xp5 U7313 ( .D0(n6340), .D1(n6335), .S(n6556), .Z(n3065) );
  dti_28hc_7t_30_invx1 U7314 ( .A(\eda_img_ram/img_memory[2][4][3] ), .Z(n6336) );
  dti_28hc_7t_30_muxi21xp5 U7315 ( .D0(n6336), .D1(n6340), .S(n6555), .Z(n3049) );
  dti_28hc_7t_30_invx1 U7316 ( .A(\eda_img_ram/img_memory[2][1][3] ), .Z(n6337) );
  dti_28hc_7t_30_muxi21xp5 U7317 ( .D0(n6340), .D1(n6337), .S(n6549), .Z(n3073) );
  dti_28hc_7t_30_invxp5 U7318 ( .A(\eda_img_ram/img_memory[2][0][3] ), .Z(
        n6338) );
  dti_28hc_7t_30_muxi21xp5 U7319 ( .D0(n6340), .D1(n6338), .S(n6558), .Z(n3081) );
  dti_28hc_7t_30_invxp5 U7320 ( .A(\eda_img_ram/img_memory[2][5][3] ), .Z(
        n6339) );
  dti_28hc_7t_30_muxi21xp5 U7321 ( .D0(n6339), .D1(n6340), .S(n6553), .Z(n3041) );
  dti_28hc_7t_30_invxp5 U7322 ( .A(\eda_img_ram/img_memory[2][3][3] ), .Z(
        n6341) );
  dti_28hc_7t_30_muxi21xp5 U7323 ( .D0(n6341), .D1(n6340), .S(n6551), .Z(n3057) );
  dti_28hc_7t_30_invxp5 U7336 ( .A(\eda_img_ram/img_memory[0][2][2] ), .Z(
        n6348) );
  dti_28hc_7t_30_muxi21xp5 U7337 ( .D0(n6348), .D1(n6378), .S(n6590), .Z(n3162) );
  dti_28hc_7t_30_invx1 U7344 ( .A(\eda_img_ram/img_memory[0][5][2] ), .Z(n6352) );
  dti_28hc_7t_30_muxi21xp5 U7345 ( .D0(n6352), .D1(n6378), .S(n6587), .Z(n3138) );
  dti_28hc_7t_30_invx1 U7348 ( .A(\eda_img_ram/img_memory[5][2][2] ), .Z(n6354) );
  dti_28hc_7t_30_muxi21xp5 U7349 ( .D0(n6378), .D1(n6354), .S(n6535), .Z(n2922) );
  dti_28hc_7t_30_invx1 U7354 ( .A(\eda_img_ram/img_memory[5][1][2] ), .Z(n6357) );
  dti_28hc_7t_30_muxi21xp5 U7355 ( .D0(n6378), .D1(n6357), .S(n6529), .Z(n2930) );
  dti_28hc_7t_30_invx1 U7358 ( .A(\eda_img_ram/img_memory[5][0][2] ), .Z(n6359) );
  dti_28hc_7t_30_muxi21xp5 U7359 ( .D0(n6378), .D1(n6359), .S(n6537), .Z(n2938) );
  dti_28hc_7t_30_invxp5 U7360 ( .A(\eda_img_ram/img_memory[4][2][2] ), .Z(
        n6360) );
  dti_28hc_7t_30_muxi21xp5 U7361 ( .D0(n6378), .D1(n6360), .S(n6521), .Z(n2970) );
  dti_28hc_7t_30_invx1 U7366 ( .A(\eda_img_ram/img_memory[4][1][2] ), .Z(n6363) );
  dti_28hc_7t_30_muxi21xp5 U7367 ( .D0(n6378), .D1(n6363), .S(n6547), .Z(n2978) );
  dti_28hc_7t_30_invxp5 U7370 ( .A(\eda_img_ram/img_memory[4][0][2] ), .Z(
        n6365) );
  dti_28hc_7t_30_muxi21xp5 U7371 ( .D0(n6378), .D1(n6365), .S(n6545), .Z(n2986) );
  dti_28hc_7t_30_invxp5 U7372 ( .A(\eda_img_ram/img_memory[3][2][2] ), .Z(
        n6366) );
  dti_28hc_7t_30_muxi21xp5 U7373 ( .D0(n6378), .D1(n6366), .S(n6571), .Z(n3018) );
  dti_28hc_7t_30_invx1 U7378 ( .A(\eda_img_ram/img_memory[3][1][2] ), .Z(n6369) );
  dti_28hc_7t_30_muxi21xp5 U7379 ( .D0(n6378), .D1(n6369), .S(n6581), .Z(n3026) );
  dti_28hc_7t_30_invxp5 U7382 ( .A(\eda_img_ram/img_memory[3][0][2] ), .Z(
        n6371) );
  dti_28hc_7t_30_muxi21xp5 U7383 ( .D0(n6378), .D1(n6371), .S(n6579), .Z(n3034) );
  dti_28hc_7t_30_invxp5 U7384 ( .A(\eda_img_ram/img_memory[2][2][2] ), .Z(
        n6372) );
  dti_28hc_7t_30_muxi21xp5 U7385 ( .D0(n6378), .D1(n6372), .S(n6556), .Z(n3066) );
  dti_28hc_7t_30_invxp5 U7386 ( .A(\eda_img_ram/img_memory[2][3][2] ), .Z(
        n6373) );
  dti_28hc_7t_30_muxi21xp5 U7387 ( .D0(n6373), .D1(n6378), .S(n6551), .Z(n3058) );
  dti_28hc_7t_30_muxi21xp5 U7389 ( .D0(n6374), .D1(n6378), .S(n6555), .Z(n3050) );
  dti_28hc_7t_30_invxp5 U7390 ( .A(\eda_img_ram/img_memory[2][1][2] ), .Z(
        n6375) );
  dti_28hc_7t_30_muxi21xp5 U7391 ( .D0(n6378), .D1(n6375), .S(n6549), .Z(n3074) );
  dti_28hc_7t_30_invxp5 U7394 ( .A(\eda_img_ram/img_memory[2][0][2] ), .Z(
        n6377) );
  dti_28hc_7t_30_muxi21xp5 U7395 ( .D0(n6378), .D1(n6377), .S(n6558), .Z(n3082) );
  dti_28hc_7t_30_invxp5 U7399 ( .A(\eda_img_ram/img_memory[0][4][7] ), .Z(
        n6381) );
  dti_28hc_7t_30_muxi21xp5 U7400 ( .D0(n6381), .D1(n6414), .S(n6589), .Z(n3141) );
  dti_28hc_7t_30_invxp5 U7402 ( .A(\eda_img_ram/img_memory[0][5][7] ), .Z(
        n6383) );
  dti_28hc_7t_30_muxi21xp5 U7403 ( .D0(n6383), .D1(n6414), .S(n6587), .Z(n3133) );
  dti_28hc_7t_30_invxp5 U7404 ( .A(\eda_img_ram/img_memory[0][0][7] ), .Z(
        n6384) );
  dti_28hc_7t_30_muxi21xp5 U7405 ( .D0(n6384), .D1(n6414), .S(n6592), .Z(n3173) );
  dti_28hc_7t_30_muxi21xp5 U7407 ( .D0(n6414), .D1(n6385), .S(n6529), .Z(n2925) );
  dti_28hc_7t_30_invxp5 U7408 ( .A(\eda_img_ram/img_memory[5][4][7] ), .Z(
        n6386) );
  dti_28hc_7t_30_muxi21xp5 U7409 ( .D0(n6414), .D1(n6386), .S(n6533), .Z(n2901) );
  dti_28hc_7t_30_invx1 U7410 ( .A(\eda_img_ram/img_memory[5][2][7] ), .Z(n6387) );
  dti_28hc_7t_30_muxi21xp5 U7411 ( .D0(n6414), .D1(n6387), .S(n6535), .Z(n2917) );
  dti_28hc_7t_30_invxp5 U7412 ( .A(\eda_img_ram/img_memory[5][3][7] ), .Z(
        n6388) );
  dti_28hc_7t_30_muxi21xp5 U7413 ( .D0(n6414), .D1(n6388), .S(n6531), .Z(n2909) );
  dti_28hc_7t_30_invxp5 U7414 ( .A(\eda_img_ram/img_memory[5][0][7] ), .Z(
        n6389) );
  dti_28hc_7t_30_muxi21xp5 U7415 ( .D0(n6414), .D1(n6389), .S(n6537), .Z(n2933) );
  dti_28hc_7t_30_invxp5 U7416 ( .A(\eda_img_ram/img_memory[5][5][7] ), .Z(
        n6390) );
  dti_28hc_7t_30_muxi21xp5 U7417 ( .D0(n6414), .D1(n6390), .S(n6500), .Z(n2893) );
  dti_28hc_7t_30_invx1 U7418 ( .A(\eda_img_ram/img_memory[4][2][7] ), .Z(n6391) );
  dti_28hc_7t_30_muxi21xp5 U7419 ( .D0(n6414), .D1(n6391), .S(n6521), .Z(n2965) );
  dti_28hc_7t_30_muxi21xp5 U7421 ( .D0(n6414), .D1(n6392), .S(n6547), .Z(n2973) );
  dti_28hc_7t_30_invxp5 U7424 ( .A(\eda_img_ram/img_memory[4][3][7] ), .Z(
        n6394) );
  dti_28hc_7t_30_muxi21xp5 U7425 ( .D0(n6394), .D1(n6414), .S(n6539), .Z(n2957) );
  dti_28hc_7t_30_muxi21xp5 U7429 ( .D0(n6414), .D1(n6396), .S(n6545), .Z(n2981) );
  dti_28hc_7t_30_invxp5 U7430 ( .A(\eda_img_ram/img_memory[1][1][7] ), .Z(
        n6397) );
  dti_28hc_7t_30_muxi21xp5 U7431 ( .D0(n6397), .D1(n6414), .S(n6560), .Z(n3117) );
  dti_28hc_7t_30_invx1 U7442 ( .A(\eda_img_ram/img_memory[2][1][7] ), .Z(n6403) );
  dti_28hc_7t_30_muxi21xp5 U7443 ( .D0(n6414), .D1(n6403), .S(n6549), .Z(n3069) );
  dti_28hc_7t_30_invx1 U7446 ( .A(\eda_img_ram/img_memory[2][2][7] ), .Z(n6405) );
  dti_28hc_7t_30_muxi21xp5 U7447 ( .D0(n6414), .D1(n6405), .S(n6556), .Z(n3061) );
  dti_28hc_7t_30_invxp5 U7448 ( .A(\eda_img_ram/img_memory[2][5][7] ), .Z(
        n6406) );
  dti_28hc_7t_30_muxi21xp5 U7449 ( .D0(n6406), .D1(n6414), .S(n6553), .Z(n3037) );
  dti_28hc_7t_30_invx1 U7450 ( .A(\eda_img_ram/img_memory[2][0][7] ), .Z(n6407) );
  dti_28hc_7t_30_muxi21xp5 U7451 ( .D0(n6414), .D1(n6407), .S(n6558), .Z(n3077) );
  dti_28hc_7t_30_invxp5 U7454 ( .A(\eda_img_ram/img_memory[3][1][7] ), .Z(
        n6409) );
  dti_28hc_7t_30_muxi21xp5 U7455 ( .D0(n6414), .D1(n6409), .S(n6581), .Z(n3021) );
  dti_28hc_7t_30_invxp5 U7456 ( .A(\eda_img_ram/img_memory[3][4][7] ), .Z(
        n6410) );
  dti_28hc_7t_30_muxi21xp5 U7457 ( .D0(n6410), .D1(n6414), .S(n6577), .Z(n2997) );
  dti_28hc_7t_30_invx1 U7458 ( .A(\eda_img_ram/img_memory[3][2][7] ), .Z(n6411) );
  dti_28hc_7t_30_muxi21xp5 U7459 ( .D0(n6414), .D1(n6411), .S(n6571), .Z(n3013) );
  dti_28hc_7t_30_invx1 U7462 ( .A(\eda_img_ram/img_memory[3][0][7] ), .Z(n6413) );
  dti_28hc_7t_30_muxi21xp5 U7463 ( .D0(n6414), .D1(n6413), .S(n6579), .Z(n3029) );
  dti_28hc_7t_30_invxp5 U7464 ( .A(\eda_img_ram/img_memory[3][3][7] ), .Z(
        n6415) );
  dti_28hc_7t_30_muxi21xp5 U7465 ( .D0(n6415), .D1(n6414), .S(n6573), .Z(n3005) );
  dti_28hc_7t_30_invxp5 U7466 ( .A(\eda_img_ram/img_memory[4][2][4] ), .Z(
        n6416) );
  dti_28hc_7t_30_muxi21xp5 U7467 ( .D0(n6451), .D1(n6416), .S(n6521), .Z(n2968) );
  dti_28hc_7t_30_muxi21xp5 U7469 ( .D0(n6417), .D1(n6451), .S(n6539), .Z(n2960) );
  dti_28hc_7t_30_invxp5 U7470 ( .A(\eda_img_ram/img_memory[4][4][4] ), .Z(
        n6418) );
  dti_28hc_7t_30_muxi21xp5 U7471 ( .D0(n6451), .D1(n6418), .S(n6543), .Z(n2952) );
  dti_28hc_7t_30_invx1 U7472 ( .A(\eda_img_ram/img_memory[4][5][4] ), .Z(n6419) );
  dti_28hc_7t_30_muxi21xp5 U7473 ( .D0(n6451), .D1(n6419), .S(n6541), .Z(n2944) );
  dti_28hc_7t_30_invxp5 U7474 ( .A(\eda_img_ram/img_memory[4][1][4] ), .Z(
        n6420) );
  dti_28hc_7t_30_muxi21xp5 U7475 ( .D0(n6451), .D1(n6420), .S(n6547), .Z(n2976) );
  dti_28hc_7t_30_invx1 U7476 ( .A(\eda_img_ram/img_memory[4][0][4] ), .Z(n6421) );
  dti_28hc_7t_30_muxi21xp5 U7477 ( .D0(n6451), .D1(n6421), .S(n6545), .Z(n2984) );
  dti_28hc_7t_30_invxp5 U7478 ( .A(\eda_img_ram/img_memory[0][2][4] ), .Z(
        n6422) );
  dti_28hc_7t_30_muxi21xp5 U7479 ( .D0(n6422), .D1(n6451), .S(n6590), .Z(n3160) );
  dti_28hc_7t_30_invxp5 U7484 ( .A(\eda_img_ram/img_memory[0][5][4] ), .Z(
        n6425) );
  dti_28hc_7t_30_muxi21xp5 U7485 ( .D0(n6425), .D1(n6451), .S(n6587), .Z(n3136) );
  dti_28hc_7t_30_invxp5 U7488 ( .A(\eda_img_ram/img_memory[0][0][4] ), .Z(
        n6427) );
  dti_28hc_7t_30_muxi21xp5 U7489 ( .D0(n6427), .D1(n6451), .S(n6592), .Z(n3176) );
  dti_28hc_7t_30_invxp5 U7490 ( .A(\eda_img_ram/img_memory[3][2][4] ), .Z(
        n6428) );
  dti_28hc_7t_30_muxi21xp5 U7491 ( .D0(n6451), .D1(n6428), .S(n6571), .Z(n3016) );
  dti_28hc_7t_30_invxp5 U7492 ( .A(\eda_img_ram/img_memory[3][4][4] ), .Z(
        n6429) );
  dti_28hc_7t_30_muxi21xp5 U7493 ( .D0(n6429), .D1(n6451), .S(n6577), .Z(n3000) );
  dti_28hc_7t_30_muxi21xp5 U7498 ( .D0(n6451), .D1(n6432), .S(n6581), .Z(n3024) );
  dti_28hc_7t_30_invx1 U7499 ( .A(\eda_img_ram/img_memory[3][0][4] ), .Z(n6433) );
  dti_28hc_7t_30_muxi21xp5 U7500 ( .D0(n6451), .D1(n6433), .S(n6579), .Z(n3032) );
  dti_28hc_7t_30_invxp5 U7501 ( .A(\eda_img_ram/img_memory[2][2][4] ), .Z(
        n6434) );
  dti_28hc_7t_30_muxi21xp5 U7502 ( .D0(n6451), .D1(n6434), .S(n6556), .Z(n3064) );
  dti_28hc_7t_30_muxi21xp5 U7509 ( .D0(n6451), .D1(n6438), .S(n6549), .Z(n3072) );
  dti_28hc_7t_30_invx1 U7510 ( .A(\eda_img_ram/img_memory[2][0][4] ), .Z(n6439) );
  dti_28hc_7t_30_muxi21xp5 U7511 ( .D0(n6451), .D1(n6439), .S(n6558), .Z(n3080) );
  dti_28hc_7t_30_invxp5 U7512 ( .A(\eda_img_ram/img_memory[5][2][4] ), .Z(
        n6440) );
  dti_28hc_7t_30_muxi21xp5 U7513 ( .D0(n6451), .D1(n6440), .S(n6535), .Z(n2920) );
  dti_28hc_7t_30_invx1 U7514 ( .A(\eda_img_ram/img_memory[5][3][4] ), .Z(n6441) );
  dti_28hc_7t_30_muxi21xp5 U7515 ( .D0(n6451), .D1(n6441), .S(n6531), .Z(n2912) );
  dti_28hc_7t_30_muxi21xp5 U7520 ( .D0(n6451), .D1(n6444), .S(n6537), .Z(n2936) );
  dti_28hc_7t_30_invx1 U7521 ( .A(\eda_img_ram/img_memory[5][1][4] ), .Z(n6445) );
  dti_28hc_7t_30_muxi21xp5 U7522 ( .D0(n6451), .D1(n6445), .S(n6529), .Z(n2928) );
  dti_28hc_7t_30_invxp5 U7525 ( .A(\eda_img_ram/img_memory[1][4][4] ), .Z(
        n6447) );
  dti_28hc_7t_30_muxi21xp5 U7526 ( .D0(n6447), .D1(n6451), .S(n6566), .Z(n3096) );
  dti_28hc_7t_30_invx1 U7531 ( .A(\eda_img_ram/img_memory[1][1][4] ), .Z(n6450) );
  dti_28hc_7t_30_muxi21xp5 U7532 ( .D0(n6450), .D1(n6451), .S(n6560), .Z(n3120) );
  dti_28hc_7t_30_muxi21xp5 U7538 ( .D0(n6488), .D1(n6454), .S(n6533), .Z(n2903) );
  dti_28hc_7t_30_invx1 U7539 ( .A(\eda_img_ram/img_memory[5][2][5] ), .Z(n6455) );
  dti_28hc_7t_30_muxi21xp5 U7540 ( .D0(n6488), .D1(n6455), .S(n6535), .Z(n2919) );
  dti_28hc_7t_30_invx1 U7543 ( .A(\eda_img_ram/img_memory[5][0][5] ), .Z(n6457) );
  dti_28hc_7t_30_muxi21xp5 U7544 ( .D0(n6488), .D1(n6457), .S(n6537), .Z(n2935) );
  dti_28hc_7t_30_invx1 U7545 ( .A(\eda_img_ram/img_memory[5][3][5] ), .Z(n6458) );
  dti_28hc_7t_30_muxi21xp5 U7546 ( .D0(n6488), .D1(n6458), .S(n6531), .Z(n2911) );
  dti_28hc_7t_30_invxp5 U7554 ( .A(\eda_img_ram/img_memory[1][0][5] ), .Z(
        n6463) );
  dti_28hc_7t_30_muxi21xp5 U7555 ( .D0(n6463), .D1(n6488), .S(n6570), .Z(n3127) );
  dti_28hc_7t_30_invxp5 U7558 ( .A(\eda_img_ram/img_memory[0][1][5] ), .Z(
        n6465) );
  dti_28hc_7t_30_muxi21xp5 U7559 ( .D0(n6465), .D1(n6488), .S(n6583), .Z(n3167) );
  dti_28hc_7t_30_invxp5 U7562 ( .A(\eda_img_ram/img_memory[0][2][5] ), .Z(
        n6467) );
  dti_28hc_7t_30_muxi21xp5 U7563 ( .D0(n6467), .D1(n6488), .S(n6590), .Z(n3159) );
  dti_28hc_7t_30_invxp5 U7566 ( .A(\eda_img_ram/img_memory[0][0][5] ), .Z(
        n6469) );
  dti_28hc_7t_30_muxi21xp5 U7567 ( .D0(n6469), .D1(n6488), .S(n6592), .Z(n3175) );
  dti_28hc_7t_30_muxi21xp5 U7569 ( .D0(n6470), .D1(n6488), .S(n6585), .Z(n3151) );
  dti_28hc_7t_30_invxp5 U7570 ( .A(\eda_img_ram/img_memory[4][1][5] ), .Z(
        n6471) );
  dti_28hc_7t_30_muxi21xp5 U7571 ( .D0(n6488), .D1(n6471), .S(n6547), .Z(n2975) );
  dti_28hc_7t_30_invxp5 U7572 ( .A(\eda_img_ram/img_memory[4][4][5] ), .Z(
        n6472) );
  dti_28hc_7t_30_muxi21xp5 U7573 ( .D0(n6488), .D1(n6472), .S(n6543), .Z(n2951) );
  dti_28hc_7t_30_invx1 U7574 ( .A(\eda_img_ram/img_memory[4][2][5] ), .Z(n6473) );
  dti_28hc_7t_30_muxi21xp5 U7575 ( .D0(n6488), .D1(n6473), .S(n6521), .Z(n2967) );
  dti_28hc_7t_30_invxp5 U7576 ( .A(\eda_img_ram/img_memory[4][5][5] ), .Z(
        n6474) );
  dti_28hc_7t_30_muxi21xp5 U7577 ( .D0(n6488), .D1(n6474), .S(n6541), .Z(n2943) );
  dti_28hc_7t_30_invx1 U7578 ( .A(\eda_img_ram/img_memory[4][0][5] ), .Z(n6475) );
  dti_28hc_7t_30_muxi21xp5 U7579 ( .D0(n6488), .D1(n6475), .S(n6545), .Z(n2983) );
  dti_28hc_7t_30_invxp5 U7580 ( .A(\eda_img_ram/img_memory[4][3][5] ), .Z(
        n6476) );
  dti_28hc_7t_30_muxi21xp5 U7581 ( .D0(n6476), .D1(n6488), .S(n6539), .Z(n2959) );
  dti_28hc_7t_30_invxp5 U7582 ( .A(\eda_img_ram/img_memory[3][1][5] ), .Z(
        n6477) );
  dti_28hc_7t_30_muxi21xp5 U7583 ( .D0(n6488), .D1(n6477), .S(n6581), .Z(n3023) );
  dti_28hc_7t_30_invxp5 U7584 ( .A(\eda_img_ram/img_memory[3][4][5] ), .Z(
        n6478) );
  dti_28hc_7t_30_muxi21xp5 U7585 ( .D0(n6478), .D1(n6488), .S(n6577), .Z(n2999) );
  dti_28hc_7t_30_invxp5 U7586 ( .A(\eda_img_ram/img_memory[3][2][5] ), .Z(
        n6479) );
  dti_28hc_7t_30_muxi21xp5 U7587 ( .D0(n6488), .D1(n6479), .S(n6571), .Z(n3015) );
  dti_28hc_7t_30_invxp5 U7590 ( .A(\eda_img_ram/img_memory[3][0][5] ), .Z(
        n6481) );
  dti_28hc_7t_30_muxi21xp5 U7591 ( .D0(n6488), .D1(n6481), .S(n6579), .Z(n3031) );
  dti_28hc_7t_30_invxp5 U7592 ( .A(\eda_img_ram/img_memory[3][3][5] ), .Z(
        n6482) );
  dti_28hc_7t_30_muxi21xp5 U7593 ( .D0(n6482), .D1(n6488), .S(n6573), .Z(n3007) );
  dti_28hc_7t_30_muxi21xp5 U7594 ( .D0(n6488), .D1(n6483), .S(n6549), .Z(n3071) );
  dti_28hc_7t_30_invxp5 U7595 ( .A(\eda_img_ram/img_memory[2][4][5] ), .Z(
        n6484) );
  dti_28hc_7t_30_muxi21xp5 U7596 ( .D0(n6484), .D1(n6488), .S(n6555), .Z(n3047) );
  dti_28hc_7t_30_invx1 U7597 ( .A(\eda_img_ram/img_memory[2][2][5] ), .Z(n6485) );
  dti_28hc_7t_30_muxi21xp5 U7598 ( .D0(n6488), .D1(n6485), .S(n6556), .Z(n3063) );
  dti_28hc_7t_30_invxp5 U7599 ( .A(\eda_img_ram/img_memory[2][5][5] ), .Z(
        n6486) );
  dti_28hc_7t_30_muxi21xp5 U7600 ( .D0(n6486), .D1(n6488), .S(n6553), .Z(n3039) );
  dti_28hc_7t_30_muxi21xp5 U7602 ( .D0(n6488), .D1(n7657), .S(n6558), .Z(n3079) );
  dti_28hc_7t_30_invxp5 U7603 ( .A(\eda_img_ram/img_memory[2][3][5] ), .Z(
        n6489) );
  dti_28hc_7t_30_muxi21xp5 U7604 ( .D0(n6489), .D1(n6488), .S(n6551), .Z(n3055) );
  dti_28hc_7t_30_invx1 U7605 ( .A(\eda_img_ram/img_memory[2][2][1] ), .Z(n6490) );
  dti_28hc_7t_30_muxi21xp5 U7606 ( .D0(n6527), .D1(n6490), .S(n6556), .Z(n3067) );
  dti_28hc_7t_30_invxp5 U7607 ( .A(\eda_img_ram/img_memory[2][1][1] ), .Z(
        n6491) );
  dti_28hc_7t_30_muxi21xp5 U7608 ( .D0(n6527), .D1(n6491), .S(n6549), .Z(n3075) );
  dti_28hc_7t_30_invxp5 U7613 ( .A(\eda_img_ram/img_memory[2][0][1] ), .Z(
        n6494) );
  dti_28hc_7t_30_muxi21xp5 U7614 ( .D0(n6527), .D1(n6494), .S(n6558), .Z(n3083) );
  dti_28hc_7t_30_muxi21xp5 U7616 ( .D0(n6495), .D1(n6527), .S(n6551), .Z(n3059) );
  dti_28hc_7t_30_invx1 U7617 ( .A(\eda_img_ram/img_memory[5][2][1] ), .Z(n6496) );
  dti_28hc_7t_30_muxi21xp5 U7618 ( .D0(n6527), .D1(n6496), .S(n6535), .Z(n2923) );
  dti_28hc_7t_30_invx1 U7619 ( .A(\eda_img_ram/img_memory[5][1][1] ), .Z(n6497) );
  dti_28hc_7t_30_muxi21xp5 U7620 ( .D0(n6527), .D1(n6497), .S(n6529), .Z(n2931) );
  dti_28hc_7t_30_invxp5 U7623 ( .A(\eda_img_ram/img_memory[5][3][1] ), .Z(
        n6499) );
  dti_28hc_7t_30_muxi21xp5 U7624 ( .D0(n6527), .D1(n6499), .S(n6531), .Z(n2915) );
  dti_28hc_7t_30_invxp5 U7627 ( .A(\eda_img_ram/img_memory[5][0][1] ), .Z(
        n6502) );
  dti_28hc_7t_30_muxi21xp5 U7628 ( .D0(n6527), .D1(n6502), .S(n6537), .Z(n2939) );
  dti_28hc_7t_30_invxp5 U7639 ( .A(\eda_img_ram/img_memory[0][3][1] ), .Z(
        n6508) );
  dti_28hc_7t_30_muxi21xp5 U7640 ( .D0(n6508), .D1(n6527), .S(n6585), .Z(n3155) );
  dti_28hc_7t_30_invx1 U7641 ( .A(\eda_img_ram/img_memory[3][2][1] ), .Z(n6509) );
  dti_28hc_7t_30_muxi21xp5 U7642 ( .D0(n6527), .D1(n6509), .S(n6571), .Z(n3019) );
  dti_28hc_7t_30_invx1 U7643 ( .A(\eda_img_ram/img_memory[3][1][1] ), .Z(n6510) );
  dti_28hc_7t_30_muxi21xp5 U7644 ( .D0(n6527), .D1(n6510), .S(n6581), .Z(n3027) );
  dti_28hc_7t_30_invx1 U7645 ( .A(\eda_img_ram/img_memory[3][4][1] ), .Z(n6511) );
  dti_28hc_7t_30_muxi21xp5 U7646 ( .D0(n6511), .D1(n6527), .S(n6577), .Z(n3003) );
  dti_28hc_7t_30_invx1 U7649 ( .A(\eda_img_ram/img_memory[3][0][1] ), .Z(n6513) );
  dti_28hc_7t_30_muxi21xp5 U7650 ( .D0(n6527), .D1(n6513), .S(n6579), .Z(n3035) );
  dti_28hc_7t_30_invxp5 U7653 ( .A(\eda_img_ram/img_memory[1][2][1] ), .Z(
        n6515) );
  dti_28hc_7t_30_muxi21xp5 U7654 ( .D0(n6515), .D1(n6527), .S(n6568), .Z(n3115) );
  dti_28hc_7t_30_invxp5 U7655 ( .A(\eda_img_ram/img_memory[1][1][1] ), .Z(
        n6516) );
  dti_28hc_7t_30_muxi21xp5 U7656 ( .D0(n6516), .D1(n6527), .S(n6560), .Z(n3123) );
  dti_28hc_7t_30_invxp5 U7659 ( .A(\eda_img_ram/img_memory[1][3][1] ), .Z(
        n6518) );
  dti_28hc_7t_30_muxi21xp5 U7660 ( .D0(n6518), .D1(n6527), .S(n6562), .Z(n3107) );
  dti_28hc_7t_30_invxp5 U7663 ( .A(\eda_img_ram/img_memory[1][0][1] ), .Z(
        n6520) );
  dti_28hc_7t_30_muxi21xp5 U7664 ( .D0(n6520), .D1(n6527), .S(n6570), .Z(n3131) );
  dti_28hc_7t_30_invxp5 U7665 ( .A(\eda_img_ram/img_memory[4][2][1] ), .Z(
        n6522) );
  dti_28hc_7t_30_muxi21xp5 U7666 ( .D0(n6527), .D1(n6522), .S(n6521), .Z(n2971) );
  dti_28hc_7t_30_invxp5 U7667 ( .A(\eda_img_ram/img_memory[4][1][1] ), .Z(
        n6523) );
  dti_28hc_7t_30_muxi21xp5 U7668 ( .D0(n6527), .D1(n6523), .S(n6547), .Z(n2979) );
  dti_28hc_7t_30_muxi21xp5 U7673 ( .D0(n6527), .D1(n6526), .S(n6545), .Z(n2987) );
  dti_28hc_7t_30_invx1 U7676 ( .A(\eda_img_ram/img_memory[5][1][0] ), .Z(n6530) );
  dti_28hc_7t_30_muxi21xp5 U7677 ( .D0(n6593), .D1(n6530), .S(n6529), .Z(n2932) );
  dti_28hc_7t_30_invxp5 U7678 ( .A(\eda_img_ram/img_memory[5][3][0] ), .Z(
        n6532) );
  dti_28hc_7t_30_muxi21xp5 U7679 ( .D0(n6593), .D1(n6532), .S(n6531), .Z(n2916) );
  dti_28hc_7t_30_invx1 U7680 ( .A(\eda_img_ram/img_memory[5][4][0] ), .Z(n6534) );
  dti_28hc_7t_30_muxi21xp5 U7681 ( .D0(n6593), .D1(n6534), .S(n6533), .Z(n2908) );
  dti_28hc_7t_30_invxp5 U7684 ( .A(\eda_img_ram/img_memory[5][0][0] ), .Z(
        n6538) );
  dti_28hc_7t_30_muxi21xp5 U7685 ( .D0(n6593), .D1(n6538), .S(n6537), .Z(n2940) );
  dti_28hc_7t_30_invxp5 U7686 ( .A(\eda_img_ram/img_memory[4][3][0] ), .Z(
        n6540) );
  dti_28hc_7t_30_muxi21xp5 U7687 ( .D0(n6540), .D1(n6593), .S(n6539), .Z(n2964) );
  dti_28hc_7t_30_muxi21xp5 U7689 ( .D0(n6593), .D1(n6542), .S(n6541), .Z(n2948) );
  dti_28hc_7t_30_invxp5 U7690 ( .A(\eda_img_ram/img_memory[4][4][0] ), .Z(
        n6544) );
  dti_28hc_7t_30_muxi21xp5 U7691 ( .D0(n6593), .D1(n6544), .S(n6543), .Z(n2956) );
  dti_28hc_7t_30_invxp5 U7692 ( .A(\eda_img_ram/img_memory[4][0][0] ), .Z(
        n6546) );
  dti_28hc_7t_30_muxi21xp5 U7693 ( .D0(n6593), .D1(n6546), .S(n6545), .Z(n2988) );
  dti_28hc_7t_30_muxi21xp5 U7695 ( .D0(n6593), .D1(n6548), .S(n6547), .Z(n2980) );
  dti_28hc_7t_30_invx1 U7696 ( .A(\eda_img_ram/img_memory[2][1][0] ), .Z(n6550) );
  dti_28hc_7t_30_muxi21xp5 U7697 ( .D0(n6593), .D1(n6550), .S(n6549), .Z(n3076) );
  dti_28hc_7t_30_invx1 U7705 ( .A(\eda_img_ram/img_memory[2][0][0] ), .Z(n6559) );
  dti_28hc_7t_30_muxi21xp5 U7706 ( .D0(n6593), .D1(n6559), .S(n6558), .Z(n3084) );
  dti_28hc_7t_30_invxp5 U7709 ( .A(\eda_img_ram/img_memory[1][3][0] ), .Z(
        n6563) );
  dti_28hc_7t_30_muxi21xp5 U7710 ( .D0(n6563), .D1(n6593), .S(n6562), .Z(n3108) );
  dti_28hc_7t_30_invxp5 U7715 ( .A(\eda_img_ram/img_memory[1][2][0] ), .Z(
        n6569) );
  dti_28hc_7t_30_muxi21xp5 U7716 ( .D0(n6569), .D1(n6593), .S(n6568), .Z(n3116) );
  dti_28hc_7t_30_invxp5 U7718 ( .A(\eda_img_ram/img_memory[3][2][0] ), .Z(
        n6572) );
  dti_28hc_7t_30_muxi21xp5 U7719 ( .D0(n6593), .D1(n6572), .S(n6571), .Z(n3020) );
  dti_28hc_7t_30_invx1 U7726 ( .A(\eda_img_ram/img_memory[3][0][0] ), .Z(n6580) );
  dti_28hc_7t_30_muxi21xp5 U7727 ( .D0(n6593), .D1(n6580), .S(n6579), .Z(n3036) );
  dti_28hc_7t_30_invx1 U7728 ( .A(\eda_img_ram/img_memory[3][1][0] ), .Z(n6582) );
  dti_28hc_7t_30_muxi21xp5 U7729 ( .D0(n6593), .D1(n6582), .S(n6581), .Z(n3028) );
  dti_28hc_7t_30_invxp5 U7737 ( .A(\eda_img_ram/img_memory[0][2][0] ), .Z(
        n6591) );
  dti_28hc_7t_30_muxi21xp5 U7738 ( .D0(n6591), .D1(n6593), .S(n6590), .Z(n3164) );
  dti_28hc_7t_30_invx1 U7742 ( .A(n6641), .Z(n6596) );
  dti_28hc_7t_30_nand2x1 U7743 ( .A(n5589), .B(new_pixel), .Z(n6602) );
  dti_28hc_7t_30_invx1 U7746 ( .A(n6724), .Z(n6648) );
  dti_28hc_7t_30_nor2x1 U7749 ( .A(n6646), .B(n3264), .Z(n6617) );
  dti_28hc_7t_30_nand2x1 U7754 ( .A(n6633), .B(new_pixel), .Z(n6629) );
  dti_28hc_7t_30_nand2x1 U7768 ( .A(n7076), .B(n6707), .Z(n6672) );
  dti_28hc_7t_30_invx1 U7789 ( .A(n6722), .Z(n2542) );
  dti_28hc_7t_30_or2x1 U7790 ( .A(n6723), .B(n6724), .Z(n6734) );
  dti_28hc_7t_30_invx1 U7791 ( .A(n6725), .Z(n6733) );
  dti_28hc_7t_30_nand2i1xp5 U7792 ( .A(
        \eda_fifos/sync_fifo_downleft/rd_addr [0]), .B(
        \eda_fifos/sync_fifo_downleft/wr_addr [0]), .Z(n6726) );
  dti_28hc_7t_30_xor2bxp5 U7793 ( .A(n6727), .B(n6726), .Z(n6728) );
  dti_28hc_7t_30_nand4i1x1 U7794 ( .A(n6731), .B(n3464), .C(n6728), .D(n6729), 
        .Z(n6732) );
  dti_28hc_7t_30_invx1 U7795 ( .A(n6735), .Z(n6739) );
  dti_28hc_7t_30_invx1 U7796 ( .A(\eda_fifos/sync_fifo_downright/rd_addr [3]), 
        .Z(n6737) );
  dti_28hc_7t_30_ioa22xp5 U7798 ( .A1(n6745), .A2(n6746), .B1(n6739), .B2(
        n6748), .Z(n2853) );
  dti_28hc_7t_30_invx1 U7799 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [1]), 
        .Z(n6884) );
  dti_28hc_7t_30_invx1 U7800 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [3]), 
        .Z(n6741) );
  dti_28hc_7t_30_aoi12rex1 U7801 ( .B1(n7790), .B2(n6741), .A(n6740), .Z(n6742) );
  dti_28hc_7t_30_oai12rex1 U7802 ( .B1(n6744), .B2(n6884), .A(n6743), .Z(n2854) );
  dti_28hc_7t_30_iao12x1 U7803 ( .B1(n6748), .B2(
        \eda_fifos/sync_fifo_downright/rd_addr [0]), .A(n6745), .Z(n2852) );
  dti_28hc_7t_30_ioa12xp5 U7804 ( .B1(
        \eda_fifos/sync_fifo_downright/rd_addr [3]), .B2(n6746), .A(n6745), 
        .Z(n6750) );
  dti_28hc_7t_30_nand2xp5 U7805 ( .A(n6748), .B(n6747), .Z(n6749) );
  dti_28hc_7t_30_ioa12xp5 U7806 ( .B1(n6750), .B2(
        \eda_fifos/sync_fifo_downright/rd_addr [2]), .A(n6749), .Z(n2851) );
  dti_28hc_7t_30_invx1 U7807 ( .A(n6751), .Z(n6763) );
  dti_28hc_7t_30_nand2i1xp5 U7808 ( .A(\eda_fifos/sync_fifo_down/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_down/wr_addr [2]), .Z(n6752) );
  dti_28hc_7t_30_nor2i1x1 U7809 ( .A(\eda_fifos/sync_fifo_down/wr_addr [0]), 
        .B(\eda_fifos/sync_fifo_down/rd_addr [0]), .Z(n6756) );
  dti_28hc_7t_30_xor2bx1 U7810 ( .A(n6757), .B(n6756), .Z(n6758) );
  dti_28hc_7t_30_invx1 U7812 ( .A(\eda_fifos/sync_fifo_down/wr_addr [0]), .Z(
        n6765) );
  dti_28hc_7t_30_invx1 U7815 ( .A(n6767), .Z(n6768) );
  dti_28hc_7t_30_aoi12rex1 U7816 ( .B1(n6770), .B2(n6769), .A(n6768), .Z(n2808) );
  dti_28hc_7t_30_invx1 U7817 ( .A(n6771), .Z(n6775) );
  dti_28hc_7t_30_nand2i1xp5 U7818 ( .A(\eda_fifos/sync_fifo_right/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_right/wr_addr [0]), .Z(n6772) );
  dti_28hc_7t_30_xor2bx1 U7819 ( .A(n6773), .B(n6772), .Z(n6774) );
  dti_28hc_7t_30_invx1 U7822 ( .A(\eda_fifos/sync_fifo_upright/rd_addr [0]), 
        .Z(n6794) );
  dti_28hc_7t_30_invx1 U7823 ( .A(n6791), .Z(n6792) );
  dti_28hc_7t_30_aoi12rex1 U7824 ( .B1(n6794), .B2(n6793), .A(n6792), .Z(n2720) );
  dti_28hc_7t_30_nand2x1 U7825 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [1]), 
        .B(\eda_fifos/sync_fifo_upright/wr_addr [0]), .Z(n6797) );
  dti_28hc_7t_30_invx1 U7826 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [0]), 
        .Z(n6848) );
  dti_28hc_7t_30_nand2i1x1 U7827 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [1]), .B(\eda_fifos/sync_fifo_upright/wr_addr [2]), .Z(n6841) );
  dti_28hc_7t_30_nor2x1 U7828 ( .A(n6841), .B(
        \eda_fifos/sync_fifo_upright/wr_addr [3]), .Z(n6796) );
  dti_28hc_7t_30_nor2i1x1 U7831 ( .A(\eda_fifos/sync_fifo_left/wr_addr [2]), 
        .B(\eda_fifos/sync_fifo_left/wr_addr [1]), .Z(n6800) );
  dti_28hc_7t_30_oai12x1 U7833 ( .B1(\eda_fifos/sync_fifo_left/wr_addr [2]), 
        .B2(n6802), .A(n6804), .Z(n6803) );
  dti_28hc_7t_30_nor2x1 U7834 ( .A(n6803), .B(n6820), .Z(n2760) );
  dti_28hc_7t_30_ioa12xp5 U7835 ( .B1(n6806), .B2(n6805), .A(
        \eda_fifos/sync_fifo_left/rd_addr [2]), .Z(n6809) );
  dti_28hc_7t_30_nand2i1xp5 U7836 ( .A(\eda_fifos/sync_fifo_left/rd_addr [0]), 
        .B(\eda_fifos/sync_fifo_left/wr_addr [0]), .Z(n6811) );
  dti_28hc_7t_30_xor2bxp5 U7837 ( .A(n6812), .B(n6811), .Z(n6813) );
  dti_28hc_7t_30_invx1 U7838 ( .A(n6972), .Z(n6818) );
  dti_28hc_7t_30_nand3xp5 U7839 ( .A(n6818), .B(n6971), .C(n6970), .Z(n6819)
         );
  dti_28hc_7t_30_nor2xp5 U7841 ( .A(n6822), .B(n6821), .Z(n6831) );
  dti_28hc_7t_30_nor2i1x1 U7843 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [0]), 
        .B(\eda_fifos/sync_fifo_upright/rd_addr [0]), .Z(n6824) );
  dti_28hc_7t_30_xor2bxp5 U7844 ( .A(n6825), .B(n6824), .Z(n6827) );
  dti_28hc_7t_30_nand2x1 U7846 ( .A(n6834), .B(n6833), .Z(n6837) );
  dti_28hc_7t_30_invx1 U7847 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [1]), 
        .Z(n6836) );
  dti_28hc_7t_30_aoi12rex1 U7848 ( .B1(n6836), .B2(n6837), .A(n6835), .Z(n2722) );
  dti_28hc_7t_30_invx1 U7849 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][2] ), .Z(
        n6838) );
  dti_28hc_7t_30_invx1 U7851 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n6843) );
  dti_28hc_7t_30_invx1 U7853 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(
        n6851) );
  dti_28hc_7t_30_invx1 U7854 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n6856) );
  dti_28hc_7t_30_invx1 U7857 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n6858) );
  dti_28hc_7t_30_or2x1 U7858 ( .A(\eda_fifos/sync_fifo_right/wr_addr [1]), .B(
        \eda_fifos/sync_fifo_right/wr_addr [2]), .Z(n6866) );
  dti_28hc_7t_30_invx1 U7859 ( .A(n6866), .Z(n6857) );
  dti_28hc_7t_30_invx1 U7860 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(
        n6862) );
  dti_28hc_7t_30_nand2x1 U7861 ( .A(\eda_fifos/sync_fifo_right/wr_addr [1]), 
        .B(n6859), .Z(n6864) );
  dti_28hc_7t_30_invx1 U7864 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n6863) );
  dti_28hc_7t_30_invx1 U7865 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][2] ), .Z(
        n6865) );
  dti_28hc_7t_30_invx1 U7866 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(
        n6868) );
  dti_28hc_7t_30_invx1 U7867 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n6869) );
  dti_28hc_7t_30_invx1 U7868 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n6872) );
  dti_28hc_7t_30_nand2xp5 U7869 ( .A(n3544), .B(n6880), .Z(n6870) );
  dti_28hc_7t_30_invx1 U7871 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][2] ), .Z(
        n6875) );
  dti_28hc_7t_30_nor2x1 U7872 ( .A(n3544), .B(n6880), .Z(n6873) );
  dti_28hc_7t_30_invx1 U7873 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(
        n6878) );
  dti_28hc_7t_30_invx1 U7874 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n6879) );
  dti_28hc_7t_30_invx1 U7875 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(
        n6882) );
  dti_28hc_7t_30_invx1 U7877 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][2] ), 
        .Z(n6888) );
  dti_28hc_7t_30_invx1 U7878 ( .A(n6884), .Z(n6886) );
  dti_28hc_7t_30_nor2x1 U7879 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [0]), 
        .B(n7790), .Z(n6885) );
  dti_28hc_7t_30_invx1 U7880 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][2] ), 
        .Z(n6890) );
  dti_28hc_7t_30_invx1 U7883 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][2] ), 
        .Z(n6895) );
  dti_28hc_7t_30_invx1 U7884 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(
        n6899) );
  dti_28hc_7t_30_nor2x1 U7885 ( .A(\eda_fifos/sync_fifo_down/wr_addr [2]), .B(
        \eda_fifos/sync_fifo_down/wr_addr [1]), .Z(n6901) );
  dti_28hc_7t_30_invx1 U7886 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][2] ), .Z(
        n6900) );
  dti_28hc_7t_30_invx1 U7887 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n6905) );
  dti_28hc_7t_30_or2x1 U7888 ( .A(\eda_fifos/sync_fifo_down/wr_addr [0]), .B(
        \eda_fifos/sync_fifo_down/o_full ), .Z(n6911) );
  dti_28hc_7t_30_invx1 U7889 ( .A(n6911), .Z(n6902) );
  dti_28hc_7t_30_invx1 U7891 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(
        n6908) );
  dti_28hc_7t_30_invx1 U7892 ( .A(n6906), .Z(n6907) );
  dti_28hc_7t_30_invx1 U7893 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n6909) );
  dti_28hc_7t_30_invx1 U7894 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n6913) );
  dti_28hc_7t_30_nand2xp5 U7896 ( .A(n6915), .B(n6914), .Z(n6916) );
  dti_28hc_7t_30_and2xp5 U7897 ( .A(n6917), .B(n6916), .Z(n2632) );
  dti_28hc_7t_30_nor2x1 U7898 ( .A(\eda_fifos/sync_fifo_up/wr_addr [0]), .B(
        \eda_fifos/sync_fifo_up/o_full ), .Z(n6957) );
  dti_28hc_7t_30_nand2x1 U7899 ( .A(n6966), .B(n6919), .Z(n2673) );
  dti_28hc_7t_30_nand2x1 U7900 ( .A(\eda_fifos/sync_fifo_up/wr_addr [2]), .B(
        n7570), .Z(n6920) );
  dti_28hc_7t_30_invx1 U7901 ( .A(n6923), .Z(n6935) );
  dti_28hc_7t_30_nand2x1 U7902 ( .A(n6924), .B(n3566), .Z(n6933) );
  dti_28hc_7t_30_nand2i1xp5 U7903 ( .A(\eda_fifos/sync_fifo_upleft/rd_addr [0]), .B(\eda_fifos/sync_fifo_upleft/wr_addr [0]), .Z(n6925) );
  dti_28hc_7t_30_xor2bxp5 U7904 ( .A(n6926), .B(n6925), .Z(n6927) );
  dti_28hc_7t_30_nor3x1 U7905 ( .A(n6928), .B(n6929), .C(n6927), .Z(n6932) );
  dti_28hc_7t_30_nand2x1 U7906 ( .A(n6930), .B(n3566), .Z(n6931) );
  dti_28hc_7t_30_nor2x1 U7907 ( .A(n6949), .B(
        \eda_fifos/sync_fifo_upleft/wr_addr [0]), .Z(n6937) );
  dti_28hc_7t_30_invx1 U7910 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(
        n6944) );
  dti_28hc_7t_30_nand2px4 U7911 ( .A(n6951), .B(n6943), .Z(n7205) );
  dti_28hc_7t_30_nor3i1x1 U7913 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [1]), 
        .B(\eda_fifos/sync_fifo_upleft/wr_addr [0]), .C(
        \eda_fifos/sync_fifo_upleft/wr_addr [2]), .Z(n6945) );
  dti_28hc_7t_30_invx1 U7914 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(
        n6950) );
  dti_28hc_7t_30_nand2x1 U7915 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [0]), 
        .B(\eda_fifos/sync_fifo_upleft/wr_addr [2]), .Z(n6947) );
  dti_28hc_7t_30_nor2x1 U7916 ( .A(n6947), .B(
        \eda_fifos/sync_fifo_upleft/wr_addr [1]), .Z(n6948) );
  dti_28hc_7t_30_invx1 U7917 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n6952) );
  dti_28hc_7t_30_invx1 U7918 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(n6955)
         );
  dti_28hc_7t_30_invx1 U7919 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][2] ), .Z(n6959)
         );
  dti_28hc_7t_30_invx1 U7920 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][2] ), .Z(n6960)
         );
  dti_28hc_7t_30_invx1 U7921 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][2] ), .Z(n6964)
         );
  dti_28hc_7t_30_nor2i1x1 U7922 ( .A(n6961), .B(n6965), .Z(n6962) );
  dti_28hc_7t_30_invx1 U7923 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(n6968)
         );
  dti_28hc_7t_30_invx1 U7924 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][2] ), .Z(
        n6974) );
  dti_28hc_7t_30_nor2i1x1 U7926 ( .A(\eda_fifos/sync_fifo_left/wr_addr [1]), 
        .B(\eda_fifos/sync_fifo_left/wr_addr [2]), .Z(n6977) );
  dti_28hc_7t_30_invx1 U7927 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][2] ), .Z(
        n6980) );
  dti_28hc_7t_30_nor2i1x1 U7928 ( .A(n6977), .B(
        \eda_fifos/sync_fifo_left/wr_addr [0]), .Z(n6978) );
  dti_28hc_7t_30_invx1 U7933 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n6985) );
  dti_28hc_7t_30_invx1 U7935 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][4] ), .Z(
        n6987) );
  dti_28hc_7t_30_invx1 U7937 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n6989) );
  dti_28hc_7t_30_invx1 U7939 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(
        n6991) );
  dti_28hc_7t_30_invx1 U7940 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][4] ), .Z(
        n6992) );
  dti_28hc_7t_30_invx1 U7941 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n6993) );
  dti_28hc_7t_30_invx1 U7943 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(
        n6995) );
  dti_28hc_7t_30_invx1 U7944 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n6996) );
  dti_28hc_7t_30_invx1 U7945 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n6997) );
  dti_28hc_7t_30_invx1 U7946 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(n6998)
         );
  dti_28hc_7t_30_invx1 U7947 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(n6999)
         );
  dti_28hc_7t_30_invx1 U7948 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][4] ), .Z(n7001)
         );
  dti_28hc_7t_30_invx1 U7949 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(n7002)
         );
  dti_28hc_7t_30_invx1 U7950 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n7003) );
  dti_28hc_7t_30_invx1 U7951 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n7004) );
  dti_28hc_7t_30_invx1 U7952 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][4] ), .Z(
        n7005) );
  dti_28hc_7t_30_invx1 U7953 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][4] ), .Z(
        n7006) );
  dti_28hc_7t_30_invx1 U7954 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n7007) );
  dti_28hc_7t_30_invx1 U7955 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(
        n7008) );
  dti_28hc_7t_30_invx1 U7957 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][4] ), .Z(
        n7010) );
  dti_28hc_7t_30_invx1 U7958 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n7011) );
  dti_28hc_7t_30_invx1 U7959 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(
        n7012) );
  dti_28hc_7t_30_invx1 U7960 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n7013) );
  dti_28hc_7t_30_invx1 U7961 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n7014) );
  dti_28hc_7t_30_invx1 U7963 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][4] ), 
        .Z(n7016) );
  dti_28hc_7t_30_invx1 U7964 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][4] ), 
        .Z(n7017) );
  dti_28hc_7t_30_invx1 U7965 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][4] ), 
        .Z(n7018) );
  dti_28hc_7t_30_invx1 U7967 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][4] ), 
        .Z(n7020) );
  dti_28hc_7t_30_invx1 U7968 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n7022) );
  dti_28hc_7t_30_invx1 U7969 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n7023) );
  dti_28hc_7t_30_invx1 U7970 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][4] ), .Z(
        n7024) );
  dti_28hc_7t_30_invx1 U7971 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n7025) );
  dti_28hc_7t_30_invx1 U7972 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][4] ), .Z(
        n7026) );
  dti_28hc_7t_30_invx1 U7973 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][4] ), .Z(
        n7027) );
  dti_28hc_7t_30_invx1 U7975 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n7031) );
  dti_28hc_7t_30_invx1 U7976 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n7032) );
  dti_28hc_7t_30_invx1 U7978 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(
        n7034) );
  dti_28hc_7t_30_invx1 U7979 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n7035) );
  dti_28hc_7t_30_invx1 U7980 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n7036) );
  dti_28hc_7t_30_invx1 U7981 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][3] ), .Z(
        n7037) );
  dti_28hc_7t_30_invx1 U7983 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n7039) );
  dti_28hc_7t_30_invx1 U7985 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(
        n7041) );
  dti_28hc_7t_30_invx1 U7986 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][3] ), .Z(
        n7042) );
  dti_28hc_7t_30_invx1 U7987 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n7043) );
  dti_28hc_7t_30_invx1 U7988 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n7044) );
  dti_28hc_7t_30_invx1 U7989 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(
        n7045) );
  dti_28hc_7t_30_invx1 U7990 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n7046) );
  dti_28hc_7t_30_invx1 U7991 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n7047) );
  dti_28hc_7t_30_invx1 U7992 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(n7048)
         );
  dti_28hc_7t_30_invx1 U7993 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(n7049)
         );
  dti_28hc_7t_30_invx1 U7995 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(n7051)
         );
  dti_28hc_7t_30_invx1 U7996 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n7052) );
  dti_28hc_7t_30_invx1 U7997 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n7053) );
  dti_28hc_7t_30_invx1 U7998 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(
        n7054) );
  dti_28hc_7t_30_invx1 U7999 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n7055) );
  dti_28hc_7t_30_invx1 U8000 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][3] ), .Z(
        n7056) );
  dti_28hc_7t_30_invx1 U8001 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n7058) );
  dti_28hc_7t_30_invx1 U8004 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][3] ), 
        .Z(n7061) );
  dti_28hc_7t_30_invx1 U8006 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][3] ), 
        .Z(n7063) );
  dti_28hc_7t_30_invx1 U8007 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n7064) );
  dti_28hc_7t_30_invx1 U8008 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][3] ), .Z(
        n7065) );
  dti_28hc_7t_30_invx1 U8009 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][3] ), .Z(
        n7066) );
  dti_28hc_7t_30_invx1 U8011 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][3] ), .Z(
        n7068) );
  dti_28hc_7t_30_invx1 U8012 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n7069) );
  dti_28hc_7t_30_invx1 U8013 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][3] ), .Z(
        n7070) );
  dti_28hc_7t_30_invx1 U8014 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][3] ), .Z(
        n7071) );
  dti_28hc_7t_30_invx1 U8015 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][3] ), .Z(
        n7072) );
  dti_28hc_7t_30_invx1 U8016 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][3] ), .Z(
        n7073) );
  dti_28hc_7t_30_invx1 U8018 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][1] ), .Z(
        n7082) );
  dti_28hc_7t_30_invx1 U8019 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n7083) );
  dti_28hc_7t_30_invx1 U8020 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n7084) );
  dti_28hc_7t_30_invx1 U8022 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][1] ), .Z(
        n7086) );
  dti_28hc_7t_30_invx1 U8023 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n7087) );
  dti_28hc_7t_30_invx1 U8025 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][1] ), .Z(
        n7089) );
  dti_28hc_7t_30_invx1 U8026 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(
        n7090) );
  dti_28hc_7t_30_invx1 U8027 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n7091) );
  dti_28hc_7t_30_invx1 U8029 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n7093) );
  dti_28hc_7t_30_invx1 U8030 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n7094) );
  dti_28hc_7t_30_invx1 U8031 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][1] ), .Z(
        n7095) );
  dti_28hc_7t_30_invx1 U8032 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n7096) );
  dti_28hc_7t_30_invx1 U8033 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][1] ), .Z(
        n7097) );
  dti_28hc_7t_30_invx1 U8034 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(
        n7098) );
  dti_28hc_7t_30_invx1 U8035 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(
        n7099) );
  dti_28hc_7t_30_invx1 U8036 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][1] ), .Z(
        n7100) );
  dti_28hc_7t_30_invx1 U8037 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n7101) );
  dti_28hc_7t_30_invx1 U8039 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n7103) );
  dti_28hc_7t_30_invx1 U8040 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n7104) );
  dti_28hc_7t_30_invx1 U8042 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][1] ), 
        .Z(n7106) );
  dti_28hc_7t_30_invx1 U8043 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][1] ), 
        .Z(n7107) );
  dti_28hc_7t_30_invx1 U8046 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][1] ), 
        .Z(n7110) );
  dti_28hc_7t_30_invx1 U8051 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n7116) );
  dti_28hc_7t_30_invx1 U8052 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(
        n7117) );
  dti_28hc_7t_30_invx1 U8053 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][1] ), .Z(n7118)
         );
  dti_28hc_7t_30_invx1 U8055 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(n7120)
         );
  dti_28hc_7t_30_invx1 U8056 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][1] ), .Z(n7122)
         );
  dti_28hc_7t_30_invx1 U8057 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][1] ), .Z(
        n7123) );
  dti_28hc_7t_30_invx1 U8060 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][1] ), .Z(
        n7126) );
  dti_28hc_7t_30_invx1 U8062 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][5] ), .Z(
        n7134) );
  dti_28hc_7t_30_invx1 U8063 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n7135) );
  dti_28hc_7t_30_invx1 U8064 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n7136) );
  dti_28hc_7t_30_invx1 U8065 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n7137) );
  dti_28hc_7t_30_invx1 U8067 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][5] ), .Z(
        n7139) );
  dti_28hc_7t_30_invx1 U8068 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n7140) );
  dti_28hc_7t_30_invx1 U8069 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n7141) );
  dti_28hc_7t_30_invx1 U8070 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][5] ), .Z(
        n7142) );
  dti_28hc_7t_30_invx1 U8071 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n7143) );
  dti_28hc_7t_30_invx1 U8073 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n7145) );
  dti_28hc_7t_30_invx1 U8074 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n7146) );
  dti_28hc_7t_30_invx1 U8076 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][5] ), .Z(
        n7148) );
  dti_28hc_7t_30_invx1 U8077 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n7149) );
  dti_28hc_7t_30_invx1 U8078 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n7150) );
  dti_28hc_7t_30_invx1 U8079 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(n7151)
         );
  dti_28hc_7t_30_invx1 U8080 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(n7152)
         );
  dti_28hc_7t_30_invx1 U8081 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(n7154)
         );
  dti_28hc_7t_30_invx1 U8082 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n7155) );
  dti_28hc_7t_30_invx1 U8083 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n7156) );
  dti_28hc_7t_30_invx1 U8084 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][5] ), .Z(
        n7157) );
  dti_28hc_7t_30_invx1 U8085 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n7158) );
  dti_28hc_7t_30_invx1 U8086 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][5] ), .Z(
        n7159) );
  dti_28hc_7t_30_invx1 U8087 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n7160) );
  dti_28hc_7t_30_invx1 U8088 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n7162) );
  dti_28hc_7t_30_invx1 U8089 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n7163) );
  dti_28hc_7t_30_invx1 U8090 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][5] ), .Z(
        n7164) );
  dti_28hc_7t_30_invx1 U8091 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n7165) );
  dti_28hc_7t_30_invx1 U8092 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n7167) );
  dti_28hc_7t_30_invx1 U8093 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][5] ), .Z(
        n7168) );
  dti_28hc_7t_30_invx1 U8094 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n7169) );
  dti_28hc_7t_30_invx1 U8095 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][5] ), .Z(
        n7170) );
  dti_28hc_7t_30_invx1 U8096 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n7171) );
  dti_28hc_7t_30_invx1 U8097 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][5] ), .Z(
        n7172) );
  dti_28hc_7t_30_invx1 U8098 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][5] ), .Z(
        n7173) );
  dti_28hc_7t_30_invx1 U8099 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n7174) );
  dti_28hc_7t_30_invx1 U8102 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][5] ), 
        .Z(n7177) );
  dti_28hc_7t_30_invx1 U8103 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][5] ), 
        .Z(n7178) );
  dti_28hc_7t_30_invx1 U8105 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][5] ), 
        .Z(n7180) );
  dti_28hc_7t_30_invx1 U8108 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][0] ), .Z(
        n7192) );
  dti_28hc_7t_30_invx1 U8110 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n7196) );
  dti_28hc_7t_30_invx1 U8112 ( .A(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][0] ), .Z(
        n7200) );
  dti_28hc_7t_30_invx1 U8113 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][0] ), .Z(
        n7202) );
  dti_28hc_7t_30_invx1 U8114 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n7204) );
  dti_28hc_7t_30_invx1 U8115 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n7206) );
  dti_28hc_7t_30_invx1 U8116 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][0] ), .Z(
        n7208) );
  dti_28hc_7t_30_invx1 U8117 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n7210) );
  dti_28hc_7t_30_invx1 U8118 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n7212) );
  dti_28hc_7t_30_invx1 U8119 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n7214) );
  dti_28hc_7t_30_invx1 U8120 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n7216) );
  dti_28hc_7t_30_invx1 U8121 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][0] ), .Z(
        n7218) );
  dti_28hc_7t_30_invx1 U8122 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n7220) );
  dti_28hc_7t_30_invx1 U8123 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][0] ), .Z(
        n7222) );
  dti_28hc_7t_30_invx1 U8124 ( .A(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n7224) );
  dti_28hc_7t_30_invx1 U8125 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n7225) );
  dti_28hc_7t_30_invx1 U8126 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][0] ), .Z(
        n7227) );
  dti_28hc_7t_30_invx1 U8127 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n7229) );
  dti_28hc_7t_30_invx1 U8128 ( .A(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][0] ), .Z(
        n7231) );
  dti_28hc_7t_30_invx1 U8129 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n7232) );
  dti_28hc_7t_30_invx1 U8130 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][0] ), .Z(
        n7234) );
  dti_28hc_7t_30_invx1 U8131 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n7236) );
  dti_28hc_7t_30_invx1 U8133 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n7240) );
  dti_28hc_7t_30_invx1 U8134 ( .A(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n7242) );
  dti_28hc_7t_30_invx1 U8136 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][0] ), 
        .Z(n7246) );
  dti_28hc_7t_30_invx1 U8137 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][0] ), 
        .Z(n7248) );
  dti_28hc_7t_30_invx1 U8140 ( .A(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][0] ), 
        .Z(n7255) );
  dti_28hc_7t_30_invx1 U8141 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][0] ), .Z(
        n7257) );
  dti_28hc_7t_30_invx1 U8142 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(
        n7259) );
  dti_28hc_7t_30_invx1 U8145 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(
        n7265) );
  dti_28hc_7t_30_invx1 U8146 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(
        n7267) );
  dti_28hc_7t_30_invx1 U8147 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][0] ), .Z(n7269)
         );
  dti_28hc_7t_30_invx1 U8148 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(n7270)
         );
  dti_28hc_7t_30_invx1 U8149 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][0] ), .Z(n7272)
         );
  dti_28hc_7t_30_invx1 U8150 ( .A(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][0] ), .Z(n7275)
         );
  dti_28hc_7t_30_iao12x1 U8151 ( .B1(n7279), .B2(
        \eda_fifos/sync_fifo_down/rd_addr [0]), .A(n7276), .Z(n2589) );
  dti_28hc_7t_30_ioa12xp5 U8152 ( .B1(\eda_fifos/sync_fifo_down/rd_addr [3]), 
        .B2(n7277), .A(n7276), .Z(n7281) );
  dti_28hc_7t_30_nand2xp5 U8153 ( .A(n7279), .B(n7278), .Z(n7280) );
  dti_28hc_7t_30_ioa12xp5 U8154 ( .B1(n7281), .B2(
        \eda_fifos/sync_fifo_down/rd_addr [2]), .A(n7280), .Z(n2588) );
  dti_28hc_7t_30_muxi21xp5 U8155 ( .D0(n7290), .D1(n7286), .S(
        \eda_fifos/sync_fifo_up/rd_addr [0]), .Z(n2676) );
  dti_28hc_7t_30_invx1 U8156 ( .A(n7282), .Z(n7289) );
  dti_28hc_7t_30_invx1 U8157 ( .A(n7283), .Z(n7285) );
  dti_28hc_7t_30_aoi12xp5 U8158 ( .B1(n7286), .B2(n7285), .A(n7284), .Z(n7288)
         );
  dti_28hc_7t_30_ioa22xp5 U8159 ( .A1(n7290), .A2(n7289), .B1(n7288), .B2(
        n7287), .Z(n2675) );
  dti_28hc_7t_30_nor3i1x1 U8160 ( .A(\eda_iterated_ram/current_row[0][0] ), 
        .B(n7535), .C(n7399), .Z(n7291) );
  dti_28hc_7t_30_nor2x1 U8161 ( .A(n7430), .B(n7291), .Z(n7294) );
  dti_28hc_7t_30_nor3x1 U8162 ( .A(n7295), .B(
        \eda_iterated_ram/current_row[0][4] ), .C(n7399), .Z(n7296) );
  dti_28hc_7t_30_nor2x1 U8163 ( .A(n7430), .B(n7296), .Z(n7299) );
  dti_28hc_7t_30_nor2x1 U8164 ( .A(n7300), .B(n7399), .Z(n7301) );
  dti_28hc_7t_30_invx1 U8166 ( .A(n7305), .Z(n7306) );
  dti_28hc_7t_30_nor3x1 U8167 ( .A(n7306), .B(
        \eda_iterated_ram/current_row[1][0] ), .C(n7399), .Z(n7307) );
  dti_28hc_7t_30_nor2x1 U8171 ( .A(\eda_iterated_ram/current_row[1][3] ), .B(
        n7399), .Z(n7314) );
  dti_28hc_7t_30_nor2x1 U8172 ( .A(\eda_iterated_ram/current_row[2][0] ), .B(
        n7399), .Z(n7321) );
  dti_28hc_7t_30_nor3x1 U8173 ( .A(n7327), .B(
        \eda_iterated_ram/current_row[2][1] ), .C(n7399), .Z(n7328) );
  dti_28hc_7t_30_nor2x1 U8174 ( .A(n7430), .B(n7328), .Z(n7331) );
  dti_28hc_7t_30_nor2x1 U8175 ( .A(\eda_iterated_ram/current_row[2][2] ), .B(
        n7399), .Z(n7332) );
  dti_28hc_7t_30_nor3x1 U8176 ( .A(n7337), .B(
        \eda_iterated_ram/current_row[2][3] ), .C(n7399), .Z(n7338) );
  dti_28hc_7t_30_nor2x1 U8177 ( .A(n7430), .B(n7338), .Z(n7340) );
  dti_28hc_7t_30_nor3x1 U8178 ( .A(n7341), .B(
        \eda_iterated_ram/current_row[2][4] ), .C(n7399), .Z(n7342) );
  dti_28hc_7t_30_nor2x1 U8179 ( .A(n7430), .B(n7342), .Z(n7345) );
  dti_28hc_7t_30_nor2x1 U8180 ( .A(n7346), .B(n7399), .Z(n7347) );
  dti_28hc_7t_30_nor2x1 U8181 ( .A(n7430), .B(n7347), .Z(n7351) );
  dti_28hc_7t_30_nor2x1 U8183 ( .A(\eda_iterated_ram/current_row[3][1] ), .B(
        n7399), .Z(n7357) );
  dti_28hc_7t_30_nor3x1 U8184 ( .A(\eda_iterated_ram/current_row[3][3] ), .B(
        n7361), .C(n7399), .Z(n7362) );
  dti_28hc_7t_30_nor2x1 U8185 ( .A(n7430), .B(n7362), .Z(n7365) );
  dti_28hc_7t_30_nor3x1 U8186 ( .A(n7366), .B(
        \eda_iterated_ram/current_row[3][4] ), .C(n7399), .Z(n7367) );
  dti_28hc_7t_30_nor2x1 U8187 ( .A(n7430), .B(n7367), .Z(n7369) );
  dti_28hc_7t_30_nor2x1 U8189 ( .A(n7430), .B(n7371), .Z(n7375) );
  dti_28hc_7t_30_nor3x1 U8190 ( .A(n7376), .B(
        \eda_iterated_ram/current_row[4][0] ), .C(n7399), .Z(n7377) );
  dti_28hc_7t_30_nor2x1 U8191 ( .A(n7430), .B(n7377), .Z(n7381) );
  dti_28hc_7t_30_nor2x1 U8192 ( .A(\eda_iterated_ram/current_row[4][1] ), .B(
        n7399), .Z(n7382) );
  dti_28hc_7t_30_nor3x1 U8193 ( .A(n7385), .B(
        \eda_iterated_ram/current_row[4][2] ), .C(n7399), .Z(n7386) );
  dti_28hc_7t_30_nor3x1 U8195 ( .A(n7390), .B(
        \eda_iterated_ram/current_row[4][3] ), .C(n7399), .Z(n7391) );
  dti_28hc_7t_30_nor2x1 U8196 ( .A(n7430), .B(n7391), .Z(n7394) );
  dti_28hc_7t_30_nor3x1 U8197 ( .A(n7401), .B(
        \eda_iterated_ram/current_row[4][4] ), .C(n7399), .Z(n7395) );
  dti_28hc_7t_30_nor2x1 U8198 ( .A(n7430), .B(n7395), .Z(n7398) );
  dti_28hc_7t_30_nor3x1 U8200 ( .A(n7401), .B(n7400), .C(n7399), .Z(n7402) );
  dti_28hc_7t_30_nor2x1 U8201 ( .A(n7430), .B(n7402), .Z(n7403) );
  dti_28hc_7t_30_nand2x1 U8202 ( .A(n7405), .B(n7404), .Z(n7425) );
  dti_28hc_7t_30_nor2x1 U8203 ( .A(n7425), .B(
        \eda_iterated_ram/current_row[5][0] ), .Z(n7406) );
  dti_28hc_7t_30_nor2x1 U8204 ( .A(n7430), .B(n7406), .Z(n7409) );
  dti_28hc_7t_30_invx1 U8205 ( .A(n7425), .Z(n7431) );
  dti_28hc_7t_30_nor2x1 U8206 ( .A(n7425), .B(n7414), .Z(n7415) );
  dti_28hc_7t_30_nor2x1 U8207 ( .A(n7430), .B(n7415), .Z(n7419) );
  dti_28hc_7t_30_nor3x1 U8208 ( .A(n7425), .B(
        \eda_iterated_ram/current_row[5][4] ), .C(n7424), .Z(n7426) );
  dti_28hc_7t_30_nor2x1 U8209 ( .A(n7430), .B(n7426), .Z(n7429) );
  dti_28hc_7t_30_nand4px2 U4266 ( .A(n4139), .B(n4138), .C(n4137), .D(n4136), 
        .Z(n5097) );
  dti_28hc_7t_30_aoi22x1 U6123 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[2][5][6] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[2][2][6] ), .Z(n4511) );
  dti_28hc_7t_30_aoi22x1 U5951 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[5][3][6] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[5][5][6] ), .Z(n4237) );
  dti_28hc_7t_30_nand2i1x2 U3605 ( .A(n5603), .B(n5604), .Z(n4626) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2753), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_nand2i1x2 U3411 ( .A(n3780), .B(n3376), .Z(n3414) );
  dti_28hc_7t_30_nand4px2 U4267 ( .A(n4146), .B(n4145), .C(n4143), .D(n4144), 
        .Z(n5096) );
  dti_28hc_7t_30_nor2x1 U4355 ( .A(n7361), .B(
        \eda_iterated_ram/current_row[3][3] ), .Z(n3446) );
  dti_28hc_7t_30_nand4px1 U5968 ( .A(n4261), .B(n4260), .C(n4259), .D(n3579), 
        .Z(n4760) );
  dti_28hc_7t_30_aoi22hpx1 U5011 ( .A1(n3604), .A2(
        \eda_img_ram/img_memory[2][3][0] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[2][1][0] ), .Z(n4452) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n2823), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][1] ) );
  dti_28hc_7t_30_nand4px1 U4734 ( .A(n4449), .B(n4448), .C(n4447), .D(n4446), 
        .Z(n4998) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2757), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2826), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n2691), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][1] ) );
  dti_28hc_7t_30_nand4px2 U6160 ( .A(n4549), .B(n4546), .C(n4547), .D(n4548), 
        .Z(n5750) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n2773), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2841), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2700), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n2679), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2694), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2581), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2689), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2787), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][3] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][1][7]  ( .D(n3069), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][7] ) );
  dti_28hc_7t_30_nand2x1 U5034 ( .A(n5223), .B(
        \eda_iterated_ram/current_row[3][5] ), .Z(n5224) );
  dti_28hc_7t_30_aoi22rex1 U5156 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[0][0][1] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[0][1][1] ), .Z(n4411) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2845), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2844), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n2817), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2832), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][4] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][0][6]  ( .D(n3078), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][6] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2561), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][2] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][1][0]  ( .D(n2980), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2755), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][3] ) );
  dti_28hc_7t_30_nor2hpx2 U3442 ( .A(n6070), .B(n3577), .Z(n3683) );
  dti_28hc_7t_30_nand4px1 U6029 ( .A(n4364), .B(n4366), .C(n4365), .D(n4367), 
        .Z(n4662) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n2554), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n2555), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2570), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2569), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][4] ) );
  dti_28hc_7t_30_nand4px2 U5109 ( .A(n4435), .B(n4436), .C(n4434), .D(n4433), 
        .Z(n5691) );
  dti_28hc_7t_30_aoi22hpx1 U5261 ( .A1(n3616), .A2(n5589), .B1(n5007), .B2(
        n3319), .Z(n4436) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n2703), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][1] ) );
  dti_28hc_7t_30_nor2x3 U5195 ( .A(n6886), .B(n6128), .Z(n3645) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2713), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n2696), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n2693), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2692), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2758), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2756), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n2564), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2563), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n2576), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n2575), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n2572), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][1] ) );
  dti_28hc_7t_30_nand4px1 U4747 ( .A(n4049), .B(n4048), .C(n4047), .D(n4046), 
        .Z(n4715) );
  dti_28hc_7t_30_nand4px1 U5894 ( .A(n4129), .B(n4131), .C(n4130), .D(n4128), 
        .Z(n4694) );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_left/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2764), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_left/rd_addr [0]) );
  dti_28hc_7t_30_nor2x1 U3536 ( .A(n4665), .B(n3663), .Z(n4862) );
  dti_28hc_7t_30_invx1 U6490 ( .A(n3378), .Z(n5165) );
  dti_28hc_7t_30_aoi22rex4 U5540 ( .A1(\eda_iterated_ram/current_row[0][0] ), 
        .A2(n6633), .B1(\eda_iterated_ram/current_row[5][0] ), .B2(n5140), .Z(
        n4072) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2650), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][4] ) );
  dti_28hc_7t_30_aoi22hpx1 U4115 ( .A1(n5093), .A2(n3321), .B1(n5092), .B2(
        n6633), .Z(n5101) );
  dti_28hc_7t_30_aoi22x3 U3726 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[0][5][4] ), .B1(
        \eda_img_ram/img_memory[0][0][4] ), .B2(n3931), .Z(n4142) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_strobe_ram/strb_memory_reg[1][3]  ( 
        .D(n2494), .CK(clk), .RN(reset_n), .Q(\strb_value[1][3] ), .QN(n7316)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_strobe_ram/strb_memory_reg[4][5]  ( 
        .D(n2463), .CK(clk), .RN(reset_n), .Q(\strb_value[4][5] ), .QN(n3748)
         );
  dti_28hc_7t_30_ffqqnhshpa10x8 \eda_strobe_ram/strb_memory_reg[1][4]  ( .D(
        n3567), .CK(clk), .SN(reset_n), .Q(n7445), .QN(n3253) );
  dti_28hc_7t_30_ffqqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[0][4]  ( 
        .D(n2859), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[0][4] ), .QN(n5518) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n6147), .CE(n7237), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][1] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n7057), .CE(n7237), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n3775), .CE(n7237), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[2][0] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n5281), .CE(n7249), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][2] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n7812), .CE(n7197), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][4] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n5281), .CE(n3396), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n3804), .CE(n3396), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n7811), .CE(n3396), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n7127), .CE(n3396), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][1] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n5430), .CE(n3396), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n3702), .CE(n3396), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2712), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2821), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n2820), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][4] ) );
  dti_28hc_7t_30_aoi22x3 U3712 ( .A1(n4445), .A2(
        \eda_img_ram/img_memory[1][1][6] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[1][0][6] ), .Z(n4196) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2648), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n2647), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n2649), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_ffqbckfsux2 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n2638), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n2775), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n2786), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n2640), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n2662), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_bufx2 U5480 ( .A(n6609), .Z(n6640) );
  dti_28hc_7t_30_nor2x3 U6022 ( .A(n6941), .B(n4358), .Z(n4359) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][1][3]  ( .D(n3025), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n2511), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n2822), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n2819), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n2818), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[1][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n2779), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n2791), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n2767), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][1] ) );
  dti_28hc_7t_30_nand2x2 U5777 ( .A(n6191), .B(
        \eda_img_ram/img_memory[0][5][3] ), .Z(n3944) );
  dti_28hc_7t_30_nand2x1 U5860 ( .A(\eda_iterated_ram/current_row[1][5] ), .B(
        n3317), .Z(n4077) );
  dti_28hc_7t_30_ffqa01x4 \eda_controller/center_addr_reg[3]  ( .D(n3188), 
        .CK(clk), .RN(reset_n), .Q(left_addr[3]) );
  dti_28hc_7t_30_nand4px1 U4736 ( .A(n4322), .B(n4323), .C(n4321), .D(n4320), 
        .Z(n4731) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][1][4]  ( .D(n2976), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][4] ) );
  dti_28hc_7t_30_nand4px2 U5469 ( .A(n4415), .B(n4416), .C(n4414), .D(n4413), 
        .Z(n5007) );
  dti_28hc_7t_30_muxi21x1 U4223 ( .D0(n7127), .D1(n7126), .S(n3564), .Z(n2753)
         );
  dti_28hc_7t_30_aoi22x2 U5792 ( .A1(n4597), .A2(
        \eda_img_ram/img_memory[3][0][7] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[3][5][7] ), .Z(n3970) );
  dti_28hc_7t_30_nand4px1 U5973 ( .A(n4265), .B(n4262), .C(n4263), .D(n4264), 
        .Z(n4764) );
  dti_28hc_7t_30_nand4poptax8 U4159 ( .A(n4011), .B(n4010), .C(n4008), .D(
        n4009), .Z(n5613) );
  dti_28hc_7t_30_nand4px2 U5795 ( .A(n3971), .B(n3970), .C(n3969), .D(n3968), 
        .Z(n4721) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2714), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_ffqbcka01fox4 \eda_fifos/sync_fifo_upright/write_control_inst/wr_addr_reg[2]  ( 
        .D(n2716), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/wr_addr [2]) );
  dti_28hc_7t_30_nand2px2 U4565 ( .A(n6833), .B(n6796), .Z(n6834) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2711), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n2828), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][0] ) );
  dti_28hc_7t_30_aoi22x1 U6067 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[4][4][1] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[4][2][1] ), .Z(n4424) );
  dti_28hc_7t_30_nand4px2 U4749 ( .A(n4157), .B(n4158), .C(n4156), .D(n4155), 
        .Z(n5095) );
  dti_28hc_7t_30_ffqbcka01fox2 \eda_fifos/sync_fifo_downright/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2849), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/wr_addr [0]) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n2706), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n2556), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n2559), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][0][5]  ( .D(n2983), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][5] ) );
  dti_28hc_7t_30_nand4px1 U4740 ( .A(n4303), .B(n4302), .C(n4301), .D(n4300), 
        .Z(n4734) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n2567), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n2566), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][1] ) );
  dti_28hc_7t_30_nand2x2 U7747 ( .A(n6653), .B(n6616), .Z(n6615) );
  dti_28hc_7t_30_invx3 U4302 ( .A(n7433), .Z(n3561) );
  dti_28hc_7t_30_nand4px1 U4735 ( .A(n4045), .B(n4044), .C(n4043), .D(n4042), 
        .Z(n4712) );
  dti_28hc_7t_30_nand4px1 U4745 ( .A(n4182), .B(n4181), .C(n4180), .D(n4179), 
        .Z(n4743) );
  dti_28hc_7t_30_nand2x2 U3559 ( .A(n4817), .B(n4686), .Z(n6138) );
  dti_28hc_7t_30_aoi22x1 U5913 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][4][4] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[3][0][4] ), .Z(n4174) );
  dti_28hc_7t_30_ioa13x1 U3492 ( .B1(n5194), .B2(n5193), .B3(n5192), .A(n6000), 
        .Z(n5207) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2824), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][2] ) );
  dti_28hc_7t_30_nand4px2 U4363 ( .A(n4655), .B(n4654), .C(n4653), .D(n4652), 
        .Z(n4656) );
  dti_28hc_7t_30_bufmhzx6 U4867 ( .A(n7057), .Z(n3804) );
  dti_28hc_7t_30_aoi22rex1 U4792 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[2][0][1] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[2][1][1] ), .Z(n4415) );
  dti_28hc_7t_30_nand2x2 U5246 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][3][3] ), .Z(n3951) );
  dti_28hc_7t_30_aoi22x1 U6063 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[1][4][1] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[1][1][1] ), .Z(n4420) );
  dti_28hc_7t_30_nand2x1 U6051 ( .A(n4408), .B(
        \eda_img_ram/img_memory[0][0][2] ), .Z(n4396) );
  dti_28hc_7t_30_nand2xp8 U6187 ( .A(n4408), .B(
        \eda_img_ram/img_memory[2][0][7] ), .Z(n4587) );
  dti_28hc_7t_30_aoi22hpx1 U5600 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[0][4][1] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[0][2][1] ), .Z(n4412) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_fifos/sync_fifo_downleft/write_control_inst/wr_addr_reg[2]  ( 
        .D(n2542), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/wr_addr [2]), .QN(n6168) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n7127), .CE(n7197), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][1] ) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[1][4]  ( 
        .D(n2865), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[1][4] ), .QN(n5514) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n3804), .CE(n7781), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][3] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n5281), .CE(n7781), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][2] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n7127), .CE(n7781), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][1] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n5430), .CE(n7781), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][4] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n3702), .CE(n7781), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][0] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n7811), .CE(n7781), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[3][5][1]  ( .D(
        pixel_in[1]), .CE(n6575), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][5][1] ) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[1][3]  ( 
        .D(n2864), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[1][3] ), .QN(n5461) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n5281), .CE(n7197), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][2] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n3804), .CE(n7197), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n3702), .CE(n7197), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n2683), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2621), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2622), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n2702), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2699), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n2698), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n2728), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n2752), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n2574), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n2577), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_muxi21x2 U5592 ( .D0(n7106), .D1(n7111), .S(n7245), .Z(n2823)
         );
  dti_28hc_7t_30_muxi21x1 U4224 ( .D0(n7127), .D1(n7124), .S(n3563), .Z(n2741)
         );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[0][0]  ( 
        .D(n2890), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[0][0] ), .QN(n5530) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2582), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2579), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2578), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_nand4px2 U5677 ( .A(n4630), .B(n4629), .C(n4628), .D(n4627), 
        .Z(n5597) );
  dti_28hc_7t_30_nand4px1 U6132 ( .A(n4515), .B(n4513), .C(n4514), .D(n4516), 
        .Z(n5020) );
  dti_28hc_7t_30_aoi22x3 U4958 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[5][5][1] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[5][4][1] ), .Z(n4093) );
  dti_28hc_7t_30_aoi22x3 U3782 ( .A1(n6122), .A2(
        \eda_img_ram/img_memory[5][1][6] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[5][0][6] ), .Z(n4213) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n2608), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n2605), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_invx2 U5219 ( .A(n6112), .Z(n3781) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n2636), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2656), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][4] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][0][6]  ( .D(n2934), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][0][6] ) );
  dti_28hc_7t_30_aoi22rehpx1 U3638 ( .A1(n6633), .A2(n5105), .B1(n5140), .B2(
        n5106), .Z(n5111) );
  dti_28hc_7t_30_aoi22rehpx1 U6442 ( .A1(n5019), .A2(n6633), .B1(n6616), .B2(
        n5018), .Z(n5024) );
  dti_28hc_7t_30_aoi22x1 U4706 ( .A1(n4754), .A2(n4836), .B1(n5695), .B2(n6633), .Z(n4624) );
  dti_28hc_7t_30_nand4px1 U5978 ( .A(n4269), .B(n4266), .C(n4267), .D(n4268), 
        .Z(n4761) );
  dti_28hc_7t_30_aoi22hplm2x4 U4983 ( .A1(n5108), .A2(n3320), .B1(n5104), .B2(
        n3319), .Z(n4217) );
  dti_28hc_7t_30_nand2x2 U3660 ( .A(n5093), .B(n4855), .Z(n4160) );
  dti_28hc_7t_30_muxi21x2 U4568 ( .D0(n7084), .D1(n7111), .S(n7195), .Z(n2709)
         );
  dti_28hc_7t_30_aoi22x1 U5937 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[3][3][6] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[3][5][6] ), .Z(n4221) );
  dti_28hc_7t_30_nand2x2 U3961 ( .A(n4868), .B(n4667), .Z(n5488) );
  dti_28hc_7t_30_xor2x2 U5107 ( .A(n3241), .B(n5691), .Z(n3550) );
  dti_28hc_7t_30_nand2x1 U3334 ( .A(n7130), .B(n7129), .Z(n3278) );
  dti_28hc_7t_30_and2hpx4 U7083 ( .A(n6080), .B(n7182), .Z(n7129) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2701), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2710), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n2729), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][1] ) );
  dti_28hc_7t_30_invx2 U4551 ( .A(n5181), .Z(n5233) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[0][1]  ( 
        .D(n2856), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[0][1] ) );
  dti_28hc_7t_30_nand2x1 U4251 ( .A(n7286), .B(n3458), .Z(n5387) );
  dti_28hc_7t_30_ffqa01lpax4 \eda_fifos/sync_fifo_downleft/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2545), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/rd_addr [2]) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n2551), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][4] ) );
  dti_28hc_7t_30_ioa13x1 U5721 ( .B1(n5218), .B2(n5217), .B3(n5216), .A(n6806), 
        .Z(n5219) );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_downright/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2851), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/rd_addr [2]) );
  dti_28hc_7t_30_nand4px1 U4729 ( .A(n4230), .B(n4229), .C(n4228), .D(n4227), 
        .Z(n4699) );
  dti_28hc_7t_30_nand4px1 U5943 ( .A(n4226), .B(n4223), .C(n4224), .D(n4225), 
        .Z(n4703) );
  dti_28hc_7t_30_nand2x1 U5782 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][2][7] ), .Z(n3957) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n2614), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2611), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n2602), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n2599), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n2607), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n2549), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n2548), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n2553), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n2550), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][3] ) );
  dti_28hc_7t_30_nand2x2 U3464 ( .A(n3742), .B(n3865), .Z(n5261) );
  dti_28hc_7t_30_nor3px2 U5487 ( .A(n6176), .B(n6175), .C(n3828), .Z(n3853) );
  dti_28hc_7t_30_invshzx14 U4202 ( .A(n4756), .Z(n3320) );
  dti_28hc_7t_30_invx2 U3503 ( .A(n6930), .Z(n3381) );
  dti_28hc_7t_30_nand3hpx2 U3666 ( .A(n3263), .B(n4292), .C(n4291), .Z(n5142)
         );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][0][3]  ( .D(n2985), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][3] ) );
  dti_28hc_7t_30_aoi22hpx1 U4036 ( .A1(n5030), .A2(n4855), .B1(n5028), .B2(
        n3309), .Z(n4783) );
  dti_28hc_7t_30_nor2i1x2 U4277 ( .A(n6773), .B(n6779), .Z(n3532) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n2707), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n2654), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n2532), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n2514), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n2533), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2515), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_aoi22x1 U5788 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[5][2][7] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[5][0][7] ), .Z(n3967) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2797), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_aoi22x1 U4703 ( .A1(n4744), .A2(n6616), .B1(n4745), .B2(n6633), .Z(n4189) );
  dti_28hc_7t_30_aoi22rex1 U4670 ( .A1(n5985), .A2(n3765), .B1(n6000), .B2(
        n3764), .Z(n3763) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][2][5]  ( .D(n3063), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][2][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n2790), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n2523), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2601), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2613), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][5] ) );
  dti_28hc_7t_30_nand2px4 U4889 ( .A(n3736), .B(n3735), .Z(n4822) );
  dti_28hc_7t_30_nand2x1 U5958 ( .A(n4701), .B(n6633), .Z(n4243) );
  dti_28hc_7t_30_nand2x1 U6102 ( .A(n4408), .B(
        \eda_img_ram/img_memory[5][0][3] ), .Z(n4474) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[5][4]  ( 
        .D(n2889), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[5][4] ) );
  dti_28hc_7t_30_nand2x1 U5252 ( .A(n5030), .B(n5140), .Z(n5033) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n2635), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][1] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n2652), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n2653), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][1] ) );
  dti_28hc_7t_30_xor2bx1 U3912 ( .A(n5722), .B(n6064), .Z(n6184) );
  dti_28hc_7t_30_aoi22x1 U4799 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[5][0][1] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[5][2][1] ), .Z(n4427) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n2784), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n2796), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_nand2x1 U6100 ( .A(n4408), .B(
        \eda_img_ram/img_memory[0][0][3] ), .Z(n4470) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n2770), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2782), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n2794), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_nor3px2 U4019 ( .A(n5352), .B(n6777), .C(n5304), .Z(n6806) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n2524), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n2781), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n2769), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n2793), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n2771), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n2783), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2780), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[2][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n2768), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n2772), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n2792), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_nand4px2 U4732 ( .A(n3935), .B(n3934), .C(n3933), .D(n3932), 
        .Z(n5081) );
  dti_28hc_7t_30_nand4px1 U3468 ( .A(n3471), .B(n5345), .C(n3470), .D(n3468), 
        .Z(n5360) );
  dti_28hc_7t_30_aoi22x1 U4809 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[1][3][4] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[1][5][4] ), .Z(n4185) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n2778), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2777), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n2774), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n2785), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][1] ) );
  dti_28hc_7t_30_nor2x3 U4727 ( .A(n5496), .B(\eda_iterated_ram/have_done ), 
        .Z(n6707) );
  dti_28hc_7t_30_aoi22x3 U5653 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[3][4][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[3][0][3] ), .Z(n3942) );
  dti_28hc_7t_30_bufmhzx40 U4137 ( .A(n3901), .Z(n6191) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2655), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n2658), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2657), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][5] ) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[5][1]  ( 
        .D(n2886), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[5][1] ), .QN(n5529) );
  dti_28hc_7t_30_invx1 U4205 ( .A(n4933), .Z(n4934) );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_right/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2808), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/rd_addr [0]) );
  dti_28hc_7t_30_ffqnhshpa10lpax1 \eda_fifos/sync_fifo_up/comparator_inst/o_full_reg  ( 
        .D(n5495), .CK(n7449), .SN(reset_n), .QN(
        \eda_fifos/sync_fifo_up/o_full ) );
  dti_28hc_7t_30_ffqnhshpa10lpax1 \eda_output_ram/matrix_output_reg[4][3]  ( 
        .D(n2454), .CK(clk), .SN(reset_n), .QN(n7436) );
  dti_28hc_7t_30_ffqnbckena10xp5 \eda_img_ram/img_memory_reg[5][5][0]  ( .D(
        n6593), .CE(n7725), .CK(clk), .SN(reset_n), .QN(
        \eda_img_ram/img_memory[5][5][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][1][5]  ( .D(
        pixel_in[5]), .CE(n7724), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][1][5] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][1][3]  ( .D(
        pixel_in[3]), .CE(n7724), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][1][3] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][2][0]  ( .D(
        pixel_in[0]), .CE(n7723), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][2][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][4][6]  ( .D(
        pixel_in[6]), .CE(n7722), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][4][6] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][0][4]  ( .D(
        pixel_in[4]), .CE(n6570), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][0][4] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][5][5]  ( .D(
        pixel_in[5]), .CE(n6587), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][5][5] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][4][1]  ( .D(
        pixel_in[1]), .CE(n6566), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][4][1] ) );
  dti_28hc_7t_30_ffqqnbckxp5 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2667), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][3] ), .QN(n7050) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n2507), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][3] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n2505), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][1] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n2620), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n2596), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][0] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2538), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2536), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][2] ) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2535), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n2618), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n2594), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][4] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n2591), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][1] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n2748), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n2735), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][1] ) );
  dti_28hc_7t_30_ffqqnhshpx8 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2754), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[5][2] ), .QN(
        n7440) );
  dti_28hc_7t_30_ffqqnhshpa10x8 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2831), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][3] ), 
        .QN(n7442) );
  dti_28hc_7t_30_ffqnhpa10lpax8 \eda_controller/new_pixel_cld_reg  ( .D(n5484), 
        .CK(clk), .SN(reset_n), .QN(new_pixel) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][4][2]  ( .D(
        pixel_in[2]), .CE(n6589), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][4][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][4][6]  ( .D(
        pixel_in[6]), .CE(n6589), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][4][6] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][2][5]  ( .D(
        pixel_in[5]), .CE(n6568), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][2][5] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][4][3]  ( .D(
        pixel_in[3]), .CE(n7722), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][4][3] ) );
  dti_28hc_7t_30_ffqbckena01fsux1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n7111), .CE(n6871), .CK(n7449), .RN(n7717), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][1] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n3702), .CE(n7249), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][0] ) );
  dti_28hc_7t_30_ffqqnbcka10x4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n2517), .CK(n7449), .SN(n7717), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][1] ), 
        .QN(n7092) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[0][1]  ( .D(
        n2502), .CK(clk), .RN(reset_n), .Q(\strb_value[0][1] ), .QN(n3374) );
  dti_28hc_7t_30_ffqnhshpa10x1 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2668), .CK(n7449), .SN(n7717), .QN(n7441) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[0][1]  ( 
        .D(n2723), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][1] ), .QN(
        n5508) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n2747), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][1] ), .QN(
        n5511) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n2600), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][4] ), .QN(
        n6982) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2612), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][4] ), .QN(
        n6981) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n2598), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][2] ), .QN(
        n6940) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n2610), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][2] ), .QN(
        n6939) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2606), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][4] ), .QN(
        n6984) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2604), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][2] ), .QN(
        n6946) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n2557), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][4] ), .QN(
        n7009) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n2597), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][1] ), .QN(
        n7113) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n2609), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][1] ), .QN(
        n7112) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[3][2]  ( 
        .D(n2742), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][2] ), .QN(
        n6976) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n2681), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][3] ), .QN(
        n7038) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n2680), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][2] ), .QN(
        n6839) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[0][0]  ( 
        .D(n2684), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][0] ), .QN(
        n7194) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n2741), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][1] ), .QN(
        n7124) );
  dti_28hc_7t_30_ffqqnbckx2 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n2740), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][0] ), .QN(
        n7263) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n7812), .CE(n6242), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][4] ) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_fifos/sync_fifo_upleft/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2627), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upleft/wr_addr [3]), .QN(n7739) );
  dti_28hc_7t_30_ffqnhshpa10lpax1 \eda_output_ram/matrix_output_reg[2][1]  ( 
        .D(n2440), .CK(clk), .SN(reset_n), .QN(n7716) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n2695), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][5] ), .QN(
        n7138) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2745), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][5] ), .QN(
        n7147) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2744), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][4] ), .QN(
        n6994) );
  dti_28hc_7t_30_ffqqnbckx4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2743), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][3] ), .QN(
        n7033) );
  dti_28hc_7t_30_ffqnhshpa10lpax3 \eda_output_ram/matrix_output_reg[5][3]  ( 
        .D(n2431), .CK(clk), .SN(reset_n), .QN(n7715) );
  dti_28hc_7t_30_aoi22x1 U6470 ( .A1(n5141), .A2(n5140), .B1(n5139), .B2(n3317), .Z(n5146) );
  dti_28hc_7t_30_xnor2optax4 U3523 ( .A(n5613), .B(n5664), .Z(n6104) );
  dti_28hc_7t_30_nand4px2 U5510 ( .A(n3986), .B(n3985), .C(n3984), .D(n3983), 
        .Z(n5063) );
  dti_28hc_7t_30_nor3pmhzoptax8 U3938 ( .A(n5570), .B(n4651), .C(n4650), .Z(
        n5566) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n2642), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[1][1]  ( 
        .D(n2641), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][1] ) );
  dti_28hc_7t_30_invx2 U3721 ( .A(n3308), .Z(n3601) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2846), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2843), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2842), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[5][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2645), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_nand4px1 U3619 ( .A(n3987), .B(n3990), .C(n3988), .D(n3989), 
        .Z(n3617) );
  dti_28hc_7t_30_and2x1 U7821 ( .A(n6789), .B(n6788), .Z(n2810) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[1][1][7]  ( .D(n3117), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][1][7] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2518), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n2708), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n2704), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n2705), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_aoi22x1 U5655 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[2][3][6] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[2][5][6] ), .Z(n4229) );
  dti_28hc_7t_30_invx2 U3370 ( .A(n7081), .Z(n7183) );
  dti_28hc_7t_30_aoi22x1 U5914 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[3][3][4] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[3][5][4] ), .Z(n4173) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[4][5]  ( 
        .D(n2884), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[4][5] ) );
  dti_28hc_7t_30_aoi22x3 U3665 ( .A1(n3316), .A2(
        \eda_img_ram/img_memory[1][2][7] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[1][0][7] ), .Z(n3989) );
  dti_28hc_7t_30_nand2x2 U5902 ( .A(n3316), .B(
        \eda_img_ram/img_memory[5][2][4] ), .Z(n4147) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n2730), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][2] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][0][1]  ( .D(n3035), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][1] ) );
  dti_28hc_7t_30_aoi22hplm2x4 U5470 ( .A1(n5081), .A2(n3319), .B1(n5080), .B2(
        n4836), .Z(n3955) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[4][0]  ( 
        .D(n2879), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[4][0] ), .QN(n5445) );
  dti_28hc_7t_30_nand4px2 U5817 ( .A(n4021), .B(n4020), .C(n4019), .D(n4018), 
        .Z(n5117) );
  dti_28hc_7t_30_invx2 U4336 ( .A(n5359), .Z(n3429) );
  dti_28hc_7t_30_oai112hpx2 U3275 ( .C1(n6717), .C2(n7189), .A(n6667), .B(
        n6668), .Z(n2859) );
  dti_28hc_7t_30_and4hpx2 U4085 ( .A(n5261), .B(n5260), .C(n5259), .D(n5258), 
        .Z(n3306) );
  dti_28hc_7t_30_nand3hpx1 U5474 ( .A(n5698), .B(n4758), .C(n5697), .Z(n4759)
         );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][2][2]  ( .D(n3018), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][2] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][0][2]  ( .D(n3082), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][2] ) );
  dti_28hc_7t_30_nand4px2 U5814 ( .A(n4016), .B(n4017), .C(n4015), .D(n4014), 
        .Z(n5114) );
  dti_28hc_7t_30_aoi22x1 U6306 ( .A1(n5115), .A2(n6597), .B1(n4856), .B2(n5114), .Z(n4846) );
  dti_28hc_7t_30_nand4px2 U3894 ( .A(n4209), .B(n4208), .C(n4207), .D(n4206), 
        .Z(n5107) );
  dti_28hc_7t_30_muxi21x2 U3248 ( .D0(n7016), .D1(n7021), .S(n7245), .Z(n2826)
         );
  dti_28hc_7t_30_nand2x1 U6305 ( .A(n5126), .B(n6597), .Z(n4837) );
  dti_28hc_7t_30_nand4px1 U5472 ( .A(n4033), .B(n4032), .C(n4030), .D(n4031), 
        .Z(n3590) );
  dti_28hc_7t_30_nand4px2 U4114 ( .A(n4472), .B(n4473), .C(n4470), .D(n4471), 
        .Z(n5028) );
  dti_28hc_7t_30_nor3px4 U4687 ( .A(n3462), .B(n3472), .C(n6777), .Z(n3742) );
  dti_28hc_7t_30_nand2x1 U5764 ( .A(n6595), .B(
        \eda_img_ram/img_memory[5][5][3] ), .Z(n3917) );
  dti_28hc_7t_30_nand3hpx2 U4989 ( .A(n4351), .B(n3682), .C(n4350), .Z(n5128)
         );
  dti_28hc_7t_30_nand3x2 U3424 ( .A(n6113), .B(n6616), .C(n6650), .Z(n3376) );
  dti_28hc_7t_30_aoi22hpx2 U8061 ( .A1(n3571), .A2(n7128), .B1(
        \eda_iterated_ram/current_row[5][5] ), .B2(n7182), .Z(n7131) );
  dti_28hc_7t_30_and2x1 U5074 ( .A(n4887), .B(n4888), .Z(n6773) );
  dti_28hc_7t_30_aoi22x3 U3662 ( .A1(n4565), .A2(
        \eda_img_ram/img_memory[4][1][7] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[4][4][7] ), .Z(n3299) );
  dti_28hc_7t_30_ffqqnhshpa01lpax3 \eda_fifos/sync_fifo_right/write_control_inst/wr_addr_reg[2]  ( 
        .D(n2804), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/wr_addr [2]), .QN(n6859) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n7811), .CE(n7245), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][5] ) );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n7127), .CE(n7249), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][1] ) );
  dti_28hc_7t_30_ffqqnhshpa01x3 \eda_fifos/sync_fifo_left/write_control_inst/wr_addr_reg[2]  ( 
        .D(n2760), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_left/wr_addr [2]), .QN(n6969) );
  dti_28hc_7t_30_ffqqnhshpa01lpax3 \eda_strobe_ram/strb_memory_reg[4][1]  ( 
        .D(n2467), .CK(clk), .RN(reset_n), .Q(\strb_value[4][1] ), .QN(n3347)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax3 \eda_strobe_ram/strb_memory_reg[3][1]  ( 
        .D(n2473), .CK(clk), .RN(reset_n), .Q(\strb_value[3][1] ), .QN(n7359)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax3 \eda_strobe_ram/strb_memory_reg[5][1]  ( 
        .D(n2461), .CK(clk), .RN(reset_n), .Q(\strb_value[5][1] ), .QN(n7412)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax3 \eda_strobe_ram/strb_memory_reg[2][3]  ( 
        .D(n2477), .CK(clk), .RN(reset_n), .Q(\strb_value[2][3] ), .QN(n7339)
         );
  dti_28hc_7t_30_ffqbckenfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n3804), .CE(n7245), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_nand4px2 U4884 ( .A(n4634), .B(n4633), .C(n4632), .D(n4631), 
        .Z(n5679) );
  dti_28hc_7t_30_nand2x2 U4217 ( .A(n5325), .B(n5362), .Z(n3436) );
  dti_28hc_7t_30_nand2x2 U3561 ( .A(n3290), .B(n5154), .Z(n6137) );
  dti_28hc_7t_30_aoi22x3 U3590 ( .A1(\eda_iterated_ram/current_row[3][4] ), 
        .A2(n3319), .B1(\eda_iterated_ram/current_row[5][4] ), .B2(n4855), .Z(
        n3521) );
  dti_28hc_7t_30_nand4px2 U4739 ( .A(n4330), .B(n4331), .C(n4329), .D(n4328), 
        .Z(n5127) );
  dti_28hc_7t_30_nand4px2 U6003 ( .A(n4315), .B(n4314), .C(n4313), .D(n4312), 
        .Z(n4730) );
  dti_28hc_7t_30_aoi22hpx1 U4973 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[1][4][5] ), .B1(n3606), .B2(
        \eda_img_ram/img_memory[1][1][5] ), .Z(n4315) );
  dti_28hc_7t_30_nand2x2 U5898 ( .A(n3595), .B(
        \eda_img_ram/img_memory[0][2][4] ), .Z(n4141) );
  dti_28hc_7t_30_aoi22x1 U4782 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][4][4] ), .B1(n3608), .B2(
        \eda_img_ram/img_memory[2][1][4] ), .Z(n4166) );
  dti_28hc_7t_30_invx2 U4622 ( .A(n3492), .Z(n3491) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n2737), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n2749), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[2][4]  ( 
        .D(n2738), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n2726), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[4][4]  ( 
        .D(n2750), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][4] ) );
  dti_28hc_7t_30_nor3px1 U7753 ( .A(n6641), .B(n6640), .C(n6635), .Z(n6625) );
  dti_28hc_7t_30_nand2x1 U4428 ( .A(\eda_iterated_ram/current_row[1][5] ), .B(
        \eda_iterated_ram/current_row[1][4] ), .Z(n5170) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n2663), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[5][2]  ( 
        .D(n2798), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][2] ) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[5][0]  ( 
        .D(n2885), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[5][0] ), .QN(n7815) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[2][2][6]  ( .D(n3062), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][2][6] ) );
  dti_28hc_7t_30_oai13rehpx4 U4521 ( .B1(n3454), .B2(n3336), .B3(n3452), .A(
        n5438), .Z(n3451) );
  dti_28hc_7t_30_nand2shzx8 U4162 ( .A(n3356), .B(n3719), .Z(n7430) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n2724), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][2] ) );
  dti_28hc_7t_30_nand4px1 U5889 ( .A(n4127), .B(n4124), .C(n4125), .D(n4126), 
        .Z(n4693) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2789), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2800), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_nand2px1 U7783 ( .A(n7076), .B(n6706), .Z(n6708) );
  dti_28hc_7t_30_bufshzx36 U3688 ( .A(n3998), .Z(n3319) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n2528), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2526), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][4] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2527), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][5] ) );
  dti_28hc_7t_30_nand4px2 U5124 ( .A(n4123), .B(n4122), .C(n4121), .D(n4120), 
        .Z(n4691) );
  dti_28hc_7t_30_aoi22x1 U6254 ( .A1(n4713), .A2(n4855), .B1(n4712), .B2(n3319), .Z(n4718) );
  dti_28hc_7t_30_xnor2optax4 U3587 ( .A(n5689), .B(n5604), .Z(n6140) );
  dti_28hc_7t_30_invx4 U3686 ( .A(n6115), .Z(n5140) );
  dti_28hc_7t_30_ffqbcka01fsux2 \eda_fifos/sync_fifo_downright/write_control_inst/wr_addr_reg[2]  ( 
        .D(n2848), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/wr_addr [2]) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[0][3][5]  ( .D(n3151), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][3][5] ) );
  dti_28hc_7t_30_nand4px1 U6163 ( .A(n4553), .B(n4552), .C(n4551), .D(n4550), 
        .Z(n5040) );
  dti_28hc_7t_30_nand4px2 U5127 ( .A(n4274), .B(n4276), .C(n4277), .D(n4275), 
        .Z(n5139) );
  dti_28hc_7t_30_nand4px2 U4389 ( .A(n4573), .B(n4572), .C(n4571), .D(n4570), 
        .Z(n5041) );
  dti_28hc_7t_30_nand2x1 U6167 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][4][5] ), .Z(n4559) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[0][1][5]  ( .D(n3167), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][1][5] ) );
  dti_28hc_7t_30_aoi22x1 U5123 ( .A1(n3599), .A2(
        \eda_img_ram/img_memory[0][3][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[0][1][3] ), .Z(n4472) );
  dti_28hc_7t_30_muxi21x2 U3247 ( .D0(n3804), .D1(n7058), .S(n7223), .Z(n2775)
         );
  dti_28hc_7t_30_muxi21x2 U4555 ( .D0(n7028), .D1(n7026), .S(n7221), .Z(n2788)
         );
  dti_28hc_7t_30_nand2x1 U5806 ( .A(n5150), .B(
        \eda_img_ram/img_memory[4][0][7] ), .Z(n3991) );
  dti_28hc_7t_30_nand2hpx4 U3955 ( .A(n3683), .B(n3815), .Z(n6630) );
  dti_28hc_7t_30_aoi22x1 U6182 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[3][5][7] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[3][2][7] ), .Z(n4586) );
  dti_28hc_7t_30_and2x2 U3379 ( .A(n4408), .B(n7182), .Z(n6706) );
  dti_28hc_7t_30_nor3px1 U7745 ( .A(n6641), .B(n6626), .C(n6640), .Z(n6614) );
  dti_28hc_7t_30_nand2x1 U5550 ( .A(n3742), .B(n3741), .Z(n5220) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][0][6]  ( .D(n2982), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][6] ) );
  dti_28hc_7t_30_aoi22x1 U4399 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[3][2][3] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[3][0][3] ), .Z(n3898) );
  dti_28hc_7t_30_nor2px2 U5525 ( .A(n6070), .B(n6075), .Z(n5158) );
  dti_28hc_7t_30_ioa12hpx4 U3959 ( .B1(n3483), .B2(n3286), .A(n3337), .Z(n3336) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[1][1][4]  ( .D(n3120), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][1][4] ) );
  dti_28hc_7t_30_nand2x3 U3460 ( .A(n5325), .B(n5284), .Z(n5324) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[4][4]  ( 
        .D(n2883), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[4][4] ), .QN(n7400) );
  dti_28hc_7t_30_nand2i1xp8 U4895 ( .A(n3314), .B(n5281), .Z(n3671) );
  dti_28hc_7t_30_invx2 U4938 ( .A(n4075), .Z(n3362) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[0][5]  ( 
        .D(n2860), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[0][5] ) );
  dti_28hc_7t_30_xor2bx2 U4656 ( .A(n3793), .B(n5614), .Z(n3583) );
  dti_28hc_7t_30_aoi22x1 U5100 ( .A1(n3601), .A2(
        \eda_img_ram/img_memory[1][3][4] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[1][1][4] ), .Z(n4532) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2626), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n2516), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n2534), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n2734), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n2732), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][4] ) );
  dti_28hc_7t_30_ffqbckfsux2 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n2659), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][1] ) );
  dti_28hc_7t_30_nor3px1 U7760 ( .A(n6641), .B(n6640), .C(n6658), .Z(n6649) );
  dti_28hc_7t_30_aoi22rex1 U4272 ( .A1(n3316), .A2(
        \eda_img_ram/img_memory[4][3][3] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[4][2][3] ), .Z(n4489) );
  dti_28hc_7t_30_bufx6 U7830 ( .A(n6840), .Z(n6798) );
  dti_28hc_7t_30_nand2x1 U5828 ( .A(n4602), .B(
        \eda_img_ram/img_memory[3][0][2] ), .Z(n4042) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2733), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n2731), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2623), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2625), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_nand2hpx4 U7856 ( .A(n6861), .B(n6855), .Z(n7213) );
  dti_28hc_7t_30_invx2 U3399 ( .A(n7075), .Z(n6709) );
  dti_28hc_7t_30_nand2x4 U3403 ( .A(n3316), .B(n7182), .Z(n6682) );
  dti_28hc_7t_30_nand3x2 U4537 ( .A(n6674), .B(n6673), .C(n3387), .Z(n2886) );
  dti_28hc_7t_30_nor2px2 U4652 ( .A(n4013), .B(n4012), .Z(n4969) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n2661), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[4][0]  ( 
        .D(n2664), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][0] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2799), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[2][2]  ( 
        .D(n2736), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][2] ) );
  dti_28hc_7t_30_nand4px2 U3897 ( .A(n4983), .B(n4984), .C(n4982), .D(n4981), 
        .Z(n5561) );
  dti_28hc_7t_30_ioa12hpx2 U4909 ( .B1(n5325), .B2(n3767), .A(n3355), .Z(n3354) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n2513), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n2531), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_aoi22hpx1 U3735 ( .A1(n3316), .A2(
        \eda_img_ram/img_memory[0][3][2] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[0][1][2] ), .Z(n4398) );
  dti_28hc_7t_30_aoi22hpx2 U3592 ( .A1(\eda_iterated_ram/current_row[2][1] ), 
        .A2(n3319), .B1(\eda_iterated_ram/current_row[1][1] ), .B2(n6633), .Z(
        n4379) );
  dti_28hc_7t_30_nand4px2 U4090 ( .A(n4029), .B(n4028), .C(n4027), .D(n4026), 
        .Z(n5116) );
  dti_28hc_7t_30_nand2x2 U3695 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][3][2] ), .Z(n4027) );
  dti_28hc_7t_30_nand2x1 U6307 ( .A(n3590), .B(n6604), .Z(n4844) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[1][5]  ( 
        .D(n2866), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[1][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[2][0]  ( 
        .D(n2522), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][0] ) );
  dti_28hc_7t_30_invx3 U4167 ( .A(n3850), .Z(n7230) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n2506), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[0][2] ) );
  dti_28hc_7t_30_aoi22rehpx1 U5918 ( .A1(n4445), .A2(
        \eda_img_ram/img_memory[0][0][4] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[0][5][4] ), .Z(n4177) );
  dti_28hc_7t_30_muxi21x1 U5649 ( .D0(n7153), .D1(n6207), .S(n6234), .Z(n2707)
         );
  dti_28hc_7t_30_nor2px2 U4508 ( .A(n7292), .B(n3395), .Z(n3753) );
  dti_28hc_7t_30_nand2x1 U6624 ( .A(n7322), .B(
        \eda_iterated_ram/current_row[2][0] ), .Z(n7327) );
  dti_28hc_7t_30_or2x1 U4354 ( .A(n7337), .B(
        \eda_iterated_ram/current_row[2][3] ), .Z(n3447) );
  dti_28hc_7t_30_nand2x1 U4351 ( .A(n7286), .B(n3460), .Z(n5221) );
  dti_28hc_7t_30_nand2x2 U4991 ( .A(n3817), .B(n5435), .Z(n3783) );
  dti_28hc_7t_30_nor3pmhzoptax6 U4153 ( .A(n4669), .B(n6757), .C(n6754), .Z(
        n4906) );
  dti_28hc_7t_30_ffqbcka01fsux4 \eda_fifos/sync_fifo_down/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2586), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/wr_addr [0]) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[0][4]  ( .D(
        n2499), .CK(clk), .RN(reset_n), .Q(\strb_value[0][4] ), .QN(n7298) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[5][0]  ( .D(
        n2462), .CK(clk), .RN(reset_n), .Q(\strb_value[5][0] ), .QN(n7408) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[1][5]  ( .D(
        n2492), .CK(clk), .RN(reset_n), .Q(\strb_value[1][5] ), .QN(n3402) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[1][0]  ( .D(
        n2497), .CK(clk), .RN(reset_n), .Q(\strb_value[1][0] ), .QN(n3475) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[0][5]  ( .D(
        n2498), .CK(clk), .RN(reset_n), .Q(\strb_value[0][5] ), .QN(n7303) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[1][2]  ( .D(
        n2495), .CK(clk), .RN(reset_n), .Q(\strb_value[1][2] ), .QN(n3437) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[4][0]  ( .D(
        n2468), .CK(clk), .RN(reset_n), .Q(\strb_value[4][0] ), .QN(n7380) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[4][4]  ( .D(
        n2464), .CK(clk), .RN(reset_n), .Q(\strb_value[4][4] ), .QN(n7397) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[5][4]  ( .D(
        n2436), .CK(clk), .RN(reset_n), .Q(\strb_value[5][4] ), .QN(n7428) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[3][4]  ( .D(
        n2470), .CK(clk), .RN(reset_n), .Q(\strb_value[3][4] ), .QN(n7368) );
  dti_28hc_7t_30_ffqqnhshpa01x8 \eda_strobe_ram/strb_memory_reg[5][5]  ( .D(
        n2435), .CK(clk), .RN(reset_n), .Q(\strb_value[5][5] ), .QN(n3499) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n2595), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2568), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][3] ) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n2571), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[3][0] ) );
  dti_28hc_7t_30_ffqbckfsux2 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n2552), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqbcka01fox4 \eda_fifos/sync_fifo_downright/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2847), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/wr_addr [3]) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n2639), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqqnhshplpax3 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[0][4]  ( 
        .D(n2682), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[0][4] ), .QN(
        n6988) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[2][1]  ( 
        .D(n2868), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[2][1] ), .QN(n5447) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[0][2][4]  ( .D(n3160), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][2][4] ) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[1][1]  ( 
        .D(n2862), .CK(n7449), .RN(reset_n), .QN(n5451) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[3][0]  ( 
        .D(n2873), .CK(n7449), .RN(reset_n), .QN(n7552) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[1][2]  ( 
        .D(n2863), .CK(n7449), .RN(reset_n), .QN(n3542) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[5][2]  ( 
        .D(n2887), .CK(n7449), .RN(reset_n), .QN(n5163) );
  dti_28hc_7t_30_nand2x1 U6121 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][4][6] ), .Z(n4507) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[1][0]  ( 
        .D(n2861), .CK(n7449), .RN(reset_n), .QN(n7551) );
  dti_28hc_7t_30_aoi22x1 U4761 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][4][2] ), .B1(
        \eda_img_ram/img_memory[3][1][2] ), .B2(n3605), .Z(n4045) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[3][2]  ( 
        .D(n2875), .CK(n7449), .RN(reset_n), .QN(n7553) );
  dti_28hc_7t_30_aoi22x1 U5878 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[4][4][1] ), .B1(n3602), .B2(
        \eda_img_ram/img_memory[4][1][1] ), .Z(n4115) );
  dti_28hc_7t_30_nand2x1 U5957 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][2][6] ), .Z(n4239) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[0][2]  ( 
        .D(n2857), .CK(n7449), .RN(reset_n), .QN(n5459) );
  dti_28hc_7t_30_nand4px2 U5265 ( .A(n3924), .B(n3923), .C(n3922), .D(n3921), 
        .Z(n5696) );
  dti_28hc_7t_30_nand2x1 U6150 ( .A(n4408), .B(
        \eda_img_ram/img_memory[3][0][4] ), .Z(n4533) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[4][1]  ( 
        .D(n2880), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[4][1] ), .QN(n5536) );
  dti_28hc_7t_30_nor2px4 U4094 ( .A(n3414), .B(n3781), .Z(n7132) );
  dti_28hc_7t_30_nand4px2 U6117 ( .A(n4501), .B(n4500), .C(n4499), .D(n4498), 
        .Z(n5019) );
  dti_28hc_7t_30_aoi22x1 U6803 ( .A1(n5691), .A2(n5720), .B1(n5774), .B2(n5772), .Z(n5693) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[3][3]  ( 
        .D(n2525), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[3][3] ) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][3][5]  ( .D(n2911), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][3][5] ) );
  dti_28hc_7t_30_oai12x1 U4485 ( .B1(n5877), .B2(n5876), .A(n5875), .Z(n6032)
         );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[3][1][5]  ( .D(n3023), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][5] ) );
  dti_28hc_7t_30_nand2x1 U5799 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][2][7] ), .Z(n3977) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[1][5]  ( 
        .D(n2558), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][5] ) );
  dti_28hc_7t_30_invx3 U7751 ( .A(n7129), .Z(n7190) );
  dti_28hc_7t_30_nand2x1 U5793 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][2][7] ), .Z(n3969) );
  dti_28hc_7t_30_nand4px1 U5256 ( .A(n4749), .B(n4747), .C(n4748), .D(n4746), 
        .Z(n5694) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[4][4][4]  ( .D(n2952), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][4][4] ) );
  dti_28hc_7t_30_xnor2bx1 U5580 ( .A(n5562), .B(n4750), .Z(n5113) );
  dti_28hc_7t_30_nand2x1 U3435 ( .A(n6141), .B(n6140), .Z(n6142) );
  dti_28hc_7t_30_aoi22x1 U4939 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[4][2][3] ), .B1(n7613), .B2(
        \eda_img_ram/img_memory[4][0][3] ), .Z(n3904) );
  dti_28hc_7t_30_aoi22x1 U6253 ( .A1(n4711), .A2(n3309), .B1(n4710), .B2(n4856), .Z(n4719) );
  dti_28hc_7t_30_aoi22x1 U5844 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[0][4][2] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[0][5][2] ), .Z(n4065) );
  dti_28hc_7t_30_nand2x3 U3868 ( .A(n4603), .B(
        \eda_img_ram/img_memory[5][3][4] ), .Z(n4148) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_img_ram/img_memory_reg[5][1][7]  ( .D(n2925), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][1][7] ) );
  dti_28hc_7t_30_aoi22x1 U4264 ( .A1(n5117), .A2(n6657), .B1(n3319), .B2(n5119), .Z(n4845) );
  dti_28hc_7t_30_nand2x1 U4940 ( .A(\eda_iterated_ram/current_row[0][1] ), .B(
        \eda_iterated_ram/current_row[0][2] ), .Z(n5172) );
  dti_28hc_7t_30_ffqnhshpa10x4 \eda_fifos/sync_fifo_upleft/write_control_inst/wr_addr_reg[2]  ( 
        .D(n4363), .CK(n7449), .SN(reset_n), .QN(
        \eda_fifos/sync_fifo_upleft/wr_addr [2]) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[0][3]  ( 
        .D(n2858), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[0][3] ), .QN(n5460) );
  dti_28hc_7t_30_nand3hpx1 U6230 ( .A(n6725), .B(n4937), .C(n4924), .Z(n4674)
         );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2583), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_invx1 U3542 ( .A(n4868), .Z(n4871) );
  dti_28hc_7t_30_and2hpx4 U3488 ( .A(n6646), .B(n4680), .Z(n7181) );
  dti_28hc_7t_30_nand3x1 U5055 ( .A(n4948), .B(n4949), .C(n4947), .Z(n3481) );
  dti_28hc_7t_30_invx1 U7042 ( .A(\eda_fifos/sync_fifo_right/rd_addr [1]), .Z(
        n5994) );
  dti_28hc_7t_30_and2x2 U4391 ( .A(n4662), .B(n4408), .Z(n6178) );
  dti_28hc_7t_30_ffqbcka01fox4 \eda_fifos/sync_fifo_downleft/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2541), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/wr_addr [3]) );
  dti_28hc_7t_30_invx1 U6619 ( .A(n5441), .Z(n5442) );
  dti_28hc_7t_30_nand2px4 U4016 ( .A(n6751), .B(n6753), .Z(n4669) );
  dti_28hc_7t_30_bufmhzx44 U4824 ( .A(n3287), .Z(n6086) );
  dti_28hc_7t_30_nand2x1 U6149 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][4][4] ), .Z(n4534) );
  dti_28hc_7t_30_aoi22x3 U5608 ( .A1(n3604), .A2(
        \eda_img_ram/img_memory[3][2][3] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[3][1][3] ), .Z(n3943) );
  dti_28hc_7t_30_nand2x1 U5306 ( .A(n6806), .B(n3679), .Z(n4950) );
  dti_28hc_7t_30_invx3 U3465 ( .A(n3477), .Z(n3454) );
  dti_28hc_7t_30_nand2x1 U4130 ( .A(n3742), .B(n3739), .Z(n3476) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2669), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_nand4px1 U4743 ( .A(n4410), .B(n4411), .C(n4412), .D(n4409), 
        .Z(n3616) );
  dti_28hc_7t_30_nor2x3 U3504 ( .A(n3465), .B(n3464), .Z(n7286) );
  dti_28hc_7t_30_aoi22x1 U5829 ( .A1(n3601), .A2(
        \eda_img_ram/img_memory[4][1][2] ), .B1(n7613), .B2(
        \eda_img_ram/img_memory[4][0][2] ), .Z(n4049) );
  dti_28hc_7t_30_nand2hpx2 U3388 ( .A(n4360), .B(n3324), .Z(n6942) );
  dti_28hc_7t_30_aoi22hpx1 U5251 ( .A1(n4998), .A2(n6616), .B1(n4997), .B2(
        n6633), .Z(n5003) );
  dti_28hc_7t_30_aoi22x1 U5997 ( .A1(n3604), .A2(
        \eda_img_ram/img_memory[2][1][5] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[2][3][5] ), .Z(n4311) );
  dti_28hc_7t_30_aoi22x1 U6138 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[0][5][4] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[0][2][4] ), .Z(n4527) );
  dti_28hc_7t_30_nand4px2 U4957 ( .A(n4111), .B(n4108), .C(n4109), .D(n4110), 
        .Z(n4690) );
  dti_28hc_7t_30_nand4px2 U4125 ( .A(n4119), .B(n4118), .C(n4117), .D(n4116), 
        .Z(n4689) );
  dti_28hc_7t_30_aoi22x1 U4788 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[4][5][6] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[4][2][6] ), .Z(n4496) );
  dti_28hc_7t_30_aoi12hpx2 U5053 ( .B1(n3854), .B2(n4920), .A(n3478), .Z(n3477) );
  dti_28hc_7t_30_nand2x1 U3930 ( .A(n6711), .B(n6707), .Z(n6680) );
  dti_28hc_7t_30_oai112hpx2 U4539 ( .C1(n6709), .C2(n7189), .A(n6705), .B(
        n6704), .Z(n2890) );
  dti_28hc_7t_30_muxi21x2 U3249 ( .D0(n6896), .D1(n6865), .S(n7221), .Z(n2786)
         );
  dti_28hc_7t_30_aoi22x1 U4768 ( .A1(n3603), .A2(
        \eda_img_ram/img_memory[1][3][7] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[1][1][7] ), .Z(n4600) );
  dti_28hc_7t_30_nand2x1 U5794 ( .A(n3604), .B(
        \eda_img_ram/img_memory[3][1][7] ), .Z(n3968) );
  dti_28hc_7t_30_muxi21x1 U4589 ( .D0(n7153), .D1(n7143), .S(n7209), .Z(n2625)
         );
  dti_28hc_7t_30_nand2x1 U5800 ( .A(n3604), .B(
        \eda_img_ram/img_memory[2][1][7] ), .Z(n3976) );
  dti_28hc_7t_30_muxi21x1 U5609 ( .D0(n7153), .D1(n7144), .S(n7211), .Z(n2619)
         );
  dti_28hc_7t_30_ffqbckx2 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n2593), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][3] ) );
  dti_28hc_7t_30_oa12x2 U4226 ( .B1(n6048), .B2(n6943), .A(n7201), .Z(n4363)
         );
  dti_28hc_7t_30_nand2x1 U5865 ( .A(n5150), .B(
        \eda_img_ram/img_memory[1][0][1] ), .Z(n4084) );
  dti_28hc_7t_30_nand2x1 U5538 ( .A(n7186), .B(n7075), .Z(n6685) );
  dti_28hc_7t_30_nand4px2 U5296 ( .A(n4795), .B(n4793), .C(n3803), .D(n4794), 
        .Z(n4816) );
  dti_28hc_7t_30_xnor2bx2 U4663 ( .A(n5615), .B(n5613), .Z(n5091) );
  dti_28hc_7t_30_aoi22rex2 U4030 ( .A1(n3607), .A2(
        \eda_img_ram/img_memory[4][2][1] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[4][1][1] ), .Z(n4089) );
  dti_28hc_7t_30_nor2hpoptax6 U3831 ( .A(n3265), .B(n3264), .Z(n3234) );
  dti_28hc_7t_30_invx2 U3369 ( .A(n6682), .Z(n7185) );
  dti_28hc_7t_30_nand2px2 U3661 ( .A(n5095), .B(n3320), .Z(n4159) );
  dti_28hc_7t_30_oai112hpx2 U3274 ( .C1(n7190), .C2(n7189), .A(n7188), .B(
        n7187), .Z(n2858) );
  dti_28hc_7t_30_ffqbckx2 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[4][3]  ( 
        .D(n2617), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][3] ) );
  dti_28hc_7t_30_aoi22x1 U5857 ( .A1(\eda_iterated_ram/current_row[2][4] ), 
        .A2(n3320), .B1(\eda_iterated_ram/current_row[4][4] ), .B2(n3309), .Z(
        n4074) );
  dti_28hc_7t_30_nand2x1 U5954 ( .A(n4702), .B(n5140), .Z(n4244) );
  dti_28hc_7t_30_and2x1 U4010 ( .A(n3957), .B(n3956), .Z(n3297) );
  dti_28hc_7t_30_aoi22x1 U5854 ( .A1(n5151), .A2(n6122), .B1(n5153), .B2(n3593), .Z(n4971) );
  dti_28hc_7t_30_oai12x3 U4415 ( .B1(\eda_fifos/sync_fifo_downleft/wr_addr [2]), .B2(n3761), .A(n4890), .Z(n3760) );
  dti_28hc_7t_30_nand4px1 U4744 ( .A(n4115), .B(n4114), .C(n4113), .D(n4112), 
        .Z(n4692) );
  dti_28hc_7t_30_nand3x2 U5527 ( .A(n6672), .B(n3776), .C(n6671), .Z(n2868) );
  dti_28hc_7t_30_aoi22rex1 U6152 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[4][5][4] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[4][2][4] ), .Z(n4539) );
  dti_28hc_7t_30_aoi22x3 U3717 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[4][4][4] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[4][1][4] ), .Z(n4152) );
  dti_28hc_7t_30_nand2x1 U6019 ( .A(n6191), .B(
        \eda_img_ram/img_memory[2][5][5] ), .Z(n4346) );
  dti_28hc_7t_30_aoi22x1 U6031 ( .A1(\eda_iterated_ram/current_row[3][3] ), 
        .A2(n3320), .B1(\eda_iterated_ram/current_row[1][3] ), .B2(n6633), .Z(
        n4370) );
  dti_28hc_7t_30_ffqqnhshpa01x4 \eda_iterated_ram/iterated_memory_reg[5][3]  ( 
        .D(n2888), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[5][3] ), .QN(n5164) );
  dti_28hc_7t_30_ffqbcka01fsux4 \eda_fifos/sync_fifo_left/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2759), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_left/wr_addr [3]) );
  dti_28hc_7t_30_invshzx6 U3609 ( .A(n3241), .Z(n5866) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n2751), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_aoi22rex1 U4763 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[3][0][5] ), .B1(n3599), .B2(
        \eda_img_ram/img_memory[3][3][5] ), .Z(n4557) );
  dti_28hc_7t_30_ffqbcka01fsux4 \eda_iterated_ram/iterated_memory_reg[2][0]  ( 
        .D(n2867), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[2][0] ) );
  dti_28hc_7t_30_oai112x3 U3804 ( .C1(n7133), .C2(n6714), .A(n6691), .B(n6692), 
        .Z(n2884) );
  dti_28hc_7t_30_oai112hpx2 U4542 ( .C1(n6682), .C2(n7189), .A(n6676), .B(
        n6677), .Z(n2856) );
  dti_28hc_7t_30_nand3x2 U3927 ( .A(n7131), .B(n3276), .C(n3278), .Z(n2892) );
  dti_28hc_7t_30_aoi22x1 U4273 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[0][1][5] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[0][3][5] ), .Z(n4323) );
  dti_28hc_7t_30_nor2hpx4 U4329 ( .A(n6844), .B(n6797), .Z(n3385) );
  dti_28hc_7t_30_bufx16 U3653 ( .A(n4210), .Z(n4836) );
  dti_28hc_7t_30_bufmhzx6 U5516 ( .A(n6842), .Z(n3687) );
  dti_28hc_7t_30_aoi22x1 U4786 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[5][3][2] ), .B1(
        \eda_img_ram/img_memory[5][5][2] ), .B2(n4582), .Z(n3637) );
  dti_28hc_7t_30_aoi22x1 U5839 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[5][1][2] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[5][0][2] ), .Z(n4061) );
  dti_28hc_7t_30_nand4px2 U5700 ( .A(n6140), .B(n6133), .C(n6130), .D(n6141), 
        .Z(n4751) );
  dti_28hc_7t_30_aoi22x1 U5886 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[5][3][1] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[5][5][1] ), .Z(n4126) );
  dti_28hc_7t_30_nand2x1 U5882 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][2][1] ), .Z(n4116) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[0][5]  ( 
        .D(n2727), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][5] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n2725), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[0][3] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n2739), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][5] ) );
  dti_28hc_7t_30_invmhzx8 U4628 ( .A(n6610), .Z(n3497) );
  dti_28hc_7t_30_ffqnhshpa01lpax3 \eda_iterated_ram/iterated_memory_reg[2][2]  ( 
        .D(n2869), .CK(n7449), .RN(reset_n), .QN(n7605) );
  dti_28hc_7t_30_invshzx12 U3422 ( .A(\eda_iterated_ram/have_done ), .Z(n7182)
         );
  dti_28hc_7t_30_nand3x2 U5006 ( .A(n6649), .B(n6650), .C(n6648), .Z(n3842) );
  dti_28hc_7t_30_nand2x4 U3943 ( .A(n4541), .B(
        \eda_img_ram/img_memory[4][4][1] ), .Z(n3281) );
  dti_28hc_7t_30_muxi21x2 U3244 ( .D0(n7178), .D1(n7181), .S(n7249), .Z(n2833)
         );
  dti_28hc_7t_30_invx6 U3331 ( .A(n5430), .Z(n7021) );
  dti_28hc_7t_30_invmhzx8 U3745 ( .A(n3592), .Z(n3606) );
  dti_28hc_7t_30_nand2x2 U7782 ( .A(n7186), .B(n6706), .Z(n6704) );
  dti_28hc_7t_30_invx1 U4425 ( .A(n4869), .Z(n4870) );
  dti_28hc_7t_30_ffqbckfsux4 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n2660), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_ffqbckfsux2 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[1][4]  ( 
        .D(n2776), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][4] ) );
  dti_28hc_7t_30_ffqbckx2 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[1][0]  ( 
        .D(n2646), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][0] ) );
  dti_28hc_7t_30_nand2x1 U6458 ( .A(n3612), .B(n3317), .Z(n5085) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[4][1]  ( 
        .D(n2615), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][1] ) );
  dti_28hc_7t_30_ffqbckfsux2 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n2619), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[0][2]  ( 
        .D(n2592), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][2] ) );
  dti_28hc_7t_30_nand2x2 U5805 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][3][7] ), .Z(n3992) );
  dti_28hc_7t_30_ffqa01lpax4 \eda_controller/center_addr_reg[5]  ( .D(n3186), 
        .CK(clk), .RN(reset_n), .Q(left_addr[5]) );
  dti_28hc_7t_30_ffqbcka01x1 \eda_fifos/sync_fifo_left/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2762), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_left/rd_addr [3]) );
  dti_28hc_7t_30_ffqbcka10xp5 \eda_output_ram/matrix_output_reg[5][4]  ( .D(
        n2433), .CK(clk), .SN(reset_n), .Q(\matrix_output[5][4] ) );
  dti_28hc_7t_30_ffqbcka10xp5 \eda_output_ram/matrix_output_reg[1][5]  ( .D(
        n2491), .CK(clk), .SN(reset_n), .Q(\matrix_output[1][5] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[3][1]  ( 
        .D(n2697), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[3][1] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[3][4]  ( 
        .D(n2788), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[3][4] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[5][3]  ( 
        .D(n2580), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][3] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem_reg[5][1]  ( 
        .D(n2709), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[5][1] ) );
  dti_28hc_7t_30_ffqbckx1 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[0][3]  ( 
        .D(n2637), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][3] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem_reg[3][5]  ( 
        .D(n2833), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][5] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[5][4]  ( 
        .D(n2624), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n2573), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_ffqbckfsux2 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[4][5]  ( 
        .D(n2795), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][5] ) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[4][2]  ( 
        .D(n2466), .CK(clk), .RN(reset_n), .Q(\strb_value[4][2] ), .QN(n7388)
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_strobe_ram/strb_memory_reg[0][0]  ( .D(
        n7437), .CK(clk), .RN(reset_n), .Q(n7444) );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_right/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2807), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/rd_addr [2]) );
  dti_28hc_7t_30_ffqqnbckx1 \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem_reg[2][1]  ( 
        .D(n2603), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[2][1] ), .QN(
        n7115) );
  dti_28hc_7t_30_ffqqnbckx2 \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem_reg[3][0]  ( 
        .D(n2746), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[3][0] ), .QN(
        n7261) );
  dti_28hc_7t_30_ffqbckx1 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[1][3]  ( 
        .D(n2643), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[1][3] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][3][7]  ( .D(
        n2957), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][3][7] )
         );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[5][0]  ( 
        .D(n2802), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][0] ) );
  dti_28hc_7t_30_ffqbckfsux1 \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem_reg[5][5]  ( 
        .D(n2801), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][5] ) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[0][2]  ( 
        .D(n2501), .CK(clk), .RN(reset_n), .Q(\strb_value[0][2] ), .QN(n6232)
         );
  dti_28hc_7t_30_ffqbcka01fsux1 \eda_fifos/sync_fifo_down/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2855), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/wr_addr [1]) );
  dti_28hc_7t_30_ffqbckx1 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[2][3]  ( 
        .D(n2519), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[2][3] ) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[1][1]  ( 
        .D(n2496), .CK(clk), .RN(reset_n), .Q(\strb_value[1][1] ), .QN(n3657)
         );
  dti_28hc_7t_30_ffqa01lpax4 \eda_controller/center_addr_reg[4]  ( .D(n7446), 
        .CK(clk), .RN(reset_n), .Q(left_addr[4]) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][5][1]  ( .D(
        pixel_in[1]), .CE(n7725), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][5][1] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[4][3][1]  ( .D(
        pixel_in[1]), .CE(n6539), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][3][1] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[4][4][1]  ( .D(
        pixel_in[1]), .CE(n7718), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][4][1] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[4][5][1]  ( .D(
        pixel_in[1]), .CE(n7719), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][5][1] ) );
  dti_28hc_7t_30_invx6 U3747 ( .A(n3308), .Z(n3595) );
  dti_28hc_7t_30_invx2 U3751 ( .A(n4210), .Z(n4154) );
  dti_28hc_7t_30_invmhzx8 U4963 ( .A(n4340), .Z(n6122) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][5][1]  ( .D(
        pixel_in[1]), .CE(n6587), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][5][1] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][3][4]  ( .D(
        n2960), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][3][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][3][1]  ( .D(
        n3107), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][3][1] )
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][3][3]  ( .D(
        pixel_in[3]), .CE(n6562), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][3][3] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][4][1]  ( .D(
        pixel_in[1]), .CE(n7722), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][4][1] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][4][3]  ( .D(
        pixel_in[3]), .CE(n6566), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][4][3] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][5][1]  ( .D(
        pixel_in[1]), .CE(n6553), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][5][1] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][4][5]  ( .D(
        pixel_in[5]), .CE(n6566), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][4][5] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][5][1]  ( .D(
        pixel_in[1]), .CE(n6564), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][5][1] ) );
  dti_28hc_7t_30_bufmhzx14 U3759 ( .A(n3901), .Z(n6174) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[0][5][6]  ( .D(
        pixel_in[6]), .CE(n6587), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][5][6] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][3][4]  ( .D(
        pixel_in[4]), .CE(n6573), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][3][4] ) );
  dti_28hc_7t_30_bufmhzx22 U4834 ( .A(n3287), .Z(n4603) );
  dti_28hc_7t_30_invshzx6 U3750 ( .A(n3308), .Z(n3599) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][4][1]  ( .D(
        pixel_in[1]), .CE(n6555), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][4][1] ) );
  dti_28hc_7t_30_nand2x1 U4935 ( .A(n3287), .B(
        \eda_img_ram/img_memory[4][3][1] ), .Z(n4088) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][4][4]  ( .D(
        n3000), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][4][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][4][3]  ( .D(
        n2953), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][4][3] )
         );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[3][0][4]  ( .D(n3032), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][4] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][3][7]  ( .D(
        n2909), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][3][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][0][2]  ( .D(
        n2986), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][0][2] )
         );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[0][0][1]  ( .D(
        pixel_in[1]), .CE(n6592), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][0][1] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][5][4]  ( .D(
        n2944), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][5][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][3][1]  ( .D(
        n3059), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][3][1] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][1][1]  ( .D(
        n3075), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][1] )
         );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][1][5]  ( .D(
        pixel_in[5]), .CE(n6560), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][1][5] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[3][5][4]  ( .D(
        pixel_in[4]), .CE(n6575), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][5][4] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][4][1]  ( .D(
        pixel_in[1]), .CE(n6589), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][4][1] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][1][3]  ( .D(
        pixel_in[3]), .CE(n6560), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][1][3] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][2][3]  ( .D(
        pixel_in[3]), .CE(n6568), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][2][3] ) );
  dti_28hc_7t_30_invx3 U3740 ( .A(n3308), .Z(n3608) );
  dti_28hc_7t_30_invx6 U3925 ( .A(n3308), .Z(n3602) );
  dti_28hc_7t_30_invx4 U3749 ( .A(n3308), .Z(n3603) );
  dti_28hc_7t_30_nand2x1 U5903 ( .A(n3593), .B(
        \eda_img_ram/img_memory[3][2][4] ), .Z(n4156) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][2][0]  ( .D(
        pixel_in[0]), .CE(n7714), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][2][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[4][3][2]  ( .D(
        pixel_in[2]), .CE(n6539), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][3][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][3][2]  ( .D(
        pixel_in[2]), .CE(n7720), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][3][2] ) );
  dti_28hc_7t_30_nand2x2 U3734 ( .A(n7631), .B(n7074), .Z(n4756) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][5][3]  ( .D(
        pixel_in[3]), .CE(n6587), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][5][3] ) );
  dti_28hc_7t_30_invx6 U4820 ( .A(n3592), .Z(n3607) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][4][2]  ( .D(
        pixel_in[2]), .CE(n6566), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][4][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][4][5]  ( .D(
        pixel_in[5]), .CE(n6589), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][4][5] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][2][4]  ( .D(
        pixel_in[4]), .CE(n6568), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][2][4] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][4][2]  ( .D(
        pixel_in[2]), .CE(n7722), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][4][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][4][3]  ( .D(
        pixel_in[3]), .CE(n6577), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][4][3] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][5][5]  ( .D(
        pixel_in[5]), .CE(n7725), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][5][5] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][5][5]  ( .D(
        pixel_in[5]), .CE(n6564), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][5][5] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][3][3]  ( .D(
        pixel_in[3]), .CE(n6585), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][3][3] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][3][5]  ( .D(
        pixel_in[5]), .CE(n6562), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][3][5] ) );
  dti_28hc_7t_30_nand2x1 U5928 ( .A(n6174), .B(
        \eda_img_ram/img_memory[0][5][6] ), .Z(n4191) );
  dti_28hc_7t_30_aoi22hpx1 U5561 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][5][4] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[4][0][4] ), .Z(n4153) );
  dti_28hc_7t_30_aoi22rex1 U4755 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[1][0][1] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[1][2][1] ), .Z(n4419) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][5][2]  ( .D(
        pixel_in[2]), .CE(n6553), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][5][2] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][1][7]  ( .D(
        pixel_in[7]), .CE(n6583), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][1][7] ) );
  dti_28hc_7t_30_invshzx6 U5779 ( .A(n4003), .Z(n4565) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][1][5]  ( .D(
        n2975), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][2][4]  ( .D(
        n2920), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][2][4] )
         );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][3][7]  ( .D(
        pixel_in[7]), .CE(n6585), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][3][7] ) );
  dti_28hc_7t_30_nand2x1 U5904 ( .A(n4541), .B(
        \eda_img_ram/img_memory[3][4][4] ), .Z(n4155) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][2][3]  ( .D(
        n3065), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][2][3] )
         );
  dti_28hc_7t_30_nand2x1 U5810 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][3][7] ), .Z(n4005) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][1][3]  ( .D(
        n3073), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][2][2]  ( .D(
        n2922), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][2][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][2][4]  ( .D(
        n3064), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][2][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][3][4]  ( .D(
        n2912), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][3][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][1][1]  ( .D(
        n2979), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][1] )
         );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][3][2]  ( .D(
        pixel_in[2]), .CE(n6562), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][3][2] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][3][3]  ( .D(
        n3009), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][3][3] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][2][3]  ( .D(
        n2969), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][2][3] )
         );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[4][1][3]  ( .D(n2977), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][3] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][0][4]  ( .D(
        n3176), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][0][4] )
         );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][1][3]  ( .D(
        pixel_in[3]), .CE(n6583), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][1][3] ) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[3][4][1]  ( .D(n3003), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][4][1] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[2][3][4]  ( .D(
        pixel_in[4]), .CE(n6551), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][3][4] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][5][4]  ( .D(
        n3136), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][5][4] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][2][5]  ( .D(
        n3159), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][2][5] )
         );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][0][2]  ( .D(
        pixel_in[2]), .CE(n6570), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][0][2] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][2][3]  ( .D(
        pixel_in[3]), .CE(n6590), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][2][3] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[3][3][6]  ( .D(
        pixel_in[6]), .CE(n6573), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][3][6] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[2][5][4]  ( .D(
        pixel_in[4]), .CE(n6553), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][5][4] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[0][3][4]  ( .D(
        pixel_in[4]), .CE(n6585), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][3][4] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[0][4][4]  ( .D(
        pixel_in[4]), .CE(n6589), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][4][4] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[2][4][4]  ( .D(
        pixel_in[4]), .CE(n6555), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][4][4] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[5][5][2]  ( .D(
        pixel_in[2]), .CE(n7725), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][5][2] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][3][4]  ( .D(
        pixel_in[4]), .CE(n6562), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][3][4] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][4][3]  ( .D(
        pixel_in[3]), .CE(n6589), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][4][3] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[5][5][4]  ( .D(
        pixel_in[4]), .CE(n7725), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][5][4] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][0][3]  ( .D(
        pixel_in[3]), .CE(n6592), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][0][3] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][1][4]  ( .D(
        pixel_in[4]), .CE(n6583), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][1][4] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][0][2]  ( .D(
        pixel_in[2]), .CE(n6592), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][0][2] ) );
  dti_28hc_7t_30_nand2x1 U5811 ( .A(n6191), .B(
        \eda_img_ram/img_memory[5][5][7] ), .Z(n4004) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][5][2]  ( .D(
        pixel_in[2]), .CE(n6564), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][5][2] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][1][2]  ( .D(
        pixel_in[2]), .CE(n6560), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][1][2] ) );
  dti_28hc_7t_30_aoi22hpx1 U4879 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[4][4][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[4][0][3] ), .Z(n3938) );
  dti_28hc_7t_30_nand4px1 U6066 ( .A(n4420), .B(n4419), .C(n4418), .D(n4417), 
        .Z(n5008) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[3][0][0]  ( .D(n3036), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][0] ) );
  dti_28hc_7t_30_aoi22x3 U3875 ( .A1(n4445), .A2(
        \eda_img_ram/img_memory[0][1][4] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[0][4][4] ), .Z(n3257) );
  dti_28hc_7t_30_nand2x2 U6020 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][3][5] ), .Z(n4345) );
  dti_28hc_7t_30_nand2x2 U5983 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][3][0] ), .Z(n4278) );
  dti_28hc_7t_30_nand3x1 U3706 ( .A(n3302), .B(n4477), .C(n4476), .Z(n5030) );
  dti_28hc_7t_30_aoi22x2 U3705 ( .A1(n3595), .A2(
        \eda_img_ram/img_memory[5][2][5] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[5][0][5] ), .Z(n4350) );
  dti_28hc_7t_30_aoi22x1 U3671 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[0][2][5] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[0][0][5] ), .Z(n4334) );
  dti_28hc_7t_30_or2x1 U3723 ( .A(n7631), .B(n7074), .Z(n5160) );
  dti_28hc_7t_30_nand2x2 U5867 ( .A(n4603), .B(
        \eda_img_ram/img_memory[5][3][1] ), .Z(n4091) );
  dti_28hc_7t_30_invx1 U3737 ( .A(n4191), .Z(n3303) );
  dti_28hc_7t_30_aoi22rehpx1 U4885 ( .A1(n3603), .A2(
        \eda_img_ram/img_memory[0][2][1] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[0][1][1] ), .Z(n4101) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][5][5]  ( .D(
        pixel_in[5]), .CE(n6575), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][5][5] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][3][6]  ( .D(
        n3102), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][3][6] )
         );
  dti_28hc_7t_30_aoi22x2 U3725 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[2][4][1] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[2][0][1] ), .Z(n4096) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][5][7]  ( .D(
        pixel_in[7]), .CE(n6564), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][5][7] ) );
  dti_28hc_7t_30_nand2xp8 U5982 ( .A(n3595), .B(
        \eda_img_ram/img_memory[2][2][0] ), .Z(n4279) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][5][7]  ( .D(
        pixel_in[7]), .CE(n6575), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][5][7] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][4][6]  ( .D(
        n3094), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][4][6] )
         );
  dti_28hc_7t_30_nand2x1 U5900 ( .A(n3595), .B(
        \eda_img_ram/img_memory[2][2][4] ), .Z(n4144) );
  dti_28hc_7t_30_nand2x1 U5933 ( .A(n4603), .B(
        \eda_img_ram/img_memory[4][3][6] ), .Z(n4207) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][5][0]  ( .D(
        pixel_in[0]), .CE(n6553), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][5][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][1][6]  ( .D(
        pixel_in[6]), .CE(n6560), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][1][6] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][3][7]  ( .D(
        pixel_in[7]), .CE(n6562), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][3][7] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][2][7]  ( .D(
        pixel_in[7]), .CE(n6568), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][2][7] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][4][0]  ( .D(
        pixel_in[0]), .CE(n6566), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][4][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][1][6]  ( .D(
        pixel_in[6]), .CE(n6583), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][1][6] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][1][0]  ( .D(
        pixel_in[0]), .CE(n6560), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][1][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][2][7]  ( .D(
        pixel_in[7]), .CE(n6590), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][2][7] ) );
  dti_28hc_7t_30_aoi22x1 U3724 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[0][5][2] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[0][2][2] ), .Z(n4399) );
  dti_28hc_7t_30_aoi22x2 U4918 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[4][4][6] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[4][1][6] ), .Z(n4208) );
  dti_28hc_7t_30_aoi22hpx1 U5164 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][5][6] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[4][0][6] ), .Z(n4209) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][3][0]  ( .D(
        pixel_in[0]), .CE(n6585), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][3][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[4][4][7]  ( .D(
        pixel_in[7]), .CE(n7718), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][4][7] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][2][6]  ( .D(
        pixel_in[6]), .CE(n6568), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][2][6] ) );
  dti_28hc_7t_30_nand2x1 U5932 ( .A(n5150), .B(
        \eda_img_ram/img_memory[3][0][6] ), .Z(n4202) );
  dti_28hc_7t_30_nand2x1 U5872 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][3][1] ), .Z(n4098) );
  dti_28hc_7t_30_aoi22hpx1 U4906 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][5][4] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[2][0][4] ), .Z(n4146) );
  dti_28hc_7t_30_aoi22x1 U4927 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[5][4][5] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[5][1][5] ), .Z(n4351) );
  dti_28hc_7t_30_aoi22rex1 U5534 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[3][5][3] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[3][2][3] ), .Z(n4469) );
  dti_28hc_7t_30_aoi22rex1 U6052 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[4][5][2] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[4][2][2] ), .Z(n4402) );
  dti_28hc_7t_30_nand2x1 U6013 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][3][5] ), .Z(n4332) );
  dti_28hc_7t_30_aoi22xp8 U3716 ( .A1(n4445), .A2(
        \eda_img_ram/img_memory[5][2][2] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[5][1][2] ), .Z(n3636) );
  dti_28hc_7t_30_nand2xp8 U6050 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][4][2] ), .Z(n4397) );
  dti_28hc_7t_30_nand2xp8 U6099 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][4][3] ), .Z(n4471) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][5][6]  ( .D(
        n2894), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][5][6] )
         );
  dti_28hc_7t_30_nand2x2 U3731 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][3][4] ), .Z(n4143) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[2][4][6]  ( .D(
        pixel_in[6]), .CE(n6555), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][4][6] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][2][0]  ( .D(
        n3164), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][2][0] )
         );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[2][0][5]  ( .D(n3079), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][5] ) );
  dti_28hc_7t_30_aoi22rex1 U4031 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[4][0][1] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[4][1][1] ), .Z(n4423) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][5][7]  ( .D(
        n3037), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][5][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][2][5]  ( .D(
        n3015), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][5] )
         );
  dti_28hc_7t_30_aoi22x1 U5169 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[3][2][2] ), .B1(
        \eda_img_ram/img_memory[3][5][2] ), .B2(n6080), .Z(n4395) );
  dti_28hc_7t_30_nand2x1 U5989 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][3][0] ), .Z(n4289) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][0][6]  ( .D(
        n3174), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][0][6] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][1][6]  ( .D(
        n2926), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][1][6] )
         );
  dti_28hc_7t_30_nand2x1 U5808 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][3][7] ), .Z(n4000) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][5][7]  ( .D(
        n3133), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][5][7] )
         );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[3][3][0]  ( .D(
        pixel_in[0]), .CE(n6573), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][3][0] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][3][6]  ( .D(
        pixel_in[6]), .CE(n6585), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][3][6] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][0][7]  ( .D(
        pixel_in[7]), .CE(n6570), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][0][7] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][0][6]  ( .D(
        pixel_in[6]), .CE(n6570), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][0][6] ) );
  dti_28hc_7t_30_nand2x1 U5873 ( .A(n6191), .B(
        \eda_img_ram/img_memory[3][5][1] ), .Z(n4103) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][1][7]  ( .D(
        n2973), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][1][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][1][0]  ( .D(
        n2932), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][1][0] )
         );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][5][0]  ( .D(
        pixel_in[0]), .CE(n6587), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][5][0] ) );
  dti_28hc_7t_30_nand2x2 U5874 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][3][1] ), .Z(n4102) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][3][7]  ( .D(
        n3005), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][3][7] )
         );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[0][0][0]  ( .D(
        pixel_in[0]), .CE(n6592), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][0][0] ) );
  dti_28hc_7t_30_invx4 U3713 ( .A(n3308), .Z(n3604) );
  dti_28hc_7t_30_invx3 U3691 ( .A(n6626), .Z(n3317) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[1][0][0]  ( .D(
        pixel_in[0]), .CE(n6570), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][0][0] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[0][4][0]  ( .D(
        pixel_in[0]), .CE(n6589), .CK(clk), .RN(reset_n), .Q(n3554) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[1][5][0]  ( .D(
        pixel_in[0]), .CE(n6564), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][5][0] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[3][5][0]  ( .D(
        pixel_in[0]), .CE(n6575), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][5][0] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[2][5][6]  ( .D(
        pixel_in[6]), .CE(n6553), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][5][6] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[2][3][7]  ( .D(
        pixel_in[7]), .CE(n6551), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][3][7] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[3][4][0]  ( .D(
        pixel_in[0]), .CE(n6577), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][4][0] ) );
  dti_28hc_7t_30_aoi22x3 U5646 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[0][4][1] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[0][0][1] ), .Z(n4100) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[1][4][7]  ( .D(
        pixel_in[7]), .CE(n6566), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][4][7] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[0][1][0]  ( .D(
        pixel_in[0]), .CE(n6583), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][1][0] ) );
  dti_28hc_7t_30_ffqbckena01x1 \eda_img_ram/img_memory_reg[2][4][7]  ( .D(
        pixel_in[7]), .CE(n6555), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][4][7] ) );
  dti_28hc_7t_30_nand2xp8 U6014 ( .A(n6191), .B(
        \eda_img_ram/img_memory[4][5][5] ), .Z(n4337) );
  dti_28hc_7t_30_nand2xp8 U6012 ( .A(n6191), .B(
        \eda_img_ram/img_memory[0][5][5] ), .Z(n4333) );
  dti_28hc_7t_30_nand2px1 U3689 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][3][5] ), .Z(n4341) );
  dti_28hc_7t_30_aoi22rehpx1 U3715 ( .A1(n5150), .A2(
        \eda_img_ram/img_memory[2][1][2] ), .B1(
        \eda_img_ram/img_memory[2][5][2] ), .B2(n6080), .Z(n3631) );
  dti_28hc_7t_30_aoi22hpx1 U3727 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[1][5][4] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[1][0][4] ), .Z(n4139) );
  dti_28hc_7t_30_nand4px1 U6070 ( .A(n4424), .B(n4423), .C(n4422), .D(n4421), 
        .Z(n5005) );
  dti_28hc_7t_30_nand4px1 U5168 ( .A(n4395), .B(n4394), .C(n4393), .D(n4392), 
        .Z(n4988) );
  dti_28hc_7t_30_and2x1 U3710 ( .A(n4290), .B(n4289), .Z(n3263) );
  dti_28hc_7t_30_aoi22x3 U4926 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[0][5][2] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[0][0][2] ), .Z(n4037) );
  dti_28hc_7t_30_aoi22x3 U5001 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][5][7] ), .B1(n3602), .B2(
        \eda_img_ram/img_memory[4][2][7] ), .Z(n3993) );
  dti_28hc_7t_30_aoi22rex1 U3692 ( .A1(n6122), .A2(
        \eda_img_ram/img_memory[0][1][6] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[0][0][6] ), .Z(n4192) );
  dti_28hc_7t_30_aoi22rehpx2 U4936 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[5][5][2] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[5][0][2] ), .Z(n4029) );
  dti_28hc_7t_30_nand2x1 U5825 ( .A(n3603), .B(
        \eda_img_ram/img_memory[0][2][2] ), .Z(n4034) );
  dti_28hc_7t_30_aoi22x1 U3681 ( .A1(n3593), .A2(
        \eda_img_ram/img_memory[3][2][5] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[3][0][5] ), .Z(n4330) );
  dti_28hc_7t_30_aoi22rehpx1 U4783 ( .A1(n3595), .A2(
        \eda_img_ram/img_memory[5][2][6] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[5][4][6] ), .Z(n4214) );
  dti_28hc_7t_30_nor2x1 U4370 ( .A(n3413), .B(n3411), .Z(n3410) );
  dti_28hc_7t_30_aoi22x1 U3673 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[4][4][0] ), .B1(n4591), .B2(
        \eda_img_ram/img_memory[4][1][0] ), .Z(n4291) );
  dti_28hc_7t_30_aoi22rehpx1 U5258 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[2][1][2] ), .B1(
        \eda_img_ram/img_memory[2][4][2] ), .B2(n6080), .Z(n4016) );
  dti_28hc_7t_30_nand2x1 U5813 ( .A(n3602), .B(
        \eda_img_ram/img_memory[2][2][2] ), .Z(n4014) );
  dti_28hc_7t_30_aoi22x2 U3848 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[3][4][5] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[3][1][5] ), .Z(n4331) );
  dti_28hc_7t_30_aoi22hpx1 U4787 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[0][5][7] ), .B1(n3608), .B2(
        \eda_img_ram/img_memory[0][2][7] ), .Z(n4002) );
  dti_28hc_7t_30_aoi22x2 U4969 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][4][0] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[5][1][0] ), .Z(n4295) );
  dti_28hc_7t_30_aoi22x2 U4878 ( .A1(n3601), .A2(
        \eda_img_ram/img_memory[1][2][6] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[1][4][6] ), .Z(n4197) );
  dti_28hc_7t_30_nand2x1 U6011 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][3][5] ), .Z(n4328) );
  dti_28hc_7t_30_nor2x3 U3693 ( .A(n5589), .B(n5160), .Z(n6616) );
  dti_28hc_7t_30_aoi22x6 U4913 ( .A1(n3593), .A2(
        \eda_img_ram/img_memory[2][2][7] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[2][0][7] ), .Z(n3996) );
  dti_28hc_7t_30_nand2x2 U5984 ( .A(n3607), .B(
        \eda_img_ram/img_memory[3][2][0] ), .Z(n4283) );
  dti_28hc_7t_30_nand2x2 U5986 ( .A(n3606), .B(
        \eda_img_ram/img_memory[0][2][0] ), .Z(n4285) );
  dti_28hc_7t_30_aoi22x2 U3900 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[1][4][0] ), .B1(n7517), .B2(
        \eda_img_ram/img_memory[1][1][0] ), .Z(n4276) );
  dti_28hc_7t_30_aoi22hpx1 U3701 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][5][2] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[4][0][2] ), .Z(n4021) );
  dti_28hc_7t_30_nand2xp8 U5991 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][3][0] ), .Z(n4293) );
  dti_28hc_7t_30_nand2x1 U5920 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][2][4] ), .Z(n4175) );
  dti_28hc_7t_30_aoi22rex1 U4781 ( .A1(n3595), .A2(
        \eda_img_ram/img_memory[0][2][6] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[0][4][6] ), .Z(n4193) );
  dti_28hc_7t_30_nand2xp8 U5824 ( .A(n4603), .B(
        \eda_img_ram/img_memory[0][3][2] ), .Z(n4035) );
  dti_28hc_7t_30_aoi22x6 U5102 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[0][4][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[0][0][3] ), .Z(n3946) );
  dti_28hc_7t_30_aoi22rex1 U4771 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[5][5][0] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[5][0][0] ), .Z(n4296) );
  dti_28hc_7t_30_aoi22hpoptax4 U3999 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[3][1][0] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[3][4][0] ), .Z(n3294) );
  dti_28hc_7t_30_nand2x1 U5802 ( .A(n6086), .B(
        \eda_img_ram/img_memory[3][3][7] ), .Z(n3983) );
  dti_28hc_7t_30_nand2xp8 U5990 ( .A(n3602), .B(
        \eda_img_ram/img_memory[5][2][0] ), .Z(n4294) );
  dti_28hc_7t_30_nand3px2 U5134 ( .A(n3878), .B(n4097), .C(n4096), .Z(n5074)
         );
  dti_28hc_7t_30_nand2x1 U5929 ( .A(n6191), .B(
        \eda_img_ram/img_memory[1][5][6] ), .Z(n4194) );
  dti_28hc_7t_30_nand2x2 U5087 ( .A(n6191), .B(
        \eda_img_ram/img_memory[2][5][7] ), .Z(n3995) );
  dti_28hc_7t_30_aoi22rehpx2 U5465 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[1][4][3] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[1][0][3] ), .Z(n3952) );
  dti_28hc_7t_30_aoi22rehpx1 U5987 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[4][5][0] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[4][0][0] ), .Z(n4292) );
  dti_28hc_7t_30_nand2x2 U5245 ( .A(n6191), .B(
        \eda_img_ram/img_memory[1][5][3] ), .Z(n3950) );
  dti_28hc_7t_30_aoi22hpx1 U5596 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[2][4][3] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[2][1][3] ), .Z(n3934) );
  dti_28hc_7t_30_nand4px1 U5183 ( .A(n4032), .B(n4033), .C(n4031), .D(n4030), 
        .Z(n5118) );
  dti_28hc_7t_30_nand4x1 U6174 ( .A(n4569), .B(n4568), .C(n4567), .D(n4566), 
        .Z(n5043) );
  dti_28hc_7t_30_aoi22x1 U6146 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[3][5][4] ), .B1(n7613), .B2(
        \eda_img_ram/img_memory[3][2][4] ), .Z(n4536) );
  dti_28hc_7t_30_aoi22hpx1 U5224 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[0][5][6] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[0][2][6] ), .Z(n4500) );
  dti_28hc_7t_30_aoi22x1 U5761 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[1][2][3] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[1][0][3] ), .Z(n3915) );
  dti_28hc_7t_30_aoi22x1 U5791 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][4][7] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[3][3][7] ), .Z(n3971) );
  dti_28hc_7t_30_aoi22hpx1 U5255 ( .A1(n4988), .A2(n6616), .B1(n4987), .B2(
        n6633), .Z(n4993) );
  dti_28hc_7t_30_aoi22x1 U5162 ( .A1(n5027), .A2(n3320), .B1(n3309), .B2(n5026), .Z(n5035) );
  dti_28hc_7t_30_aoi22rex1 U3664 ( .A1(n3593), .A2(
        \eda_img_ram/img_memory[2][3][5] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[2][1][5] ), .Z(n4563) );
  dti_28hc_7t_30_aoi22rex1 U4777 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[2][0][6] ), .B1(n3599), .B2(
        \eda_img_ram/img_memory[2][3][6] ), .Z(n4512) );
  dti_28hc_7t_30_aoi22x1 U4795 ( .A1(n3608), .A2(
        \eda_img_ram/img_memory[4][3][4] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[4][1][4] ), .Z(n4540) );
  dti_28hc_7t_30_aoi22rex1 U5468 ( .A1(n3601), .A2(
        \eda_img_ram/img_memory[3][3][6] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[3][1][6] ), .Z(n4508) );
  dti_28hc_7t_30_aoi22hpx1 U3979 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[1][5][4] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[1][2][4] ), .Z(n4531) );
  dti_28hc_7t_30_aoi22hpx1 U5603 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[3][3][1] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[3][5][1] ), .Z(n4110) );
  dti_28hc_7t_30_aoi22hpx1 U5784 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[1][4][7] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[1][3][7] ), .Z(n3963) );
  dti_28hc_7t_30_aoi22x1 U4762 ( .A1(n3593), .A2(
        \eda_img_ram/img_memory[1][1][2] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[1][0][2] ), .Z(n4057) );
  dti_28hc_7t_30_aoi22rex1 U4756 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[5][1][3] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[5][3][3] ), .Z(n3919) );
  dti_28hc_7t_30_aoi22rex1 U6176 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[0][5][5] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[0][2][5] ), .Z(n4573) );
  dti_28hc_7t_30_aoi22rex1 U3964 ( .A1(n3605), .A2(
        \eda_img_ram/img_memory[1][1][3] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[1][3][3] ), .Z(n3914) );
  dti_28hc_7t_30_aoi22rex1 U5185 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][4][0] ), .B1(n3599), .B2(
        \eda_img_ram/img_memory[3][1][0] ), .Z(n4250) );
  dti_28hc_7t_30_aoi22rexp8 U5970 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[5][4][0] ), .B1(n3593), .B2(
        \eda_img_ram/img_memory[5][1][0] ), .Z(n4265) );
  dti_28hc_7t_30_aoi22rex1 U5522 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[2][5][4] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[2][2][4] ), .Z(n4545) );
  dti_28hc_7t_30_aoi22rex1 U4191 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[0][1][3] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[0][3][3] ), .Z(n3924) );
  dti_28hc_7t_30_aoi22rex1 U5781 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][4][7] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[4][3][7] ), .Z(n3959) );
  dti_28hc_7t_30_aoi22hpx1 U4276 ( .A1(n3316), .A2(
        \eda_img_ram/img_memory[0][3][5] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[0][1][5] ), .Z(n4572) );
  dti_28hc_7t_30_aoi22hpx1 U5637 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[5][2][3] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[5][0][3] ), .Z(n3918) );
  dti_28hc_7t_30_aoi22hpx1 U5266 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[0][2][3] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[0][0][3] ), .Z(n3923) );
  dti_28hc_7t_30_nand4px1 U6126 ( .A(n4511), .B(n4512), .C(n4510), .D(n4509), 
        .Z(n5017) );
  dti_28hc_7t_30_nand4px1 U5636 ( .A(n4250), .B(n4249), .C(n4248), .D(n4247), 
        .Z(n4765) );
  dti_28hc_7t_30_nand4px1 U4674 ( .A(n4994), .B(n4992), .C(n4991), .D(n4993), 
        .Z(n5541) );
  dti_28hc_7t_30_nand4px1 U4386 ( .A(n4242), .B(n4241), .C(n4240), .D(n4239), 
        .Z(n4701) );
  dti_28hc_7t_30_aoi22x1 U6466 ( .A1(n5127), .A2(n5429), .B1(n5126), .B2(n6633), .Z(n5132) );
  dti_28hc_7t_30_nand4x1 U5940 ( .A(n4222), .B(n4221), .C(n4220), .D(n4219), 
        .Z(n4700) );
  dti_28hc_7t_30_aoi22xp8 U3823 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[0][3][2] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[0][0][2] ), .Z(n4064) );
  dti_28hc_7t_30_aoi22x1 U5228 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[3][3][2] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[3][5][2] ), .Z(n4044) );
  dti_28hc_7t_30_nand2x1 U5823 ( .A(n5118), .B(n6633), .Z(n4039) );
  dti_28hc_7t_30_invx1 U3634 ( .A(n5589), .Z(n6635) );
  dti_28hc_7t_30_nand2x2 U3851 ( .A(n5127), .B(n3320), .Z(n3820) );
  dti_28hc_7t_30_nand2x2 U3641 ( .A(n5128), .B(n6597), .Z(n4352) );
  dti_28hc_7t_30_aoi22x1 U5606 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[2][3][4] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[2][5][4] ), .Z(n4165) );
  dti_28hc_7t_30_aoi22x1 U4753 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[4][4][0] ), .B1(n3599), .B2(
        \eda_img_ram/img_memory[4][1][0] ), .Z(n4254) );
  dti_28hc_7t_30_aoi22x2 U4028 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[1][3][5] ), .B1(
        \eda_img_ram/img_memory[1][5][5] ), .B2(n6595), .Z(n4314) );
  dti_28hc_7t_30_aoi22rex1 U4790 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[1][4][1] ), .B1(n3602), .B2(
        \eda_img_ram/img_memory[1][1][1] ), .Z(n4123) );
  dti_28hc_7t_30_nand3px1 U3631 ( .A(n3958), .B(n3297), .C(n3959), .Z(n4722)
         );
  dti_28hc_7t_30_nand2x1 U6001 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][2][5] ), .Z(n4313) );
  dti_28hc_7t_30_aoi22x3 U5818 ( .A1(n5114), .A2(n3319), .B1(n5117), .B2(n4836), .Z(n4041) );
  dti_28hc_7t_30_aoi22hpx4 U5464 ( .A1(n5084), .A2(n6597), .B1(n3587), .B2(
        n6633), .Z(n3700) );
  dti_28hc_7t_30_aoi22hpx1 U6430 ( .A1(n4976), .A2(n6616), .B1(n4975), .B2(
        n6633), .Z(n4984) );
  dti_28hc_7t_30_aoi22hpx1 U4035 ( .A1(n4724), .A2(n6633), .B1(n4721), .B2(
        n3320), .Z(n4643) );
  dti_28hc_7t_30_aoi22rex1 U3627 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[3][3][7] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[3][1][7] ), .Z(n4585) );
  dti_28hc_7t_30_nand4px1 U5579 ( .A(n5146), .B(n5144), .C(n5145), .D(n5147), 
        .Z(n5595) );
  dti_28hc_7t_30_nand4px2 U4133 ( .A(n5123), .B(n5122), .C(n5121), .D(n5120), 
        .Z(n5598) );
  dti_28hc_7t_30_nand2xp8 U6127 ( .A(n5017), .B(n3319), .Z(n4518) );
  dti_28hc_7t_30_nand4px1 U4685 ( .A(n4642), .B(n4641), .C(n4643), .D(n4640), 
        .Z(n5612) );
  dti_28hc_7t_30_and2x1 U4694 ( .A(n4647), .B(n4646), .Z(n3549) );
  dti_28hc_7t_30_aoi22hpx1 U6208 ( .A1(n4702), .A2(n6597), .B1(n4701), .B2(
        n6604), .Z(n4639) );
  dti_28hc_7t_30_nand4px2 U4148 ( .A(n4201), .B(n4200), .C(n4198), .D(n4199), 
        .Z(n5104) );
  dti_28hc_7t_30_aoi22x1 U4725 ( .A1(n4989), .A2(n4855), .B1(n4990), .B2(n5589), .Z(n3633) );
  dti_28hc_7t_30_aoi22x1 U3622 ( .A1(n5075), .A2(n4836), .B1(n5070), .B2(n6657), .Z(n4830) );
  dti_28hc_7t_30_aoi22x1 U6142 ( .A1(n4979), .A2(n6597), .B1(n4975), .B2(n6604), .Z(n4549) );
  dti_28hc_7t_30_aoi22hpx1 U5110 ( .A1(n5029), .A2(n3320), .B1(n5028), .B2(
        n5589), .Z(n4493) );
  dti_28hc_7t_30_aoi22x1 U3633 ( .A1(n4741), .A2(n6633), .B1(n4740), .B2(n4836), .Z(n4649) );
  dti_28hc_7t_30_nand2xp8 U6283 ( .A(n5008), .B(n6604), .Z(n4790) );
  dti_28hc_7t_30_invshzx8 U3922 ( .A(n5891), .Z(n3613) );
  dti_28hc_7t_30_aoi22hpx1 U5225 ( .A1(n4980), .A2(n6633), .B1(n4976), .B2(
        n3320), .Z(n4548) );
  dti_28hc_7t_30_aoi22hpx1 U4373 ( .A1(n5021), .A2(n5589), .B1(n5018), .B2(
        n3319), .Z(n4798) );
  dti_28hc_7t_30_nand2x1 U5178 ( .A(n4985), .B(n6657), .Z(n3627) );
  dti_28hc_7t_30_nand2xp8 U6284 ( .A(n5005), .B(n6657), .Z(n4789) );
  dti_28hc_7t_30_aoi22x1 U5597 ( .A1(n5006), .A2(n3319), .B1(n5007), .B2(n4856), .Z(n4792) );
  dti_28hc_7t_30_invx3 U4905 ( .A(n5576), .Z(n5548) );
  dti_28hc_7t_30_nand2xp5 U6299 ( .A(n5074), .B(n4856), .Z(n4829) );
  dti_28hc_7t_30_aoi22x1 U4041 ( .A1(n5044), .A2(n6633), .B1(n5039), .B2(n3319), .Z(n4576) );
  dti_28hc_7t_30_aoi22hpx4 U5667 ( .A1(n5075), .A2(n3309), .B1(n5070), .B2(
        n4836), .Z(n3881) );
  dti_28hc_7t_30_nand4px1 U4676 ( .A(n3638), .B(n3633), .C(n3630), .D(n3627), 
        .Z(n5649) );
  dti_28hc_7t_30_nand4px1 U3877 ( .A(n4831), .B(n4830), .C(n4829), .D(n4828), 
        .Z(n5651) );
  dti_28hc_7t_30_aoi22x1 U3879 ( .A1(n5097), .A2(n5589), .B1(n3548), .B2(n4836), .Z(n4826) );
  dti_28hc_7t_30_nand2x2 U4944 ( .A(n5106), .B(n6597), .Z(n4215) );
  dti_28hc_7t_30_aoi22x1 U4383 ( .A1(n4692), .A2(n4836), .B1(n4689), .B2(n3319), .Z(n4630) );
  dti_28hc_7t_30_aoi22rex1 U4342 ( .A1(n5548), .A2(n5575), .B1(n5582), .B2(
        n5584), .Z(n5555) );
  dti_28hc_7t_30_nand4px1 U3846 ( .A(n4638), .B(n4639), .C(n4637), .D(n4636), 
        .Z(n5578) );
  dti_28hc_7t_30_aoi22xp8 U3967 ( .A1(n5053), .A2(n4855), .B1(n5051), .B2(
        n3309), .Z(n4779) );
  dti_28hc_7t_30_nand2xp5 U6276 ( .A(n5050), .B(n4856), .Z(n4777) );
  dti_28hc_7t_30_invx3 U3606 ( .A(n5134), .Z(n3774) );
  dti_28hc_7t_30_aoi22hpx1 U5626 ( .A1(n3593), .A2(
        \eda_img_ram/img_memory[0][3][0] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[0][1][0] ), .Z(n4443) );
  dti_28hc_7t_30_aoi22rex1 U4773 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[3][0][0] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[3][1][0] ), .Z(n4448) );
  dti_28hc_7t_30_aoi22rehpx2 U3601 ( .A1(n3391), .A2(n5603), .B1(n5866), .B2(
        n5597), .Z(n5565) );
  dti_28hc_7t_30_nand4px1 U5659 ( .A(n4453), .B(n4452), .C(n4451), .D(n4450), 
        .Z(n4995) );
  dti_28hc_7t_30_nand4x1 U6092 ( .A(n4457), .B(n4456), .C(n4455), .D(n4454), 
        .Z(n4999) );
  dti_28hc_7t_30_nand4x1 U6079 ( .A(n4439), .B(n4440), .C(n4438), .D(n4437), 
        .Z(n5000) );
  dti_28hc_7t_30_aoi22x1 U6280 ( .A1(n4998), .A2(n3319), .B1(n4995), .B2(n4856), .Z(n4787) );
  dti_28hc_7t_30_or2xp5 U6801 ( .A(n5751), .B(n5752), .Z(n5718) );
  dti_28hc_7t_30_ffqqnhshpa01x2 \eda_iterated_ram/iterated_memory_reg[2][3]  ( 
        .D(n2870), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[2][3] ) );
  dti_28hc_7t_30_ffqqnhshpa01x3 \eda_iterated_ram/iterated_memory_reg[5][5]  ( 
        .D(n2892), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[5][5] ), .QN(n5169) );
  dti_28hc_7t_30_aoi22x1 U4720 ( .A1(n5695), .A2(n5589), .B1(n5696), .B2(n4757), .Z(n4758) );
  dti_28hc_7t_30_nand2x2 U5856 ( .A(\eda_iterated_ram/current_row[5][4] ), .B(
        n5140), .Z(n4075) );
  dti_28hc_7t_30_aoi13x2 U3595 ( .B1(n5719), .B2(n5718), .B3(n5717), .A(n5716), 
        .Z(n5773) );
  dti_28hc_7t_30_nand2xp8 U3586 ( .A(\eda_iterated_ram/current_row[1][1] ), 
        .B(n3317), .Z(n3349) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_up/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2678), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/wr_addr [1]) );
  dti_28hc_7t_30_nand2xp8 U5026 ( .A(\eda_iterated_ram/current_row[5][1] ), 
        .B(n4855), .Z(n3419) );
  dti_28hc_7t_30_aoi22hpx1 U5718 ( .A1(\eda_iterated_ram/current_row[4][1] ), 
        .A2(n4836), .B1(\eda_iterated_ram/current_row[0][1] ), .B2(n5589), .Z(
        n4380) );
  dti_28hc_7t_30_nand2xp8 U4829 ( .A(\eda_iterated_ram/current_row[4][1] ), 
        .B(n3309), .Z(n3330) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_iterated_ram/iterated_memory_reg[4][3]  ( 
        .D(n2882), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[4][3] ), .QN(n5515) );
  dti_28hc_7t_30_nand2xp8 U5858 ( .A(\eda_iterated_ram/current_row[0][5] ), 
        .B(n6633), .Z(n4080) );
  dti_28hc_7t_30_ffqnhpa01lpax1 \eda_fifos/sync_fifo_left/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2761), .CK(n7449), .RN(reset_n), .QN(n7721) );
  dti_28hc_7t_30_invx1 U3575 ( .A(n6114), .Z(n6119) );
  dti_28hc_7t_30_ffqbcka01fox1 \eda_fifos/sync_fifo_up/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2674), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/rd_addr [3]) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_fifos/sync_fifo_left/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2766), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_left/wr_addr [1]), .QN(n6970) );
  dti_28hc_7t_30_and2x1 U4695 ( .A(n4271), .B(n4270), .Z(n3840) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_down/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2584), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/wr_addr [3]) );
  dti_28hc_7t_30_nand2x2 U5852 ( .A(\eda_iterated_ram/current_row[2][0] ), .B(
        n3320), .Z(n4071) );
  dti_28hc_7t_30_aoi22x3 U4398 ( .A1(\eda_iterated_ram/current_row[4][3] ), 
        .A2(n3309), .B1(\eda_iterated_ram/current_row[1][3] ), .B2(n3317), .Z(
        n3352) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upright/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2721), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/rd_addr [1]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_up/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2677), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/rd_addr [1]) );
  dti_28hc_7t_30_aoi22x3 U5025 ( .A1(\eda_iterated_ram/current_row[4][1] ), 
        .A2(n6657), .B1(\eda_iterated_ram/current_row[3][1] ), .B2(n3319), .Z(
        n3420) );
  dti_28hc_7t_30_aoi22hpx1 U5885 ( .A1(n4689), .A2(n3320), .B1(n4691), .B2(
        n3317), .Z(n4134) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_down/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2589), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/rd_addr [0]) );
  dti_28hc_7t_30_aoi22xp8 U4810 ( .A1(\eda_iterated_ram/current_row[4][3] ), 
        .A2(n4836), .B1(\eda_iterated_ram/current_row[0][3] ), .B2(n5589), .Z(
        n4372) );
  dti_28hc_7t_30_invx4 U3788 ( .A(\eda_fifos/sync_fifo_downleft/wr_addr [1]), 
        .Z(n6880) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_fifos/sync_fifo_upright/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2722), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/wr_addr [1]), .QN(n3673) );
  dti_28hc_7t_30_aoi22hpx1 U3777 ( .A1(\eda_iterated_ram/current_row[4][5] ), 
        .A2(n4836), .B1(\eda_iterated_ram/current_row[5][5] ), .B2(n3309), .Z(
        n3485) );
  dti_28hc_7t_30_ffqa01lpax1 \eda_fifos/sync_fifo_left/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2765), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_left/rd_addr [1]) );
  dti_28hc_7t_30_nand2x1 U4410 ( .A(\eda_iterated_ram/current_row[4][4] ), .B(
        n6657), .Z(n3518) );
  dti_28hc_7t_30_nand2x1 U4409 ( .A(\eda_iterated_ram/current_row[1][4] ), .B(
        n6604), .Z(n3519) );
  dti_28hc_7t_30_nand2x1 U4411 ( .A(\eda_iterated_ram/current_row[2][1] ), .B(
        n3320), .Z(n3348) );
  dti_28hc_7t_30_aoi22rex1 U5855 ( .A1(\eda_iterated_ram/current_row[1][4] ), 
        .A2(n3317), .B1(\eda_iterated_ram/current_row[0][4] ), .B2(n6633), .Z(
        n4076) );
  dti_28hc_7t_30_nand2x1 U4283 ( .A(\eda_iterated_ram/current_row[1][5] ), .B(
        n6633), .Z(n4385) );
  dti_28hc_7t_30_aoi22x1 U3585 ( .A1(\eda_iterated_ram/current_row[3][5] ), 
        .A2(n3319), .B1(\eda_iterated_ram/current_row[1][5] ), .B2(n5589), .Z(
        n3514) );
  dti_28hc_7t_30_xnor2optax4 U3795 ( .A(n3241), .B(n5686), .Z(n6141) );
  dti_28hc_7t_30_aoi22x3 U4278 ( .A1(\eda_iterated_ram/current_row[2][5] ), 
        .A2(n3319), .B1(\eda_iterated_ram/current_row[3][5] ), .B2(n3320), .Z(
        n3486) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_fifos/sync_fifo_up/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2671), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_up/wr_addr [3]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upleft/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2631), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upleft/rd_addr [2]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_right/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2805), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/wr_addr [0]) );
  dti_28hc_7t_30_ffqa01lpax1 \eda_fifos/sync_fifo_upright/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2718), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/rd_addr [3]) );
  dti_28hc_7t_30_nand4px1 U4394 ( .A(n3786), .B(n3787), .C(n4374), .D(n4373), 
        .Z(n4615) );
  dti_28hc_7t_30_nand2x1 U3778 ( .A(n5014), .B(n5015), .Z(n6196) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upleft/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2629), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upleft/wr_addr [0]) );
  dti_28hc_7t_30_nor2hpx1 U6295 ( .A(n6119), .B(n3264), .Z(n4820) );
  dti_28hc_7t_30_ffqbcka01x4 \eda_fifos/sync_fifo_upright/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2717), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/wr_addr [0]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_upright/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2719), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/rd_addr [2]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_downleft/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2544), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/rd_addr [3]) );
  dti_28hc_7t_30_ffqbcka01fox2 \eda_fifos/sync_fifo_down/write_control_inst/wr_addr_reg[2]  ( 
        .D(n2585), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_down/wr_addr [2]) );
  dti_28hc_7t_30_nand2xp5 U6028 ( .A(\eda_iterated_ram/current_row[2][0] ), 
        .B(n3319), .Z(n4364) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_left/read_control_inst/rd_addr_reg[2]  ( 
        .D(n2763), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_left/rd_addr [2]) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_fifos/sync_fifo_upright/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2715), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_upright/wr_addr [3]) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_fifos/sync_fifo_right/write_control_inst/wr_addr_reg[3]  ( 
        .D(n2803), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/wr_addr [3]), .QN(n6188) );
  dti_28hc_7t_30_nand3hpx1 U3780 ( .A(n3830), .B(n4245), .C(n4246), .Z(n5873)
         );
  dti_28hc_7t_30_nand3hpx1 U3578 ( .A(n4272), .B(n4273), .C(n3840), .Z(n5898)
         );
  dti_28hc_7t_30_invx1 U5063 ( .A(\eda_fifos/sync_fifo_up/rd_addr [3]), .Z(
        n3506) );
  dti_28hc_7t_30_invx2 U4121 ( .A(n3813), .Z(n3625) );
  dti_28hc_7t_30_ioa12hpx1 U5072 ( .B1(n6859), .B2(
        \eda_fifos/sync_fifo_right/rd_addr [2]), .A(n4888), .Z(n3530) );
  dti_28hc_7t_30_nand2x1 U6473 ( .A(n5151), .B(n4592), .Z(n5152) );
  dti_28hc_7t_30_xnor2bx1 U6226 ( .A(\eda_fifos/sync_fifo_up/rd_addr [0]), .B(
        \eda_fifos/sync_fifo_up/wr_addr [0]), .Z(n5493) );
  dti_28hc_7t_30_nand2x1 U4049 ( .A(n4823), .B(n4592), .Z(n3658) );
  dti_28hc_7t_30_nand2px2 U3560 ( .A(n6204), .B(n6194), .Z(n5038) );
  dti_28hc_7t_30_xnor2x1 U4208 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_downleft/wr_addr [2]), .Z(n4891) );
  dti_28hc_7t_30_nor3x2 U4854 ( .A(n5174), .B(n5173), .C(n5172), .Z(n7305) );
  dti_28hc_7t_30_muxi21optax4 U3948 ( .D0(n5157), .D1(n5156), .S(n3702), .Z(
        n4972) );
  dti_28hc_7t_30_nand2x2 U4108 ( .A(n4376), .B(n4375), .Z(n6179) );
  dti_28hc_7t_30_nor2x3 U4145 ( .A(n3710), .B(n6896), .Z(n3807) );
  dti_28hc_7t_30_nand3i1x2 U3553 ( .A(n6817), .B(n4885), .C(n3301), .Z(n3663)
         );
  dti_28hc_7t_30_nor2x1 U4689 ( .A(n3711), .B(n6896), .Z(n6181) );
  dti_28hc_7t_30_nand2x1 U5148 ( .A(n5151), .B(n4408), .Z(n6198) );
  dti_28hc_7t_30_invx2 U4052 ( .A(n6651), .Z(n6081) );
  dti_28hc_7t_30_nand2x2 U4107 ( .A(n6177), .B(n4774), .Z(n3701) );
  dti_28hc_7t_30_nand2px2 U5287 ( .A(n6653), .B(n7672), .Z(n5059) );
  dti_28hc_7t_30_or2hpx2 U4144 ( .A(n3710), .B(n4081), .Z(n6061) );
  dti_28hc_7t_30_ffqqnbckxp5 \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem_reg[2][5]  ( 
        .D(n2651), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[2][5] ), .QN(n7443) );
  dti_28hc_7t_30_nor2x2 U3516 ( .A(n3677), .B(n3455), .Z(n3676) );
  dti_28hc_7t_30_nor2px2 U3544 ( .A(n5973), .B(n5441), .Z(n7353) );
  dti_28hc_7t_30_nor2px2 U3534 ( .A(n4678), .B(n6929), .Z(n3768) );
  dti_28hc_7t_30_nor2x3 U4692 ( .A(n3517), .B(n3513), .Z(n6102) );
  dti_28hc_7t_30_and2x1 U5035 ( .A(n6213), .B(
        \eda_iterated_ram/current_row[3][4] ), .Z(n5223) );
  dti_28hc_7t_30_nand2px2 U3884 ( .A(n4968), .B(n4967), .Z(n6924) );
  dti_28hc_7t_30_muxi21x1 U6870 ( .D0(n5803), .D1(n5802), .S(n5833), .Z(n5813)
         );
  dti_28hc_7t_30_nand2x1 U3512 ( .A(n6067), .B(n4971), .Z(n6930) );
  dti_28hc_7t_30_invx2 U4259 ( .A(n5304), .Z(n3315) );
  dti_28hc_7t_30_invx2 U3883 ( .A(n6924), .Z(n3382) );
  dti_28hc_7t_30_invx1 U5508 ( .A(n5485), .Z(n4875) );
  dti_28hc_7t_30_nor2x1 U4088 ( .A(n5973), .B(n5442), .Z(n7322) );
  dti_28hc_7t_30_nor2x3 U3494 ( .A(n7603), .B(n3649), .Z(n3644) );
  dti_28hc_7t_30_nor2xp8 U3871 ( .A(n5180), .B(n3341), .Z(n5182) );
  dti_28hc_7t_30_nand3hpx1 U3487 ( .A(n3480), .B(n4918), .C(n3479), .Z(n3478)
         );
  dti_28hc_7t_30_nor2x1 U4941 ( .A(n5176), .B(n5520), .Z(n7405) );
  dti_28hc_7t_30_nor2x1 U3498 ( .A(n6215), .B(n5450), .Z(n6050) );
  dti_28hc_7t_30_bufx1 U5535 ( .A(n6000), .Z(n3697) );
  dti_28hc_7t_30_invx2 U4346 ( .A(n6915), .Z(n3854) );
  dti_28hc_7t_30_nand2x1 U3483 ( .A(n5458), .B(n5517), .Z(n7376) );
  dti_28hc_7t_30_nor2x1 U6626 ( .A(n7327), .B(n5447), .Z(n7333) );
  dti_28hc_7t_30_iao22x1 U5007 ( .A1(n6000), .A2(n5272), .B1(n6823), .B2(n5271), .Z(n5273) );
  dti_28hc_7t_30_and3x1 U4349 ( .A(n5219), .B(n5220), .C(n5221), .Z(n3394) );
  dti_28hc_7t_30_aoi12x2 U3479 ( .B1(n3854), .B2(n5209), .A(n5208), .Z(n5222)
         );
  dti_28hc_7t_30_oai12rex1 U4506 ( .B1(n5837), .B2(n5840), .A(n5836), .Z(n5838) );
  dti_28hc_7t_30_nand2x1 U4353 ( .A(n3742), .B(n3738), .Z(n5388) );
  dti_28hc_7t_30_nand2i1x2 U3786 ( .A(n7603), .B(n7554), .Z(n3334) );
  dti_28hc_7t_30_invx1 U5452 ( .A(n3802), .Z(n6967) );
  dti_28hc_7t_30_invxp6 U5502 ( .A(n7603), .Z(n3651) );
  dti_28hc_7t_30_nor2x1 U4255 ( .A(n7376), .B(n5445), .Z(n7383) );
  dti_28hc_7t_30_nand3x1 U6606 ( .A(n5388), .B(n5387), .C(n5386), .Z(n5436) );
  dti_28hc_7t_30_nand2x2 U3935 ( .A(n3394), .B(n5222), .Z(n3300) );
  dti_28hc_7t_30_ffqbcka01fsux1 \eda_fifos/sync_fifo_upright/comparator_inst/o_full_reg  ( 
        .D(\eda_fifos/sync_fifo_upright/comparator_inst/N53 ), .CK(n7449), 
        .RN(reset_n), .Q(\eda_fifos/sync_fifo_upright/o_full ) );
  dti_28hc_7t_30_nor2x1 U5271 ( .A(n3314), .B(n3775), .Z(n5362) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_fifos/sync_fifo_right/comparator_inst/o_full_reg  ( 
        .D(\eda_fifos/sync_fifo_right/comparator_inst/N53 ), .CK(n7449), .RN(
        reset_n), .Q(\eda_fifos/sync_fifo_right/o_full ) );
  dti_28hc_7t_30_nand4x1 U5116 ( .A(n5528), .B(n5527), .C(n7370), .D(n7346), 
        .Z(n6225) );
  dti_28hc_7t_30_nand4xp8 U4161 ( .A(n5432), .B(n7631), .C(n5433), .D(n3286), 
        .Z(n3708) );
  dti_28hc_7t_30_oai112x1 U4182 ( .C1(n5319), .C2(n6915), .A(n5318), .B(n5317), 
        .Z(n5320) );
  dti_28hc_7t_30_nor2x1 U4254 ( .A(n6139), .B(n6132), .Z(n3431) );
  dti_28hc_7t_30_aoi12hpx1 U3459 ( .B1(n5361), .B2(n5362), .A(n5360), .Z(n3435) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_fifos/sync_fifo_upleft/comparator_inst/o_full_reg  ( 
        .D(\eda_fifos/sync_fifo_upleft/comparator_inst/N53 ), .CK(n7449), .RN(
        reset_n), .Q(\eda_fifos/sync_fifo_upleft/o_full ) );
  dti_28hc_7t_30_ffqnubcka10x1 \eda_output_ram/compare_out_tmp_reg  ( .D(n2504), .CK(clk), .SN(reset_n), .QN(n7439) );
  dti_28hc_7t_30_nand2xp8 U6661 ( .A(n5502), .B(n5501), .Z(n5503) );
  dti_28hc_7t_30_ffqbcka01fox1 \eda_fifos/sync_fifo_left/comparator_inst/o_full_reg  ( 
        .D(\eda_fifos/sync_fifo_left/comparator_inst/N53 ), .CK(n7449), .RN(
        reset_n), .Q(\eda_fifos/sync_fifo_left/o_full ) );
  dti_28hc_7t_30_nand2x2 U4304 ( .A(n3436), .B(n3429), .Z(n3425) );
  dti_28hc_7t_30_nand2x2 U4309 ( .A(n3504), .B(n3721), .Z(n3356) );
  dti_28hc_7t_30_or2xp58 U3446 ( .A(n6074), .B(n6073), .Z(n3577) );
  dti_28hc_7t_30_nor2i1x1 U4341 ( .A(n6061), .B(n3430), .Z(n3432) );
  dti_28hc_7t_30_ioa12x2 U3448 ( .B1(n6215), .B2(n5443), .A(n3706), .Z(n5444)
         );
  dti_28hc_7t_30_invx6 U3835 ( .A(n3188), .Z(n3235) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_iterated_ram/have_done_reg  ( .D(
        \eda_iterated_ram/N743 ), .CK(clk), .RN(reset_n), .Q(
        \eda_iterated_ram/have_done ) );
  dti_28hc_7t_30_invx2 U7102 ( .A(n6103), .Z(n6108) );
  dti_28hc_7t_30_invx2 U4532 ( .A(n7430), .Z(n3718) );
  dti_28hc_7t_30_or2hpx2 U5477 ( .A(n6182), .B(n6183), .Z(n6782) );
  dti_28hc_7t_30_invxp8 U3436 ( .A(n3509), .Z(n3510) );
  dti_28hc_7t_30_invx4 U4331 ( .A(n5567), .Z(n3406) );
  dti_28hc_7t_30_invx2 U4235 ( .A(n5566), .Z(n3405) );
  dti_28hc_7t_30_nor2x1 U7085 ( .A(n6083), .B(n6082), .Z(n6632) );
  dti_28hc_7t_30_nand3i1x2 U3428 ( .A(n3510), .B(n6108), .C(n6107), .Z(n3797)
         );
  dti_28hc_7t_30_and2hpx2 U3426 ( .A(n4963), .B(n4962), .Z(n4357) );
  dti_28hc_7t_30_nand2xp8 U3427 ( .A(n6104), .B(n3369), .Z(n3522) );
  dti_28hc_7t_30_invshzx6 U4112 ( .A(n7446), .Z(n3312) );
  dti_28hc_7t_30_nor2px2 U4147 ( .A(n6116), .B(n7827), .Z(n3818) );
  dti_28hc_7t_30_nor2x2 U3890 ( .A(n6615), .B(n6655), .Z(n3262) );
  dti_28hc_7t_30_invx2 U5650 ( .A(n6782), .Z(n6783) );
  dti_28hc_7t_30_and2x1 U7079 ( .A(n6174), .B(n7182), .Z(n7128) );
  dti_28hc_7t_30_oai22xp8 U3394 ( .A1(n3706), .A2(n5887), .B1(n6035), .B2(
        n5886), .Z(n5911) );
  dti_28hc_7t_30_nand2px1 U3383 ( .A(n6651), .B(n3273), .Z(n3272) );
  dti_28hc_7t_30_invx2 U3398 ( .A(n3262), .Z(n3261) );
  dti_28hc_7t_30_invx4 U3385 ( .A(n6109), .Z(n6897) );
  dti_28hc_7t_30_ffqbcka01fsux2 \eda_strobe_ram/strb_memory_reg[3][0]  ( .D(
        n2474), .CK(clk), .RN(reset_n), .Q(\strb_value[3][0] ) );
  dti_28hc_7t_30_nor2px2 U3392 ( .A(n6898), .B(n3862), .Z(n3861) );
  dti_28hc_7t_30_nand2x1 U7741 ( .A(n6595), .B(n7182), .Z(n7133) );
  dti_28hc_7t_30_ffqqnbcka10x1 \eda_output_ram/matrix_output_reg[3][4]  ( .D(
        n2449), .CK(clk), .SN(reset_n), .Q(\matrix_output[3][4] ) );
  dti_28hc_7t_30_nor2px2 U4604 ( .A(n6850), .B(n6797), .Z(n6835) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[3][3]  ( 
        .D(n2471), .CK(clk), .RN(reset_n), .Q(\strb_value[3][3] ), .QN(n7364)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[3][5]  ( 
        .D(n2469), .CK(clk), .RN(reset_n), .Q(\strb_value[3][5] ), .QN(n7374)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[5][3]  ( 
        .D(n2437), .CK(clk), .RN(reset_n), .Q(\strb_value[5][3] ), .QN(n7422)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[4][3]  ( 
        .D(n2465), .CK(clk), .RN(reset_n), .Q(\strb_value[4][3] ), .QN(n7393)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[5][2]  ( 
        .D(n2460), .CK(clk), .RN(reset_n), .Q(\strb_value[5][2] ), .QN(n7418)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_strobe_ram/strb_memory_reg[0][3]  ( 
        .D(n2500), .CK(clk), .RN(reset_n), .Q(\strb_value[0][3] ), .QN(n6155)
         );
  dti_28hc_7t_30_nand2px2 U4498 ( .A(n3669), .B(n7665), .Z(n7421) );
  dti_28hc_7t_30_nor2px2 U3861 ( .A(n7132), .B(n7576), .Z(n3246) );
  dti_28hc_7t_30_nor2px2 U3928 ( .A(n7132), .B(n7133), .Z(n3277) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[5][5]  ( .D(
        n2434), .CK(clk), .SN(reset_n), .Q(\matrix_output[5][5] ) );
  dti_28hc_7t_30_nand2px2 U4605 ( .A(n4361), .B(n3688), .Z(n5538) );
  dti_28hc_7t_30_nor2x2 U4236 ( .A(n6898), .B(n3864), .Z(n3863) );
  dti_28hc_7t_30_invx1 U7855 ( .A(n6854), .Z(n6855) );
  dti_28hc_7t_30_ffqbcka10lpax1 \eda_output_ram/matrix_output_reg[1][0]  ( .D(
        n2486), .CK(clk), .SN(reset_n), .Q(\matrix_output[1][0] ) );
  dti_28hc_7t_30_nand3px1 U5670 ( .A(n6971), .B(n6970), .C(n6969), .Z(n6973)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[2][5]  ( 
        .D(n2475), .CK(clk), .RN(reset_n), .Q(\strb_value[2][5] ), .QN(n7350)
         );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[2][4]  ( 
        .D(n2476), .CK(clk), .RN(reset_n), .Q(\strb_value[2][4] ), .QN(n7344)
         );
  dti_28hc_7t_30_and2x1 U5216 ( .A(n3390), .B(n3647), .Z(n3641) );
  dti_28hc_7t_30_nand2x1 U3926 ( .A(n7130), .B(n6706), .Z(n6702) );
  dti_28hc_7t_30_aoi22x1 U4060 ( .A1(n6698), .A2(n7075), .B1(
        \eda_iterated_ram/current_row[1][1] ), .B2(n7182), .Z(n6675) );
  dti_28hc_7t_30_aoi22x1 U8017 ( .A1(n7077), .A2(n7185), .B1(
        \eda_iterated_ram/current_row[2][2] ), .B2(n7182), .Z(n7078) );
  dti_28hc_7t_30_nand2x2 U4297 ( .A(n7665), .B(n7407), .Z(n3675) );
  dti_28hc_7t_30_nand2xp8 U7777 ( .A(n6711), .B(n7075), .Z(n6689) );
  dti_28hc_7t_30_nand2xp8 U7766 ( .A(n7186), .B(n7183), .Z(n6667) );
  dti_28hc_7t_30_aoi22x3 U7114 ( .A1(n3571), .A2(n7129), .B1(
        \eda_iterated_ram/current_row[5][4] ), .B2(n7182), .Z(n6144) );
  dti_28hc_7t_30_invx1 U3337 ( .A(n3293), .Z(n3292) );
  dti_28hc_7t_30_invx1 U3829 ( .A(n3277), .Z(n3276) );
  dti_28hc_7t_30_invx1 U3342 ( .A(n3388), .Z(n3387) );
  dti_28hc_7t_30_aoi12x1 U4526 ( .B1(n7383), .B2(n7382), .A(n7430), .Z(n7384)
         );
  dti_28hc_7t_30_nand2xp8 U3858 ( .A(n7130), .B(n7183), .Z(n3244) );
  dti_28hc_7t_30_oai22rexp8 U5727 ( .A1(n6235), .A2(n6237), .B1(
        \eda_fifos/sync_fifo_down/wr_addr [3]), .B2(n7239), .Z(n6236) );
  dti_28hc_7t_30_nor2xp8 U5334 ( .A(n3730), .B(n3729), .Z(n7354) );
  dti_28hc_7t_30_nor2x1 U8165 ( .A(n7430), .B(n7301), .Z(n7304) );
  dti_28hc_7t_30_oai12rex1 U3329 ( .B1(n6938), .B2(
        \eda_fifos/sync_fifo_upleft/wr_addr [3]), .A(n5538), .Z(n6048) );
  dti_28hc_7t_30_nand2x1 U7090 ( .A(n6711), .B(n7183), .Z(n6087) );
  dti_28hc_7t_30_nand2xp8 U7110 ( .A(n6711), .B(n6706), .Z(n6125) );
  dti_28hc_7t_30_nand2x1 U7785 ( .A(n6711), .B(n7185), .Z(n6712) );
  dti_28hc_7t_30_nor2x1 U8194 ( .A(n7430), .B(n7386), .Z(n7389) );
  dti_28hc_7t_30_nor3pmhzoptax10 U3947 ( .A(n6845), .B(n6844), .C(
        \eda_fifos/sync_fifo_upright/wr_addr [1]), .Z(n7197) );
  dti_28hc_7t_30_nand2x1 U3340 ( .A(n7349), .B(\strb_value[2][5] ), .Z(n3695)
         );
  dti_28hc_7t_30_nand2px1 U3793 ( .A(n7076), .B(n7129), .Z(n7030) );
  dti_28hc_7t_30_aoi22x3 U7771 ( .A1(n6694), .A2(n7075), .B1(
        \eda_iterated_ram/current_row[3][1] ), .B2(n7182), .Z(n6678) );
  dti_28hc_7t_30_aoi22x3 U7770 ( .A1(n3571), .A2(n7075), .B1(
        \eda_iterated_ram/current_row[5][1] ), .B2(n7182), .Z(n6674) );
  dti_28hc_7t_30_nor2x1 U8168 ( .A(n7430), .B(n7307), .Z(n7308) );
  dti_28hc_7t_30_nor2x1 U8170 ( .A(n7430), .B(n7310), .Z(n7311) );
  dti_28hc_7t_30_nor2px1 U3294 ( .A(n3564), .B(
        \eda_fifos/sync_fifo_left/wr_addr [3]), .Z(n6820) );
  dti_28hc_7t_30_muxi21x2 U5673 ( .D0(n7154), .D1(n7153), .S(n7273), .Z(n2663)
         );
  dti_28hc_7t_30_muxi21x1 U4904 ( .D0(n3565), .D1(n6998), .S(n7268), .Z(n2650)
         );
  dti_28hc_7t_30_muxi21x1 U3270 ( .D0(n3565), .D1(n6999), .S(n3891), .Z(n2638)
         );
  dti_28hc_7t_30_muxi21x1 U5623 ( .D0(n7111), .D1(n7093), .S(n7213), .Z(n2791)
         );
  dti_28hc_7t_30_muxi21x1 U5648 ( .D0(n7111), .D1(n7095), .S(n7217), .Z(n2779)
         );
  dti_28hc_7t_30_muxi21x1 U5409 ( .D0(n7111), .D1(n7094), .S(n7215), .Z(n2767)
         );
  dti_28hc_7t_30_muxi21x1 U5573 ( .D0(n7172), .D1(n7181), .S(n7237), .Z(n2564)
         );
  dti_28hc_7t_30_oai12rex1 U3977 ( .B1(n7351), .B2(n7349), .A(n3695), .Z(n2475) );
  dti_28hc_7t_30_aoi12hpx1 U5564 ( .B1(n6936), .B2(n6935), .A(n6934), .Z(
        \eda_fifos/sync_fifo_upleft/comparator_inst/N53 ) );
  dti_28hc_7t_30_muxi21x1 U5326 ( .D0(n7174), .D1(n7181), .S(n7241), .Z(n2576)
         );
  dti_28hc_7t_30_muxi21x1 U5351 ( .D0(n3565), .D1(n6987), .S(n7191), .Z(n2700)
         );
  dti_28hc_7t_30_muxi21x1 U4593 ( .D0(n7153), .D1(n7139), .S(n7201), .Z(n2613)
         );
  dti_28hc_7t_30_muxi21x1 U5562 ( .D0(n7153), .D1(n7140), .S(n7203), .Z(n2601)
         );
  dti_28hc_7t_30_muxi21x1 U5632 ( .D0(n7111), .D1(n7083), .S(n7193), .Z(n2679)
         );
  dti_28hc_7t_30_muxi21x1 U4561 ( .D0(n7111), .D1(n7086), .S(n7199), .Z(n2691)
         );
  dti_28hc_7t_30_muxi21x1 U3841 ( .D0(n6908), .D1(n6967), .S(n7237), .Z(n2561)
         );
  dti_28hc_7t_30_muxi21x1 U5601 ( .D0(n7012), .D1(n7021), .S(n7237), .Z(n2563)
         );
  dti_28hc_7t_30_muxi21x1 U5370 ( .D0(n7028), .D1(n7022), .S(n7213), .Z(n2794)
         );
  dti_28hc_7t_30_muxi21x1 U5383 ( .D0(n7111), .D1(n7082), .S(n7191), .Z(n2697)
         );
  dti_28hc_7t_30_muxi21x1 U4603 ( .D0(n7014), .D1(n7021), .S(n7241), .Z(n2575)
         );
  dti_28hc_7t_30_muxi21x1 U5385 ( .D0(n7028), .D1(n6997), .S(n3564), .Z(n2756)
         );
  dti_28hc_7t_30_muxi21x1 U5436 ( .D0(n7025), .D1(n7028), .S(n7219), .Z(n2800)
         );
  dti_28hc_7t_30_muxi21x1 U3257 ( .D0(n7122), .D1(n7121), .S(n7273), .Z(n2659)
         );
  dti_28hc_7t_30_muxi21x1 U4168 ( .D0(n7002), .D1(n3565), .S(n7273), .Z(n2662)
         );
  dti_28hc_7t_30_muxi21x1 U3266 ( .D0(n3775), .D1(n7214), .S(n7213), .Z(n2796)
         );
  dti_28hc_7t_30_muxi21x1 U5432 ( .D0(n3775), .D1(n7218), .S(n7217), .Z(n2784)
         );
  dti_28hc_7t_30_muxi21x1 U4601 ( .D0(n7001), .D1(n3565), .S(n7000), .Z(n2656)
         );
  dti_28hc_7t_30_muxi21x1 U5386 ( .D0(n3775), .D1(n7267), .S(n3564), .Z(n2758)
         );
  dti_28hc_7t_30_muxi21x1 U3263 ( .D0(n3775), .D1(n7192), .S(n7191), .Z(n2702)
         );
  dti_28hc_7t_30_muxi21x2 U4563 ( .D0(n7153), .D1(n7134), .S(n7191), .Z(n2701)
         );
  dti_28hc_7t_30_oai12rex1 U3273 ( .B1(n7365), .B2(n7363), .A(n3857), .Z(n2471) );
  dti_28hc_7t_30_oai112rex2 U3816 ( .C1(n6682), .C2(n6697), .A(n6678), .B(
        n6679), .Z(n2874) );
  dti_28hc_7t_30_aoi12x1 U3260 ( .B1(n6235), .B2(n6237), .A(n6236), .Z(n2855)
         );
  dti_28hc_7t_30_oai112x2 U7757 ( .C1(n7190), .C2(n6701), .A(n6636), .B(n6637), 
        .Z(n2864) );
  dti_28hc_7t_30_muxi21x2 U3253 ( .D0(n4081), .D1(n7440), .S(n3564), .Z(n2754)
         );
  dti_28hc_7t_30_invx14 U3768 ( .A(n3929), .Z(n3930) );
  dti_28hc_7t_30_invmhzx20 U3763 ( .A(n4591), .Z(n4340) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][3][1]  ( .D(
        n2915), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][3][1] )
         );
  dti_28hc_7t_30_invshzx8 U3921 ( .A(n4591), .Z(n4003) );
  dti_28hc_7t_30_nor2px1 U3765 ( .A(n6124), .B(n6526), .Z(n3283) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][3][1]  ( .D(
        n3155), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][3][1] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][0][1]  ( .D(
        n3083), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][0][1] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][2][1]  ( .D(
        n3115), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][2][1] )
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][2][1]  ( .D(
        pixel_in[1]), .CE(n6590), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][2][1] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[1][1][1]  ( .D(
        n3123), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[1][1][1] )
         );
  dti_28hc_7t_30_invmhzx12 U4293 ( .A(n7057), .Z(n7074) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][1][1]  ( .D(
        pixel_in[1]), .CE(n6583), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][1][1] ) );
  dti_28hc_7t_30_invx4 U3754 ( .A(n3308), .Z(n3593) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[4][4][2]  ( .D(
        pixel_in[2]), .CE(n7718), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][4][2] ) );
  dti_28hc_7t_30_invx10 U3933 ( .A(n6124), .Z(n5150) );
  dti_28hc_7t_30_invx10 U3742 ( .A(n4003), .Z(n4445) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_img_ram/img_memory_reg[3][4][6]  ( .D(n2998), 
        .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][4][6] ) );
  dti_28hc_7t_30_or2x2 U4819 ( .A(n4154), .B(n7028), .Z(n6115) );
  dti_28hc_7t_30_aoi22x2 U3718 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[2][4][1] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[2][2][1] ), .Z(n4416) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][1][5]  ( .D(
        n3071), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][0][2]  ( .D(
        n3034), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][3][5]  ( .D(
        n3055), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][3][5] )
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][5][6]  ( .D(
        pixel_in[6]), .CE(n6575), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][5][6] ) );
  dti_28hc_7t_30_and2x6 U3756 ( .A(left_addr[5]), .B(left_addr[3]), .Z(n6597)
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][2][2]  ( .D(
        pixel_in[2]), .CE(n6568), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][2][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][3][2]  ( .D(
        pixel_in[2]), .CE(n6573), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][3][2] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[2][1][2]  ( .D(
        n3074), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[2][1][2] )
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][1][2]  ( .D(
        pixel_in[2]), .CE(n6583), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][1][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[0][3][2]  ( .D(
        pixel_in[2]), .CE(n6585), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[0][3][2] ) );
  dti_28hc_7t_30_ffqenbcka01lpax1 \eda_img_ram/img_memory_reg[3][3][1]  ( .D(
        pixel_in[1]), .CE(n6573), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][3][1] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[5][4][4]  ( .D(
        pixel_in[4]), .CE(n7722), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[5][4][4] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[4][5][2]  ( .D(
        pixel_in[2]), .CE(n7719), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][5][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][5][2]  ( .D(
        pixel_in[2]), .CE(n6575), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][5][2] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[4][5][6]  ( .D(
        pixel_in[6]), .CE(n7719), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][5][6] ) );
  dti_28hc_7t_30_nand2x1 U3722 ( .A(n3599), .B(
        \eda_img_ram/img_memory[4][2][4] ), .Z(n4151) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][3][0]  ( .D(
        pixel_in[0]), .CE(n6551), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][3][0] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[3][4][2]  ( .D(
        pixel_in[2]), .CE(n6577), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[3][4][2] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[0][5][2]  ( .D(
        n3138), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[0][5][2] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][2][3]  ( .D(
        n3017), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][2][3] )
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][5][4]  ( .D(
        pixel_in[4]), .CE(n6564), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][5][4] ) );
  dti_28hc_7t_30_nor2shzx10 U3729 ( .A(n3900), .B(n7074), .Z(n5589) );
  dti_28hc_7t_30_aoi22x3 U5099 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[1][3][4] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[1][1][4] ), .Z(n4138) );
  dti_28hc_7t_30_aoi22hpx2 U3931 ( .A1(n4445), .A2(
        \eda_img_ram/img_memory[2][1][4] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[2][4][4] ), .Z(n4145) );
  dti_28hc_7t_30_aoi22rex2 U5674 ( .A1(n3605), .A2(
        \eda_img_ram/img_memory[4][2][5] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[4][0][5] ), .Z(n4338) );
  dti_28hc_7t_30_aoi22x1 U5111 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[3][3][3] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[3][1][3] ), .Z(n4468) );
  dti_28hc_7t_30_aoi22rex1 U5130 ( .A1(n3595), .A2(
        \eda_img_ram/img_memory[1][2][5] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[1][0][5] ), .Z(n4344) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][1][7]  ( .D(
        n3021), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][1][7] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][3][5]  ( .D(
        n3007), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][3][5] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[4][4][0]  ( .D(
        n2956), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[4][4][0] )
         );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[3][0][5]  ( .D(
        n3031), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[3][0][5] )
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[1][5][6]  ( .D(
        pixel_in[6]), .CE(n6564), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[1][5][6] ) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][4][0]  ( .D(
        pixel_in[0]), .CE(n6555), .CK(clk), .RN(reset_n), .Q(n3556) );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[2][3][6]  ( .D(
        pixel_in[6]), .CE(n6551), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[2][3][6] ) );
  dti_28hc_7t_30_ffqblcka01xp5 \eda_img_ram/img_memory_reg[5][2][7]  ( .D(
        n2917), .CK(clk), .RN(reset_n), .Q(\eda_img_ram/img_memory[5][2][7] )
         );
  dti_28hc_7t_30_ffqbckena01xp5 \eda_img_ram/img_memory_reg[4][5][7]  ( .D(
        pixel_in[7]), .CE(n7719), .CK(clk), .RN(reset_n), .Q(
        \eda_img_ram/img_memory[4][5][7] ) );
  dti_28hc_7t_30_aoi22rehpx1 U4192 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[2][2][1] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[2][1][1] ), .Z(n4097) );
  dti_28hc_7t_30_nand2x1 U6015 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][3][5] ), .Z(n4336) );
  dti_28hc_7t_30_aoi22rehpx1 U3859 ( .A1(n4597), .A2(
        \eda_img_ram/img_memory[0][2][3] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[0][5][3] ), .Z(n4473) );
  dti_28hc_7t_30_aoi22rehpx1 U5863 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[1][5][1] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[1][4][1] ), .Z(n4087) );
  dti_28hc_7t_30_nand4px1 U4726 ( .A(n4481), .B(n4480), .C(n4478), .D(n4479), 
        .Z(n5027) );
  dti_28hc_7t_30_nand4px1 U3811 ( .A(n4399), .B(n4398), .C(n4397), .D(n4396), 
        .Z(n4987) );
  dti_28hc_7t_30_nand4px1 U4190 ( .A(n4389), .B(n3635), .C(n3634), .D(n4388), 
        .Z(n4990) );
  dti_28hc_7t_30_aoi22x3 U4765 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[1][5][0] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[1][0][0] ), .Z(n4277) );
  dti_28hc_7t_30_aoi22rehpx1 U5139 ( .A1(n3603), .A2(
        \eda_img_ram/img_memory[5][2][7] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[5][0][7] ), .Z(n4006) );
  dti_28hc_7t_30_aoi22x2 U5478 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[5][4][7] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[5][1][7] ), .Z(n4007) );
  dti_28hc_7t_30_aoi22x1 U4796 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[2][2][5] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[2][0][5] ), .Z(n4348) );
  dti_28hc_7t_30_nand2x2 U5930 ( .A(n3602), .B(
        \eda_img_ram/img_memory[2][2][6] ), .Z(n4199) );
  dti_28hc_7t_30_aoi22hpx1 U3711 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][5][0] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[2][0][0] ), .Z(n4281) );
  dti_28hc_7t_30_aoi22x6 U5466 ( .A1(n3604), .A2(
        \eda_img_ram/img_memory[1][2][3] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[1][1][3] ), .Z(n3953) );
  dti_28hc_7t_30_aoi22hpx1 U3672 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[1][5][2] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[1][0][2] ), .Z(n4033) );
  dti_28hc_7t_30_aoi22x2 U3674 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[5][4][2] ), .B1(n4565), .B2(
        \eda_img_ram/img_memory[5][1][2] ), .Z(n4028) );
  dti_28hc_7t_30_aoi22x1 U4766 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[3][5][2] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[3][0][2] ), .Z(n4025) );
  dti_28hc_7t_30_nand2x2 U3690 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][3][0] ), .Z(n4282) );
  dti_28hc_7t_30_nand2x1 U5812 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][3][2] ), .Z(n4015) );
  dti_28hc_7t_30_nand2x1 U5819 ( .A(n4603), .B(
        \eda_img_ram/img_memory[3][3][2] ), .Z(n4023) );
  dti_28hc_7t_30_nand2x1 U5815 ( .A(n4603), .B(
        \eda_img_ram/img_memory[4][3][2] ), .Z(n4019) );
  dti_28hc_7t_30_nand2x1 U5821 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][3][2] ), .Z(n4031) );
  dti_28hc_7t_30_aoi22x1 U3652 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[1][5][6] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[1][2][6] ), .Z(n4504) );
  dti_28hc_7t_30_nand2x1 U5097 ( .A(n3604), .B(
        \eda_img_ram/img_memory[5][2][2] ), .Z(n4026) );
  dti_28hc_7t_30_nand2x1 U5936 ( .A(n6086), .B(
        \eda_img_ram/img_memory[5][3][6] ), .Z(n4211) );
  dti_28hc_7t_30_nand2x2 U3974 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][3][6] ), .Z(n4198) );
  dti_28hc_7t_30_invx2 U3696 ( .A(n5160), .Z(n5429) );
  dti_28hc_7t_30_aoi22hpx1 U3975 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[2][1][0] ), .B1(n3556), .B2(n4582), .Z(n4280)
         );
  dti_28hc_7t_30_invx4 U3707 ( .A(n3311), .Z(n3309) );
  dti_28hc_7t_30_nand4px1 U3663 ( .A(n4149), .B(n3795), .C(n4148), .D(n4147), 
        .Z(n3548) );
  dti_28hc_7t_30_aoi22x1 U5085 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[3][3][0] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[3][5][0] ), .Z(n4249) );
  dti_28hc_7t_30_aoi22hpx1 U3643 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][4][7] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[2][3][7] ), .Z(n3979) );
  dti_28hc_7t_30_aoi22x1 U4025 ( .A1(n3599), .A2(
        \eda_img_ram/img_memory[0][3][4] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[0][1][4] ), .Z(n4528) );
  dti_28hc_7t_30_nand2px1 U4256 ( .A(n3410), .B(n4560), .Z(n5044) );
  dti_28hc_7t_30_aoi22x1 U4751 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[0][4][1] ), .B1(n3595), .B2(
        \eda_img_ram/img_memory[0][1][1] ), .Z(n4131) );
  dti_28hc_7t_30_nand4px1 U4388 ( .A(n4563), .B(n4564), .C(n4562), .D(n4561), 
        .Z(n5039) );
  dti_28hc_7t_30_nand4px1 U5684 ( .A(n3919), .B(n3918), .C(n3916), .D(n3917), 
        .Z(n4755) );
  dti_28hc_7t_30_nand4px1 U5174 ( .A(n3962), .B(n3963), .C(n3961), .D(n3960), 
        .Z(n4724) );
  dti_28hc_7t_30_nand4px1 U6145 ( .A(n4532), .B(n4531), .C(n4530), .D(n4529), 
        .Z(n4980) );
  dti_28hc_7t_30_nand4px1 U4157 ( .A(n3915), .B(n3914), .C(n3913), .D(n3912), 
        .Z(n5695) );
  dti_28hc_7t_30_nand2x1 U3616 ( .A(n5115), .B(n5589), .Z(n4038) );
  dti_28hc_7t_30_aoi22x2 U5559 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[1][3][1] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[1][5][1] ), .Z(n4122) );
  dti_28hc_7t_30_aoi22hpx1 U4798 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[5][2][5] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[5][0][5] ), .Z(n4318) );
  dti_28hc_7t_30_aoi22hpx1 U4126 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[2][3][1] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[2][5][1] ), .Z(n4118) );
  dti_28hc_7t_30_nand4x1 U3982 ( .A(n4601), .B(n4600), .C(n4599), .D(n4598), 
        .Z(n5054) );
  dti_28hc_7t_30_nand4x1 U5965 ( .A(n4258), .B(n4257), .C(n4256), .D(n4255), 
        .Z(n4763) );
  dti_28hc_7t_30_aoi22rex1 U6188 ( .A1(n3316), .A2(
        \eda_img_ram/img_memory[4][3][7] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[4][1][7] ), .Z(n4595) );
  dti_28hc_7t_30_aoi22rex1 U4707 ( .A1(n4755), .A2(n6597), .B1(n5696), .B2(
        n5589), .Z(n4623) );
  dti_28hc_7t_30_aoi22x1 U4911 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[4][5][7] ), .B1(n7613), .B2(
        \eda_img_ram/img_memory[4][2][7] ), .Z(n4596) );
  dti_28hc_7t_30_aoi22x1 U4704 ( .A1(n5042), .A2(n6616), .B1(n5041), .B2(n6633), .Z(n5047) );
  dti_28hc_7t_30_aoi22hpx1 U5235 ( .A1(n5044), .A2(n6604), .B1(n5041), .B2(
        n3321), .Z(n4806) );
  dti_28hc_7t_30_aoi22rex1 U6291 ( .A1(n5589), .A2(n4980), .B1(n3309), .B2(
        n4975), .Z(n4811) );
  dti_28hc_7t_30_invx2 U3611 ( .A(n5613), .Z(n3793) );
  dti_28hc_7t_30_aoi22hpx1 U5715 ( .A1(n3612), .A2(n5589), .B1(n5082), .B2(
        n3309), .Z(n4853) );
  dti_28hc_7t_30_nand4px1 U5080 ( .A(n4792), .B(n4791), .C(n4789), .D(n4790), 
        .Z(n5650) );
  dti_28hc_7t_30_invx2 U4657 ( .A(n3613), .Z(n3614) );
  dti_28hc_7t_30_aoi22x1 U6202 ( .A1(n4694), .A2(n5589), .B1(n4690), .B2(n3320), .Z(n4629) );
  dti_28hc_7t_30_nand3hpx1 U3615 ( .A(n4719), .B(n3231), .C(n4718), .Z(n5689)
         );
  dti_28hc_7t_30_nand3hpx1 U4908 ( .A(n4649), .B(n3549), .C(n4648), .Z(n5573)
         );
  dti_28hc_7t_30_nand2x2 U4183 ( .A(n4626), .B(n4625), .Z(n5564) );
  dti_28hc_7t_30_nor2i1x2 U6220 ( .A(n4750), .B(n5573), .Z(n4650) );
  dti_28hc_7t_30_nand4x1 U4270 ( .A(n4461), .B(n4460), .C(n4459), .D(n4458), 
        .Z(n4996) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_iterated_ram/iterated_memory_reg[3][1]  ( 
        .D(n2874), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[3][1] ), .QN(n5533) );
  dti_28hc_7t_30_ffqqnhshpa01x2 \eda_iterated_ram/iterated_memory_reg[3][4]  ( 
        .D(n2877), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[3][4] ) );
  dti_28hc_7t_30_ffqqnhshpa01x2 \eda_iterated_ram/iterated_memory_reg[3][5]  ( 
        .D(n2878), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[3][5] ) );
  dti_28hc_7t_30_ffqqnhshpa01x2 \eda_iterated_ram/iterated_memory_reg[2][5]  ( 
        .D(n2872), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[2][5] ) );
  dti_28hc_7t_30_ffqqnhshpa01lpax2 \eda_iterated_ram/iterated_memory_reg[4][2]  ( 
        .D(n2881), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[4][2] ) );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_downright/read_control_inst/rd_addr_reg[0]  ( 
        .D(n2852), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/rd_addr [0]) );
  dti_28hc_7t_30_ffqqnhshpa01x2 \eda_iterated_ram/iterated_memory_reg[2][4]  ( 
        .D(n2871), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[2][4] ), .QN(n5526) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_right/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2809), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/rd_addr [1]) );
  dti_28hc_7t_30_ffqbcka01x2 \eda_fifos/sync_fifo_downright/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2850), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downright/rd_addr [3]) );
  dti_28hc_7t_30_and2hpx2 U4816 ( .A(n3775), .B(n6147), .Z(n5154) );
  dti_28hc_7t_30_nand2x1 U3588 ( .A(\eda_iterated_ram/current_row[4][5] ), .B(
        n6657), .Z(n3515) );
  dti_28hc_7t_30_nand2x2 U4280 ( .A(\eda_iterated_ram/current_row[5][5] ), .B(
        n4836), .Z(n3703) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_iterated_ram/iterated_memory_reg[3][3]  ( 
        .D(n2876), .CK(n7449), .RN(reset_n), .Q(
        \eda_iterated_ram/current_row[3][3] ), .QN(n5166) );
  dti_28hc_7t_30_ffqa01lpax2 \eda_fifos/sync_fifo_downleft/write_control_inst/wr_addr_reg[0]  ( 
        .D(n2543), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/wr_addr [0]) );
  dti_28hc_7t_30_nor2px1 U3583 ( .A(n6184), .B(n6185), .Z(n3813) );
  dti_28hc_7t_30_aoi22x1 U6039 ( .A1(\eda_iterated_ram/current_row[2][4] ), 
        .A2(n3319), .B1(\eda_iterated_ram/current_row[1][4] ), .B2(n6633), .Z(
        n4384) );
  dti_28hc_7t_30_aoi22x1 U4813 ( .A1(\eda_iterated_ram/current_row[4][2] ), 
        .A2(n4836), .B1(\eda_iterated_ram/current_row[0][2] ), .B2(n6604), .Z(
        n3786) );
  dti_28hc_7t_30_xor2bx1 U5683 ( .A(n5750), .B(n3613), .Z(n6183) );
  dti_28hc_7t_30_nand2x2 U6237 ( .A(\eda_iterated_ram/current_row[2][0] ), .B(
        n4856), .Z(n4819) );
  dti_28hc_7t_30_aoi22x1 U5190 ( .A1(\eda_iterated_ram/current_row[2][2] ), 
        .A2(n3320), .B1(n3543), .B2(n3317), .Z(n3749) );
  dti_28hc_7t_30_aoi22x1 U4403 ( .A1(\eda_iterated_ram/current_row[3][2] ), 
        .A2(n3320), .B1(\eda_iterated_ram/current_row[2][2] ), .B2(n3319), .Z(
        n3787) );
  dti_28hc_7t_30_aoi22hpx1 U4413 ( .A1(\eda_iterated_ram/current_row[2][1] ), 
        .A2(n4856), .B1(\eda_iterated_ram/current_row[1][1] ), .B2(n5589), .Z(
        n3418) );
  dti_28hc_7t_30_invxp9 U5041 ( .A(\eda_fifos/sync_fifo_up/wr_addr [1]), .Z(
        n3457) );
  dti_28hc_7t_30_aoi22hpx1 U4282 ( .A1(\eda_iterated_ram/current_row[4][3] ), 
        .A2(n6657), .B1(\eda_iterated_ram/current_row[0][3] ), .B2(n3321), .Z(
        n3743) );
  dti_28hc_7t_30_aoi22hpx1 U4387 ( .A1(\eda_iterated_ram/current_row[5][1] ), 
        .A2(n5140), .B1(\eda_iterated_ram/current_row[0][1] ), .B2(n6633), .Z(
        n3350) );
  dti_28hc_7t_30_ffqa01lpax1 \eda_fifos/sync_fifo_downleft/read_control_inst/rd_addr_reg[1]  ( 
        .D(n2547), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_downleft/rd_addr [1]) );
  dti_28hc_7t_30_aoi22rex2 U4412 ( .A1(\eda_iterated_ram/current_row[0][3] ), 
        .A2(n6633), .B1(\eda_iterated_ram/current_row[2][3] ), .B2(n3320), .Z(
        n3351) );
  dti_28hc_7t_30_nand2x2 U6238 ( .A(\eda_iterated_ram/current_row[0][0] ), .B(
        n6597), .Z(n4818) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_fifos/sync_fifo_right/write_control_inst/wr_addr_reg[1]  ( 
        .D(n2810), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/wr_addr [1]), .QN(n6787) );
  dti_28hc_7t_30_nand4px1 U5589 ( .A(n4073), .B(n4072), .C(n4071), .D(n4070), 
        .Z(n5151) );
  dti_28hc_7t_30_aoi22x1 U5578 ( .A1(n4752), .A2(n3320), .B1(n5695), .B2(n3317), .Z(n3927) );
  dti_28hc_7t_30_aoi22rex1 U5182 ( .A1(\eda_iterated_ram/current_row[0][0] ), 
        .A2(n5589), .B1(\eda_iterated_ram/current_row[5][0] ), .B2(n3309), .Z(
        n4366) );
  dti_28hc_7t_30_ffqa01lpax1 \eda_fifos/sync_fifo_right/read_control_inst/rd_addr_reg[3]  ( 
        .D(n2806), .CK(n7449), .RN(reset_n), .Q(
        \eda_fifos/sync_fifo_right/rd_addr [3]) );
  dti_28hc_7t_30_nor2i1x1 U4050 ( .A(n6147), .B(n3775), .Z(n5148) );
  dti_28hc_7t_30_nand2i1xp8 U6228 ( .A(
        \eda_fifos/sync_fifo_upright/rd_addr [1]), .B(
        \eda_fifos/sync_fifo_upright/wr_addr [1]), .Z(n4937) );
  dti_28hc_7t_30_nand3hpx1 U3985 ( .A(n3715), .B(n4079), .C(n4078), .Z(n5156)
         );
  dti_28hc_7t_30_nand2x1 U3557 ( .A(n6098), .B(n6122), .Z(n6136) );
  dti_28hc_7t_30_invxp9 U5299 ( .A(n5156), .Z(n3714) );
  dti_28hc_7t_30_nand2x1 U4285 ( .A(n3666), .B(
        \eda_fifos/sync_fifo_upleft/rd_addr [1]), .Z(n4863) );
  dti_28hc_7t_30_nand2x1 U3562 ( .A(n5153), .B(n4445), .Z(n3248) );
  dti_28hc_7t_30_xnor2bx1 U3798 ( .A(n3241), .B(n5650), .Z(n4793) );
  dti_28hc_7t_30_xnor2x1 U5544 ( .A(\eda_fifos/sync_fifo_upleft/wr_addr [3]), 
        .B(\eda_fifos/sync_fifo_upleft/rd_addr [3]), .Z(n4867) );
  dti_28hc_7t_30_nand3hpx1 U4359 ( .A(n6134), .B(n6138), .C(n6137), .Z(n6059)
         );
  dti_28hc_7t_30_nand2x1 U5554 ( .A(n5153), .B(n5150), .Z(n6197) );
  dti_28hc_7t_30_nand3px2 U3550 ( .A(n4772), .B(n3658), .C(n4776), .Z(n3806)
         );
  dti_28hc_7t_30_nand4x1 U6502 ( .A(\eda_iterated_ram/current_row[2][0] ), .B(
        \eda_iterated_ram/current_row[2][3] ), .C(
        \eda_iterated_ram/current_row[2][1] ), .D(
        \eda_iterated_ram/current_row[2][2] ), .Z(n5524) );
  dti_28hc_7t_30_nor3x1 U4831 ( .A(n5450), .B(n5165), .C(n5166), .Z(n6213) );
  dti_28hc_7t_30_nand2x1 U4393 ( .A(n3678), .B(n6729), .Z(n3664) );
  dti_28hc_7t_30_nand3hpx1 U5676 ( .A(n5090), .B(n5089), .C(n5091), .Z(n6070)
         );
  dti_28hc_7t_30_nor2x1 U4890 ( .A(n4972), .B(n6896), .Z(n6201) );
  dti_28hc_7t_30_oai12rex1 U3526 ( .B1(n4842), .B2(n3775), .A(n3802), .Z(n3517) );
  dti_28hc_7t_30_invx1 U3531 ( .A(n6059), .Z(n3438) );
  dti_28hc_7t_30_or2x1 U4249 ( .A(n4972), .B(n4081), .Z(n4967) );
  dti_28hc_7t_30_nor3px2 U4093 ( .A(n3664), .B(n3573), .C(n3663), .Z(n3662) );
  dti_28hc_7t_30_and2x1 U5050 ( .A(n4907), .B(n7789), .Z(n5415) );
  dti_28hc_7t_30_invx3 U4366 ( .A(n3503), .Z(n3501) );
  dti_28hc_7t_30_nand2hpx2 U3491 ( .A(n3382), .B(n3381), .Z(n5181) );
  dti_28hc_7t_30_nand2x1 U5475 ( .A(n7353), .B(n5224), .Z(n6215) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[4][2]  ( 
        .D(n2530), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[4][2] ) );
  dti_28hc_7t_30_ffqbckxp5 \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem_reg[1][2]  ( 
        .D(n2512), .CK(n7449), .Q(
        \eda_fifos/sync_fifo_downleft/sync_fifo_mem_inst/fifo_mem[1][2] ) );
  dti_28hc_7t_30_nand2xp5 U4129 ( .A(n3742), .B(n3737), .Z(n3471) );
  dti_28hc_7t_30_oai12x2 U3456 ( .B1(n3569), .B2(n5437), .A(n3708), .Z(n3784)
         );
  dti_28hc_7t_30_invx4 U3453 ( .A(n5537), .Z(n3706) );
  dti_28hc_7t_30_nor2px1 U3447 ( .A(n6196), .B(n3771), .Z(n3845) );
  dti_28hc_7t_30_nand2px1 U3425 ( .A(n4965), .B(n3887), .Z(n3335) );
  dti_28hc_7t_30_nand2x1 U3417 ( .A(n6642), .B(n3495), .Z(n3494) );
  dti_28hc_7t_30_nor3px2 U5285 ( .A(n6610), .B(n6611), .C(n6658), .Z(n3769) );
  dti_28hc_7t_30_bufmhzx6 U4522 ( .A(n3732), .Z(n3539) );
  dti_28hc_7t_30_nor3px4 U4899 ( .A(n6972), .B(n6801), .C(n6970), .Z(n6802) );
  dti_28hc_7t_30_ffqqnhshpa01lpax1 \eda_strobe_ram/strb_memory_reg[2][0]  ( 
        .D(n2480), .CK(clk), .RN(reset_n), .Q(\strb_value[2][0] ), .QN(n7325)
         );
  dti_28hc_7t_30_nor2px2 U5537 ( .A(n6867), .B(n6866), .Z(n3851) );
  dti_28hc_7t_30_nor2i1x1 U4414 ( .A(n6847), .B(n3536), .Z(n3534) );
  dti_28hc_7t_30_nor2hpx2 U3920 ( .A(n6877), .B(n6169), .Z(n6874) );
  dti_28hc_7t_30_nand2xp8 U3335 ( .A(n7130), .B(n7075), .Z(n3247) );
  dti_28hc_7t_30_invx1 U3330 ( .A(n3270), .Z(n3269) );
  dti_28hc_7t_30_aoi22hpx1 U7763 ( .A1(n7077), .A2(n7183), .B1(
        \eda_iterated_ram/current_row[2][3] ), .B2(n7182), .Z(n6663) );
  dti_28hc_7t_30_nand2hpx1 U3352 ( .A(n6237), .B(n3383), .Z(n6110) );
  dti_28hc_7t_30_invx1 U3338 ( .A(n3246), .Z(n3245) );
  dti_28hc_7t_30_invx1 U3336 ( .A(n3243), .Z(n3242) );
  dti_28hc_7t_30_nand2xp8 U4986 ( .A(n7130), .B(n7185), .Z(n6623) );
  dti_28hc_7t_30_aoi22x1 U7974 ( .A1(n7077), .A2(n7128), .B1(
        \eda_iterated_ram/current_row[2][5] ), .B2(n7182), .Z(n7029) );
  dti_28hc_7t_30_nand2x4 U4569 ( .A(n6979), .B(n5510), .Z(n7264) );
  dti_28hc_7t_30_nand2x1 U3350 ( .A(n7076), .B(n7185), .Z(n6664) );
  dti_28hc_7t_30_nand2xp8 U5093 ( .A(n7343), .B(\strb_value[2][4] ), .Z(n3696)
         );
  dti_28hc_7t_30_nand2x2 U4493 ( .A(n6231), .B(\strb_value[0][2] ), .Z(n3856)
         );
  dti_28hc_7t_30_aoi22x1 U7769 ( .A1(n7077), .A2(n7075), .B1(
        \eda_iterated_ram/current_row[2][1] ), .B2(n7182), .Z(n6671) );
  dti_28hc_7t_30_invx4 U4610 ( .A(n6238), .Z(n6242) );
  dti_28hc_7t_30_nand2px1 U5591 ( .A(n6051), .B(\strb_value[3][2] ), .Z(n3837)
         );
  dti_28hc_7t_30_nand2xp8 U4018 ( .A(n6835), .B(
        \eda_fifos/sync_fifo_upright/wr_addr [2]), .Z(n6795) );
  dti_28hc_7t_30_nand2px1 U5022 ( .A(n6154), .B(\strb_value[0][3] ), .Z(n3855)
         );
  dti_28hc_7t_30_muxi21x1 U4553 ( .D0(n7153), .D1(n7135), .S(n7193), .Z(n2683)
         );
  dti_28hc_7t_30_muxi21x1 U4323 ( .D0(n7153), .D1(n7151), .S(n3891), .Z(n2639)
         );
  dti_28hc_7t_30_muxi21x1 U4581 ( .D0(n6146), .D1(n7153), .S(n6242), .Z(n2645)
         );
  dti_28hc_7t_30_muxi21x1 U4594 ( .D0(n7153), .D1(n7142), .S(n7207), .Z(n2607)
         );
  dti_28hc_7t_30_muxi21x1 U5696 ( .D0(n7153), .D1(n7141), .S(n7205), .Z(n2595)
         );
  dti_28hc_7t_30_muxi21x1 U4562 ( .D0(n6989), .D1(n3565), .S(n7195), .Z(n2712)
         );
  dti_28hc_7t_30_oai112x1 U5324 ( .C1(n7133), .C2(n7080), .A(n7029), .B(n7030), 
        .Z(n2872) );
  dti_28hc_7t_30_oai112x1 U5448 ( .C1(n7190), .C2(n7080), .A(n6664), .B(n6663), 
        .Z(n2870) );
  dti_28hc_7t_30_aoi12rex1 U5672 ( .B1(n6817), .B2(n6816), .A(n6815), .Z(
        \eda_fifos/sync_fifo_left/comparator_inst/N53 ) );
  dti_28hc_7t_30_aoi12x1 U3916 ( .B1(n6169), .B2(n6877), .A(n6874), .Z(n2543)
         );
  dti_28hc_7t_30_muxi21x2 U3243 ( .D0(n7429), .D1(n7428), .S(n7593), .Z(n2436)
         );
  dti_28hc_7t_30_muxi21x2 U3246 ( .D0(n7409), .D1(n7408), .S(n3675), .Z(n2462)
         );
  dti_28hc_7t_30_oai12rex1 U3250 ( .B1(n6053), .B2(n6051), .A(n3837), .Z(n2472) );
  dti_28hc_7t_30_oai12x1 U3251 ( .B1(n6156), .B2(n6154), .A(n3855), .Z(n2500)
         );
  dti_28hc_7t_30_oai12x1 U3252 ( .B1(n7345), .B2(n7343), .A(n3696), .Z(n2476)
         );
  dti_28hc_7t_30_oai12rex1 U3254 ( .B1(n7423), .B2(n7421), .A(n3796), .Z(n2437) );
  dti_28hc_7t_30_muxi21x1 U3259 ( .D0(n7111), .D1(n7110), .S(n7254), .Z(n2841)
         );
  dti_28hc_7t_30_oai12rex1 U3262 ( .B1(n7336), .B2(n7334), .A(n3836), .Z(n2478) );
  dti_28hc_7t_30_nand3x1 U3265 ( .A(n3268), .B(n6708), .C(n7559), .Z(n2867) );
  dti_28hc_7t_30_muxi21x1 U3271 ( .D0(n6158), .D1(n7153), .S(n7000), .Z(n2657)
         );
  dti_28hc_7t_30_muxi21optax4 U3276 ( .D0(n7304), .D1(n7303), .S(n7653), .Z(
        n2498) );
  dti_28hc_7t_30_muxi21optax4 U3277 ( .D0(n7299), .D1(n7298), .S(n7774), .Z(
        n2499) );
  dti_28hc_7t_30_nor2i1poptax10 U3278 ( .A(n7603), .B(n7823), .Z(n7245) );
  dti_28hc_7t_30_nor3pmhzoptax10 U3280 ( .A(n6845), .B(n3687), .C(n6841), .Z(
        n7195) );
  dti_28hc_7t_30_invx3 U3281 ( .A(n3848), .Z(n7221) );
  dti_28hc_7t_30_invx3 U3282 ( .A(n7599), .Z(n3891) );
  dti_28hc_7t_30_nand2xp8 U3283 ( .A(n7363), .B(\strb_value[3][3] ), .Z(n3857)
         );
  dti_28hc_7t_30_nand2px4 U3284 ( .A(n6951), .B(
        \eda_fifos/sync_fifo_upleft/wr_addr [2]), .Z(n7211) );
  dti_28hc_7t_30_nand2x2 U3285 ( .A(n7302), .B(n7434), .Z(n7653) );
  dti_28hc_7t_30_nand2x2 U3286 ( .A(n7416), .B(n3668), .Z(n7686) );
  dti_28hc_7t_30_nand2x2 U3288 ( .A(n3357), .B(n3668), .Z(n7806) );
  dti_28hc_7t_30_nand2hpx4 U3289 ( .A(n7746), .B(n7745), .Z(n6234) );
  dti_28hc_7t_30_nand2x2 U3290 ( .A(n7665), .B(n7434), .Z(n7575) );
  dti_28hc_7t_30_nand2x2 U3291 ( .A(n7302), .B(n3511), .Z(n7774) );
  dti_28hc_7t_30_nand2x2 U3292 ( .A(n7417), .B(\strb_value[5][2] ), .Z(n3838)
         );
  dti_28hc_7t_30_nand2xp8 U3293 ( .A(n7421), .B(\strb_value[5][3] ), .Z(n3796)
         );
  dti_28hc_7t_30_aoi22x1 U3295 ( .A1(n6921), .A2(
        \eda_fifos/sync_fifo_up/wr_addr [2]), .B1(
        \eda_fifos/sync_fifo_up/wr_addr [3]), .B2(n6091), .Z(n6092) );
  dti_28hc_7t_30_nand2x4 U3296 ( .A(n6237), .B(n6906), .Z(n7233) );
  dti_28hc_7t_30_nand2px4 U3297 ( .A(n7603), .B(n3645), .Z(n3621) );
  dti_28hc_7t_30_aoi22x1 U3298 ( .A1(n7077), .A2(n7129), .B1(
        \eda_iterated_ram/current_row[2][4] ), .B2(n7182), .Z(n6715) );
  dti_28hc_7t_30_nor2pmhzx6 U3299 ( .A(n7554), .B(n7817), .Z(n7241) );
  dti_28hc_7t_30_nand2x2 U3300 ( .A(n3357), .B(n7372), .Z(n7674) );
  dti_28hc_7t_30_nand2x4 U3301 ( .A(n6979), .B(n6978), .Z(n7262) );
  dti_28hc_7t_30_nand2x4 U3317 ( .A(n6975), .B(n6977), .Z(n3563) );
  dti_28hc_7t_30_nand2hpx2 U3320 ( .A(n6979), .B(n5507), .Z(n7258) );
  dti_28hc_7t_30_nand2x2 U3321 ( .A(n3669), .B(n7319), .Z(n7600) );
  dti_28hc_7t_30_nor2px1 U3324 ( .A(n6921), .B(n6920), .Z(n7577) );
  dti_28hc_7t_30_nand2x2 U3325 ( .A(n3357), .B(n7665), .Z(n7792) );
  dti_28hc_7t_30_nand2x2 U3327 ( .A(n3357), .B(n7319), .Z(n7813) );
  dti_28hc_7t_30_nand2hpx1 U3332 ( .A(n7334), .B(\strb_value[2][2] ), .Z(n3836) );
  dti_28hc_7t_30_nand2x2 U3333 ( .A(n3511), .B(n7665), .Z(n7593) );
  dti_28hc_7t_30_aoi22x1 U3339 ( .A1(n7077), .A2(n6707), .B1(
        \eda_iterated_ram/current_row[2][0] ), .B2(n7182), .Z(n3268) );
  dti_28hc_7t_30_nand2x1 U3341 ( .A(n6693), .B(n6706), .Z(n6696) );
  dti_28hc_7t_30_nand2x1 U3343 ( .A(n6693), .B(n7185), .Z(n6639) );
  dti_28hc_7t_30_invx1 U3344 ( .A(n7560), .Z(n7559) );
  dti_28hc_7t_30_nor2hpoptax6 U3345 ( .A(n6966), .B(n6965), .Z(n7273) );
  dti_28hc_7t_30_nand2xp8 U3346 ( .A(n7392), .B(\strb_value[4][3] ), .Z(n3858)
         );
  dti_28hc_7t_30_nand4px4 U3347 ( .A(n6903), .B(n6902), .C(n6904), .D(n6901), 
        .Z(n7235) );
  dti_28hc_7t_30_or2x1 U3348 ( .A(n7080), .B(n6682), .Z(n3776) );
  dti_28hc_7t_30_nor2i1poptax6 U3349 ( .A(n6963), .B(n6090), .Z(n7000) );
  dti_28hc_7t_30_nand2x2 U3351 ( .A(n3357), .B(n7302), .Z(n7791) );
  dti_28hc_7t_30_nand2px1 U3353 ( .A(n6693), .B(n6707), .Z(n6679) );
  dti_28hc_7t_30_aoi22hpx2 U3354 ( .A1(n3571), .A2(n7185), .B1(n7182), .B2(
        \eda_iterated_ram/current_row[5][2] ), .Z(n6123) );
  dti_28hc_7t_30_nand2px2 U3355 ( .A(n3511), .B(n7348), .Z(n7343) );
  dti_28hc_7t_30_nand2px2 U3356 ( .A(n7416), .B(n7302), .Z(n6231) );
  dti_28hc_7t_30_nand3px4 U3358 ( .A(n7819), .B(n6662), .C(n7818), .Z(n7077)
         );
  dti_28hc_7t_30_nor2hpx4 U3359 ( .A(n6942), .B(n6941), .Z(n6949) );
  dti_28hc_7t_30_nand2x2 U3360 ( .A(n6802), .B(
        \eda_fifos/sync_fifo_left/wr_addr [2]), .Z(n6804) );
  dti_28hc_7t_30_invx2 U3361 ( .A(n6697), .Z(n7612) );
  dti_28hc_7t_30_nand2x2 U3362 ( .A(n7565), .B(n6620), .Z(n6694) );
  dti_28hc_7t_30_nand3px2 U3363 ( .A(n7742), .B(n3544), .C(n6163), .Z(n6720)
         );
  dti_28hc_7t_30_nand2px2 U3365 ( .A(n6963), .B(n6961), .Z(n6921) );
  dti_28hc_7t_30_nand2px2 U3366 ( .A(n6963), .B(n6145), .Z(n6238) );
  dti_28hc_7t_30_ioa12hpx2 U3367 ( .B1(n6904), .B2(n6628), .A(n3491), .Z(n6698) );
  dti_28hc_7t_30_nor2px4 U3368 ( .A(n6867), .B(n6864), .Z(n3848) );
  dti_28hc_7t_30_nand2x4 U3371 ( .A(n7785), .B(n3541), .Z(n7319) );
  dti_28hc_7t_30_nand2px4 U3372 ( .A(n3357), .B(n7348), .Z(n7329) );
  dti_28hc_7t_30_ioa12hpx2 U3373 ( .B1(n7603), .B2(n6657), .A(n7475), .Z(n6711) );
  dti_28hc_7t_30_nand2x2 U3374 ( .A(n4359), .B(n7516), .Z(n6938) );
  dti_28hc_7t_30_nand2px2 U3375 ( .A(n3669), .B(n7302), .Z(n6154) );
  dti_28hc_7t_30_invx3 U3376 ( .A(n6850), .Z(n7746) );
  dti_28hc_7t_30_nand2x3 U3377 ( .A(n7372), .B(n7416), .Z(n6051) );
  dti_28hc_7t_30_nand2px4 U3378 ( .A(n6975), .B(n6800), .Z(n3564) );
  dti_28hc_7t_30_nor2px4 U3380 ( .A(n6852), .B(n7799), .Z(n6861) );
  dti_28hc_7t_30_nand2x3 U3382 ( .A(n7416), .B(n7665), .Z(n7417) );
  dti_28hc_7t_30_nand2x4 U3384 ( .A(n6963), .B(n6957), .Z(n6966) );
  dti_28hc_7t_30_nor2px2 U3386 ( .A(n7132), .B(n6709), .Z(n7481) );
  dti_28hc_7t_30_aoi12x6 U3387 ( .B1(n3693), .B2(n6614), .A(n7491), .Z(n6697)
         );
  dti_28hc_7t_30_nor2hpx2 U3389 ( .A(n6867), .B(n6787), .Z(n6786) );
  dti_28hc_7t_30_invx2 U3390 ( .A(n7800), .Z(n7799) );
  dti_28hc_7t_30_nand2shzx8 U3391 ( .A(n7497), .B(n3541), .Z(n3357) );
  dti_28hc_7t_30_nor2px6 U3393 ( .A(n6867), .B(n6854), .Z(n7219) );
  dti_28hc_7t_30_oai13rehpx6 U3395 ( .B1(n3188), .B2(n7666), .B3(n7667), .A(
        n3541), .Z(n3668) );
  dti_28hc_7t_30_nand2pmhzx8 U3396 ( .A(n3456), .B(n3541), .Z(n7302) );
  dti_28hc_7t_30_nand2x4 U3397 ( .A(n3461), .B(n3541), .Z(n7407) );
  dti_28hc_7t_30_nand2px4 U3400 ( .A(n3731), .B(n3541), .Z(n7372) );
  dti_28hc_7t_30_nor2px4 U3401 ( .A(n6972), .B(n6801), .Z(n6975) );
  dti_28hc_7t_30_nand2x2 U3402 ( .A(n7603), .B(n3309), .Z(n3650) );
  dti_28hc_7t_30_invx1 U3405 ( .A(n3827), .Z(n7632) );
  dti_28hc_7t_30_nand2px2 U3406 ( .A(n6784), .B(n6783), .Z(n6852) );
  dti_28hc_7t_30_nor2px2 U3407 ( .A(n6850), .B(n6848), .Z(n6833) );
  dti_28hc_7t_30_oai12relm2x12 U3408 ( .B1(n7323), .B2(n3312), .A(n3539), .Z(
        n7348) );
  dti_28hc_7t_30_nor2px2 U3409 ( .A(n6877), .B(n6165), .Z(n7778) );
  dti_28hc_7t_30_nand2hpoptax6 U3410 ( .A(n3401), .B(n3312), .Z(n3456) );
  dti_28hc_7t_30_nor2i1px4 U3412 ( .A(n6650), .B(n7679), .Z(n3693) );
  dti_28hc_7t_30_nand2px4 U3413 ( .A(n4356), .B(n4357), .Z(n6941) );
  dti_28hc_7t_30_nor2px2 U3414 ( .A(n6842), .B(
        \eda_fifos/sync_fifo_upright/wr_addr [2]), .Z(n7831) );
  dti_28hc_7t_30_nand3pshzoptax8 U3418 ( .A(n6781), .B(n6784), .C(n7615), .Z(
        n6867) );
  dti_28hc_7t_30_nor2px1 U3420 ( .A(n6655), .B(n7477), .Z(n7476) );
  dti_28hc_7t_30_nor2hpx4 U3421 ( .A(n6853), .B(n6782), .Z(n6781) );
  dti_28hc_7t_30_nand3hpx1 U3423 ( .A(n3313), .B(n3497), .C(n6119), .Z(n7756)
         );
  dti_28hc_7t_30_nand2shzx8 U3431 ( .A(n3313), .B(n3497), .Z(n6647) );
  dti_28hc_7t_30_invshzx6 U3432 ( .A(n7292), .Z(n7802) );
  dti_28hc_7t_30_nand2px4 U3433 ( .A(n6618), .B(n6904), .Z(n6118) );
  dti_28hc_7t_30_nand2x1 U3434 ( .A(n6642), .B(n3366), .Z(n7614) );
  dti_28hc_7t_30_nor3x2 U3437 ( .A(n6643), .B(n7695), .C(n7764), .Z(n3331) );
  dti_28hc_7t_30_oai12rehpoptax4 U3438 ( .B1(n3300), .B2(n3260), .A(n5438), 
        .Z(n3448) );
  dti_28hc_7t_30_nand2x2 U3439 ( .A(n5326), .B(n7734), .Z(n7733) );
  dti_28hc_7t_30_nand2x1 U3441 ( .A(n3289), .B(n5361), .Z(n3339) );
  dti_28hc_7t_30_nor2x2 U3443 ( .A(n7508), .B(n7507), .Z(n3338) );
  dti_28hc_7t_30_aoi12rehpx2 U3444 ( .B1(n5188), .B2(n5437), .A(n7801), .Z(
        n3260) );
  dti_28hc_7t_30_invx1 U3445 ( .A(n7554), .Z(n7825) );
  dti_28hc_7t_30_invx2 U3451 ( .A(n5434), .Z(n3286) );
  dti_28hc_7t_30_ioa12hpx2 U3452 ( .B1(n5434), .B2(n7074), .A(n7555), .Z(n7801) );
  dti_28hc_7t_30_nand2mhzx8 U3457 ( .A(n3642), .B(n4959), .Z(n5471) );
  dti_28hc_7t_30_nand2pshzx10 U3458 ( .A(n6903), .B(n6904), .Z(n7554) );
  dti_28hc_7t_30_nor2x2 U3461 ( .A(n7594), .B(n3310), .Z(n5234) );
  dti_28hc_7t_30_nor2pmhzx12 U3463 ( .A(n7685), .B(n4957), .Z(n6904) );
  dti_28hc_7t_30_nor2x3 U3466 ( .A(n7603), .B(n7525), .Z(n3642) );
  dti_28hc_7t_30_nor2i1x2 U3467 ( .A(n6826), .B(n7727), .Z(n7726) );
  dti_28hc_7t_30_nand2hpx4 U3474 ( .A(n4955), .B(n6104), .Z(n6659) );
  dti_28hc_7t_30_nand2x2 U3475 ( .A(n3755), .B(n3754), .Z(n5276) );
  dti_28hc_7t_30_nand2px2 U3476 ( .A(n3238), .B(n3849), .Z(n6816) );
  dti_28hc_7t_30_nand3px2 U3477 ( .A(n5486), .B(n5490), .C(n7752), .Z(n6923)
         );
  dti_28hc_7t_30_invx3 U3480 ( .A(n3291), .Z(n7663) );
  dti_28hc_7t_30_nor2px1 U3482 ( .A(n6201), .B(n6083), .Z(n3755) );
  dti_28hc_7t_30_nor2px1 U3484 ( .A(n7569), .B(n6730), .Z(n7496) );
  dti_28hc_7t_30_nor3px4 U3486 ( .A(n6103), .B(n6095), .C(n6106), .Z(n4955) );
  dti_28hc_7t_30_invx2 U3489 ( .A(n6060), .Z(n4771) );
  dti_28hc_7t_30_xnor2bx1 U3490 ( .A(n4867), .B(n7670), .Z(n6929) );
  dti_28hc_7t_30_nand2px1 U3495 ( .A(n5228), .B(n7305), .Z(n5973) );
  dti_28hc_7t_30_nand2x4 U3499 ( .A(n4906), .B(n7789), .Z(n6730) );
  dti_28hc_7t_30_nand2px1 U3500 ( .A(n7789), .B(n4899), .Z(n7510) );
  dti_28hc_7t_30_nand3hpx1 U3501 ( .A(n6200), .B(n6198), .C(n6197), .Z(n6083)
         );
  dti_28hc_7t_30_nor2px1 U3502 ( .A(n6074), .B(n3716), .Z(n7566) );
  dti_28hc_7t_30_invxp8 U3505 ( .A(n6731), .Z(n7509) );
  dti_28hc_7t_30_oai13rehpoptax6 U3507 ( .B1(n7772), .B2(n4822), .B3(n7771), 
        .A(n7770), .Z(n3416) );
  dti_28hc_7t_30_or2x1 U3508 ( .A(n3711), .B(n4081), .Z(n3284) );
  dti_28hc_7t_30_or2x2 U3509 ( .A(n5150), .B(n4821), .Z(n7770) );
  dti_28hc_7t_30_nand2x2 U3511 ( .A(n4818), .B(n4820), .Z(n7772) );
  dti_28hc_7t_30_nor2px1 U3513 ( .A(n7794), .B(n5230), .Z(n5228) );
  dti_28hc_7t_30_nor2hpx1 U3517 ( .A(n3566), .B(n5488), .Z(n7668) );
  dti_28hc_7t_30_aoi12x1 U3519 ( .B1(n3714), .B2(n3775), .A(n7589), .Z(n6074)
         );
  dti_28hc_7t_30_nand2px1 U3520 ( .A(n3248), .B(n3249), .Z(n3716) );
  dti_28hc_7t_30_nand3hpx1 U3521 ( .A(n5152), .B(n3256), .C(n3255), .Z(n6073)
         );
  dti_28hc_7t_30_and2hpx2 U3522 ( .A(n3583), .B(n3574), .Z(n6631) );
  dti_28hc_7t_30_oai12rehpx1 U3524 ( .B1(n5157), .B2(n3775), .A(n3802), .Z(
        n7589) );
  dti_28hc_7t_30_nand2x1 U3525 ( .A(n3508), .B(n4868), .Z(n7515) );
  dti_28hc_7t_30_muxi21x4 U3527 ( .D0(n4842), .D1(n4841), .S(n3702), .Z(n3710)
         );
  dti_28hc_7t_30_aoi22x1 U3530 ( .A1(n3487), .A2(n3775), .B1(n7809), .B2(n3702), .Z(n3711) );
  dti_28hc_7t_30_nand3px4 U3532 ( .A(n3514), .B(n7585), .C(n3516), .Z(n4841)
         );
  dti_28hc_7t_30_invxp9 U3535 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [2]), 
        .Z(n7519) );
  dti_28hc_7t_30_or2x2 U3537 ( .A(\eda_fifos/sync_fifo_downleft/rd_addr [1]), 
        .B(n6880), .Z(n4889) );
  dti_28hc_7t_30_nand2x3 U3540 ( .A(n5563), .B(n5565), .Z(n5498) );
  dti_28hc_7t_30_xnor2bx1 U3541 ( .A(n5134), .B(n5582), .Z(n3574) );
  dti_28hc_7t_30_nand4px4 U3543 ( .A(n4687), .B(n3421), .C(n4688), .D(n3422), 
        .Z(n3290) );
  dti_28hc_7t_30_nand3hpx2 U3545 ( .A(n7538), .B(n3743), .C(n4684), .Z(n4817)
         );
  dti_28hc_7t_30_nand4px1 U3547 ( .A(n4382), .B(n4383), .C(n4381), .D(n4384), 
        .Z(n3487) );
  dti_28hc_7t_30_nand4px1 U3548 ( .A(n3485), .B(n3486), .C(n4386), .D(n4385), 
        .Z(n7809) );
  dti_28hc_7t_30_aoi22rex1 U3551 ( .A1(\eda_iterated_ram/current_row[3][5] ), 
        .A2(n5429), .B1(\eda_iterated_ram/current_row[5][5] ), .B2(n5140), .Z(
        n4078) );
  dti_28hc_7t_30_invx2 U3552 ( .A(n6176), .Z(n7466) );
  dti_28hc_7t_30_aoi22x1 U3554 ( .A1(\eda_iterated_ram/current_row[2][5] ), 
        .A2(n3320), .B1(n3309), .B2(\eda_iterated_ram/current_row[4][5] ), .Z(
        n4079) );
  dti_28hc_7t_30_aoi22hpx1 U3555 ( .A1(\eda_iterated_ram/current_row[0][2] ), 
        .A2(n6633), .B1(\eda_iterated_ram/current_row[3][2] ), .B2(n5429), .Z(
        n3750) );
  dti_28hc_7t_30_and2x1 U3556 ( .A(n3659), .B(n3419), .Z(n7797) );
  dti_28hc_7t_30_xor2bx1 U3558 ( .A(n3527), .B(n5594), .Z(n5015) );
  dti_28hc_7t_30_nand3hpx1 U3564 ( .A(n3773), .B(n4380), .C(n4379), .Z(n4616)
         );
  dti_28hc_7t_30_invx2 U3565 ( .A(n7605), .Z(
        \eda_iterated_ram/current_row[2][2] ) );
  dti_28hc_7t_30_invx2 U3566 ( .A(n7553), .Z(
        \eda_iterated_ram/current_row[3][2] ) );
  dti_28hc_7t_30_aoi22x4 U3571 ( .A1(\eda_iterated_ram/current_row[4][0] ), 
        .A2(n6657), .B1(\eda_iterated_ram/current_row[1][0] ), .B2(n6604), .Z(
        n3735) );
  dti_28hc_7t_30_invx3 U3572 ( .A(n7250), .Z(n3702) );
  dti_28hc_7t_30_invmhzx12 U3576 ( .A(n3829), .Z(n7250) );
  dti_28hc_7t_30_nand3x2 U3577 ( .A(n4520), .B(n4519), .C(n7798), .Z(n5751) );
  dti_28hc_7t_30_nor2px6 U3579 ( .A(n7751), .B(n7750), .Z(n3527) );
  dti_28hc_7t_30_aoi22hpx1 U3581 ( .A1(n5021), .A2(n6633), .B1(n5018), .B2(
        n3320), .Z(n4519) );
  dti_28hc_7t_30_and2x2 U3582 ( .A(n4767), .B(n4766), .Z(n7690) );
  dti_28hc_7t_30_nand3x2 U3584 ( .A(n7505), .B(n5048), .C(n5047), .Z(n5582) );
  dti_28hc_7t_30_aoi22x1 U3589 ( .A1(n4693), .A2(n4855), .B1(n4689), .B2(n4856), .Z(n7489) );
  dti_28hc_7t_30_nand2xp8 U3593 ( .A(n4690), .B(n3319), .Z(n7776) );
  dti_28hc_7t_30_nand2px1 U3594 ( .A(n5126), .B(n5589), .Z(n3821) );
  dti_28hc_7t_30_nand3hpx1 U3597 ( .A(n3911), .B(n3910), .C(n7464), .Z(n4752)
         );
  dti_28hc_7t_30_nand2x2 U3598 ( .A(n5137), .B(n3320), .Z(n7740) );
  dti_28hc_7t_30_aoi22rex1 U3599 ( .A1(n3599), .A2(
        \eda_img_ram/img_memory[5][3][7] ), .B1(
        \eda_img_ram/img_memory[5][1][7] ), .B2(n3931), .Z(n4580) );
  dti_28hc_7t_30_aoi22xp8 U3600 ( .A1(n5138), .A2(n3320), .B1(n5137), .B2(
        n5429), .Z(n5147) );
  dti_28hc_7t_30_nand3x2 U3607 ( .A(n5034), .B(n7765), .C(n5035), .Z(n5587) );
  dti_28hc_7t_30_aoi22x3 U3610 ( .A1(n5083), .A2(n5429), .B1(n5082), .B2(n6633), .Z(n7548) );
  dti_28hc_7t_30_nand4px1 U3612 ( .A(n4536), .B(n4535), .C(n4533), .D(n4534), 
        .Z(n4976) );
  dti_28hc_7t_30_aoi22xp8 U3613 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[0][3][1] ), .B1(n6595), .B2(
        \eda_img_ram/img_memory[0][5][1] ), .Z(n4130) );
  dti_28hc_7t_30_and2x1 U3614 ( .A(n5033), .B(n5032), .Z(n7765) );
  dti_28hc_7t_30_aoi22hpx1 U3617 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[2][2][5] ), .B1(
        \eda_img_ram/img_memory[2][5][5] ), .B2(n4582), .Z(n4564) );
  dti_28hc_7t_30_nand4px4 U3618 ( .A(n3947), .B(n3946), .C(n3944), .D(n3945), 
        .Z(n5082) );
  dti_28hc_7t_30_nand4px2 U3620 ( .A(n4284), .B(n3294), .C(n4282), .D(n4283), 
        .Z(n5137) );
  dti_28hc_7t_30_nand4px2 U3623 ( .A(n4286), .B(n4288), .C(n4287), .D(n4285), 
        .Z(n5143) );
  dti_28hc_7t_30_nand4px1 U3625 ( .A(n4505), .B(n4504), .C(n4503), .D(n4502), 
        .Z(n5021) );
  dti_28hc_7t_30_nand4px1 U3626 ( .A(n4036), .B(n4035), .C(n4034), .D(n4037), 
        .Z(n5115) );
  dti_28hc_7t_30_bufmhzx6 U3629 ( .A(n5589), .Z(n6604) );
  dti_28hc_7t_30_iao22x1 U3630 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[2][4][5] ), .B1(n4340), .B2(n6483), .Z(n4347)
         );
  dti_28hc_7t_30_aoi22x3 U3632 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[4][1][2] ), .B1(n4541), .B2(
        \eda_img_ram/img_memory[4][4][2] ), .Z(n4020) );
  dti_28hc_7t_30_aoi22rex2 U3636 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[1][1][2] ), .B1(
        \eda_img_ram/img_memory[1][4][2] ), .B2(n4582), .Z(n4032) );
  dti_28hc_7t_30_aoi22hpx1 U3637 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[4][2][3] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[4][1][3] ), .Z(n3939) );
  dti_28hc_7t_30_nand4px2 U3639 ( .A(n4093), .B(n4090), .C(n4091), .D(n7645), 
        .Z(n5075) );
  dti_28hc_7t_30_aoi22hpx4 U3640 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[5][1][4] ), .B1(n6174), .B2(
        \eda_img_ram/img_memory[5][5][4] ), .Z(n3795) );
  dti_28hc_7t_30_aoi22rex1 U3644 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][5][1] ), .B1(n4603), .B2(
        \eda_img_ram/img_memory[2][3][1] ), .Z(n3878) );
  dti_28hc_7t_30_aoi22x2 U3645 ( .A1(n6086), .A2(
        \eda_img_ram/img_memory[5][3][5] ), .B1(n6174), .B2(
        \eda_img_ram/img_memory[5][5][5] ), .Z(n3682) );
  dti_28hc_7t_30_aoi22hpoptax4 U3648 ( .A1(n3603), .A2(
        \eda_img_ram/img_memory[5][2][1] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[5][1][1] ), .Z(n7645) );
  dti_28hc_7t_30_nand2x1 U3649 ( .A(n4022), .B(n7677), .Z(n7676) );
  dti_28hc_7t_30_invx1 U3654 ( .A(n3938), .Z(n7523) );
  dti_28hc_7t_30_nand3i1x4 U3656 ( .A(left_addr[5]), .B(left_addr[4]), .C(
        n7074), .Z(n6646) );
  dti_28hc_7t_30_aoi22hpx1 U3658 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[3][4][1] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[3][0][1] ), .Z(n4104) );
  dti_28hc_7t_30_invx1 U3667 ( .A(n3991), .Z(n7572) );
  dti_28hc_7t_30_invmhzx16 U3668 ( .A(n6124), .Z(n4592) );
  dti_28hc_7t_30_nand2x1 U3669 ( .A(n4591), .B(
        \eda_img_ram/img_memory[3][1][2] ), .Z(n7677) );
  dti_28hc_7t_30_nand2xp8 U3670 ( .A(n3605), .B(
        \eda_img_ram/img_memory[3][2][2] ), .Z(n4022) );
  dti_28hc_7t_30_aoi22x2 U3675 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[3][3][4] ), .B1(n7517), .B2(
        \eda_img_ram/img_memory[3][1][4] ), .Z(n4157) );
  dti_28hc_7t_30_invx14 U3676 ( .A(n4340), .Z(n4602) );
  dti_28hc_7t_30_invx12 U3677 ( .A(n7492), .Z(n4582) );
  dti_28hc_7t_30_invshzx8 U3678 ( .A(n4340), .Z(n4597) );
  dti_28hc_7t_30_bufx1 U3679 ( .A(left_addr[4]), .Z(n7631) );
  dti_28hc_7t_30_invx2 U3680 ( .A(n3804), .Z(n7486) );
  dti_28hc_7t_30_invx2 U3682 ( .A(n3900), .Z(n7485) );
  dti_28hc_7t_30_aoi12hpx2 U3685 ( .B1(n6191), .B2(
        \eda_img_ram/img_memory[4][5][1] ), .A(n3283), .Z(n3282) );
  dti_28hc_7t_30_bufmhzx28 U3687 ( .A(n3920), .Z(n4541) );
  dti_28hc_7t_30_nor2px6 U3694 ( .A(n7274), .B(n4368), .Z(n4408) );
  dti_28hc_7t_30_and2x1 U3698 ( .A(left_addr[5]), .B(n7057), .Z(n4210) );
  dti_28hc_7t_30_invx10 U3699 ( .A(n3605), .Z(n3592) );
  dti_28hc_7t_30_invmhzx18 U3700 ( .A(n3605), .Z(n3308) );
  dti_28hc_7t_30_invshzx8 U3703 ( .A(up_addr[0]), .Z(n3829) );
  dti_28hc_7t_30_muxi21x2 U3704 ( .D0(n7435), .D1(n3499), .S(n7575), .Z(n2435)
         );
  dti_28hc_7t_30_muxi21x2 U3708 ( .D0(n3254), .D1(n3253), .S(n3252), .Z(n3567)
         );
  dti_28hc_7t_30_nor2hpoptax6 U3709 ( .A(n3621), .B(n7790), .Z(n7781) );
  dti_28hc_7t_30_nor2hpoptax6 U3714 ( .A(n3621), .B(n6893), .Z(n3396) );
  dti_28hc_7t_30_xnor2x1 U3719 ( .A(n7739), .B(n5539), .Z(n2627) );
  dti_28hc_7t_30_nand3x2 U3720 ( .A(n6690), .B(n6689), .C(n7641), .Z(n2881) );
  dti_28hc_7t_30_oai12x2 U3730 ( .B1(n6233), .B2(n6231), .A(n3856), .Z(n2501)
         );
  dti_28hc_7t_30_muxi21x2 U3736 ( .D0(n7018), .D1(n7021), .S(n7249), .Z(n2832)
         );
  dti_28hc_7t_30_muxi21x1 U3738 ( .D0(n7021), .D1(n7017), .S(n7247), .Z(n2820)
         );
  dti_28hc_7t_30_oai12rehpx1 U3741 ( .B1(n7354), .B2(n7356), .A(n3834), .Z(
        n2474) );
  dti_28hc_7t_30_oai12rex1 U3743 ( .B1(n6820), .B2(n6819), .A(n7582), .Z(n2766) );
  dti_28hc_7t_30_oai12rex1 U3744 ( .B1(n7375), .B2(n7373), .A(n3778), .Z(n2469) );
  dti_28hc_7t_30_oai12rex1 U3746 ( .B1(n7331), .B2(n7329), .A(n3782), .Z(n2479) );
  dti_28hc_7t_30_muxi21x1 U3748 ( .D0(n3775), .D1(n7255), .S(n7254), .Z(n2846)
         );
  dti_28hc_7t_30_muxi21x1 U3752 ( .D0(n7181), .D1(n7171), .S(n7235), .Z(n2552)
         );
  dti_28hc_7t_30_muxi21x1 U3757 ( .D0(n7220), .D1(n3775), .S(n7219), .Z(n2802)
         );
  dti_28hc_7t_30_nand3x2 U3758 ( .A(n6123), .B(n3247), .C(n3245), .Z(n2887) );
  dti_28hc_7t_30_xor2bx1 U3760 ( .A(n7577), .B(
        \eda_fifos/sync_fifo_up/wr_addr [3]), .Z(n2671) );
  dti_28hc_7t_30_oai12rehpx1 U3761 ( .B1(n7419), .B2(n7417), .A(n3838), .Z(
        n2460) );
  dti_28hc_7t_30_muxi21x1 U3762 ( .D0(n7096), .D1(n7111), .S(n7219), .Z(n2797)
         );
  dti_28hc_7t_30_muxi21x2 U3764 ( .D0(n7111), .D1(n7098), .S(n7223), .Z(n2773)
         );
  dti_28hc_7t_30_muxi21x1 U3766 ( .D0(n7028), .D1(n7023), .S(n7215), .Z(n2770)
         );
  dti_28hc_7t_30_muxi21x1 U3767 ( .D0(n7028), .D1(n7024), .S(n7217), .Z(n2782)
         );
  dti_28hc_7t_30_oai12rex2 U3769 ( .B1(n7326), .B2(n7324), .A(n3833), .Z(n2480) );
  dti_28hc_7t_30_xor2bx1 U3770 ( .A(n6804), .B(n3686), .Z(n2759) );
  dti_28hc_7t_30_oai12rex1 U3771 ( .B1(n7394), .B2(n7392), .A(n3858), .Z(n2465) );
  dti_28hc_7t_30_muxi21x1 U3772 ( .D0(n6765), .D1(
        \eda_fifos/sync_fifo_down/wr_addr [0]), .S(n7736), .Z(n2586) );
  dti_28hc_7t_30_xor2bx1 U3773 ( .A(n6110), .B(n7531), .Z(n2584) );
  dti_28hc_7t_30_aoi12hpx1 U3774 ( .B1(n5276), .B2(n7556), .A(n7459), .Z(
        \eda_fifos/sync_fifo_upright/comparator_inst/N53 ) );
  dti_28hc_7t_30_muxi21x2 U3775 ( .D0(n7398), .D1(n7397), .S(n7807), .Z(n2464)
         );
  dti_28hc_7t_30_muxi21x2 U3779 ( .D0(n7369), .D1(n7368), .S(n7775), .Z(n2470)
         );
  dti_28hc_7t_30_muxi21x2 U3781 ( .D0(n7308), .D1(n3475), .S(n3474), .Z(n2497)
         );
  dti_28hc_7t_30_muxi21x2 U3784 ( .D0(n7381), .D1(n7380), .S(n7808), .Z(n2468)
         );
  dti_28hc_7t_30_muxi21x2 U3785 ( .D0(n7313), .D1(n3437), .S(n3386), .Z(n2495)
         );
  dti_28hc_7t_30_muxi21x2 U3787 ( .D0(n7320), .D1(n3402), .S(n3259), .Z(n2492)
         );
  dti_28hc_7t_30_muxi21x2 U3789 ( .D0(n7136), .D1(n7153), .S(n7195), .Z(n2713)
         );
  dti_28hc_7t_30_muxi21x2 U3790 ( .D0(n7413), .D1(n7412), .S(n7792), .Z(n2461)
         );
  dti_28hc_7t_30_muxi21x2 U3791 ( .D0(n7360), .D1(n7359), .S(n7674), .Z(n2473)
         );
  dti_28hc_7t_30_muxi21x2 U3794 ( .D0(n7384), .D1(n3347), .S(n7806), .Z(n2467)
         );
  dti_28hc_7t_30_muxi21x2 U3796 ( .D0(n7340), .D1(n7339), .S(n7694), .Z(n2477)
         );
  dti_28hc_7t_30_muxi21x2 U3797 ( .D0(n7389), .D1(n7687), .S(n7686), .Z(n2466)
         );
  dti_28hc_7t_30_muxi21x2 U3799 ( .D0(n7317), .D1(n7316), .S(n7600), .Z(n2494)
         );
  dti_28hc_7t_30_muxi21x2 U3801 ( .D0(n7311), .D1(n3657), .S(n7813), .Z(n2496)
         );
  dti_28hc_7t_30_muxi21x1 U3802 ( .D0(n7403), .D1(n3748), .S(n7524), .Z(n2463)
         );
  dti_28hc_7t_30_aoi22hpx4 U3803 ( .A1(n6710), .A2(n7128), .B1(
        \eda_iterated_ram/current_row[4][5] ), .B2(n7618), .Z(n6692) );
  dti_28hc_7t_30_aoi22x3 U3805 ( .A1(n7184), .A2(n7128), .B1(
        \eda_iterated_ram/current_row[0][5] ), .B2(n7495), .Z(n6608) );
  dti_28hc_7t_30_aoi22x3 U3806 ( .A1(n3571), .A2(n7183), .B1(
        \eda_iterated_ram/current_row[5][3] ), .B2(n7182), .Z(n6624) );
  dti_28hc_7t_30_nand2x2 U3807 ( .A(n7407), .B(n3668), .Z(n7808) );
  dti_28hc_7t_30_nand2x2 U3808 ( .A(n7416), .B(n7319), .Z(n3386) );
  dti_28hc_7t_30_or2xp85 U3809 ( .A(n6970), .B(n6975), .Z(n7582) );
  dti_28hc_7t_30_iao22x4 U3810 ( .A1(n7184), .A2(n7075), .B1(
        \eda_iterated_ram/have_done ), .B2(n7536), .Z(n6677) );
  dti_28hc_7t_30_invx3 U3812 ( .A(n3851), .Z(n7223) );
  dti_28hc_7t_30_nand2px1 U3813 ( .A(n7186), .B(n7129), .Z(n6607) );
  dti_28hc_7t_30_nand2x2 U3814 ( .A(n7407), .B(n7319), .Z(n3474) );
  dti_28hc_7t_30_nand2x1 U3817 ( .A(n7373), .B(\strb_value[3][5] ), .Z(n3778)
         );
  dti_28hc_7t_30_aoi22x1 U3818 ( .A1(n6694), .A2(n7128), .B1(
        \eda_iterated_ram/current_row[3][5] ), .B2(n7182), .Z(n6621) );
  dti_28hc_7t_30_iao22x2 U3819 ( .A1(n7184), .A2(n6707), .B1(n7470), .B2(
        \eda_iterated_ram/have_done ), .Z(n6705) );
  dti_28hc_7t_30_nand2px1 U3820 ( .A(n3586), .B(n7185), .Z(n6636) );
  dti_28hc_7t_30_iao22x4 U3821 ( .A1(n6710), .A2(n7075), .B1(n7543), .B2(
        \eda_iterated_ram/have_done ), .Z(n6681) );
  dti_28hc_7t_30_iao22x4 U3822 ( .A1(n6710), .A2(n7129), .B1(n7588), .B2(
        \eda_iterated_ram/have_done ), .Z(n6088) );
  dti_28hc_7t_30_nand2px2 U3824 ( .A(n7434), .B(n3668), .Z(n7524) );
  dti_28hc_7t_30_invx1 U3825 ( .A(n7500), .Z(n7499) );
  dti_28hc_7t_30_nand2x2 U3827 ( .A(n3511), .B(n7319), .Z(n3252) );
  dti_28hc_7t_30_nand2x2 U3830 ( .A(n7434), .B(n7319), .Z(n3259) );
  dti_28hc_7t_30_nand2hpoptax6 U3832 ( .A(n3385), .B(n6798), .Z(n7191) );
  dti_28hc_7t_30_nor2i1poptax10 U3833 ( .A(n7603), .B(n7453), .Z(n7249) );
  dti_28hc_7t_30_nand2xp8 U3834 ( .A(n6693), .B(n7129), .Z(n6622) );
  dti_28hc_7t_30_nand2x1 U3836 ( .A(n6693), .B(n7183), .Z(n6670) );
  dti_28hc_7t_30_nand2x1 U3837 ( .A(n7130), .B(n6707), .Z(n6673) );
  dti_28hc_7t_30_nor2pmhzx6 U3839 ( .A(n7554), .B(n7767), .Z(n7237) );
  dti_28hc_7t_30_nand2px2 U3840 ( .A(n6963), .B(n6962), .Z(n7271) );
  dti_28hc_7t_30_invx1 U3842 ( .A(n7683), .Z(n7682) );
  dti_28hc_7t_30_invx1 U3843 ( .A(n7758), .Z(n7757) );
  dti_28hc_7t_30_nand2x1 U3844 ( .A(n6710), .B(n7183), .Z(n7702) );
  dti_28hc_7t_30_nand2px2 U3845 ( .A(n7186), .B(n7185), .Z(n7187) );
  dti_28hc_7t_30_invx1 U3847 ( .A(n7580), .Z(n7579) );
  dti_28hc_7t_30_nand2x2 U3849 ( .A(n3669), .B(n7348), .Z(n7694) );
  dti_28hc_7t_30_nand2px2 U3850 ( .A(n3863), .B(n6897), .Z(n3526) );
  dti_28hc_7t_30_nand2px2 U3852 ( .A(n7329), .B(\strb_value[2][1] ), .Z(n3782)
         );
  dti_28hc_7t_30_nand2hpx4 U3853 ( .A(n7746), .B(n7760), .Z(n7199) );
  dti_28hc_7t_30_nand2px1 U3854 ( .A(n6711), .B(n7129), .Z(n6691) );
  dti_28hc_7t_30_nand2px4 U3855 ( .A(n3535), .B(n3534), .Z(n7193) );
  dti_28hc_7t_30_nand2x1 U3856 ( .A(n3586), .B(n7183), .Z(n3489) );
  dti_28hc_7t_30_nand2xp8 U3857 ( .A(n3586), .B(n6707), .Z(n3322) );
  dti_28hc_7t_30_nand2hpx1 U3860 ( .A(n7612), .B(n7729), .Z(n7662) );
  dti_28hc_7t_30_nand2hpx1 U3862 ( .A(n7612), .B(n7611), .Z(n7610) );
  dti_28hc_7t_30_nand2px4 U3864 ( .A(n6874), .B(n6873), .Z(n7226) );
  dti_28hc_7t_30_nand2hpx1 U3865 ( .A(n7620), .B(n7619), .Z(n7706) );
  dti_28hc_7t_30_nor2i1x2 U3866 ( .A(n7737), .B(n7554), .Z(n7736) );
  dti_28hc_7t_30_aoi22rex1 U3867 ( .A1(n6698), .A2(n7185), .B1(n3543), .B2(
        n7182), .Z(n6684) );
  dti_28hc_7t_30_nand2px1 U3869 ( .A(n3571), .B(n6707), .Z(n7482) );
  dti_28hc_7t_30_nor2px2 U3872 ( .A(n7481), .B(n7480), .Z(n7479) );
  dti_28hc_7t_30_aoi22x3 U3873 ( .A1(n6710), .A2(n7185), .B1(n7182), .B2(
        \eda_iterated_ram/current_row[4][2] ), .Z(n6690) );
  dti_28hc_7t_30_iao22x2 U3874 ( .A1(n6710), .A2(n6707), .B1(
        \eda_iterated_ram/have_done ), .B2(n7691), .Z(n7701) );
  dti_28hc_7t_30_aoi22hpx1 U3876 ( .A1(n6694), .A2(n7129), .B1(n7182), .B2(
        \eda_iterated_ram/current_row[3][4] ), .Z(n7592) );
  dti_28hc_7t_30_aoi22x3 U3878 ( .A1(n7184), .A2(n7185), .B1(n7636), .B2(n7504), .Z(n6686) );
  dti_28hc_7t_30_aoi22x1 U3880 ( .A1(n6694), .A2(n7185), .B1(n3378), .B2(n7182), .Z(n6687) );
  dti_28hc_7t_30_nand2x3 U3881 ( .A(n7416), .B(n7348), .Z(n7334) );
  dti_28hc_7t_30_nand2hpoptax6 U3882 ( .A(n6840), .B(
        \eda_fifos/sync_fifo_upright/wr_addr [0]), .Z(n6845) );
  dti_28hc_7t_30_or2x1 U3885 ( .A(n6911), .B(n3862), .Z(n7817) );
  dti_28hc_7t_30_or2xp5 U3886 ( .A(n6870), .B(
        \eda_fifos/sync_fifo_downleft/wr_addr [0]), .Z(n7743) );
  dti_28hc_7t_30_nand2x2 U3887 ( .A(n7407), .B(n7348), .Z(n7324) );
  dti_28hc_7t_30_nand2mhzx10 U3888 ( .A(n6079), .B(n6078), .Z(n6710) );
  dti_28hc_7t_30_nand2px2 U3889 ( .A(n6786), .B(
        \eda_fifos/sync_fifo_right/wr_addr [2]), .Z(n6212) );
  dti_28hc_7t_30_invxp5 U3891 ( .A(\eda_iterated_ram/have_done ), .Z(n7495) );
  dti_28hc_7t_30_invshzx6 U3892 ( .A(n7698), .Z(n3571) );
  dti_28hc_7t_30_nand2x3 U3893 ( .A(n3652), .B(n3261), .Z(n6693) );
  dti_28hc_7t_30_invxp5 U3895 ( .A(\eda_iterated_ram/have_done ), .Z(n7504) );
  dti_28hc_7t_30_nand2px1 U3896 ( .A(n3808), .B(n7790), .Z(n6056) );
  dti_28hc_7t_30_nand2px2 U3898 ( .A(n7348), .B(n7434), .Z(n7349) );
  dti_28hc_7t_30_bufx3 U3899 ( .A(n6054), .Z(n3639) );
  dti_28hc_7t_30_nand3x3 U3901 ( .A(n3650), .B(n6606), .C(n7465), .Z(n7186) );
  dti_28hc_7t_30_invx3 U3904 ( .A(n7778), .Z(n7166) );
  dti_28hc_7t_30_or2xp5 U3905 ( .A(n6876), .B(n3544), .Z(n7744) );
  dti_28hc_7t_30_nand3x2 U3906 ( .A(n7632), .B(n6634), .C(n3272), .Z(n3586) );
  dti_28hc_7t_30_nand3x2 U3907 ( .A(n7664), .B(n6120), .C(n6121), .Z(n7130) );
  dti_28hc_7t_30_nor2px2 U3908 ( .A(n6701), .B(n6682), .Z(n7469) );
  dti_28hc_7t_30_invx1 U3909 ( .A(n6849), .Z(n7760) );
  dti_28hc_7t_30_nor2x2 U3910 ( .A(n7080), .B(n7576), .Z(n7596) );
  dti_28hc_7t_30_invx1 U3911 ( .A(n3798), .Z(n7823) );
  dti_28hc_7t_30_nor2hpx4 U3913 ( .A(n6109), .B(n6898), .Z(n6237) );
  dti_28hc_7t_30_nand2px2 U3914 ( .A(n3669), .B(n3668), .Z(n7392) );
  dti_28hc_7t_30_nand2px2 U3915 ( .A(n3669), .B(n7372), .Z(n7363) );
  dti_28hc_7t_30_oai12rexp5 U3918 ( .B1(n6877), .B2(n6718), .A(n6168), .Z(
        n6721) );
  dti_28hc_7t_30_nor2px2 U3919 ( .A(n3731), .B(n3461), .Z(n3730) );
  dti_28hc_7t_30_oai12rehpx1 U3923 ( .B1(n6697), .B2(n7190), .A(n7581), .Z(
        n7580) );
  dti_28hc_7t_30_oai12rehplm2x2 U3924 ( .B1(n6697), .B2(n6709), .A(n7501), .Z(
        n7500) );
  dti_28hc_7t_30_aoi12hpoptax4 U3929 ( .B1(n3693), .B2(n6625), .A(n7484), .Z(
        n6701) );
  dti_28hc_7t_30_nor3px4 U3932 ( .A(n7696), .B(n7697), .C(n3340), .Z(n7080) );
  dti_28hc_7t_30_nand3px4 U3934 ( .A(n7378), .B(n7667), .C(n3188), .Z(n7785)
         );
  dti_28hc_7t_30_nand3px2 U3936 ( .A(n6170), .B(n7795), .C(n6171), .Z(n6881)
         );
  dti_28hc_7t_30_aoi22hpoptax4 U3937 ( .A1(n7603), .A2(n6633), .B1(n3623), 
        .B2(n6651), .Z(n7488) );
  dti_28hc_7t_30_invx4 U3939 ( .A(n7831), .Z(n6844) );
  dti_28hc_7t_30_aoi22x2 U3940 ( .A1(n7476), .A2(n6653), .B1(n6651), .B2(n3398), .Z(n7475) );
  dti_28hc_7t_30_nand2x4 U3942 ( .A(n6963), .B(n6657), .Z(n6662) );
  dti_28hc_7t_30_invxp6 U3944 ( .A(n6655), .Z(n7546) );
  dti_28hc_7t_30_nand2x4 U3945 ( .A(n6600), .B(n6904), .Z(n7693) );
  dti_28hc_7t_30_invx1 U3946 ( .A(n7534), .Z(n7533) );
  dti_28hc_7t_30_invx1 U3949 ( .A(n3684), .Z(n7664) );
  dti_28hc_7t_30_nor2px2 U3950 ( .A(n6941), .B(n3689), .Z(n3688) );
  dti_28hc_7t_30_invx2 U3951 ( .A(n6877), .Z(n7742) );
  dti_28hc_7t_30_oai12rex6 U3952 ( .B1(n7805), .B2(n3785), .A(n3541), .Z(n3669) );
  dti_28hc_7t_30_nand4px1 U3953 ( .A(n6653), .B(n7672), .C(n6633), .D(n6632), 
        .Z(n6606) );
  dti_28hc_7t_30_nand3px2 U3954 ( .A(n6651), .B(n6652), .C(n6604), .Z(n7465)
         );
  dti_28hc_7t_30_bufxp11 U3956 ( .A(n7081), .Z(n7576) );
  dti_28hc_7t_30_nor2hpx1 U3957 ( .A(n6055), .B(n3809), .Z(n3808) );
  dti_28hc_7t_30_nand3px4 U3958 ( .A(n7666), .B(n7667), .C(n3188), .Z(n3731)
         );
  dti_28hc_7t_30_nand3px4 U3962 ( .A(n3523), .B(n3524), .C(n7530), .Z(n6898)
         );
  dti_28hc_7t_30_and2xp58 U3963 ( .A(n6168), .B(n6169), .Z(n7795) );
  dti_28hc_7t_30_nand3poptax6 U3965 ( .A(n7651), .B(n7456), .C(n3694), .Z(
        n6972) );
  dti_28hc_7t_30_oai12rehpoptax4 U3966 ( .B1(n6118), .B2(n6612), .A(n6117), 
        .Z(n3819) );
  dti_28hc_7t_30_invx2 U3968 ( .A(n3842), .Z(n7697) );
  dti_28hc_7t_30_invx3 U3969 ( .A(n7756), .Z(n7755) );
  dti_28hc_7t_30_invx2 U3970 ( .A(n3705), .Z(n7805) );
  dti_28hc_7t_30_nor2px1 U3971 ( .A(n3640), .B(n6635), .Z(n3827) );
  dti_28hc_7t_30_nor2px1 U3972 ( .A(n6659), .B(n6658), .Z(n6660) );
  dti_28hc_7t_30_nand3poptax6 U3973 ( .A(n5464), .B(n3705), .C(n7710), .Z(
        n7497) );
  dti_28hc_7t_30_nor2hpx4 U3976 ( .A(n6118), .B(n6646), .Z(n3681) );
  dti_28hc_7t_30_nor2px2 U3978 ( .A(n6659), .B(n3311), .Z(n6600) );
  dti_28hc_7t_30_bufx16 U3980 ( .A(n3732), .Z(n3541) );
  dti_28hc_7t_30_nand2pmhzx6 U3981 ( .A(n7802), .B(n7607), .Z(n3785) );
  dti_28hc_7t_30_nor3px2 U3983 ( .A(n6611), .B(n6115), .C(n6610), .Z(n3780) );
  dti_28hc_7t_30_invx2 U3984 ( .A(n7634), .Z(n7615) );
  dti_28hc_7t_30_bufx1 U3986 ( .A(\eda_fifos/sync_fifo_downright/wr_addr [2]), 
        .Z(n7790) );
  dti_28hc_7t_30_invshzx6 U3987 ( .A(n3674), .Z(n7607) );
  dti_28hc_7t_30_invshzx6 U3988 ( .A(n7323), .Z(n3401) );
  dti_28hc_7t_30_invshzx6 U3989 ( .A(n6842), .Z(n6206) );
  dti_28hc_7t_30_invx2 U3990 ( .A(n5498), .Z(n7651) );
  dti_28hc_7t_30_nor2i1px2 U3991 ( .A(n4969), .B(n3335), .Z(n4360) );
  dti_28hc_7t_30_nor2px2 U3992 ( .A(n7762), .B(n7761), .Z(n3524) );
  dti_28hc_7t_30_or2x1 U3993 ( .A(n6627), .B(n6115), .Z(n6116) );
  dti_28hc_7t_30_invxp9 U3994 ( .A(n6648), .Z(n7679) );
  dti_28hc_7t_30_nand2x2 U3995 ( .A(n6632), .B(n6631), .Z(n6655) );
  dti_28hc_7t_30_nor2hpx2 U3996 ( .A(n6228), .B(n3718), .Z(n3500) );
  dti_28hc_7t_30_nand3hpx1 U3997 ( .A(n6650), .B(n6596), .C(n6597), .Z(n7649)
         );
  dti_28hc_7t_30_nand3i1x1 U3998 ( .A(n6643), .B(n6642), .C(n3791), .Z(n3790)
         );
  dti_28hc_7t_30_nand3x1 U4000 ( .A(n6642), .B(n7689), .C(n7788), .Z(n6112) );
  dti_28hc_7t_30_invx3 U4002 ( .A(n6659), .Z(n6618) );
  dti_28hc_7t_30_nand2px4 U4003 ( .A(n7378), .B(n5444), .Z(n7446) );
  dti_28hc_7t_30_nand2shzx12 U4004 ( .A(n3235), .B(n7667), .Z(n7323) );
  dti_28hc_7t_30_invx1 U4006 ( .A(\eda_fifos/sync_fifo_right/wr_addr [0]), .Z(
        n7634) );
  dti_28hc_7t_30_nand2x2 U4008 ( .A(n3188), .B(n3186), .Z(n3333) );
  dti_28hc_7t_30_invx1 U4011 ( .A(n6094), .Z(n7762) );
  dti_28hc_7t_30_invx2 U4012 ( .A(n3432), .Z(n7647) );
  dti_28hc_7t_30_or2xp58 U4013 ( .A(n3872), .B(n6102), .Z(n7761) );
  dti_28hc_7t_30_oai12rehpoptax4 U4015 ( .B1(n3783), .B2(n3784), .A(n5438), 
        .Z(n7378) );
  dti_28hc_7t_30_oai12rehpoptax4 U4017 ( .B1(n3717), .B2(n3572), .A(n5438), 
        .Z(n3674) );
  dti_28hc_7t_30_invx3 U4020 ( .A(n7478), .Z(n3582) );
  dti_28hc_7t_30_invxp8 U4021 ( .A(n6184), .Z(n7769) );
  dti_28hc_7t_30_nand2x2 U4022 ( .A(n6224), .B(n7404), .Z(n5465) );
  dti_28hc_7t_30_or3xp85 U4023 ( .A(n3757), .B(n3575), .C(n3758), .Z(n7643) );
  dti_28hc_7t_30_invxp6 U4027 ( .A(n6194), .Z(n7637) );
  dti_28hc_7t_30_nand3i2xp8 U4033 ( .A(n6202), .B(n6201), .C(n7454), .Z(n7545)
         );
  dti_28hc_7t_30_and2hpx2 U4040 ( .A(n6071), .B(n6072), .Z(n3815) );
  dti_28hc_7t_30_nand3px2 U4054 ( .A(n3339), .B(n3338), .C(n3306), .Z(n3353)
         );
  dti_28hc_7t_30_nand3px2 U4059 ( .A(n5322), .B(n5324), .C(n7733), .Z(n3717)
         );
  dti_28hc_7t_30_nand2x2 U4066 ( .A(n3447), .B(n3441), .Z(n3757) );
  dti_28hc_7t_30_or2x2 U4074 ( .A(n5320), .B(n5321), .Z(n3572) );
  dti_28hc_7t_30_aoi12x1 U4077 ( .B1(n5434), .B2(n7753), .A(n5436), .Z(n3817)
         );
  dti_28hc_7t_30_nand2x1 U4082 ( .A(n5326), .B(n3670), .Z(n3355) );
  dti_28hc_7t_30_oai22rehpoptax4 U4083 ( .A1(n5236), .A2(n3334), .B1(n5235), 
        .B2(n5471), .Z(n5325) );
  dti_28hc_7t_30_nor2px1 U4086 ( .A(n6915), .B(n3831), .Z(n7507) );
  dti_28hc_7t_30_invx1 U4087 ( .A(n7735), .Z(n7734) );
  dti_28hc_7t_30_oai12rehplm2x2 U4089 ( .B1(n5471), .B2(n5275), .A(n7584), .Z(
        n5326) );
  dti_28hc_7t_30_oai13rehpx2 U4091 ( .B1(n3649), .B2(n7825), .B3(n7803), .A(
        n3651), .Z(n5361) );
  dti_28hc_7t_30_nand3px2 U4092 ( .A(n5182), .B(n3816), .C(n5181), .Z(n3504)
         );
  dti_28hc_7t_30_nand2x2 U4095 ( .A(n5234), .B(n5233), .Z(n5235) );
  dti_28hc_7t_30_nor2x1 U4096 ( .A(n6244), .B(n7783), .Z(n7782) );
  dti_28hc_7t_30_aoi12hpx2 U4097 ( .B1(n5431), .B2(n7074), .A(n3314), .Z(n7555) );
  dti_28hc_7t_30_nand2x4 U4098 ( .A(n3644), .B(n7554), .Z(n5434) );
  dti_28hc_7t_30_invx3 U4099 ( .A(n3314), .Z(n5433) );
  dti_28hc_7t_30_nand2x3 U4101 ( .A(n5181), .B(n5234), .Z(n5472) );
  dti_28hc_7t_30_nand2pshzx6 U4103 ( .A(n7748), .B(n3501), .Z(n3314) );
  dti_28hc_7t_30_invx1 U4104 ( .A(n7669), .Z(n3698) );
  dti_28hc_7t_30_invx2 U4105 ( .A(n6816), .Z(n5277) );
  dti_28hc_7t_30_nor2hpoptax6 U4109 ( .A(n6659), .B(n6102), .Z(n6903) );
  dti_28hc_7t_30_invx2 U4110 ( .A(n5276), .Z(n3310) );
  dti_28hc_7t_30_invx3 U4111 ( .A(n5180), .Z(n7748) );
  dti_28hc_7t_30_nor2px1 U4117 ( .A(n4873), .B(n6923), .Z(n7518) );
  dti_28hc_7t_30_aoi13rehpoptax2 U4118 ( .B1(n4899), .B2(n6731), .B3(n6729), 
        .A(n6730), .Z(n5985) );
  dti_28hc_7t_30_nor2px2 U4119 ( .A(n3503), .B(n5183), .Z(n7669) );
  dti_28hc_7t_30_nand2x3 U4120 ( .A(n7820), .B(n5279), .Z(n7525) );
  dti_28hc_7t_30_nand2px2 U4127 ( .A(n7496), .B(n3662), .Z(n5180) );
  dti_28hc_7t_30_nand2px2 U4132 ( .A(n3768), .B(n3665), .Z(n3503) );
  dti_28hc_7t_30_fadderox2 U4134 ( .A(n5830), .B(n5831), .CI(n5796), .CON(
        n5833) );
  dti_28hc_7t_30_nand2pmhzx6 U4135 ( .A(n6054), .B(n3733), .Z(n3640) );
  dti_28hc_7t_30_nand3pmhzoptax6 U4136 ( .A(n6652), .B(n7821), .C(n7826), .Z(
        n7820) );
  dti_28hc_7t_30_nor2px2 U4138 ( .A(n7510), .B(n7509), .Z(n3279) );
  dti_28hc_7t_30_nand3px2 U4139 ( .A(n6771), .B(n3532), .C(n6776), .Z(n5304)
         );
  dti_28hc_7t_30_nand2x4 U4140 ( .A(n3290), .B(n5148), .Z(n6099) );
  dti_28hc_7t_30_invxp9 U4142 ( .A(n6073), .Z(n3240) );
  dti_28hc_7t_30_nand2x2 U4143 ( .A(n7513), .B(n5113), .Z(n6075) );
  dti_28hc_7t_30_nor3pmhzoptax6 U4146 ( .A(n6179), .B(n3701), .C(n6178), .Z(
        n6652) );
  dti_28hc_7t_30_nand3i1x2 U4149 ( .A(n6926), .B(n7668), .C(n4864), .Z(n3573)
         );
  dti_28hc_7t_30_nand2x1 U4150 ( .A(n7563), .B(n7562), .Z(n7655) );
  dti_28hc_7t_30_nand2px2 U4151 ( .A(n5490), .B(n6776), .Z(n4678) );
  dti_28hc_7t_30_nand3px4 U4152 ( .A(n7681), .B(n4803), .C(n4802), .Z(n7630)
         );
  dti_28hc_7t_30_invx2 U4155 ( .A(n4819), .Z(n7771) );
  dti_28hc_7t_30_nand2x3 U4156 ( .A(n4962), .B(n4963), .Z(n3528) );
  dti_28hc_7t_30_nor2hpx1 U4158 ( .A(n6643), .B(n7695), .Z(n7562) );
  dti_28hc_7t_30_nand2x3 U4163 ( .A(n6096), .B(n3509), .Z(n4951) );
  dti_28hc_7t_30_nand2x1 U4164 ( .A(n6650), .B(n6143), .Z(n6723) );
  dti_28hc_7t_30_nand2x2 U4166 ( .A(n4961), .B(n4960), .Z(n6066) );
  dti_28hc_7t_30_bufmhzx6 U4174 ( .A(n6631), .Z(n7672) );
  dti_28hc_7t_30_nand2x1 U4175 ( .A(n4863), .B(n7671), .Z(n7670) );
  dti_28hc_7t_30_invx1 U4176 ( .A(n7650), .Z(n7563) );
  dti_28hc_7t_30_nand3hpx1 U4178 ( .A(n3928), .B(n7471), .C(n3927), .Z(n5868)
         );
  dti_28hc_7t_30_nor3pmhzoptax8 U4181 ( .A(n3811), .B(n7511), .C(n3625), .Z(
        n6651) );
  dti_28hc_7t_30_nand2x1 U4184 ( .A(n6943), .B(
        \eda_fifos/sync_fifo_upleft/rd_addr [2]), .Z(n7671) );
  dti_28hc_7t_30_xor2bx1 U4185 ( .A(n5604), .B(n5598), .Z(n5136) );
  dti_28hc_7t_30_nand2px1 U4186 ( .A(n5499), .B(n5496), .Z(n7650) );
  dti_28hc_7t_30_ioa12hpx2 U4187 ( .B1(n7519), .B2(
        \eda_fifos/sync_fifo_upright/rd_addr [2]), .A(n4936), .Z(n7713) );
  dti_28hc_7t_30_ioa12hpx2 U4188 ( .B1(n6969), .B2(
        \eda_fifos/sync_fifo_left/rd_addr [2]), .A(n4925), .Z(n7833) );
  dti_28hc_7t_30_nand2x1 U4195 ( .A(n5155), .B(n5154), .Z(n3249) );
  dti_28hc_7t_30_aoi22hpx1 U4214 ( .A1(n4723), .A2(n6633), .B1(n4720), .B2(
        n3320), .Z(n3980) );
  dti_28hc_7t_30_nand3px4 U4215 ( .A(n7797), .B(n3418), .C(n3420), .Z(n4823)
         );
  dti_28hc_7t_30_aoi22hpx1 U4216 ( .A1(n4725), .A2(n5140), .B1(n5429), .B2(
        n4721), .Z(n3981) );
  dti_28hc_7t_30_nand2px2 U4218 ( .A(n6880), .B(
        \eda_fifos/sync_fifo_downleft/rd_addr [1]), .Z(n4890) );
  dti_28hc_7t_30_nand3hpx1 U4225 ( .A(n7763), .B(n4069), .C(n4068), .Z(n5847)
         );
  dti_28hc_7t_30_nand2x1 U4227 ( .A(n4616), .B(n3607), .Z(n5499) );
  dti_28hc_7t_30_invx2 U4229 ( .A(n5746), .Z(n7503) );
  dti_28hc_7t_30_nand4px1 U4231 ( .A(n3351), .B(n4083), .C(n4082), .D(n3352), 
        .Z(n5155) );
  dti_28hc_7t_30_and2x1 U4232 ( .A(n3925), .B(n3926), .Z(n7471) );
  dti_28hc_7t_30_nand4px2 U4233 ( .A(n7627), .B(n3350), .C(n3328), .D(n3348), 
        .Z(n5153) );
  dti_28hc_7t_30_nand3px2 U4234 ( .A(n7626), .B(n4819), .C(n4818), .Z(n6098)
         );
  dti_28hc_7t_30_nand3x2 U4237 ( .A(n4327), .B(n7660), .C(n7658), .Z(n5858) );
  dti_28hc_7t_30_aoi22x3 U4239 ( .A1(\eda_iterated_ram/current_row[0][5] ), 
        .A2(n6597), .B1(\eda_iterated_ram/current_row[2][5] ), .B2(n4856), .Z(
        n3516) );
  dti_28hc_7t_30_muxi21xp5 U4240 ( .D0(n5588), .D1(n5587), .S(n5605), .Z(n5590) );
  dti_28hc_7t_30_aoi22rex6 U4242 ( .A1(\eda_iterated_ram/current_row[2][2] ), 
        .A2(n4856), .B1(\eda_iterated_ram/current_row[0][2] ), .B2(n3309), .Z(
        n3421) );
  dti_28hc_7t_30_invx2 U4244 ( .A(n6182), .Z(n7467) );
  dti_28hc_7t_30_and2x1 U4245 ( .A(n3330), .B(n3349), .Z(n7627) );
  dti_28hc_7t_30_iao22x4 U4247 ( .A1(\eda_iterated_ram/current_row[3][2] ), 
        .A2(n3319), .B1(n3542), .B2(n7512), .Z(n3422) );
  dti_28hc_7t_30_nand2x2 U4250 ( .A(n7633), .B(n5679), .Z(n5497) );
  dti_28hc_7t_30_nor2px2 U4260 ( .A(n7609), .B(n7608), .Z(n7660) );
  dti_28hc_7t_30_and2x1 U4261 ( .A(n4067), .B(n4066), .Z(n7763) );
  dti_28hc_7t_30_nor2hpx1 U4263 ( .A(n3305), .B(n3362), .Z(n7777) );
  dti_28hc_7t_30_invx2 U4265 ( .A(n5459), .Z(
        \eda_iterated_ram/current_row[0][2] ) );
  dti_28hc_7t_30_invxp5 U4269 ( .A(n5589), .Z(n7512) );
  dti_28hc_7t_30_invx1 U4274 ( .A(n3542), .Z(n3543) );
  dti_28hc_7t_30_invx1 U4275 ( .A(n4324), .Z(n7609) );
  dti_28hc_7t_30_aoi22x3 U4284 ( .A1(\eda_iterated_ram/current_row[2][3] ), 
        .A2(n4856), .B1(\eda_iterated_ram/current_row[1][3] ), .B2(n6604), .Z(
        n7780) );
  dti_28hc_7t_30_invx2 U4286 ( .A(n5451), .Z(
        \eda_iterated_ram/current_row[1][1] ) );
  dti_28hc_7t_30_invx1 U4288 ( .A(n7549), .Z(n6147) );
  dti_28hc_7t_30_nand2x2 U4291 ( .A(n5645), .B(n6114), .Z(n5746) );
  dti_28hc_7t_30_invx2 U4296 ( .A(n7551), .Z(
        \eda_iterated_ram/current_row[1][0] ) );
  dti_28hc_7t_30_invx2 U4298 ( .A(n7552), .Z(
        \eda_iterated_ram/current_row[3][0] ) );
  dti_28hc_7t_30_nor2px2 U4299 ( .A(n4660), .B(n7567), .Z(n5563) );
  dti_28hc_7t_30_nand4px2 U4300 ( .A(n4407), .B(n4405), .C(n3622), .D(n4406), 
        .Z(n5772) );
  dti_28hc_7t_30_nand2x2 U4301 ( .A(n5690), .B(n5700), .Z(n6063) );
  dti_28hc_7t_30_invxp9 U4306 ( .A(n5578), .Z(n7644) );
  dti_28hc_7t_30_invx2 U4307 ( .A(n5604), .Z(n3391) );
  dti_28hc_7t_30_and2x1 U4310 ( .A(n7506), .B(n4727), .Z(n3375) );
  dti_28hc_7t_30_aoi22xp8 U4314 ( .A1(n5137), .A2(n3319), .B1(n5143), .B2(
        n3309), .Z(n4834) );
  dti_28hc_7t_30_nand2x3 U4316 ( .A(n5107), .B(n4855), .Z(n4216) );
  dti_28hc_7t_30_aoi22hpx1 U4318 ( .A1(n4986), .A2(n3319), .B1(n4990), .B2(
        n6633), .Z(n3622) );
  dti_28hc_7t_30_nand2px8 U4322 ( .A(n3274), .B(n3822), .Z(n5134) );
  dti_28hc_7t_30_invxp6 U4325 ( .A(n5612), .Z(n7786) );
  dti_28hc_7t_30_aoi22x1 U4327 ( .A1(n4755), .A2(n4855), .B1(n4754), .B2(n6657), .Z(n5697) );
  dti_28hc_7t_30_nand3x2 U4328 ( .A(n7604), .B(n4807), .C(n4806), .Z(n5644) );
  dti_28hc_7t_30_and2x1 U4330 ( .A(n7830), .B(n5067), .Z(n7829) );
  dti_28hc_7t_30_and2x1 U4332 ( .A(n4844), .B(n4843), .Z(n7537) );
  dti_28hc_7t_30_aoi22hpx1 U4333 ( .A1(n5009), .A2(n3309), .B1(n3584), .B2(
        n4855), .Z(n4791) );
  dti_28hc_7t_30_nand3hpx1 U4337 ( .A(n7832), .B(n4590), .C(n4589), .Z(n5050)
         );
  dti_28hc_7t_30_nand3px1 U4339 ( .A(n4707), .B(n4708), .C(n7652), .Z(n5688)
         );
  dti_28hc_7t_30_invx3 U4343 ( .A(n7528), .Z(n7460) );
  dti_28hc_7t_30_aoi22x1 U4345 ( .A1(n3545), .A2(n4856), .B1(n3319), .B2(n5108), .Z(n4850) );
  dti_28hc_7t_30_nand2x1 U4352 ( .A(n5116), .B(n4855), .Z(n4843) );
  dti_28hc_7t_30_nand2x1 U4356 ( .A(n5080), .B(n6657), .Z(n4851) );
  dti_28hc_7t_30_and2xp58 U4358 ( .A(n7544), .B(n4800), .Z(n3638) );
  dti_28hc_7t_30_and2x1 U4362 ( .A(n4517), .B(n4518), .Z(n7798) );
  dti_28hc_7t_30_and2x1 U4365 ( .A(n4804), .B(n4805), .Z(n7604) );
  dti_28hc_7t_30_and2x1 U4371 ( .A(n4797), .B(n4796), .Z(n7502) );
  dti_28hc_7t_30_and2xp58 U4372 ( .A(n4618), .B(n4617), .Z(n7547) );
  dti_28hc_7t_30_nand4px2 U4375 ( .A(n5088), .B(n5085), .C(n5086), .D(n7548), 
        .Z(n5588) );
  dti_28hc_7t_30_aoi22hpoptax4 U4377 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[2][1][6] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[2][4][6] ), .Z(n4200) );
  dti_28hc_7t_30_nand3hpx1 U4382 ( .A(n5133), .B(n5132), .C(n7574), .Z(n5547)
         );
  dti_28hc_7t_30_nand2x2 U4384 ( .A(n4353), .B(n3820), .Z(n7463) );
  dti_28hc_7t_30_nand2x2 U4385 ( .A(n4038), .B(n4039), .Z(n7528) );
  dti_28hc_7t_30_and2x1 U4396 ( .A(n5022), .B(n5023), .Z(n7542) );
  dti_28hc_7t_30_and2x1 U4404 ( .A(n4706), .B(n4705), .Z(n7652) );
  dti_28hc_7t_30_and2xp58 U4407 ( .A(n4588), .B(n4587), .Z(n7832) );
  dti_28hc_7t_30_nand3px2 U4421 ( .A(n5111), .B(n7532), .C(n5112), .Z(n5576)
         );
  dti_28hc_7t_30_nand3px1 U4422 ( .A(n7629), .B(n4508), .C(n7628), .Z(n5018)
         );
  dti_28hc_7t_30_aoi22hpoptax4 U4431 ( .A1(n5063), .A2(n3320), .B1(n5060), 
        .B2(n6633), .Z(n4011) );
  dti_28hc_7t_30_aoi22rex1 U4434 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][4][1] ), .B1(n3605), .B2(
        \eda_img_ram/img_memory[2][1][1] ), .Z(n4119) );
  dti_28hc_7t_30_nand2xp5 U4435 ( .A(n6086), .B(
        \eda_img_ram/img_memory[2][2][4] ), .Z(n4164) );
  dti_28hc_7t_30_nand2x2 U4436 ( .A(n5138), .B(n3319), .Z(n7708) );
  dti_28hc_7t_30_nand2x4 U4437 ( .A(n5064), .B(n5589), .Z(n4009) );
  dti_28hc_7t_30_nand3hpx1 U4448 ( .A(n7474), .B(n5013), .C(n7473), .Z(n5540)
         );
  dti_28hc_7t_30_aoi22x1 U4462 ( .A1(n5114), .A2(n3320), .B1(n5115), .B2(n6633), .Z(n5123) );
  dti_28hc_7t_30_nand2x2 U4471 ( .A(n5142), .B(n4855), .Z(n7678) );
  dti_28hc_7t_30_nand2x4 U4476 ( .A(n5061), .B(n3321), .Z(n4008) );
  dti_28hc_7t_30_nand2x1 U4478 ( .A(n5141), .B(n6597), .Z(n7709) );
  dti_28hc_7t_30_nand2x1 U4479 ( .A(n5125), .B(n3319), .Z(n4353) );
  dti_28hc_7t_30_nand2x3 U4480 ( .A(n5143), .B(n5589), .Z(n7741) );
  dti_28hc_7t_30_nand3x1 U4481 ( .A(n3974), .B(n3975), .C(n7692), .Z(n4723) );
  dti_28hc_7t_30_nand3x1 U4482 ( .A(n3967), .B(n3966), .C(n7738), .Z(n4725) );
  dti_28hc_7t_30_aoi12hpx1 U4483 ( .B1(n6086), .B2(
        \eda_img_ram/img_memory[2][2][5] ), .A(n7617), .Z(n4310) );
  dti_28hc_7t_30_and2x1 U4484 ( .A(n4837), .B(n4838), .Z(n7731) );
  dti_28hc_7t_30_and2x1 U4486 ( .A(n5131), .B(n5130), .Z(n7574) );
  dti_28hc_7t_30_aoi22x2 U4487 ( .A1(n5116), .A2(n3321), .B1(n5119), .B2(n3320), .Z(n4040) );
  dti_28hc_7t_30_nand4px4 U4488 ( .A(n3997), .B(n3996), .C(n3995), .D(n3994), 
        .Z(n5062) );
  dti_28hc_7t_30_nand4px4 U4489 ( .A(n4197), .B(n4196), .C(n4194), .D(n7747), 
        .Z(n5103) );
  dti_28hc_7t_30_nand3px4 U4490 ( .A(n7586), .B(n3939), .C(n3937), .Z(n5080)
         );
  dti_28hc_7t_30_aoi22rex1 U4491 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][4][6] ), .B1(n3606), .B2(
        \eda_img_ram/img_memory[2][1][6] ), .Z(n4230) );
  dti_28hc_7t_30_aoi22rex1 U4492 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][4][1] ), .B1(n3608), .B2(
        \eda_img_ram/img_memory[3][1][1] ), .Z(n4111) );
  dti_28hc_7t_30_aoi22rex1 U4494 ( .A1(n3931), .A2(
        \eda_img_ram/img_memory[5][1][4] ), .B1(n3599), .B2(
        \eda_img_ram/img_memory[5][3][4] ), .Z(n4523) );
  dti_28hc_7t_30_aoi22x1 U4495 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[4][1][3] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[4][3][3] ), .Z(n3905) );
  dti_28hc_7t_30_nor2x1 U4496 ( .A(n4003), .B(n7657), .Z(n7617) );
  dti_28hc_7t_30_nand4px1 U4497 ( .A(n4198), .B(n7550), .C(n4199), .D(n4201), 
        .Z(n3545) );
  dti_28hc_7t_30_nand3px2 U4500 ( .A(n3371), .B(n3299), .C(n3993), .Z(n5065)
         );
  dti_28hc_7t_30_nand3x2 U4501 ( .A(n7730), .B(n4347), .C(n4348), .Z(n5125) );
  dti_28hc_7t_30_nand4px2 U4502 ( .A(n3952), .B(n3951), .C(n3950), .D(n3953), 
        .Z(n3587) );
  dti_28hc_7t_30_nand3px2 U4503 ( .A(n7814), .B(n4280), .C(n4281), .Z(n5138)
         );
  dti_28hc_7t_30_and2x1 U4504 ( .A(n5010), .B(n7558), .Z(n7473) );
  dti_28hc_7t_30_and2x1 U4505 ( .A(n4507), .B(n4506), .Z(n7629) );
  dti_28hc_7t_30_aoi22rex1 U4507 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[3][2][6] ), .B1(
        \eda_img_ram/img_memory[3][5][6] ), .B2(n4541), .Z(n7628) );
  dti_28hc_7t_30_nand3px2 U4509 ( .A(n7638), .B(n4006), .C(n4007), .Z(n5061)
         );
  dti_28hc_7t_30_nand2x3 U4513 ( .A(n6086), .B(
        \eda_img_ram/img_memory[0][3][3] ), .Z(n3945) );
  dti_28hc_7t_30_aoi22x1 U4515 ( .A1(n3605), .A2(
        \eda_img_ram/img_memory[0][2][3] ), .B1(n4591), .B2(
        \eda_img_ram/img_memory[0][1][3] ), .Z(n3947) );
  dti_28hc_7t_30_iao22x2 U4518 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[0][4][7] ), .B1(n4340), .B2(n7728), .Z(n4001)
         );
  dti_28hc_7t_30_nand2x2 U4529 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][3][6] ), .Z(n7747) );
  dti_28hc_7t_30_nand2x1 U4538 ( .A(n6191), .B(
        \eda_img_ram/img_memory[1][5][7] ), .Z(n3988) );
  dti_28hc_7t_30_aoi22x3 U4543 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[0][5][0] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[0][0][0] ), .Z(n4288) );
  dti_28hc_7t_30_aoi22rex1 U4544 ( .A1(n6122), .A2(
        \eda_img_ram/img_memory[0][1][2] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[0][4][2] ), .Z(n4036) );
  dti_28hc_7t_30_aoi22rex6 U4545 ( .A1(n4597), .A2(
        \eda_img_ram/img_memory[0][1][0] ), .B1(n6080), .B2(n3554), .Z(n4287)
         );
  dti_28hc_7t_30_aoi22x6 U4546 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[1][4][7] ), .B1(n4597), .B2(
        \eda_img_ram/img_memory[1][1][7] ), .Z(n3990) );
  dti_28hc_7t_30_aoi22x6 U4547 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[2][1][7] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[2][4][7] ), .Z(n3997) );
  dti_28hc_7t_30_aoi22rehpx1 U4554 ( .A1(n3607), .A2(
        \eda_img_ram/img_memory[5][2][3] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[5][1][3] ), .Z(n3588) );
  dti_28hc_7t_30_nand2x1 U4557 ( .A(n3599), .B(
        \eda_img_ram/img_memory[1][2][2] ), .Z(n4030) );
  dti_28hc_7t_30_nor2hpx2 U4559 ( .A(n7523), .B(n7522), .Z(n7586) );
  dti_28hc_7t_30_aoi22x3 U4560 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[2][5][6] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[2][0][6] ), .Z(n4201) );
  dti_28hc_7t_30_aoi22x3 U4567 ( .A1(n4592), .A2(
        \eda_img_ram/img_memory[3][0][0] ), .B1(n6191), .B2(
        \eda_img_ram/img_memory[3][5][0] ), .Z(n4284) );
  dti_28hc_7t_30_nand3px2 U4573 ( .A(n7793), .B(n4142), .C(n3257), .Z(n5092)
         );
  dti_28hc_7t_30_aoi12hpx2 U4584 ( .B1(n4541), .B2(
        \eda_img_ram/img_memory[3][4][2] ), .A(n7676), .Z(n7675) );
  dti_28hc_7t_30_nor2px2 U4585 ( .A(n7640), .B(n7639), .Z(n7638) );
  dti_28hc_7t_30_and2x1 U4586 ( .A(n4000), .B(n3999), .Z(n7766) );
  dti_28hc_7t_30_nand3hpx1 U4587 ( .A(n3629), .B(n4402), .C(n7571), .Z(n4985)
         );
  dti_28hc_7t_30_nor2px2 U4592 ( .A(n7573), .B(n7572), .Z(n3371) );
  dti_28hc_7t_30_nand4px1 U4595 ( .A(n4339), .B(n4337), .C(n4336), .D(n4338), 
        .Z(n5124) );
  dti_28hc_7t_30_nand4px1 U4600 ( .A(n3632), .B(n4391), .C(n3631), .D(n4390), 
        .Z(n4986) );
  dti_28hc_7t_30_nand3px2 U4602 ( .A(n3880), .B(n4087), .C(n7493), .Z(n5073)
         );
  dti_28hc_7t_30_nor2px6 U4606 ( .A(n4368), .B(n7250), .Z(n6595) );
  dti_28hc_7t_30_aoi22x2 U4607 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[1][4][5] ), .B1(
        \eda_img_ram/img_memory[1][1][5] ), .B2(n7517), .Z(n4343) );
  dti_28hc_7t_30_aoi22x2 U4611 ( .A1(n4445), .A2(
        \eda_img_ram/img_memory[0][1][5] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[0][4][5] ), .Z(n4335) );
  dti_28hc_7t_30_aoi22rehpx1 U4612 ( .A1(n3287), .A2(
        \eda_img_ram/img_memory[3][3][6] ), .B1(n3605), .B2(
        \eda_img_ram/img_memory[3][2][6] ), .Z(n4205) );
  dti_28hc_7t_30_invx1 U4614 ( .A(n4005), .Z(n7640) );
  dti_28hc_7t_30_invx1 U4617 ( .A(n4004), .Z(n7639) );
  dti_28hc_7t_30_nor2px2 U4618 ( .A(n7622), .B(n7621), .Z(n3882) );
  dti_28hc_7t_30_and2x1 U4620 ( .A(n4085), .B(n4084), .Z(n3880) );
  dti_28hc_7t_30_aoi12hpx2 U4624 ( .B1(\eda_img_ram/img_memory[0][3][4] ), 
        .B2(n6086), .A(n7564), .Z(n7793) );
  dti_28hc_7t_30_and2x1 U4625 ( .A(n4401), .B(n4400), .Z(n7571) );
  dti_28hc_7t_30_aoi22hpx1 U4626 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[3][4][6] ), .B1(n6122), .B2(
        \eda_img_ram/img_memory[3][1][6] ), .Z(n4204) );
  dti_28hc_7t_30_aoi22x3 U4627 ( .A1(n4592), .A2(
        \eda_img_ram/img_memory[1][1][2] ), .B1(n4582), .B2(
        \eda_img_ram/img_memory[1][5][2] ), .Z(n3634) );
  dti_28hc_7t_30_aoi22x2 U4629 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[5][4][4] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[5][0][4] ), .Z(n4149) );
  dti_28hc_7t_30_aoi22x3 U4631 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[1][2][1] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[1][1][1] ), .Z(n7493) );
  dti_28hc_7t_30_invx1 U4635 ( .A(n4141), .Z(n7564) );
  dti_28hc_7t_30_nand2hpx2 U4636 ( .A(n3281), .B(n4088), .Z(n7621) );
  dti_28hc_7t_30_invmhzx32 U4637 ( .A(n6124), .Z(n3931) );
  dti_28hc_7t_30_bufmhzx6 U4638 ( .A(n4591), .Z(n7517) );
  dti_28hc_7t_30_invshzx8 U4639 ( .A(n3920), .Z(n7492) );
  dti_28hc_7t_30_nor2shzx10 U4641 ( .A(n3626), .B(n7816), .Z(n3920) );
  dti_28hc_7t_30_nor2px8 U4643 ( .A(n3895), .B(n7274), .Z(n3287) );
  dti_28hc_7t_30_nor2pshzx14 U4646 ( .A(n3895), .B(n7250), .Z(n3605) );
  dti_28hc_7t_30_invshzx8 U4647 ( .A(up_addr[2]), .Z(n3619) );
  dti_28hc_7t_30_aoi22xp5 U4655 ( .A1(n5696), .A2(n6597), .B1(n5695), .B2(
        n5589), .Z(n5699) );
  dti_28hc_7t_30_nand2xp5 U4658 ( .A(n5752), .B(n5751), .Z(n5708) );
  dti_28hc_7t_30_aoi12xp5 U4659 ( .B1(n5726), .B2(n5899), .A(n5844), .Z(n5730)
         );
  dti_28hc_7t_30_nand2xp5 U4664 ( .A(n5670), .B(n6114), .Z(n5771) );
  dti_28hc_7t_30_nand2xp5 U4665 ( .A(n5763), .B(n5809), .Z(n5758) );
  dti_28hc_7t_30_muxi21xp5 U4666 ( .D0(n5775), .D1(n5774), .S(n5773), .Z(n5804) );
  dti_28hc_7t_30_nand2xp5 U4671 ( .A(n3931), .B(
        \eda_img_ram/img_memory[1][1][5] ), .Z(n3412) );
  dti_28hc_7t_30_aoi12rex1 U4672 ( .B1(n5804), .B2(n5806), .A(n5785), .Z(n5786) );
  dti_28hc_7t_30_invx1 U4673 ( .A(n5754), .Z(n5755) );
  dti_28hc_7t_30_muxi21xp5 U4675 ( .D0(n5756), .D1(n5755), .S(n5778), .Z(n5757) );
  dti_28hc_7t_30_oai12xp5 U4678 ( .B1(n5565), .B2(n5564), .A(n5563), .Z(n5568)
         );
  dti_28hc_7t_30_nand2xp5 U4681 ( .A(n5680), .B(n5573), .Z(n5574) );
  dti_28hc_7t_30_aoi22x1 U4683 ( .A1(n6080), .A2(
        \eda_img_ram/img_memory[4][3][2] ), .B1(
        \eda_img_ram/img_memory[4][5][2] ), .B2(n6595), .Z(n4048) );
  dti_28hc_7t_30_nand2xp5 U4684 ( .A(n6086), .B(
        \eda_img_ram/img_memory[1][4][2] ), .Z(n4389) );
  dti_28hc_7t_30_nand2xp5 U4693 ( .A(n3287), .B(n3556), .Z(n4451) );
  dti_28hc_7t_30_nand2xp5 U4696 ( .A(n4408), .B(
        \eda_img_ram/img_memory[0][0][7] ), .Z(n4604) );
  dti_28hc_7t_30_nand2xp5 U4700 ( .A(n4408), .B(
        \eda_img_ram/img_memory[5][0][7] ), .Z(n4578) );
  dti_28hc_7t_30_nand2xp5 U4705 ( .A(n5664), .B(n6114), .Z(n5737) );
  dti_28hc_7t_30_nand2xp5 U4708 ( .A(n5801), .B(n5799), .Z(n5592) );
  dti_28hc_7t_30_nand2x1 U4710 ( .A(n3607), .B(
        \eda_img_ram/img_memory[1][2][4] ), .Z(n4137) );
  dti_28hc_7t_30_nand2xp5 U4713 ( .A(n6595), .B(
        \eda_img_ram/img_memory[4][5][3] ), .Z(n3903) );
  dti_28hc_7t_30_and2xp58 U4716 ( .A(n3909), .B(n3908), .Z(n7464) );
  dti_28hc_7t_30_nand2xp5 U4717 ( .A(n6191), .B(
        \eda_img_ram/img_memory[5][4][2] ), .Z(n4058) );
  dti_28hc_7t_30_nand2x1 U4721 ( .A(n6191), .B(
        \eda_img_ram/img_memory[3][5][6] ), .Z(n4203) );
  dti_28hc_7t_30_nand2xp5 U4730 ( .A(n6122), .B(
        \eda_img_ram/img_memory[3][0][5] ), .Z(n4304) );
  dti_28hc_7t_30_aoi22hpx1 U4733 ( .A1(n3606), .A2(
        \eda_img_ram/img_memory[2][3][3] ), .B1(n4602), .B2(
        \eda_img_ram/img_memory[2][2][3] ), .Z(n4480) );
  dti_28hc_7t_30_aoi22xp5 U4738 ( .A1(n7282), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][0] ), .B1(n5373), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][0] ), .Z(n5331)
         );
  dti_28hc_7t_30_aoi22xp5 U4748 ( .A1(n7282), .A2(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[3][1] ), .B1(n5373), .B2(\eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(n5289)
         );
  dti_28hc_7t_30_aoi22xp5 U4754 ( .A1(n5577), .A2(n5576), .B1(n5605), .B2(
        n5575), .Z(n5829) );
  dti_28hc_7t_30_aoi22xp5 U4759 ( .A1(n6747), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][5] ), 
        .B1(n5420), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][5] ), 
        .Z(n4914) );
  dti_28hc_7t_30_nand2xp5 U4772 ( .A(n5572), .B(n5571), .Z(n5680) );
  dti_28hc_7t_30_nand2x1 U4775 ( .A(n5142), .B(n6657), .Z(n4833) );
  dti_28hc_7t_30_nand2px2 U4778 ( .A(n4041), .B(n4040), .Z(n7529) );
  dti_28hc_7t_30_nand2x1 U4779 ( .A(\eda_iterated_ram/current_row[5][1] ), .B(
        n6597), .Z(n4377) );
  dti_28hc_7t_30_and2x1 U4784 ( .A(n5046), .B(n5045), .Z(n7505) );
  dti_28hc_7t_30_nand2xp5 U4789 ( .A(n4996), .B(n6657), .Z(n4785) );
  dti_28hc_7t_30_aoi22xp5 U4791 ( .A1(n5397), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[1][4] ), .B1(
        n5996), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[5][4] ), .Z(
        n5401) );
  dti_28hc_7t_30_nand2xp5 U4794 ( .A(n5096), .B(n3320), .Z(n5099) );
  dti_28hc_7t_30_nand4px2 U4800 ( .A(n3941), .B(n3943), .C(n3940), .D(n3942), 
        .Z(n5083) );
  dti_28hc_7t_30_aoi22xp5 U4801 ( .A1(n6747), .A2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[3][0] ), 
        .B1(n5420), .B2(
        \eda_fifos/sync_fifo_downright/sync_fifo_mem_inst/fifo_mem[0][0] ), 
        .Z(n5338) );
  dti_28hc_7t_30_nand3xp5 U4802 ( .A(n5289), .B(n5290), .C(n5288), .Z(n3459)
         );
  dti_28hc_7t_30_nand2x1 U4804 ( .A(\eda_iterated_ram/current_row[0][1] ), .B(
        n3321), .Z(n3659) );
  dti_28hc_7t_30_invx2 U4807 ( .A(n3821), .Z(n7462) );
  dti_28hc_7t_30_nand2xp5 U4808 ( .A(n5855), .B(n5854), .Z(n5857) );
  dti_28hc_7t_30_nor2xp5 U4823 ( .A(n6243), .B(
        \eda_fifos/sync_fifo_down/rd_addr [2]), .Z(n5413) );
  dti_28hc_7t_30_nor2xp5 U4830 ( .A(n4884), .B(
        \eda_fifos/sync_fifo_right/rd_addr [0]), .Z(n5398) );
  dti_28hc_7t_30_nor2xp5 U4832 ( .A(n4882), .B(
        \eda_fifos/sync_fifo_right/rd_addr [0]), .Z(n5396) );
  dti_28hc_7t_30_nand2xp5 U4835 ( .A(n5106), .B(n4855), .Z(n4847) );
  dti_28hc_7t_30_aoi22xp5 U4837 ( .A1(n6246), .A2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[5][4] ), .B1(
        n5413), .B2(
        \eda_fifos/sync_fifo_down/sync_fifo_mem_inst/fifo_mem[1][4] ), .Z(
        n5417) );
  dti_28hc_7t_30_nand4px1 U4839 ( .A(n5100), .B(n5101), .C(n5099), .D(n5098), 
        .Z(n5562) );
  dti_28hc_7t_30_nand4px1 U4842 ( .A(n4577), .B(n4576), .C(n4575), .D(n4574), 
        .Z(n5707) );
  dti_28hc_7t_30_ioa22xp5 U4847 ( .A1(n7327), .A2(
        \eda_iterated_ram/current_row[2][1] ), .B1(n7358), .B2(n5533), .Z(
        n7526) );
  dti_28hc_7t_30_nand2xp5 U4851 ( .A(\eda_iterated_ram/current_row[3][4] ), 
        .B(n3320), .Z(n4381) );
  dti_28hc_7t_30_oai12xp5 U4861 ( .B1(n5900), .B2(n5632), .A(n5631), .Z(n5860)
         );
  dti_28hc_7t_30_nor2xp5 U4865 ( .A(n4897), .B(n5953), .Z(n5407) );
  dti_28hc_7t_30_aoi22xp5 U4868 ( .A1(n5364), .A2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[2][2] ), .B1(
        n5363), .B2(
        \eda_fifos/sync_fifo_upright/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n5240) );
  dti_28hc_7t_30_aoi22xp5 U4869 ( .A1(n5399), .A2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[4][5] ), .B1(
        n5398), .B2(
        \eda_fifos/sync_fifo_right/sync_fifo_mem_inst/fifo_mem[0][5] ), .Z(
        n4893) );
  dti_28hc_7t_30_aoi22xp5 U4874 ( .A1(n5988), .A2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[3][5] ), .B1(
        n5391), .B2(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[1][5] ), .Z(
        n4880) );
  dti_28hc_7t_30_nand2i1xp8 U4875 ( .A(n5591), .B(n5871), .Z(n4625) );
  dti_28hc_7t_30_invx1 U4876 ( .A(n6119), .Z(n7477) );
  dti_28hc_7t_30_nand2x2 U4880 ( .A(n3457), .B(
        \eda_fifos/sync_fifo_up/rd_addr [1]), .Z(n4868) );
  dti_28hc_7t_30_nand2x1 U4881 ( .A(n6098), .B(n4408), .Z(n4772) );
  dti_28hc_7t_30_nand2xp5 U4882 ( .A(n4971), .B(n4970), .Z(n3325) );
  dti_28hc_7t_30_and2xp85 U4883 ( .A(n6923), .B(n4946), .Z(n5250) );
  dti_28hc_7t_30_and2xp5 U4887 ( .A(n6652), .B(n3317), .Z(n3623) );
  dti_28hc_7t_30_nor2i1x1 U4891 ( .A(\eda_iterated_ram/current_row[4][0] ), 
        .B(n5168), .Z(n5457) );
  dti_28hc_7t_30_oai13rehpx1 U4892 ( .B1(n6626), .B2(n6627), .B3(n6630), .A(
        n6629), .Z(n3492) );
  dti_28hc_7t_30_nand3xp5 U4893 ( .A(n5191), .B(n5190), .C(n5189), .Z(n5209)
         );
  dti_28hc_7t_30_nand2x4 U4894 ( .A(n7486), .B(n7485), .Z(n6658) );
  dti_28hc_7t_30_invx2 U4896 ( .A(n4773), .Z(n3805) );
  dti_28hc_7t_30_and2hpx4 U4897 ( .A(n5465), .B(n6044), .Z(n3732) );
  dti_28hc_7t_30_invx2 U4900 ( .A(n6075), .Z(n6077) );
  dti_28hc_7t_30_and2xp5 U4902 ( .A(n6812), .B(n4939), .Z(n3473) );
  dti_28hc_7t_30_nor3x1 U4903 ( .A(n5431), .B(n3314), .C(n3484), .Z(n3483) );
  dti_28hc_7t_30_nand2xp5 U4907 ( .A(n7182), .B(
        \eda_iterated_ram/current_row[3][0] ), .Z(n7501) );
  dti_28hc_7t_30_nand2xp5 U4910 ( .A(n3317), .B(new_pixel), .Z(n7818) );
  dti_28hc_7t_30_nand2px2 U4912 ( .A(n6963), .B(n6119), .Z(n6078) );
  dti_28hc_7t_30_nor2xp5 U4914 ( .A(n5476), .B(iterated_all), .Z(n5477) );
  dti_28hc_7t_30_bufx1p5 U4916 ( .A(\eda_iterated_ram/current_row[0][1] ), .Z(
        n7535) );
  dti_28hc_7t_30_nand3pshzoptax8 U4917 ( .A(n7688), .B(n5567), .C(n5566), .Z(
        n6643) );
  dti_28hc_7t_30_nand2xp5 U4919 ( .A(\eda_fifos/sync_fifo_downleft/wr_addr [0]), .B(\eda_fifos/sync_fifo_downleft/wr_addr [1]), .Z(n6718) );
  dti_28hc_7t_30_invx4 U4920 ( .A(n3705), .Z(n3704) );
  dti_28hc_7t_30_aoi12x1 U4921 ( .B1(n3854), .B2(n5428), .A(n3762), .Z(n5435)
         );
  dti_28hc_7t_30_nand3i1xp5 U4922 ( .A(\eda_fifos/sync_fifo_down/rd_addr [2]), 
        .B(\eda_fifos/sync_fifo_down/rd_addr [1]), .C(
        \eda_fifos/sync_fifo_down/rd_addr [0]), .Z(n4904) );
  dti_28hc_7t_30_nand2xp5 U4923 ( .A(n5977), .B(n5478), .Z(n5162) );
  dti_28hc_7t_30_invx2 U4924 ( .A(n6730), .Z(n4946) );
  dti_28hc_7t_30_oai12hpx2 U4925 ( .B1(n3578), .B2(n5437), .A(n3453), .Z(n3452) );
  dti_28hc_7t_30_nor2px2 U4928 ( .A(n7132), .B(n7190), .Z(n3293) );
  dti_28hc_7t_30_nor3xp5 U4929 ( .A(n7309), .B(
        \eda_iterated_ram/current_row[1][1] ), .C(n7399), .Z(n7310) );
  dti_28hc_7t_30_nor2xp5 U4930 ( .A(n7370), .B(n7399), .Z(n7371) );
  dti_28hc_7t_30_nor3xp5 U4932 ( .A(n6229), .B(n7636), .C(n7399), .Z(n6230) );
  dti_28hc_7t_30_nor2xp5 U4934 ( .A(n5462), .B(
        \eda_iterated_ram/current_row[5][3] ), .Z(n7420) );
  dti_28hc_7t_30_nor2xp5 U4937 ( .A(n4882), .B(n6770), .Z(n5997) );
  dti_28hc_7t_30_nand2x4 U4942 ( .A(n5464), .B(n3753), .Z(n3461) );
  dti_28hc_7t_30_nor2px2 U4943 ( .A(n7132), .B(n6717), .Z(n3243) );
  dti_28hc_7t_30_invshzx6 U4945 ( .A(n3592), .Z(n3316) );
  dti_28hc_7t_30_nor2px4 U4946 ( .A(n6142), .B(n3839), .Z(n6170) );
  dti_28hc_7t_30_invx1 U4950 ( .A(n6864), .Z(n6860) );
  dti_28hc_7t_30_invx1 U4951 ( .A(n3537), .Z(n7745) );
  dti_28hc_7t_30_nor2xp5 U4952 ( .A(\eda_iterated_ram/current_row[3][0] ), .B(
        n7399), .Z(n7352) );
  dti_28hc_7t_30_nor2xp5 U4953 ( .A(n6735), .B(n3869), .Z(n6738) );
  dti_28hc_7t_30_nor2hpx1 U4954 ( .A(n6082), .B(n5059), .Z(n3754) );
  dti_28hc_7t_30_oai12rehpx6 U4955 ( .B1(n3705), .B2(n3785), .A(n3541), .Z(
        n7416) );
  dti_28hc_7t_30_nand2xp5 U4956 ( .A(n5479), .B(n5478), .Z(n6027) );
  dti_28hc_7t_30_invx1 U4960 ( .A(n7596), .Z(n7595) );
  dti_28hc_7t_30_invx1 U4962 ( .A(\eda_img_ram/img_memory[2][3][1] ), .Z(n6495) );
  dti_28hc_7t_30_invx1 U4964 ( .A(\eda_img_ram/img_memory[5][1][7] ), .Z(n6385) );
  dti_28hc_7t_30_nand2px1 U4965 ( .A(n6693), .B(n7075), .Z(n6688) );
  dti_28hc_7t_30_invx1 U4966 ( .A(n7469), .Z(n7468) );
  dti_28hc_7t_30_nand2x2 U4967 ( .A(n7324), .B(\strb_value[2][0] ), .Z(n3833)
         );
  dti_28hc_7t_30_invx1 U4968 ( .A(\eda_img_ram/img_memory[1][4][6] ), .Z(n6276) );
  dti_28hc_7t_30_nor2xp5 U4970 ( .A(n6767), .B(n5966), .Z(n5967) );
  dti_28hc_7t_30_invx1 U4974 ( .A(\eda_img_ram/img_memory[4][0][6] ), .Z(n6260) );
  dti_28hc_7t_30_invx1 U4975 ( .A(\eda_img_ram/img_memory[0][3][5] ), .Z(n6470) );
  dti_28hc_7t_30_invx1 U4977 ( .A(\eda_img_ram/img_memory[5][5][6] ), .Z(n6265) );
  dti_28hc_7t_30_nand2x1 U4978 ( .A(n7219), .B(n6188), .Z(n6788) );
  dti_28hc_7t_30_invx1 U4979 ( .A(n7700), .Z(n7699) );
  dti_28hc_7t_30_ioa12xp5 U4981 ( .B1(\strb_value[5][3] ), .B2(new_pixel), .A(
        \matrix_output[5][3] ), .Z(n5914) );
  dti_28hc_7t_30_nand2xp5 U4982 ( .A(n6291), .B(n6290), .Z(n6302) );
  dti_28hc_7t_30_nand2xp5 U4984 ( .A(n3697), .B(n5999), .Z(n6769) );
  dti_28hc_7t_30_nand2px1 U4988 ( .A(n7186), .B(n6707), .Z(n6676) );
  dti_28hc_7t_30_nor2x1 U4990 ( .A(n6835), .B(n6847), .Z(n6799) );
  dti_28hc_7t_30_invx1 U4992 ( .A(\eda_img_ram/img_memory[3][1][3] ), .Z(n6330) );
  dti_28hc_7t_30_or2x1 U4997 ( .A(n6911), .B(n6907), .Z(n7767) );
  dti_28hc_7t_30_invx2 U4998 ( .A(n7490), .Z(n7268) );
  dti_28hc_7t_30_invx1 U5000 ( .A(\eda_img_ram/img_memory[4][1][0] ), .Z(n6548) );
  dti_28hc_7t_30_nand2mhzx6 U5002 ( .A(n3861), .B(n6897), .Z(n7239) );
  dti_28hc_7t_30_invx1 U5003 ( .A(\eda_img_ram/img_memory[4][1][7] ), .Z(n6392) );
  dti_28hc_7t_30_ioa12xp5 U5004 ( .B1(\strb_value[3][3] ), .B2(new_pixel), .A(
        \matrix_output[3][3] ), .Z(n5945) );
  dti_28hc_7t_30_ioa12xp5 U5005 ( .B1(\strb_value[1][2] ), .B2(new_pixel), .A(
        \matrix_output[1][2] ), .Z(n5917) );
  dti_28hc_7t_30_aoi12xp5 U5008 ( .B1(n6738), .B2(n6737), .A(n7789), .Z(n6748)
         );
  dti_28hc_7t_30_invx1 U5009 ( .A(\eda_img_ram/img_memory[5][3][3] ), .Z(n6309) );
  dti_28hc_7t_30_aoi12xp5 U5012 ( .B1(n6246), .B2(n6245), .A(n6244), .Z(n7279)
         );
  dti_28hc_7t_30_ioa12xp5 U5013 ( .B1(\strb_value[1][0] ), .B2(new_pixel), .A(
        \matrix_output[1][0] ), .Z(n5926) );
  dti_28hc_7t_30_aoi12xp5 U5015 ( .B1(n6050), .B2(n6049), .A(n7430), .Z(n6053)
         );
  dti_28hc_7t_30_invx1 U5017 ( .A(n6147), .Z(n7121) );
  dti_28hc_7t_30_oai12xp5 U5019 ( .B1(n6226), .B2(n6225), .A(n3706), .Z(n6227)
         );
  dti_28hc_7t_30_invx1 U5020 ( .A(\eda_img_ram/img_memory[5][4][5] ), .Z(n6454) );
  dti_28hc_7t_30_invx1 U5021 ( .A(\eda_img_ram/img_memory[4][5][0] ), .Z(n6542) );
  dti_28hc_7t_30_invx1 U5023 ( .A(\eda_img_ram/img_memory[4][0][7] ), .Z(n6396) );
  dti_28hc_7t_30_invx1 U5024 ( .A(\eda_img_ram/img_memory[2][4][2] ), .Z(n6374) );
  dti_28hc_7t_30_invx1 U5027 ( .A(\eda_img_ram/img_memory[1][0][3] ), .Z(n6316) );
  dti_28hc_7t_30_nand3i1xp5 U5028 ( .A(n3706), .B(n6044), .C(n6043), .Z(n2504)
         );
  dti_28hc_7t_30_iao12x1 U5029 ( .B1(n7254), .B2(
        \eda_fifos/sync_fifo_downright/wr_addr [3]), .A(n6058), .Z(n2848) );
  dti_28hc_7t_30_nand3x2 U5030 ( .A(n7482), .B(n6702), .C(n7479), .Z(n2885) );
  dti_28hc_7t_30_muxi21x1 U5031 ( .D0(n4081), .D1(n6976), .S(n3563), .Z(n2742)
         );
  dti_28hc_7t_30_muxi21optax4 U5038 ( .D0(n7294), .D1(n3374), .S(n7791), .Z(
        n2502) );
  dti_28hc_7t_30_muxi21xp5 U5042 ( .D0(n4081), .D1(n6879), .S(n7166), .Z(n2536) );
  dti_28hc_7t_30_nor2xp5 U5051 ( .A(n6298), .B(n6259), .Z(n6539) );
  dti_28hc_7t_30_nor2xp5 U5052 ( .A(n6296), .B(n6302), .Z(n6587) );
  dti_28hc_7t_30_oai112x1 U5056 ( .C1(n7380), .C2(n3559), .A(n6044), .B(n5941), 
        .Z(n2451) );
  dti_28hc_7t_30_oai112x1 U5057 ( .C1(n3657), .C2(n3559), .A(n6044), .B(n5915), 
        .Z(n2487) );
  dti_28hc_7t_30_ioa22xp5 U5058 ( .A1(n6874), .A2(n6880), .B1(n6162), .B2(
        n6161), .Z(n2891) );
  dti_28hc_7t_30_nand2xp5 U5059 ( .A(n6785), .B(n3407), .Z(n2805) );
  dti_28hc_7t_30_nand2i1x1 U5060 ( .A(n7000), .B(n6092), .Z(n2672) );
  dti_28hc_7t_30_nor2xp5 U5061 ( .A(n5976), .B(n3314), .Z(
        \eda_iterated_ram/N741 ) );
  dti_28hc_7t_30_xnor2bxp5 U5066 ( .A(\eda_fifos/sync_fifo_left/rd_addr [3]), 
        .B(n6014), .Z(n2762) );
  dti_28hc_7t_30_or2x1 U5071 ( .A(n7080), .B(n6717), .Z(n7451) );
  dti_28hc_7t_30_or3x1 U5075 ( .A(n6192), .B(n6191), .C(
        \eda_fifos/sync_fifo_upright/o_full ), .Z(n7452) );
  dti_28hc_7t_30_nand2xp5 U5076 ( .A(n5449), .B(n7376), .Z(n3450) );
  dti_28hc_7t_30_or2x1 U5081 ( .A(n6891), .B(n7790), .Z(n7453) );
  dti_28hc_7t_30_invx1 U5082 ( .A(n3931), .Z(n5496) );
  dti_28hc_7t_30_nand3pshzoptax8 U5083 ( .A(n3955), .B(n3954), .C(n3700), .Z(
        n5871) );
  dti_28hc_7t_30_invx3 U5084 ( .A(n5871), .Z(n7472) );
  dti_28hc_7t_30_bufx2 U5086 ( .A(n5498), .Z(n7695) );
  dti_28hc_7t_30_invx2 U5089 ( .A(n5498), .Z(n6642) );
  dti_28hc_7t_30_invshzx6 U5090 ( .A(n3527), .Z(n6064) );
  dti_28hc_7t_30_nor2x1 U5091 ( .A(n3844), .B(n7452), .Z(n7454) );
  dti_28hc_7t_30_and2xp5 U5096 ( .A(\eda_fifos/sync_fifo_up/wr_addr [3]), .B(
        n6239), .Z(n7455) );
  dti_28hc_7t_30_and3hpx2 U5098 ( .A(n5569), .B(n3800), .C(n5497), .Z(n7456)
         );
  dti_28hc_7t_30_nand3xp5 U5101 ( .A(n5384), .B(n5385), .C(n5383), .Z(n7457)
         );
  dti_28hc_7t_30_aoi13xp5 U5103 ( .B1(n5355), .B2(n5354), .B3(n5353), .A(n5352), .Z(n7458) );
  dti_28hc_7t_30_ao13xp5 U5105 ( .B1(n6831), .B2(n6832), .B3(n7521), .A(n3568), 
        .Z(n7459) );
  dti_28hc_7t_30_invmhzx12 U5106 ( .A(n3702), .Z(n3775) );
  dti_28hc_7t_30_nand4px4 U5113 ( .A(n3438), .B(n6061), .C(n4770), .D(n4771), 
        .Z(n5279) );
  dti_28hc_7t_30_tiehix1 U5114 ( .HI(n7717) );
  dti_28hc_7t_30_nand3x2 U5117 ( .A(n7590), .B(n6670), .C(n7592), .Z(n2877) );
  dti_28hc_7t_30_nand2pshzx8 U5125 ( .A(n7461), .B(n7460), .Z(n5604) );
  dti_28hc_7t_30_invx4 U5126 ( .A(n7529), .Z(n7461) );
  dti_28hc_7t_30_nand2px4 U5132 ( .A(n6094), .B(n3369), .Z(n4952) );
  dti_28hc_7t_30_xnor2optax4 U5136 ( .A(n5134), .B(n5765), .Z(n3369) );
  dti_28hc_7t_30_nor2px4 U5137 ( .A(n4816), .B(n7630), .Z(n6054) );
  dti_28hc_7t_30_nor2px4 U5138 ( .A(n7463), .B(n7462), .Z(n3274) );
  dti_28hc_7t_30_nor2px1 U5140 ( .A(n6659), .B(n6635), .Z(n6628) );
  dti_28hc_7t_30_aoi22hplm2x4 U5141 ( .A1(n5065), .A2(n4836), .B1(n5062), .B2(
        n3319), .Z(n4010) );
  dti_28hc_7t_30_and2x1 U5142 ( .A(n7557), .B(n5011), .Z(n7474) );
  dti_28hc_7t_30_nand2hpx2 U5143 ( .A(n3853), .B(n3852), .Z(n6853) );
  dti_28hc_7t_30_nand2i1x2 U5144 ( .A(n6129), .B(n6130), .Z(n7583) );
  dti_28hc_7t_30_invx1 U5145 ( .A(n6777), .Z(n3467) );
  dti_28hc_7t_30_nand2x4 U5146 ( .A(n4965), .B(n4966), .Z(n6065) );
  dti_28hc_7t_30_nand3x2 U5149 ( .A(n6113), .B(n6650), .C(n6657), .Z(n7602) );
  dti_28hc_7t_30_nand3plm2x4 U5152 ( .A(n6186), .B(n7467), .C(n7466), .Z(n3811) );
  dti_28hc_7t_30_nand3x2 U5165 ( .A(n3322), .B(n6675), .C(n7468), .Z(n2862) );
  dti_28hc_7t_30_invmhzx10 U5166 ( .A(n3186), .Z(n7667) );
  dti_28hc_7t_30_nand2x4 U5167 ( .A(n3512), .B(n3539), .Z(n3511) );
  dti_28hc_7t_30_invx1 U5170 ( .A(\eda_iterated_ram/current_row[0][0] ), .Z(
        n7470) );
  dti_28hc_7t_30_or2hpx8 U5179 ( .A(n4355), .B(n3528), .Z(n6610) );
  dti_28hc_7t_30_nor2px2 U5180 ( .A(n7080), .B(n6709), .Z(n7560) );
  dti_28hc_7t_30_nand3hpx2 U5200 ( .A(n7709), .B(n7708), .C(n7707), .Z(n7751)
         );
  dti_28hc_7t_30_aoi22x1 U5201 ( .A1(n4582), .A2(
        \eda_img_ram/img_memory[4][3][0] ), .B1(
        \eda_img_ram/img_memory[4][5][0] ), .B2(n6595), .Z(n4253) );
  dti_28hc_7t_30_aoi22x3 U5203 ( .A1(n7603), .A2(n3317), .B1(n6651), .B2(n3826), .Z(n3652) );
  dti_28hc_7t_30_xnor2optax4 U5206 ( .A(n3241), .B(n5867), .Z(n4963) );
  dti_28hc_7t_30_xnor2optax4 U5207 ( .A(n3241), .B(n5651), .Z(n3509) );
  dti_28hc_7t_30_nand2x2 U5210 ( .A(n5655), .B(n6114), .Z(n5777) );
  dti_28hc_7t_30_nand2x1 U5214 ( .A(n4725), .B(n4855), .Z(n7506) );
  dti_28hc_7t_30_xnor2bx1 U5218 ( .A(n7472), .B(n5868), .Z(n4013) );
  dti_28hc_7t_30_xnor2optax4 U5236 ( .A(n5653), .B(n5871), .Z(n3803) );
  dti_28hc_7t_30_nand3hpx1 U5240 ( .A(n7494), .B(n4488), .C(n4489), .Z(n5026)
         );
  dti_28hc_7t_30_nand2shzx16 U5241 ( .A(n7549), .B(n3619), .Z(n3929) );
  dti_28hc_7t_30_or2hpx4 U5242 ( .A(n3769), .B(n3331), .Z(n7483) );
  dti_28hc_7t_30_nand2px2 U5250 ( .A(n7624), .B(n7623), .Z(n7487) );
  dti_28hc_7t_30_nand2x3 U5259 ( .A(n6204), .B(n6205), .Z(n7478) );
  dti_28hc_7t_30_nor2px2 U5262 ( .A(n7815), .B(\eda_iterated_ram/have_done ), 
        .Z(n7480) );
  dti_28hc_7t_30_nand3poptax6 U5263 ( .A(n7678), .B(n7741), .C(n7740), .Z(
        n7750) );
  dti_28hc_7t_30_aoi22x3 U5273 ( .A1(n6191), .A2(
        \eda_img_ram/img_memory[3][5][4] ), .B1(n3931), .B2(
        \eda_img_ram/img_memory[3][0][4] ), .Z(n4158) );
  dti_28hc_7t_30_xnor2optax4 U5286 ( .A(n5604), .B(n5649), .Z(n4802) );
  dti_28hc_7t_30_aoi12hpx6 U5291 ( .B1(n3304), .B2(n3332), .A(n7483), .Z(n7189) );
  dti_28hc_7t_30_oai22lm2x6 U5303 ( .A1(n6647), .A2(n6626), .B1(n3494), .B2(
        n6643), .Z(n7484) );
  dti_28hc_7t_30_nand2x1 U5304 ( .A(n5433), .B(n6147), .Z(n7735) );
  dti_28hc_7t_30_nand2x1 U5309 ( .A(n4616), .B(n3931), .Z(n6177) );
  dti_28hc_7t_30_invshzx6 U5310 ( .A(n7684), .Z(n7685) );
  dti_28hc_7t_30_nor2i1px2 U5311 ( .A(n3284), .B(n7655), .Z(n3238) );
  dti_28hc_7t_30_nand2px4 U5318 ( .A(n3279), .B(n3680), .Z(n6777) );
  dti_28hc_7t_30_nand3x2 U5319 ( .A(n4620), .B(n4619), .C(n7547), .Z(n5603) );
  dti_28hc_7t_30_invmhzx40 U5320 ( .A(n6658), .Z(n6633) );
  dti_28hc_7t_30_ioa12hpx4 U5321 ( .B1(n3450), .B2(n6224), .A(n3451), .Z(n3186) );
  dti_28hc_7t_30_invx4 U5322 ( .A(n5471), .Z(n5159) );
  dti_28hc_7t_30_aoi22hplm2x4 U5323 ( .A1(n4817), .A2(n5148), .B1(n3290), .B2(
        n4973), .Z(n4773) );
  dti_28hc_7t_30_invx2 U5327 ( .A(n6106), .Z(n6107) );
  dti_28hc_7t_30_nand2x1 U5336 ( .A(n4976), .B(n3319), .Z(n4808) );
  dti_28hc_7t_30_nand3x2 U5343 ( .A(n6685), .B(n7487), .C(n6686), .Z(n2857) );
  dti_28hc_7t_30_aoi22x1 U5344 ( .A1(n4740), .A2(n3321), .B1(n4742), .B2(n3320), .Z(n4190) );
  dti_28hc_7t_30_ioa12hpx4 U5349 ( .B1(n7533), .B2(n7546), .A(n7488), .Z(n7076) );
  dti_28hc_7t_30_ioa12hpx4 U5367 ( .B1(n5129), .B2(n6633), .A(n4352), .Z(n7810) );
  dti_28hc_7t_30_nand3x2 U5377 ( .A(n7579), .B(n7578), .C(n6639), .Z(n2876) );
  dti_28hc_7t_30_invmhzx12 U5390 ( .A(n3640), .Z(n7603) );
  dti_28hc_7t_30_nand2x1 U5397 ( .A(n5433), .B(n3565), .Z(n7754) );
  dti_28hc_7t_30_invx2 U5398 ( .A(n7568), .Z(n7567) );
  dti_28hc_7t_30_nand3hpx1 U5412 ( .A(n5361), .B(n7127), .C(n5433), .Z(n5322)
         );
  dti_28hc_7t_30_oa12x1 U5415 ( .B1(n5277), .B2(n5276), .A(n7820), .Z(n7803)
         );
  dti_28hc_7t_30_oai112hpx2 U5418 ( .C1(n7133), .C2(n7189), .A(n6607), .B(
        n6608), .Z(n2860) );
  dti_28hc_7t_30_nand3x2 U5427 ( .A(n4697), .B(n7673), .C(n7489), .Z(n5686) );
  dti_28hc_7t_30_ioa13x2 U5437 ( .B1(n5449), .B2(n6215), .B3(n5225), .A(n6224), 
        .Z(n5226) );
  dti_28hc_7t_30_nand2x1 U5447 ( .A(n6729), .B(n6776), .Z(n3677) );
  dti_28hc_7t_30_aoi22x1 U5449 ( .A1(n4721), .A2(n3319), .B1(n4720), .B2(n4856), .Z(n4729) );
  dti_28hc_7t_30_nor2px4 U5451 ( .A(n5136), .B(n5135), .Z(n6076) );
  dti_28hc_7t_30_muxi21x1 U5456 ( .D0(n7443), .D1(n7153), .S(n7490), .Z(n2651)
         );
  dti_28hc_7t_30_nor2px4 U5458 ( .A(n3346), .B(n3343), .Z(n7490) );
  dti_28hc_7t_30_nand3x2 U5463 ( .A(n7451), .B(n6715), .C(n7587), .Z(n2871) );
  dti_28hc_7t_30_nand3hpx2 U5476 ( .A(n4768), .B(n3370), .C(n7690), .Z(n5690)
         );
  dti_28hc_7t_30_aoi22x1 U5483 ( .A1(n6191), .A2(n3554), .B1(n4602), .B2(
        \eda_img_ram/img_memory[0][0][0] ), .Z(n4269) );
  dti_28hc_7t_30_nand2x1 U5485 ( .A(n5016), .B(n6657), .Z(n4797) );
  dti_28hc_7t_30_invx2 U5486 ( .A(n3346), .Z(n7594) );
  dti_28hc_7t_30_oai22lm2x6 U5488 ( .A1(n6647), .A2(n6612), .B1(n7614), .B2(
        n6643), .Z(n7491) );
  dti_28hc_7t_30_nor2x4 U5489 ( .A(n6065), .B(n6066), .Z(n6068) );
  dti_28hc_7t_30_xnor2optax4 U5490 ( .A(n7503), .B(n3613), .Z(n6096) );
  dti_28hc_7t_30_nand2mhzx32 U5492 ( .A(n3930), .B(n7274), .Z(n6124) );
  dti_28hc_7t_30_aoi22x3 U5493 ( .A1(n5072), .A2(n5589), .B1(n5071), .B2(n3320), .Z(n3885) );
  dti_28hc_7t_30_nor2px4 U5495 ( .A(n4951), .B(n4952), .Z(n7684) );
  dti_28hc_7t_30_nor2hpoptax6 U5497 ( .A(n3681), .B(n3234), .Z(n6079) );
  dti_28hc_7t_30_nand3px2 U5499 ( .A(n6651), .B(n6119), .C(n6652), .Z(n6120)
         );
  dti_28hc_7t_30_xor2bx1 U5500 ( .A(n5644), .B(n5134), .Z(n7625) );
  dti_28hc_7t_30_and2x1 U5504 ( .A(n4487), .B(n4486), .Z(n7494) );
  dti_28hc_7t_30_oai12rehplm2x2 U5505 ( .B1(n6714), .B2(n7190), .A(n7705), .Z(
        n7704) );
  dti_28hc_7t_30_nand2x1 U5507 ( .A(n3482), .B(n5434), .Z(n3337) );
  dti_28hc_7t_30_xnor2x1 U5511 ( .A(n4935), .B(n4934), .Z(n6826) );
  dti_28hc_7t_30_nand2x4 U5514 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][3][7] ), .Z(n3994) );
  dti_28hc_7t_30_iao22x1 U5515 ( .A1(n6698), .A2(n7129), .B1(
        \eda_iterated_ram/have_done ), .B2(n7656), .Z(n3490) );
  dti_28hc_7t_30_nor2px4 U5521 ( .A(n3346), .B(n3342), .Z(n7599) );
  dti_28hc_7t_30_nand3plm2x4 U5524 ( .A(n7527), .B(n5158), .C(n7663), .Z(n3346) );
  dti_28hc_7t_30_nand3x2 U5528 ( .A(n7498), .B(n7499), .C(n6696), .Z(n2873) );
  dti_28hc_7t_30_nand2x1 U5529 ( .A(n6694), .B(n6707), .Z(n7498) );
  dti_28hc_7t_30_invx6 U5530 ( .A(n7598), .Z(n5464) );
  dti_28hc_7t_30_nand2i1x2 U5531 ( .A(n3346), .B(n5276), .Z(n5275) );
  dti_28hc_7t_30_oai12relm2x6 U5532 ( .B1(n3354), .B2(n3353), .A(n5438), .Z(
        n6228) );
  dti_28hc_7t_30_aoi22x3 U5533 ( .A1(n7184), .A2(n7129), .B1(n7182), .B2(
        \eda_iterated_ram/current_row[0][4] ), .Z(n6668) );
  dti_28hc_7t_30_xnor2optax4 U5536 ( .A(n5660), .B(n4709), .Z(n4803) );
  dti_28hc_7t_30_nand3x2 U5546 ( .A(n7502), .B(n4799), .C(n4798), .Z(n5660) );
  dti_28hc_7t_30_nand2px4 U5547 ( .A(n6631), .B(n3582), .Z(n6842) );
  dti_28hc_7t_30_nand2x1 U5548 ( .A(n4988), .B(n3319), .Z(n7544) );
  dti_28hc_7t_30_aoi22x2 U5553 ( .A1(n5096), .A2(n4856), .B1(n5095), .B2(n3319), .Z(n7773) );
  dti_28hc_7t_30_nand2x1 U5557 ( .A(n5108), .B(n5429), .Z(n5109) );
  dti_28hc_7t_30_nor2x2 U5558 ( .A(n6777), .B(n3315), .Z(n6000) );
  dti_28hc_7t_30_iao22x2 U5560 ( .A1(n7184), .A2(n7183), .B1(n7539), .B2(
        \eda_iterated_ram/have_done ), .Z(n7188) );
  dti_28hc_7t_30_xnor2optax4 U5565 ( .A(n3760), .B(n3759), .Z(n6729) );
  dti_28hc_7t_30_xnor2optax4 U5567 ( .A(n5604), .B(n5541), .Z(n6194) );
  dti_28hc_7t_30_nand3px2 U5568 ( .A(n7542), .B(n5025), .C(n5024), .Z(n5575)
         );
  dti_28hc_7t_30_invx1 U5569 ( .A(\strb_value[4][2] ), .Z(n7687) );
  dti_28hc_7t_30_invx2 U5571 ( .A(n5273), .Z(n7508) );
  dti_28hc_7t_30_xnor2optax4 U5572 ( .A(n3613), .B(n5561), .Z(n6204) );
  dti_28hc_7t_30_aoi22x1 U5574 ( .A1(n3604), .A2(
        \eda_img_ram/img_memory[0][1][6] ), .B1(
        \eda_img_ram/img_memory[0][4][6] ), .B2(n6174), .Z(n4242) );
  dti_28hc_7t_30_or2hpx2 U5575 ( .A(n6183), .B(n6175), .Z(n7511) );
  dti_28hc_7t_30_nand2pshzx8 U5577 ( .A(n6171), .B(n6170), .Z(n6877) );
  dti_28hc_7t_30_nor3pmhzoptax6 U5581 ( .A(n7583), .B(n7646), .C(n7647), .Z(
        n6171) );
  dti_28hc_7t_30_aoi22x1 U5582 ( .A1(n5016), .A2(n4855), .B1(n5019), .B2(n5589), .Z(n4520) );
  dti_28hc_7t_30_invx1 U5583 ( .A(n7591), .Z(n7590) );
  dti_28hc_7t_30_nand2x2 U5584 ( .A(n3586), .B(n7129), .Z(n6665) );
  dti_28hc_7t_30_aoi22x1 U5585 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[1][0][6] ), .B1(n3595), .B2(
        \eda_img_ram/img_memory[1][3][6] ), .Z(n4505) );
  dti_28hc_7t_30_xor2bx2 U5588 ( .A(n5548), .B(n4709), .Z(n7513) );
  dti_28hc_7t_30_xnor2bx1 U5593 ( .A(n3241), .B(n5540), .Z(n5014) );
  dti_28hc_7t_30_xor2bx2 U5594 ( .A(n7515), .B(n3505), .Z(n5490) );
  dti_28hc_7t_30_invx2 U5595 ( .A(n6942), .Z(n7516) );
  dti_28hc_7t_30_nand2px1 U5598 ( .A(n6653), .B(n6657), .Z(n7534) );
  dti_28hc_7t_30_aoi22x1 U5599 ( .A1(n5017), .A2(n3320), .B1(n5016), .B2(n3309), .Z(n5025) );
  dti_28hc_7t_30_nand2x3 U5602 ( .A(n4875), .B(n7518), .Z(n6915) );
  dti_28hc_7t_30_or2hpx2 U5604 ( .A(n7726), .B(n5304), .Z(n3462) );
  dti_28hc_7t_30_nand2x1 U5612 ( .A(n4603), .B(
        \eda_img_ram/img_memory[2][4][6] ), .Z(n4509) );
  dti_28hc_7t_30_invx2 U5615 ( .A(n3423), .Z(n3395) );
  dti_28hc_7t_30_nand2x1 U5616 ( .A(n4603), .B(
        \eda_img_ram/img_memory[1][3][1] ), .Z(n4085) );
  dti_28hc_7t_30_nand2x1 U5617 ( .A(n6814), .B(n4938), .Z(n3360) );
  dti_28hc_7t_30_ioa12hpx2 U5618 ( .B1(n3854), .B2(n3722), .A(n7520), .Z(n5359) );
  dti_28hc_7t_30_aoi22x3 U5622 ( .A1(n3697), .A2(n5357), .B1(n7521), .B2(n7458), .Z(n7520) );
  dti_28hc_7t_30_invx1 U5627 ( .A(n6823), .Z(n7521) );
  dti_28hc_7t_30_invx1 U5629 ( .A(n3936), .Z(n7522) );
  dti_28hc_7t_30_nor2x1 U5640 ( .A(n5531), .B(n7526), .Z(n5534) );
  dti_28hc_7t_30_invx3 U5641 ( .A(n6224), .Z(n5537) );
  dti_28hc_7t_30_nor3x2 U5644 ( .A(n3296), .B(n3757), .C(n3428), .Z(n3295) );
  dti_28hc_7t_30_xnor2bx1 U5645 ( .A(n3527), .B(n5690), .Z(n4769) );
  dti_28hc_7t_30_and2x1 U5647 ( .A(n5316), .B(n5985), .Z(n7784) );
  dti_28hc_7t_30_and2hpx2 U5652 ( .A(n6729), .B(n4906), .Z(n3680) );
  dti_28hc_7t_30_ioa12lm2x8 U5657 ( .B1(n3706), .B2(n3427), .A(n3423), .Z(
        n3705) );
  dti_28hc_7t_30_nand4px2 U5660 ( .A(n4204), .B(n4203), .C(n4202), .D(n4205), 
        .Z(n5108) );
  dti_28hc_7t_30_and2hpx2 U5661 ( .A(n7566), .B(n3240), .Z(n7527) );
  dti_28hc_7t_30_xnor2optax4 U5663 ( .A(n5604), .B(n5777), .Z(n6103) );
  dti_28hc_7t_30_xnor2x2 U5668 ( .A(n4672), .B(n7713), .Z(n4938) );
  dti_28hc_7t_30_and2hpx2 U5671 ( .A(n6096), .B(n6101), .Z(n7530) );
  dti_28hc_7t_30_invx1 U5675 ( .A(\eda_fifos/sync_fifo_down/wr_addr [3]), .Z(
        n7531) );
  dti_28hc_7t_30_invmhzx10 U5679 ( .A(up_addr[0]), .Z(n7274) );
  dti_28hc_7t_30_and2hpx2 U5690 ( .A(n5110), .B(n5109), .Z(n7532) );
  dti_28hc_7t_30_aoi22hplm2x4 U5695 ( .A1(n3504), .A2(n5185), .B1(n5471), .B2(
        n5478), .Z(n6224) );
  dti_28hc_7t_30_ioa12hpx2 U5698 ( .B1(n5326), .B2(n3434), .A(n3435), .Z(n3424) );
  dti_28hc_7t_30_invx4 U5699 ( .A(n6761), .Z(n7789) );
  dti_28hc_7t_30_nand2x3 U5705 ( .A(n3868), .B(n3867), .Z(n6761) );
  dti_28hc_7t_30_invx1 U5706 ( .A(n7535), .Z(n7536) );
  dti_28hc_7t_30_nand3hpx1 U5707 ( .A(n4846), .B(n4845), .C(n7537), .Z(n5655)
         );
  dti_28hc_7t_30_nand2x3 U5709 ( .A(n4817), .B(n5154), .Z(n6100) );
  dti_28hc_7t_30_and2hpx2 U5713 ( .A(n7780), .B(n4685), .Z(n7538) );
  dti_28hc_7t_30_nor3px1 U5714 ( .A(n4957), .B(n6102), .C(n4956), .Z(n4958) );
  dti_28hc_7t_30_xnor2optax4 U5720 ( .A(n5613), .B(n5687), .Z(n6130) );
  dti_28hc_7t_30_invx1 U5725 ( .A(\eda_iterated_ram/current_row[0][3] ), .Z(
        n7539) );
  dti_28hc_7t_30_aoi22x1 U5726 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[4][3][4] ), .B1(
        \eda_img_ram/img_memory[4][5][4] ), .B2(n6595), .Z(n4169) );
  dti_28hc_7t_30_nor2px4 U5744 ( .A(n7712), .B(n7540), .Z(n6840) );
  dti_28hc_7t_30_or2hpx2 U5748 ( .A(n7637), .B(n7545), .Z(n7540) );
  dti_28hc_7t_30_nor2shzx6 U5751 ( .A(n3819), .B(n3818), .Z(n7698) );
  dti_28hc_7t_30_nor3pmhzoptax6 U5756 ( .A(n3405), .B(n3406), .C(n3404), .Z(
        n6971) );
  dti_28hc_7t_30_ioa12hpx4 U5770 ( .B1(n4709), .B2(n7644), .A(n7541), .Z(n5570) );
  dti_28hc_7t_30_nand2x3 U5780 ( .A(n7786), .B(n5613), .Z(n7541) );
  dti_28hc_7t_30_invshzx6 U5796 ( .A(up_addr[1]), .Z(n7549) );
  dti_28hc_7t_30_nand3plm2x4 U5803 ( .A(n7635), .B(n4162), .C(n4161), .Z(n4750) );
  dti_28hc_7t_30_nand3x2 U5807 ( .A(n6684), .B(n7706), .C(n6683), .Z(n2863) );
  dti_28hc_7t_30_nor2x2 U5820 ( .A(n6701), .B(n6717), .Z(n3270) );
  dti_28hc_7t_30_and2hpx2 U5822 ( .A(n5569), .B(n5497), .Z(n7688) );
  dti_28hc_7t_30_aoi22x3 U5826 ( .A1(n5578), .A2(n5875), .B1(n3774), .B2(n4656), .Z(n5569) );
  dti_28hc_7t_30_xnor2optax4 U5841 ( .A(n4709), .B(n5575), .Z(n6205) );
  dti_28hc_7t_30_xnor2bx1 U5859 ( .A(\eda_fifos/sync_fifo_downleft/wr_addr [3]), .B(n6720), .Z(n2541) );
  dti_28hc_7t_30_xor2bx2 U5864 ( .A(n5754), .B(n4709), .Z(n6095) );
  dti_28hc_7t_30_invx1 U5869 ( .A(\eda_iterated_ram/current_row[4][1] ), .Z(
        n7543) );
  dti_28hc_7t_30_xnor2x2 U5870 ( .A(n4890), .B(n4891), .Z(n6731) );
  dti_28hc_7t_30_nor2px4 U5875 ( .A(n4751), .B(n3690), .Z(n6650) );
  dti_28hc_7t_30_aoi13rehpx2 U5891 ( .B1(n3317), .B2(n6618), .B3(n6904), .A(
        n6617), .Z(n7565) );
  dti_28hc_7t_30_nand2x2 U5896 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][3][4] ), .Z(n4150) );
  dti_28hc_7t_30_invx2 U5899 ( .A(n7189), .Z(n7624) );
  dti_28hc_7t_30_ioa12hpx4 U5905 ( .B1(n7643), .B2(n3706), .A(n3674), .Z(n7598) );
  dti_28hc_7t_30_or2hpx2 U5909 ( .A(n3730), .B(n3728), .Z(n3834) );
  dti_28hc_7t_30_invx2 U5912 ( .A(n3282), .Z(n7622) );
  dti_28hc_7t_30_nand3hpx2 U5921 ( .A(n4938), .B(n6825), .C(n6829), .Z(n7727)
         );
  dti_28hc_7t_30_nand4px2 U5931 ( .A(n6632), .B(n6653), .C(n3317), .D(n7672), 
        .Z(n6634) );
  dti_28hc_7t_30_nand2x2 U5955 ( .A(n3586), .B(n6706), .Z(n6699) );
  dti_28hc_7t_30_oai112rex2 U5995 ( .C1(n6709), .C2(n6701), .A(n6700), .B(
        n6699), .Z(n2861) );
  dti_28hc_7t_30_invx4 U6016 ( .A(up_addr[1]), .Z(n3620) );
  dti_28hc_7t_30_nand3x2 U6033 ( .A(n3674), .B(n3423), .C(n3500), .Z(n3512) );
  dti_28hc_7t_30_invx2 U6037 ( .A(n6701), .Z(n7620) );
  dti_28hc_7t_30_nand4px2 U6042 ( .A(n4334), .B(n4335), .C(n4332), .D(n4333), 
        .Z(n5126) );
  dti_28hc_7t_30_nand2x2 U6045 ( .A(n6660), .B(n6904), .Z(n7819) );
  dti_28hc_7t_30_invx3 U6086 ( .A(n6850), .Z(n3535) );
  dti_28hc_7t_30_aoi12rex1 U6113 ( .B1(n6787), .B2(n6867), .A(n6786), .Z(n6789) );
  dti_28hc_7t_30_nand3pmhzoptax6 U6118 ( .A(n3639), .B(n7790), .C(n3641), .Z(
        n7254) );
  dti_28hc_7t_30_nand4poptax8 U6125 ( .A(n3639), .B(n3390), .C(n6893), .D(
        n3647), .Z(n7247) );
  dti_28hc_7t_30_nand3hpx1 U6140 ( .A(n5593), .B(n5618), .C(n5592), .Z(n5630)
         );
  dti_28hc_7t_30_aoi22rex1 U6151 ( .A1(n5071), .A2(n5429), .B1(n6597), .B2(
        n5070), .Z(n5079) );
  dti_28hc_7t_30_nand2px4 U6169 ( .A(n6949), .B(n6945), .Z(n7207) );
  dti_28hc_7t_30_nand2xp8 U6181 ( .A(n6633), .B(n5143), .Z(n5144) );
  dti_28hc_7t_30_nor2hpoptax6 U6190 ( .A(n5564), .B(n3823), .Z(n5567) );
  dti_28hc_7t_30_aoi12xp8 U6195 ( .B1(n7554), .B2(n6763), .A(n6762), .Z(
        \eda_fifos/sync_fifo_down/comparator_inst/N53 ) );
  dti_28hc_7t_30_nor2px6 U6197 ( .A(n7810), .B(n7561), .Z(n3822) );
  dti_28hc_7t_30_muxi21x1 U6212 ( .D0(n3565), .D1(n6991), .S(n7199), .Z(n2694)
         );
  dti_28hc_7t_30_oai12x1 U6218 ( .B1(n3346), .B2(
        \eda_fifos/sync_fifo_up/o_full ), .A(
        \eda_fifos/sync_fifo_up/wr_addr [0]), .Z(n6919) );
  dti_28hc_7t_30_ioa12xp5 U6231 ( .B1(n3346), .B2(n3345), .A(n3344), .Z(n5494)
         );
  dti_28hc_7t_30_invx2 U6232 ( .A(n3346), .Z(n3341) );
  dti_28hc_7t_30_mux21optax1 U6233 ( .D0(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[0][1] ), .D1(n6147), .S(n7599), .Z(n2635) );
  dti_28hc_7t_30_nor2hpmhzoptax8 U6234 ( .A(n6630), .B(n6627), .Z(n6963) );
  dti_28hc_7t_30_nand2xp5 U6239 ( .A(n7603), .B(n6742), .Z(n6743) );
  dti_28hc_7t_30_nor2xp5 U6246 ( .A(n7603), .B(n6128), .Z(n3648) );
  dti_28hc_7t_30_oai22xp8 U6248 ( .A1(n3456), .A2(n3461), .B1(n5467), .B2(
        n5466), .Z(n5468) );
  dti_28hc_7t_30_nand2x2 U6258 ( .A(n6963), .B(n6616), .Z(n6620) );
  dti_28hc_7t_30_aoi22xp8 U6267 ( .A1(n4603), .A2(
        \eda_img_ram/img_memory[3][4][1] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[3][2][1] ), .Z(n4432) );
  dti_28hc_7t_30_oai12relm2x6 U6271 ( .B1(n3424), .B2(n3425), .A(n5438), .Z(
        n3423) );
  dti_28hc_7t_30_muxi21x2 U6282 ( .D0(n7111), .D1(n7107), .S(n7247), .Z(n2817)
         );
  dti_28hc_7t_30_muxi21x2 U6285 ( .D0(n3804), .D1(n7056), .S(n7221), .Z(n2787)
         );
  dti_28hc_7t_30_aoi22rex1 U6287 ( .A1(n4408), .A2(
        \eda_img_ram/img_memory[0][0][0] ), .B1(n4445), .B2(
        \eda_img_ram/img_memory[0][2][0] ), .Z(n4444) );
  dti_28hc_7t_30_muxi21optax8 U6294 ( .D0(n7137), .D1(n7153), .S(n7197), .Z(
        n2689) );
  dti_28hc_7t_30_nor2px2 U6297 ( .A(n6714), .B(n6717), .Z(n7683) );
  dti_28hc_7t_30_nor2px2 U6298 ( .A(n6714), .B(n6709), .Z(n7700) );
  dti_28hc_7t_30_nor2px2 U6301 ( .A(n6714), .B(n6682), .Z(n7758) );
  dti_28hc_7t_30_nor2px2 U6308 ( .A(n6714), .B(n7576), .Z(n7642) );
  dti_28hc_7t_30_invx1 U6310 ( .A(\eda_img_ram/img_memory[1][3][6] ), .Z(n6277) );
  dti_28hc_7t_30_oai22rexp5 U6312 ( .A1(n5584), .A2(n5582), .B1(n5561), .B2(
        n5552), .Z(n5554) );
  dti_28hc_7t_30_aoi22rexp5 U6327 ( .A1(n5577), .A2(n5562), .B1(n5605), .B2(
        n5561), .Z(n5620) );
  dti_28hc_7t_30_aoi22rexp5 U6333 ( .A1(n5587), .A2(n5549), .B1(n5552), .B2(
        n5561), .Z(n5550) );
  dti_28hc_7t_30_xnor2optax4 U6334 ( .A(n3613), .B(n5694), .Z(n3691) );
  dti_28hc_7t_30_nand2px2 U6342 ( .A(n3691), .B(n6133), .Z(n7646) );
  dti_28hc_7t_30_nand2mhzx10 U6351 ( .A(n3448), .B(n5226), .Z(n3188) );
  dti_28hc_7t_30_nand2i1xp5 U6362 ( .A(n5615), .B(n5614), .Z(n5559) );
  dti_28hc_7t_30_aoi12rexp5 U6364 ( .B1(n6635), .B2(n5615), .A(n5614), .Z(
        n5634) );
  dti_28hc_7t_30_aoi22x2 U6370 ( .A1(n5560), .A2(n5559), .B1(n5558), .B2(n5615), .Z(n5605) );
  dti_28hc_7t_30_nand2x1 U6410 ( .A(n4720), .B(n3319), .Z(n4641) );
  dti_28hc_7t_30_nand4px1 U6412 ( .A(n3978), .B(n3979), .C(n3977), .D(n3976), 
        .Z(n4720) );
  dti_28hc_7t_30_nand2xp5 U6425 ( .A(n4408), .B(
        \eda_img_ram/img_memory[0][0][4] ), .Z(n4525) );
  dti_28hc_7t_30_aoi12rexp5 U6427 ( .B1(n6848), .B2(n6850), .A(n6833), .Z(
        n2717) );
  dti_28hc_7t_30_nand2hpoptax6 U6433 ( .A(n6840), .B(n6206), .Z(n6850) );
  dti_28hc_7t_30_nand2hpoptax6 U6445 ( .A(n6228), .B(n7430), .Z(n7292) );
  dti_28hc_7t_30_invxp6 U6455 ( .A(n6054), .Z(n6055) );
  dti_28hc_7t_30_nor2i1x2 U6456 ( .A(n6616), .B(n3640), .Z(n3684) );
  dti_28hc_7t_30_aoi13rexp8 U6459 ( .B1(n5699), .B2(n5698), .B3(n5697), .A(
        n6131), .Z(n5743) );
  dti_28hc_7t_30_nor2x1 U6462 ( .A(n5434), .B(n7074), .Z(n5188) );
  dti_28hc_7t_30_oai112rex6 U6463 ( .C1(n6603), .C2(n7827), .A(n6602), .B(
        n7693), .Z(n7184) );
  dti_28hc_7t_30_muxi21x2 U6465 ( .D0(n7028), .D1(n7027), .S(n7223), .Z(n2776)
         );
  dti_28hc_7t_30_invx2 U6469 ( .A(n6190), .Z(n3771) );
  dti_28hc_7t_30_nand2px2 U6472 ( .A(n6205), .B(n6190), .Z(n5036) );
  dti_28hc_7t_30_xnor2optax4 U6478 ( .A(n5587), .B(n5871), .Z(n6190) );
  dti_28hc_7t_30_muxi21x1 U6481 ( .D0(n7196), .D1(n3775), .S(n7195), .Z(n2714)
         );
  dti_28hc_7t_30_nor2px4 U6483 ( .A(n6647), .B(n6646), .Z(n7696) );
  dti_28hc_7t_30_muxi21x2 U6485 ( .D0(n3565), .D1(n6988), .S(n7193), .Z(n2682)
         );
  dti_28hc_7t_30_oai112rex2 U6489 ( .C1(n7133), .C2(n6701), .A(n6666), .B(
        n6665), .Z(n2866) );
  dti_28hc_7t_30_nand2px2 U6492 ( .A(n3511), .B(n3668), .Z(n7807) );
  dti_28hc_7t_30_nand2px2 U6495 ( .A(n7372), .B(n3511), .Z(n7775) );
  dti_28hc_7t_30_nand2hpx4 U6535 ( .A(n6861), .B(n6857), .Z(n7215) );
  dti_28hc_7t_30_nand2hpx4 U6537 ( .A(n6861), .B(n6860), .Z(n7217) );
  dti_28hc_7t_30_aoi22x1 U6599 ( .A1(n4541), .A2(
        \eda_img_ram/img_memory[4][5][3] ), .B1(n5150), .B2(
        \eda_img_ram/img_memory[4][1][3] ), .Z(n4488) );
  dti_28hc_7t_30_nand2i1x2 U6613 ( .A(n6129), .B(n3691), .Z(n3690) );
  dti_28hc_7t_30_bufmhzx6 U6621 ( .A(n6630), .Z(n7827) );
  dti_28hc_7t_30_aoi22hpx1 U6625 ( .A1(n6698), .A2(n7183), .B1(
        \eda_iterated_ram/current_row[1][3] ), .B2(n7182), .Z(n6637) );
  dti_28hc_7t_30_aoi22hpx1 U6631 ( .A1(n6698), .A2(n6707), .B1(
        \eda_iterated_ram/current_row[1][0] ), .B2(n7182), .Z(n6700) );
  dti_28hc_7t_30_aoi22hpx1 U6632 ( .A1(n6698), .A2(n7128), .B1(
        \eda_iterated_ram/current_row[1][5] ), .B2(n7182), .Z(n6666) );
  dti_28hc_7t_30_nand2xp5 U6636 ( .A(n6228), .B(n6227), .Z(n3189) );
  dti_28hc_7t_30_nor2i1plm2x2 U6638 ( .A(n6816), .B(n4958), .Z(n4959) );
  dti_28hc_7t_30_nand4px1 U6640 ( .A(n4595), .B(n4594), .C(n4596), .D(n4593), 
        .Z(n5049) );
  dti_28hc_7t_30_nand2xp5 U6644 ( .A(n4408), .B(
        \eda_img_ram/img_memory[4][0][7] ), .Z(n4593) );
  dti_28hc_7t_30_nand2x1 U6651 ( .A(n3586), .B(n7075), .Z(n6683) );
  dti_28hc_7t_30_nand2mhzx6 U6653 ( .A(n3620), .B(up_addr[2]), .Z(n3626) );
  dti_28hc_7t_30_nand4px2 U6660 ( .A(n4849), .B(n4850), .C(n4848), .D(n4847), 
        .Z(n5754) );
  dti_28hc_7t_30_xor2bx2 U6665 ( .A(n5654), .B(n5871), .Z(n6106) );
  dti_28hc_7t_30_nand2xp8 U6667 ( .A(n6086), .B(
        \eda_img_ram/img_memory[4][4][6] ), .Z(n4494) );
  dti_28hc_7t_30_nand4poptax8 U6672 ( .A(n4218), .B(n4217), .C(n4215), .D(
        n4216), .Z(n4709) );
  dti_28hc_7t_30_aoi22xp5 U6674 ( .A1(n5588), .A2(n5543), .B1(n5600), .B2(
        n5598), .Z(n5544) );
  dti_28hc_7t_30_invxp5 U6675 ( .A(n5588), .Z(n5549) );
  dti_28hc_7t_30_invx2 U6680 ( .A(n5163), .Z(
        \eda_iterated_ram/current_row[5][2] ) );
  dti_28hc_7t_30_aoi22x3 U6689 ( .A1(n6174), .A2(
        \eda_img_ram/img_memory[2][5][2] ), .B1(n4592), .B2(
        \eda_img_ram/img_memory[2][0][2] ), .Z(n4017) );
  dti_28hc_7t_30_aoi22hpx1 U6691 ( .A1(n4602), .A2(
        \eda_img_ram/img_memory[2][1][6] ), .B1(n6080), .B2(
        \eda_img_ram/img_memory[2][4][6] ), .Z(n7550) );
  dti_28hc_7t_30_invxp5 U6694 ( .A(n4951), .Z(n4954) );
  dti_28hc_7t_30_invx1 U6695 ( .A(\eda_img_ram/img_memory[3][4][6] ), .Z(n6272) );
  dti_28hc_7t_30_nand4px2 U6696 ( .A(n3987), .B(n3989), .C(n3988), .D(n3990), 
        .Z(n5060) );
  dti_28hc_7t_30_aoi22x3 U6698 ( .A1(n3545), .A2(n3320), .B1(n5103), .B2(n3317), .Z(n5112) );
  dti_28hc_7t_30_invx1 U6699 ( .A(\eda_img_ram/img_memory[4][3][4] ), .Z(n6417) );
  dti_28hc_7t_30_bufmhzx6 U6710 ( .A(up_addr[0]), .Z(n7816) );
  dti_28hc_7t_30_nand4px1 U6720 ( .A(n3996), .B(n3995), .C(n3997), .D(n3994), 
        .Z(n3615) );
  dti_28hc_7t_30_nand2xp8 U6723 ( .A(n5429), .B(n5119), .Z(n5120) );
  dti_28hc_7t_30_nand2x1 U6735 ( .A(n3605), .B(
        \eda_img_ram/img_memory[0][1][7] ), .Z(n3973) );
  dti_28hc_7t_30_iao22xp8 U6738 ( .A1(n3605), .A2(
        \eda_img_ram/img_memory[2][3][4] ), .B1(n6438), .B2(n6124), .Z(n4544)
         );
  dti_28hc_7t_30_nand4px2 U6739 ( .A(n4854), .B(n4853), .C(n4852), .D(n4851), 
        .Z(n5654) );
  dti_28hc_7t_30_nand3hpx2 U6767 ( .A(n4025), .B(n4023), .C(n7675), .Z(n5119)
         );
  dti_28hc_7t_30_nand2i1xp5 U6779 ( .A(n5754), .B(n5660), .Z(n5643) );
  dti_28hc_7t_30_aoi22xp5 U6783 ( .A1(n5662), .A2(n5661), .B1(n5756), .B2(
        n5754), .Z(n5667) );
  dti_28hc_7t_30_nand2px2 U6784 ( .A(n3674), .B(n3500), .Z(n7804) );
  dti_28hc_7t_30_invxp5 U6804 ( .A(n5867), .Z(n5846) );
  dti_28hc_7t_30_aoi22xp5 U6818 ( .A1(n5868), .A2(n5869), .B1(n5866), .B2(
        n5867), .Z(n5870) );
  dti_28hc_7t_30_bufmhzx32 U6823 ( .A(n3920), .Z(n6080) );
  dti_28hc_7t_30_nand3x2 U6843 ( .A(n7078), .B(n7597), .C(n7595), .Z(n2869) );
  dti_28hc_7t_30_nand2px2 U6844 ( .A(n7372), .B(n7434), .Z(n7373) );
  dti_28hc_7t_30_bufmhzx6 U6848 ( .A(up_addr[2]), .Z(n3802) );
  dti_28hc_7t_30_nand2x4 U6859 ( .A(up_addr[1]), .B(up_addr[2]), .Z(n4368) );
  dti_28hc_7t_30_nand4poptax8 U6867 ( .A(n6100), .B(n6099), .C(n6097), .D(
        n3416), .Z(n4957) );
  dti_28hc_7t_30_and2x1 U6891 ( .A(n6100), .B(n6099), .Z(n6101) );
  dti_28hc_7t_30_xnor2optax4 U6900 ( .A(n3531), .B(n3530), .Z(n6776) );
  dti_28hc_7t_30_aoi22x1 U6904 ( .A1(n3602), .A2(
        \eda_img_ram/img_memory[4][3][5] ), .B1(
        \eda_img_ram/img_memory[4][0][5] ), .B2(n4408), .Z(n4553) );
  dti_28hc_7t_30_nand3hpx1 U6921 ( .A(n3585), .B(n4427), .C(n4428), .Z(n3584)
         );
  dti_28hc_7t_30_bufx1 U6928 ( .A(\eda_iterated_ram/current_row[0][2] ), .Z(
        n7636) );
  dti_28hc_7t_30_invx3 U6929 ( .A(n7378), .Z(n7666) );
  dti_28hc_7t_30_invshzx8 U6931 ( .A(n3561), .Z(n7665) );
  dti_28hc_7t_30_invx1 U6934 ( .A(n6829), .Z(n7556) );
  dti_28hc_7t_30_nand2x1 U6939 ( .A(n5008), .B(n3317), .Z(n7557) );
  dti_28hc_7t_30_nand2x1 U6941 ( .A(n5007), .B(n3320), .Z(n7558) );
  dti_28hc_7t_30_muxi21x1 U6943 ( .D0(n7153), .D1(n7138), .S(n7199), .Z(n2695)
         );
  dti_28hc_7t_30_invx3 U6945 ( .A(n7732), .Z(n7161) );
  dti_28hc_7t_30_nand3x2 U6947 ( .A(n3466), .B(n3676), .C(n6923), .Z(n3465) );
  dti_28hc_7t_30_nor2i1x2 U6948 ( .A(n4862), .B(n3360), .Z(n3466) );
  dti_28hc_7t_30_aoi22x3 U6950 ( .A1(n5050), .A2(n3319), .B1(n5049), .B2(n4836), .Z(n4610) );
  dti_28hc_7t_30_and2hpx2 U6952 ( .A(n5124), .B(n4836), .Z(n7561) );
  dti_28hc_7t_30_nand2x1 U6954 ( .A(n7076), .B(n7075), .Z(n7597) );
  dti_28hc_7t_30_nor3px1 U6957 ( .A(n5314), .B(n7784), .C(n7782), .Z(n5317) );
  dti_28hc_7t_30_nor2x2 U6962 ( .A(n6599), .B(n6641), .Z(n6113) );
  dti_28hc_7t_30_nor2px6 U6965 ( .A(n3372), .B(n7755), .Z(n6714) );
  dti_28hc_7t_30_nand2x1 U6969 ( .A(n3793), .B(n5612), .Z(n7568) );
  dti_28hc_7t_30_nand2i1x2 U6971 ( .A(n4665), .B(n4938), .Z(n7569) );
  dti_28hc_7t_30_muxi21x1 U6973 ( .D0(n7455), .D1(n7570), .S(n6921), .Z(n6241)
         );
  dti_28hc_7t_30_invx1 U6977 ( .A(n6239), .Z(n7570) );
  dti_28hc_7t_30_invx2 U6979 ( .A(n3992), .Z(n7573) );
  dti_28hc_7t_30_xor2bx2 U6980 ( .A(n5547), .B(n5134), .Z(n5135) );
  dti_28hc_7t_30_nand2px2 U6981 ( .A(n4964), .B(n3384), .Z(n4355) );
  dti_28hc_7t_30_nor2hpoptax6 U6983 ( .A(n7768), .B(n3550), .Z(n6784) );
  dti_28hc_7t_30_and2x1 U7015 ( .A(n4808), .B(n4809), .Z(n7680) );
  dti_28hc_7t_30_xor2bx2 U7049 ( .A(\eda_fifos/sync_fifo_left/wr_addr [3]), 
        .B(\eda_fifos/sync_fifo_left/rd_addr [3]), .Z(n4676) );
  dti_28hc_7t_30_xor2bx2 U7058 ( .A(n5772), .B(n5604), .Z(n6176) );
  dti_28hc_7t_30_nand2x1 U7075 ( .A(n6694), .B(n7183), .Z(n7578) );
  dti_28hc_7t_30_nand2x1 U7084 ( .A(n7182), .B(
        \eda_iterated_ram/current_row[3][3] ), .Z(n7581) );
  dti_28hc_7t_30_nand3x2 U7086 ( .A(n3269), .B(n3490), .C(n3489), .Z(n2865) );
  dti_28hc_7t_30_nor2shzx20 U7087 ( .A(n3929), .B(n3829), .Z(n4591) );
  dti_28hc_7t_30_nand4px2 U7088 ( .A(n3520), .B(n3521), .C(n3519), .D(n3518), 
        .Z(n4842) );
  dti_28hc_7t_30_nor2i1plm2x2 U7098 ( .A(n4812), .B(n7625), .Z(n7681) );
  dti_28hc_7t_30_or2hpx2 U7099 ( .A(n7603), .B(n7554), .Z(n7584) );
  dti_28hc_7t_30_nand3hpx1 U7100 ( .A(n7680), .B(n4810), .C(n4811), .Z(n5641)
         );
  dti_28hc_7t_30_and2hpx2 U7101 ( .A(n3515), .B(n3703), .Z(n7585) );
  dti_28hc_7t_30_aoi22hpx2 U7103 ( .A1(n5081), .A2(n3320), .B1(n5080), .B2(
        n3321), .Z(n5088) );
  dti_28hc_7t_30_nand2x1 U7104 ( .A(n7076), .B(n7183), .Z(n7587) );
  dti_28hc_7t_30_invx1 U7105 ( .A(\eda_iterated_ram/current_row[4][4] ), .Z(
        n7588) );
  dti_28hc_7t_30_nand3x2 U7108 ( .A(n6621), .B(n6622), .C(n7662), .Z(n2878) );
  dti_28hc_7t_30_nor2hpx1 U7109 ( .A(n6697), .B(n6717), .Z(n7591) );
  dti_28hc_7t_30_nand3x2 U7120 ( .A(n4076), .B(n7777), .C(n4074), .Z(n5157) );
  dti_28hc_7t_30_oai12relm2x12 U7129 ( .B1(n7804), .B2(n3704), .A(n3539), .Z(
        n7434) );
  dti_28hc_7t_30_xor2bx2 U7137 ( .A(n5673), .B(n3527), .Z(n4794) );
  dti_28hc_7t_30_nand2x3 U7139 ( .A(n3790), .B(n7602), .Z(n3372) );
  dti_28hc_7t_30_invx2 U7140 ( .A(n7704), .Z(n7703) );
  dti_28hc_7t_30_bufx1p5 U7144 ( .A(\eda_iterated_ram/current_row[4][0] ), .Z(
        n7606) );
  dti_28hc_7t_30_invx1 U7159 ( .A(n5464), .Z(n3190) );
  dti_28hc_7t_30_or2hpx2 U7160 ( .A(n6066), .B(n6065), .Z(n7759) );
  dti_28hc_7t_30_invx6 U7161 ( .A(n4750), .Z(n5891) );
  dti_28hc_7t_30_invx2 U7165 ( .A(n7661), .Z(n7608) );
  dti_28hc_7t_30_nand3x2 U7166 ( .A(n6687), .B(n7610), .C(n6688), .Z(n2875) );
  dti_28hc_7t_30_invx1 U7170 ( .A(n7576), .Z(n7611) );
  dti_28hc_7t_30_bufmhzx6 U7187 ( .A(n4591), .Z(n7613) );
  dti_28hc_7t_30_xnor2optax4 U7188 ( .A(n5134), .B(n5858), .Z(n4966) );
  dti_28hc_7t_30_aoi22x1 U7189 ( .A1(n5052), .A2(n3320), .B1(n5053), .B2(n6597), .Z(n4611) );
  dti_28hc_7t_30_nand3x2 U7194 ( .A(n7829), .B(n5068), .C(n7616), .Z(n5615) );
  dti_28hc_7t_30_and2hpx2 U7195 ( .A(n5066), .B(n7828), .Z(n7616) );
  dti_28hc_7t_30_invx1 U7200 ( .A(\eda_iterated_ram/have_done ), .Z(n7618) );
  dti_28hc_7t_30_invx1 U7207 ( .A(n7576), .Z(n7619) );
  dti_28hc_7t_30_invx1 U7208 ( .A(n7576), .Z(n7623) );
  dti_28hc_7t_30_invx2 U7209 ( .A(n4822), .Z(n7626) );
  dti_28hc_7t_30_nand3x2 U7210 ( .A(n7702), .B(n7703), .C(n6712), .Z(n2882) );
  dti_28hc_7t_30_nor3pmhzoptax6 U7213 ( .A(n3806), .B(n3805), .C(n3807), .Z(
        n3733) );
  dti_28hc_7t_30_xnor2optax4 U7217 ( .A(n5604), .B(n5847), .Z(n4965) );
  dti_28hc_7t_30_invx4 U7218 ( .A(n6064), .Z(n7633) );
  dti_28hc_7t_30_nand2mhzx8 U7219 ( .A(n3619), .B(up_addr[1]), .Z(n3895) );
  dti_28hc_7t_30_xnor2optax4 U7221 ( .A(n3613), .B(n5843), .Z(n4962) );
  dti_28hc_7t_30_invx2 U7223 ( .A(n6643), .Z(n7788) );
  dti_28hc_7t_30_oai22lm2x6 U7224 ( .A1(n5679), .A2(n7633), .B1(n5597), .B2(
        n5866), .Z(n3823) );
  dti_28hc_7t_30_aoi22x3 U7225 ( .A1(n5097), .A2(n6633), .B1(n5092), .B2(n6604), .Z(n4162) );
  dti_28hc_7t_30_and2hpx2 U7226 ( .A(n4159), .B(n4160), .Z(n7635) );
  dti_28hc_7t_30_invx2 U7227 ( .A(n7642), .Z(n7641) );
  dti_28hc_7t_30_bufx1p5 U7228 ( .A(\eda_iterated_ram/current_row[1][4] ), .Z(
        n7648) );
  dti_28hc_7t_30_invx3 U7231 ( .A(n7649), .Z(n3304) );
  dti_28hc_7t_30_nor2px4 U7232 ( .A(n6972), .B(n3551), .Z(n6979) );
  dti_28hc_7t_30_nand2px2 U7233 ( .A(n6076), .B(n6071), .Z(n3291) );
  dti_28hc_7t_30_ioa12hpx2 U7234 ( .B1(n3614), .B2(n5573), .A(n7654), .Z(n4660) );
  dti_28hc_7t_30_nand2x1 U7235 ( .A(n5591), .B(n7472), .Z(n7654) );
  dti_28hc_7t_30_nand2x6 U7236 ( .A(n5159), .B(n5472), .Z(n5437) );
  dti_28hc_7t_30_invx1 U7243 ( .A(n7648), .Z(n7656) );
  dti_28hc_7t_30_invx1 U7244 ( .A(\eda_img_ram/img_memory[2][0][5] ), .Z(n7657) );
  dti_28hc_7t_30_invx6 U7245 ( .A(n6611), .Z(n3313) );
  dti_28hc_7t_30_and2hpx2 U7246 ( .A(n4325), .B(n7659), .Z(n7658) );
  dti_28hc_7t_30_nand2x1 U7247 ( .A(n4730), .B(n3317), .Z(n7659) );
  dti_28hc_7t_30_nand2x1 U7248 ( .A(n4732), .B(n3320), .Z(n7661) );
  dti_28hc_7t_30_xnor2optax4 U7251 ( .A(n6064), .B(n5595), .Z(n6071) );
  dti_28hc_7t_30_and2x1 U7252 ( .A(n6814), .B(n4932), .Z(n6832) );
  dti_28hc_7t_30_nand3x2 U7255 ( .A(n4193), .B(n3379), .C(n4192), .Z(n5105) );
  dti_28hc_7t_30_and2hpx2 U7256 ( .A(n4695), .B(n7776), .Z(n7673) );
  dti_28hc_7t_30_nor2shzx8 U7257 ( .A(n3626), .B(n7274), .Z(n3901) );
  dti_28hc_7t_30_nand2px4 U7258 ( .A(n6067), .B(n6068), .Z(n6611) );
  dti_28hc_7t_30_xnor2bx1 U7259 ( .A(n5641), .B(n4750), .Z(n4812) );
  dti_28hc_7t_30_nand3x2 U7265 ( .A(n6087), .B(n6088), .C(n7682), .Z(n2883) );
  dti_28hc_7t_30_nor2x1 U7266 ( .A(n6645), .B(n6114), .Z(n7689) );
  dti_28hc_7t_30_invx1 U7267 ( .A(n7606), .Z(n7691) );
  dti_28hc_7t_30_and2x1 U7268 ( .A(n3972), .B(n3973), .Z(n7692) );
  dti_28hc_7t_30_nand4px2 U7269 ( .A(n4149), .B(n3795), .C(n4147), .D(n4148), 
        .Z(n5094) );
  dti_28hc_7t_30_aoi22hpx1 U7270 ( .A1(n5092), .A2(n3309), .B1(n5093), .B2(
        n6657), .Z(n4827) );
  dti_28hc_7t_30_or2hpx2 U7271 ( .A(n6972), .B(n6973), .Z(n7256) );
  dti_28hc_7t_30_nand3x2 U7272 ( .A(n7701), .B(n6125), .C(n7699), .Z(n2879) );
  dti_28hc_7t_30_nand2x1 U7273 ( .A(n7182), .B(
        \eda_iterated_ram/current_row[4][3] ), .Z(n7705) );
  dti_28hc_7t_30_and2x1 U7277 ( .A(n4782), .B(n4781), .Z(n7711) );
  dti_28hc_7t_30_nand2x2 U7278 ( .A(n5139), .B(n6633), .Z(n7707) );
  dti_28hc_7t_30_invx4 U7279 ( .A(n7292), .Z(n7710) );
  dti_28hc_7t_30_invx2 U7280 ( .A(n3845), .Z(n7712) );
  dti_28hc_7t_30_nand3x2 U7281 ( .A(n7711), .B(n4784), .C(n4783), .Z(n5653) );
  dti_28hc_7t_30_invx1 U7282 ( .A(n6556), .Z(n7714) );
  dti_28hc_7t_30_invx1 U7283 ( .A(n7715), .Z(\matrix_output[5][3] ) );
  dti_28hc_7t_30_invx1 U7284 ( .A(n7716), .Z(\matrix_output[2][1] ) );
  dti_28hc_7t_30_invx1 U7285 ( .A(n7441), .Z(
        \eda_fifos/sync_fifo_up/sync_fifo_mem_inst/fifo_mem[5][4] ) );
  dti_28hc_7t_30_invxp5 U7286 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[2][1] ), .Z(
        n7125) );
  dti_28hc_7t_30_invxp5 U7287 ( .A(
        \eda_fifos/sync_fifo_left/sync_fifo_mem_inst/fifo_mem[4][2] ), .Z(
        n5513) );
  dti_28hc_7t_30_invxp5 U7302 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][5] ), .Z(
        n7144) );
  dti_28hc_7t_30_invxp5 U7304 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][1] ), .Z(
        n7114) );
  dti_28hc_7t_30_invxp5 U7305 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[0][4] ), .Z(
        n6983) );
  dti_28hc_7t_30_invxp5 U7324 ( .A(
        \eda_fifos/sync_fifo_upleft/sync_fifo_mem_inst/fifo_mem[4][4] ), .Z(
        n6986) );
  dti_28hc_7t_30_invxp5 U7325 ( .A(n6543), .Z(n7718) );
  dti_28hc_7t_30_invxp5 U7326 ( .A(n6541), .Z(n7719) );
  dti_28hc_7t_30_invxp5 U7327 ( .A(n6531), .Z(n7720) );
  dti_28hc_7t_30_invxp5 U7328 ( .A(n7444), .Z(\strb_value[0][0] ) );
  dti_28hc_7t_30_invx1 U7329 ( .A(n7721), .Z(
        \eda_fifos/sync_fifo_left/wr_addr [0]) );
  dti_28hc_7t_30_invxp5 U7330 ( .A(n6533), .Z(n7722) );
  dti_28hc_7t_30_invxp5 U7331 ( .A(n6535), .Z(n7723) );
  dti_28hc_7t_30_invxp5 U7332 ( .A(n6529), .Z(n7724) );
  dti_28hc_7t_30_invxp5 U7333 ( .A(n6500), .Z(n7725) );
  dti_28hc_7t_30_invx1 U7334 ( .A(\eda_img_ram/img_memory[0][1][7] ), .Z(n7728) );
  dti_28hc_7t_30_invx1 U7335 ( .A(n7133), .Z(n7729) );
  dti_28hc_7t_30_nand3hpx1 U7338 ( .A(n7787), .B(n4177), .C(n4178), .Z(n4745)
         );
  dti_28hc_7t_30_and2hpx2 U7339 ( .A(n4346), .B(n4345), .Z(n7730) );
  dti_28hc_7t_30_nand3x2 U7340 ( .A(n4840), .B(n4839), .C(n7731), .Z(n5765) );
  dti_28hc_7t_30_nor2px2 U7341 ( .A(n6881), .B(
        \eda_fifos/sync_fifo_downleft/wr_addr [1]), .Z(n7732) );
  dti_28hc_7t_30_aoi22hpx1 U7342 ( .A1(n5081), .A2(n4856), .B1(n5083), .B2(
        n3319), .Z(n4854) );
  dti_28hc_7t_30_invx1 U7343 ( .A(\eda_fifos/sync_fifo_down/o_full ), .Z(n7737) );
  dti_28hc_7t_30_nand4px1 U7346 ( .A(n6653), .B(n7672), .C(n5140), .D(n6632), 
        .Z(n6121) );
  dti_28hc_7t_30_nand3x2 U7347 ( .A(n6144), .B(n3244), .C(n3242), .Z(n2889) );
  dti_28hc_7t_30_and2x1 U7350 ( .A(n3965), .B(n3964), .Z(n7738) );
  dti_28hc_7t_30_nor3pmhzoptax8 U7351 ( .A(n5037), .B(n5036), .C(n5038), .Z(
        n6653) );
  dti_28hc_7t_30_xnor2bx1 U7352 ( .A(n6063), .B(n6064), .Z(n6641) );
  dti_28hc_7t_30_invx1 U7353 ( .A(n7754), .Z(n7753) );
  dti_28hc_7t_30_nand3x2 U7356 ( .A(n6680), .B(n6681), .C(n7757), .Z(n2880) );
  dti_28hc_7t_30_nor2px4 U7357 ( .A(n6877), .B(n7743), .Z(n6871) );
  dti_28hc_7t_30_nor2px4 U7362 ( .A(n6877), .B(n7744), .Z(n7228) );
  dti_28hc_7t_30_nand2x1 U7363 ( .A(n6806), .B(n7457), .Z(n5386) );
  dti_28hc_7t_30_nand3hpx2 U7364 ( .A(n7766), .B(n4001), .C(n4002), .Z(n5064)
         );
  dti_28hc_7t_30_xor2bx2 U7365 ( .A(n6795), .B(n7749), .Z(n2715) );
  dti_28hc_7t_30_invx1 U7368 ( .A(\eda_fifos/sync_fifo_upright/wr_addr [3]), 
        .Z(n7749) );
  dti_28hc_7t_30_aoi22x1 U7369 ( .A1(n4692), .A2(n6597), .B1(n4690), .B2(n6616), .Z(n4135) );
  dti_28hc_7t_30_and2hpx2 U7374 ( .A(n4890), .B(n4889), .Z(n6727) );
  dti_28hc_7t_30_xor2bx2 U7375 ( .A(n3527), .B(n5898), .Z(n3384) );
  dti_28hc_7t_30_and2x1 U7376 ( .A(n4872), .B(n5493), .Z(n7752) );
  dti_28hc_7t_30_nor2x3 U7377 ( .A(n6610), .B(n7759), .Z(n4968) );
  dti_28hc_7t_30_aoi22hplm2x4 U7380 ( .A1(n5105), .A2(n5589), .B1(n5103), .B2(
        n6633), .Z(n4218) );
  dti_28hc_7t_30_nor3pmhzoptax6 U7381 ( .A(n6942), .B(n6941), .C(n3886), .Z(
        n6951) );
  dti_28hc_7t_30_or2x1 U7388 ( .A(n6645), .B(n7796), .Z(n7764) );
  dti_28hc_7t_30_nand2px2 U7392 ( .A(n6186), .B(n7769), .Z(n7768) );
  dti_28hc_7t_30_muxi21x1 U7393 ( .D0(n7127), .D1(n7123), .S(n7256), .Z(n2729)
         );
  dti_28hc_7t_30_nand2x1 U7396 ( .A(n4745), .B(n5589), .Z(n4647) );
  dti_28hc_7t_30_muxi21x1 U7397 ( .D0(n3804), .D1(n7036), .S(n3564), .Z(n2755)
         );
  dti_28hc_7t_30_nand3x2 U7398 ( .A(n7773), .B(n4827), .C(n4826), .Z(n5645) );
  dti_28hc_7t_30_nor3i1px2 U7401 ( .A(n6642), .B(n6643), .C(n7779), .Z(n3340)
         );
  dti_28hc_7t_30_or2x1 U7406 ( .A(n6645), .B(n6626), .Z(n7779) );
  dti_28hc_7t_30_and2hpx2 U7420 ( .A(n6814), .B(n4861), .Z(n3665) );
  dti_28hc_7t_30_nand2x4 U7422 ( .A(n4823), .B(n6122), .Z(n6097) );
  dti_28hc_7t_30_and3x1 U7423 ( .A(n5308), .B(n5310), .C(n5309), .Z(n7783) );
  dti_28hc_7t_30_and2x1 U7426 ( .A(n4175), .B(n4176), .Z(n7787) );
  dti_28hc_7t_30_or2x1 U7427 ( .A(n5170), .B(n5171), .Z(n7794) );
  dti_28hc_7t_30_xnor2optax4 U7428 ( .A(n4885), .B(n4886), .Z(n6771) );
  dti_28hc_7t_30_xnor2optax4 U7432 ( .A(\eda_fifos/sync_fifo_right/rd_addr [2]), .B(\eda_fifos/sync_fifo_right/wr_addr [2]), .Z(n4885) );
  dti_28hc_7t_30_invx1 U7433 ( .A(n5589), .Z(n7796) );
  dti_28hc_7t_30_xor2bx2 U7434 ( .A(n5751), .B(n4709), .Z(n6175) );
  dti_28hc_7t_30_aoi22hplm2x4 U7435 ( .A1(n5083), .A2(n3320), .B1(n5082), .B2(
        n6604), .Z(n3954) );
  dti_28hc_7t_30_nor2px2 U7436 ( .A(n6853), .B(n7615), .Z(n7800) );
  dti_28hc_7t_30_nor2x1 U7437 ( .A(n3314), .B(n7181), .Z(n3482) );
  dti_28hc_7t_30_invx1 U7438 ( .A(n7181), .Z(n7811) );
  dti_28hc_7t_30_invx1 U7439 ( .A(n3565), .Z(n7812) );
  dti_28hc_7t_30_and2hpx2 U7440 ( .A(n4279), .B(n4278), .Z(n7814) );
  dti_28hc_7t_30_invx3 U7441 ( .A(n6081), .Z(n7821) );
  dti_28hc_7t_30_aoi12rex2 U7444 ( .B1(n5277), .B2(n7820), .A(n7822), .Z(n5236) );
  dti_28hc_7t_30_invx1 U7445 ( .A(n5279), .Z(n7822) );
  dti_28hc_7t_30_nand3x2 U7452 ( .A(n6624), .B(n6623), .C(n3292), .Z(n2888) );
  dti_28hc_7t_30_muxi21x1 U7453 ( .D0(n7021), .D1(n7009), .S(n3526), .Z(n2557)
         );
  dti_28hc_7t_30_nand2x1 U7460 ( .A(n4663), .B(n5148), .Z(n4376) );
  dti_28hc_7t_30_nand3hpx1 U7461 ( .A(n7824), .B(n4372), .C(n4370), .Z(n4663)
         );
  dti_28hc_7t_30_and2x1 U7468 ( .A(n4371), .B(n4369), .Z(n7824) );
  dti_28hc_7t_30_invx2 U7480 ( .A(n6181), .Z(n7826) );
  dti_28hc_7t_30_invx1 U7481 ( .A(n3284), .Z(n5505) );
  dti_28hc_7t_30_nand2x2 U7482 ( .A(n5061), .B(n5140), .Z(n7828) );
  dti_28hc_7t_30_nand2x1 U7483 ( .A(n3617), .B(n3317), .Z(n7830) );
  dti_28hc_7t_30_nand4plm2x2 U7486 ( .A(n4834), .B(n4835), .C(n4832), .D(n4833), .Z(n5674) );
  dti_28hc_7t_30_xnor2optax4 U7487 ( .A(n7833), .B(n4676), .Z(n6814) );
endmodule

