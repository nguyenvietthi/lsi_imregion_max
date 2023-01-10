//-----------------------------------------------------------------------------------------------------------
//    Copyright (C) 2022 by Dolphin Technology
//    All right reserved.
//
//    Copyright Notification
//    No part may be reproduced except as authorized by written permission.
//
//    Module: eda_regional_max_lib.eda_regional_max
//    Company: Dolphin Technology
//    Author: anhpq0
//    Date: 14:27:07 01/10/23
//-----------------------------------------------------------------------------------------------------------

`include "eda_global_define.svh"
module eda_regional_max #(
  // synopsys template
  parameter M            = `CFG_M,
  parameter N            = `CFG_N,
  parameter ADDR_WIDTH   = `CFG_ADDR_WIDTH,
  parameter WINDOW_WIDTH = `CFG_WINDOW_WIDTH,
  parameter PIXEL_WIDTH  = `CFG_PIXEL_WIDTH,
  parameter I_WIDTH      = `CFG_I_WIDTH,
  parameter J_WIDTH      = `CFG_J_WIDTH
)
( 
  // Port Declarations
  input   wire                        clk, 
  input   wire    [PIXEL_WIDTH- 1:0]  pixel_in, 
  input   wire    [ADDR_WIDTH - 1:0]  rd_addr, 
  input   wire                        reset_n, 
  input   wire                        start, 
  input   wire    [ADDR_WIDTH - 1:0]  wr_addr, 
  input   wire                        write_en, 
  output  wire                        done, 
  output  wire                        matrix_output
);


// Internal Declarations


// Local declarations

// Internal signal declarations
wire  [ADDR_WIDTH - 1:0]                 center_addr;
wire                                     clear;
wire                                     clear_ram;          // Clear all RAMs
wire                                     clear_strb;         // Clear strobe
wire                                     compare_out;
wire  [ADDR_WIDTH-1:0]                   data_out;           // Data out from FIFO
wire  [ADDR_WIDTH - 1:0]                 down_addr;
wire  [ADDR_WIDTH - 1:0]                 downleft_addr;
wire  [ADDR_WIDTH - 1:0]                 downright_addr;
wire  [WINDOW_WIDTH-2:0]                 fifo_empty;         // FIFO empty
wire                                     iterated_all;
wire  [WINDOW_WIDTH - 2:0]               iterated_idx;
wire  [ADDR_WIDTH - 1:0]                 left_addr;
wire  [WINDOW_WIDTH - 2:0]               neigh_addr_valid;
wire                                     new_pixel;
wire  [J_WIDTH - 1:0]                    next_col;
wire  [I_WIDTH - 1:0]                    next_row;
wire  [WINDOW_WIDTH - 2:0]               push_positions;
wire  [WINDOW_WIDTH - 2:0]               read_en;
wire  [ADDR_WIDTH - 1:0]                 right_addr;
wire  [M - 1:0][N - 1:0]                 strb_value;
wire  [ADDR_WIDTH - 1:0]                 up_addr;
wire                                     update_output;      // Update output
wire  [ADDR_WIDTH - 1:0]                 upleft_addr;
wire  [ADDR_WIDTH - 1:0]                 upright_addr;
wire  [PIXEL_WIDTH * WINDOW_WIDTH - 1:0] window_values;


// Instances 
eda_compare eda_compare( 
  .clk              (clk), 
  .reset_n          (reset_n), 
  .new_pixel        (new_pixel), 
  .window_values    (window_values), 
  .neigh_addr_valid (neigh_addr_valid), 
  .iterated_idx     (iterated_idx), 
  .compare_out      (compare_out), 
  .push_positions   (push_positions)
); 

eda_controller eda_controller( 
  .clk            (clk), 
  .reset_n        (reset_n), 
  .start          (start), 
  .fifo_empty     (fifo_empty), 
  .data_out       (data_out), 
  .new_pixel      (new_pixel), 
  .clear_ram      (clear_ram), 
  .center_addr    (center_addr), 
  .clear_strb     (clear_strb), 
  .done           (done), 
  .update_output  (update_output), 
  .push_positions (push_positions), 
  .next_row       (next_row), 
  .next_col       (next_col), 
  .iterated_all   (iterated_all)
); 

eda_fifos eda_fifos( 
  .clk            (clk), 
  .reset_n        (reset_n), 
  .read_en        (read_en), 
  .push_positions (push_positions), 
  .upleft_addr    (upleft_addr), 
  .up_addr        (up_addr), 
  .upright_addr   (upright_addr), 
  .left_addr      (left_addr), 
  .right_addr     (right_addr), 
  .downleft_addr  (downleft_addr), 
  .down_addr      (down_addr), 
  .downright_addr (downright_addr), 
  .fifo_empty     (fifo_empty), 
  .data_out       (data_out)
); 

eda_img_ram eda_img_ram( 
  .clk              (clk), 
  .reset_n          (reset_n), 
  .write_en         (write_en), 
  .wr_addr          (wr_addr), 
  .pixel_in         (pixel_in), 
  .center_addr      (center_addr), 
  .window_values    (window_values), 
  .neigh_addr_valid (neigh_addr_valid), 
  .upleft_addr      (upleft_addr), 
  .up_addr          (up_addr), 
  .upright_addr     (upright_addr), 
  .left_addr        (left_addr), 
  .right_addr       (right_addr), 
  .downleft_addr    (downleft_addr), 
  .down_addr        (down_addr), 
  .downright_addr   (downright_addr)
); 

eda_iterated_ram eda_iterated_ram( 
  .clk            (clk), 
  .reset_n        (reset_n), 
  .clear          (clear), 
  .new_pixel      (new_pixel), 
  .center_addr    (center_addr), 
  .upleft_addr    (upleft_addr), 
  .up_addr        (up_addr), 
  .upright_addr   (upright_addr), 
  .left_addr      (left_addr), 
  .right_addr     (right_addr), 
  .downleft_addr  (downleft_addr), 
  .down_addr      (down_addr), 
  .downright_addr (downright_addr), 
  .push_positions (push_positions), 
  .iterated_idx   (iterated_idx), 
  .next_row       (next_row), 
  .next_col       (next_col), 
  .iterated_all   (iterated_all)
); 

eda_output_ram eda_output_ram( 
  .clk           (clk), 
  .reset_n       (reset_n), 
  .clear         (clear), 
  .update_output (update_output), 
  .compare_out   (compare_out), 
  .strb_value    (strb_value), 
  .matrix_output (matrix_output)
); 

eda_strobe_ram eda_strobe_ram( 
  .clk              (clk), 
  .reset_n          (reset_n), 
  .clear_strb       (clear_strb), 
  .push_positions   (push_positions), 
  .center_addr      (center_addr), 
  .upleft_addr      (upleft_addr), 
  .up_addr          (up_addr), 
  .upright_addr     (upright_addr), 
  .left_addr        (left_addr), 
  .right_addr       (right_addr), 
  .downleft_addr    (downleft_addr), 
  .down_addr        (down_addr), 
  .downright_addr   (downright_addr), 
  .neigh_addr_valid (neigh_addr_valid), 
  .strb_value       (strb_value)
); 


endmodule // eda_regional_max

