`define CFG_M                 10               
`define CFG_N                 10               
`define CFG_PIXEL_WIDTH       8                
`define CFG_WINDOW_WIDTH      9                
`define CFG_ADDR_WIDTH        $clog2(`CFG_M) + $clog2(`CFG_N)      
`define CFG_I_WIDTH           $clog2(`CFG_M)        
`define CFG_J_WIDTH           $clog2(`CFG_N)        
`define CFG_FIFO_DEPTH        2*(`CFG_M)            
`define CFG_DATA_WIDTH        `CFG_ADDR_WIDTH   
