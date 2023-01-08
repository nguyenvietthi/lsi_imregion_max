`include "eda_global_define.vh"

module eda_fifos #(
  parameter M                = `CFG_M                            ,
  parameter N                = `CFG_N                            ,
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH                  ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH                 ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                   ,
  parameter I_WIDTH          = `CFG_I_WIDTH                      ,
  parameter J_WIDTH          = `CFG_J_WIDTH                      
)(
  input                                          clk             ,
  input                                          reset_n         ,
  input       [WINDOW_WIDTH - 2:0]               read_en         ,
  input       [WINDOW_WIDTH - 2:0]               push_positions  ,
  input       [ADDR_WIDTH - 1:0]                 upleft_addr     ,
  input       [ADDR_WIDTH - 1:0]                 up_addr         ,
  input       [ADDR_WIDTH - 1:0]                 upright_addr    ,
  input       [ADDR_WIDTH - 1:0]                 left_addr       ,
  input       [ADDR_WIDTH - 1:0]                 right_addr      ,
  input       [ADDR_WIDTH - 1:0]                 downleft_addr   ,
  input       [ADDR_WIDTH - 1:0]                 down_addr       ,
  input       [ADDR_WIDTH - 1:0]                 downright_addr  ,
  output      [WINDOW_WIDTH - 2:0]               fifo_empty      ,
  output      [ADDR_WIDTH*8 - 1:0]               data_out        
);

//|----------|--------|-----------|
//| upleft/0 |   up/1 | upright/2 |
//|----------|--------|-----------|
//| left/3   | center |   right/4 |
//|----------|--------|-----------|
//|downleft/5| down/6 |downright/7|
//|----------|--------|-----------|
wire                    upleft_read_en;
wire                    up_read_en;
wire                    upright_read_en;
wire                    left_read_en;
wire                    right_read_en;
wire                    downleft_read_en;
wire                    down_read_en;
wire                    downright_read_en;

wire                    upleft_empty;
wire                    up_empty;
wire                    upright_empty;
wire                    left_empty;
wire                    right_empty;
wire                    downleft_empty;
wire                    down_empty;
wire                    downright_empty;

wire                    upleft_push_position;
wire                    up_push_position;
wire                    upright_push_position;
wire                    left_push_position;
wire                    right_push_position;
wire                    downleft_push_position;
wire                    down_push_position;
wire                    downright_push_position;

wire [ADDR_WIDTH - 1:0] upleft_data_out;
wire [ADDR_WIDTH - 1:0] up_data_out;
wire [ADDR_WIDTH - 1:0] upright_data_out;
wire [ADDR_WIDTH - 1:0] left_data_out;
wire [ADDR_WIDTH - 1:0] right_data_out;
wire [ADDR_WIDTH - 1:0] downleft_data_out;
wire [ADDR_WIDTH - 1:0] down_data_out;
wire [ADDR_WIDTH - 1:0] downright_data_out;

assign {upleft_read_en  ,   up_read_en, upright_read_en  ,
        left_read_en    ,               right_read_en    ,
        downleft_read_en, down_read_en, downright_read_en} = read_en;

assign {upleft_push_position  ,   up_push_position, upright_push_position  ,
        left_push_position    ,                     right_push_position    ,
        downleft_push_position, down_push_position, downright_push_position} = push_positions;

assign fifo_empty = {
  upleft_empty  , up_empty  , upright_empty  ,
  left_empty    ,             right_empty    ,
  downleft_empty, down_empty, downright_empty
};

assign data_out = {
  upleft_data_out  , up_data_out  , upright_data_out  ,
  left_data_out    ,                right_data_out    ,
  downleft_data_out, down_data_out, downright_data_out
};


sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_upleft (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (upleft_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (upleft_addr), // Push data in FIFO
  .i_ready_m         (upleft_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (upleft_empty), // FIFO empty flag
  .o_dataout         (upleft_data_out)  // Pop data from FIFO
);

sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_up (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (up_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (up_addr), // Push data in FIFO
  .i_ready_m         (left_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (up_empty), // FIFO empty flag
  .o_dataout         (up_data_out)  // Pop data from FIFO
);

sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_upright (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (upright_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (upright_addr), // Push data in FIFO
  .i_ready_m         (upright_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (upright_empty), // FIFO empty flag
  .o_dataout         (upright_data_out)  // Pop data from FIFO
);

sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_left (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (left_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (left_addr), // Push data in FIFO
  .i_ready_m         (left_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (left_empty), // FIFO empty flag
  .o_dataout         (left_data_out)  // Pop data from FIFO
);

sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_right (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (right_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (right_addr), // Push data in FIFO
  .i_ready_m         (right_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (right_empty), // FIFO empty flag
  .o_dataout         (right_data_out)  // Pop data from FIFO
);


sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_downleft (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (downleft_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (downleft_addr), // Push data in FIFO
  .i_ready_m         (downleft_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (downleft_empty), // FIFO empty flag
  .o_dataout         (downleft_data_out)  // Pop data from FIFO
);


sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_down (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (down_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (down_addr), // Push data in FIFO
  .i_ready_m         (down_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (down_empty), // FIFO empty flag
  .o_dataout         (down_data_out)  // Pop data from FIFO
);


sync_fifo #(
  FIFO_DEPTH = `CFG_FIFO_DEPTH       , // FIFO depth
  DATA_WIDTH = `CFG_DATA_WIDTH       , // Data width
  ADDR_WIDTH = $clog2(FIFO_DEPTH)      // Address width
) sync_fifo_downright (
  .i_clk             (clk), // Clock signal
  .i_rst_n           (reset_n), // Source domain asynchronous reset (active low)
  .i_valid_s         (downright_push_position), // Request write data into FIFO
  .i_almostfull_lvl  (FIFO_DEPTH-2), // The number of empty memory locations in the FIFO at which the o_almostfull flag is active
  .i_datain          (downright_addr), // Push data in FIFO
  .i_ready_m         (downright_read_en), // Request read data from FIFO
  .i_almostempty_lvl (2), // The number of empty memory locations in the FIFO at which the o_almostempty flag is active
  .o_ready_s         (), // Status write data into FIFO (if FIFO not full then o_ready_s = 1)         
  .o_almostfull      (), // FIFO almostfull flag (determined by i_almostfull_lvl)
  .o_full            (), // FIFO full flag
  .o_valid_m         (), // Status read data from FIFO (if FIFO not empty then o_valid_m = 1)
  .o_almostempty     (), // FIFO almostempty flag (determined by i_almostempty_lvl)
  .o_empty           (downright_empty), // FIFO empty flag
  .o_dataout         (downright_data_out)  // Pop data from FIFO
);


endmodule : eda_fifos