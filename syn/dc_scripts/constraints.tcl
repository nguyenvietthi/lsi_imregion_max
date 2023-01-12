reset_design

create_clock -period $CLOCK_PERIOD_DTI [get_ports clk]

set_clock_uncertainty $MARGIN_DTI [get_ports clk]

# set_clock_transition -max $MAX_TRANSITION_TIME [get_clock clk]

# set_clock_latency -source -max 1.2 [get_clock clk]

set_input_delay -max 0.4 -clock clk [get_ports reset_n  ]
set_input_delay -max 0.4 -clock clk [get_ports pixel_in*]
set_input_delay -max 0.4 -clock clk [get_ports start    ]
set_input_delay -max 0.4 -clock clk [get_ports wr_addr* ]
set_input_delay -max 0.4 -clock clk [get_ports write_en ]

set_output_delay -max 0.4 -clock clk [get_ports done           ]
set_output_delay -max 0.4 -clock clk [get_ports matrix_output* ]

set_fanout_load 1 [get_ports done           ] 
set_fanout_load 1 [get_ports matrix_output* ]
