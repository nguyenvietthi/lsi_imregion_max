`include "eda_global_define.svh"
module regional_max_model #(
  parameter M                = `CFG_M                           ,
  parameter N                = `CFG_N                           ,
  parameter PIXEL_WIDTH      = `CFG_PIXEL_WIDTH                 ,
  parameter WINDOW_WIDTH     = `CFG_WINDOW_WIDTH                ,
  parameter ADDR_WIDTH       = `CFG_ADDR_WIDTH                  ,
  parameter I_WIDTH          = `CFG_I_WIDTH                     ,
  parameter J_WIDTH          = `CFG_J_WIDTH                     
)(
  input                                                clk          ,
  input                                                reset_n      ,
  input                                                start        ,
  input         [0:M - 1][0:N - 1] [PIXEL_WIDTH - 1:0] img_memory   ,
  output logic  [M - 1:0][N - 1:0]                     output_image 
);

logic  [M - 1:0][N - 1:0]                     output_image_cp;


always_ff @(posedge clk or negedge reset_n) begin
  if(~reset_n) begin
    output_image <= '0;
  end else if (start) begin
    output_image <= regional_max(img_memory);
  end
end



  int m = 0;
  int n = 0;
function logic [M - 1:0][N - 1:0] regional_max (logic  [0:M - 1][0:N - 1] [PIXEL_WIDTH - 1:0] img_memory);
  logic  [0:M - 1][0:N - 1] [PIXEL_WIDTH - 1:0] input_image;
  logic  [M - 1:0][N - 1:0]  output_img;
  logic  [M - 1:0][N - 1:0]  output_image_cp;
  logic  [M - 1:0][N - 1:0]  max_value;
  logic  nloop;


  input_image = img_memory;

  for (int i = 0; i < M; i++) begin
    for (int j = 0; j < N; j++) begin
      output_img[i][j] = 1'b1;
      output_image_cp[i][j] = 1'b0;
    end
  end

  while (output_img != output_image_cp) begin: while_loop
    output_image_cp = output_img;
    nloop = nloop + 1;

    for ( m = 1; m < M-1; m = m + 1) begin 
      for ( n = 1; n < N-1; n = n + 1) begin 
        max_value = max (input_image[m-1][n-1], input_image[m-1][n  ], input_image[m-1][n+1],
                         input_image[m  ][n-1],                        input_image[m  ][n+1],
                         input_image[m+1][n-1], input_image[m+1][n  ], input_image[m+1][n+1]);
        if (max_value > input_image[m][n]) begin
          output_img[m][n] = 0;
        end
        if (max_value == input_image[m][n]) begin
          if (max_value == input_image[m - 1][n - 1]) begin
            if (output_img[m - 1][n - 1] == 0) begin
              output_img[m][n] = 0;
            end
          end
          if (max_value == input_image[m - 1][n]) begin
            if (output_img[m - 1][n] == 0) begin
              output_img[m][n] = 0;
            end
          end
          if (max_value == input_image[m - 1][n + 1]) begin
            if (output_img[m - 1][n + 1] == 0) begin
              output_img[m][n] = 0;
            end
          end
          if (max_value == input_image[m][n - 1]) begin
            if (output_img[m][n - 1] == 0) begin
              output_img[m][n] = 0;
            end
          end
          if (max_value == input_image[m][n + 1]) begin
            if (output_img[m][n + 1] == 0) begin
              output_img[m][n] = 0;
            end
          end
          if (max_value == input_image[m + 1][n - 1]) begin
            if (output_img[m + 1][n - 1] == 0) begin
              output_img[m][n] = 0;
            end
          end
          if (max_value == input_image[m + 1][n]) begin
            if (output_img[m + 1][n] == 0 )begin
              output_img[m][n] = 0;
            end
          end
          if (max_value == input_image[m + 1][n + 1]) begin
            if (output_img[m + 1][n + 1] == 0) begin
              output_img[m][n] = 0;
            end
          end
        end
      end
    end


    m = 0;
    n = 0;
    max_value = max (                    0,                     0,                     0,
                                         0,                        input_image[m  ][n+1],
                                         0, input_image[m+1][n  ], input_image[m+1][n+1]);
    if (max_value > input_image[m][n]) begin
      output_img[m][n] = 0;
    end
    if (max_value == input_image[m][n]) begin
      if (max_value == input_image[m][n+1]) begin
        if (output_img[m][n+1] == 0) begin
          output_img[m][n] = 0;
        end
      end
      if (max_value == input_image[m+1][n]) begin
        if (output_img[m+1][n] == 0) begin
          output_img[m][n] = 0;
        end
      end
      if (max_value == input_image[m+1][n+1]) begin
        if (output_img[m+1][n+1] == 0) begin
          output_img[m][n] = 0;
        end
      end
    end

    m = 0;
    for (n = 1; n < N-1; n++) begin 
      max_value = max (                    0,                     0,                     0,
                       input_image[m  ][n-1],                        input_image[m  ][n+1],
                       input_image[m+1][n-1], input_image[m+1][n  ], input_image[m+1][n+1]);

      if (max_value > input_image[m][n]) begin
        output_img[m][n] = 0;
      end
      if (max_value == input_image[m][n]) begin
        if (max_value == input_image[m][n-1]) begin
          if (output_img[m][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m][n+1]) begin
          if (output_img[m][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n-1]) begin
          if (output_img[m+1][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n]) begin
          if (output_img[m+1][n] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n+1]) begin
          if (output_img[m+1][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
      end
    end

    m = 0;
    n = N - 1;
    // for ( n = 1; n < N-1; n++) begin 
      max_value =  max(                    0,                     0,                     0,
                      input_image[m  ][n-1],                                            0,
                      input_image[m+1][n-1], input_image[m+1][n  ],                     0);

      if (max_value > input_image[m][n]) begin
        output_img[m][n] = 0;
      end
      if (max_value == input_image[m][n]) begin
        if (max_value == input_image[m][n-1]) begin
          if (output_img[m][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n-1]) begin
          if (output_img[m+1][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n]) begin
          if (output_img[m+1][n] == 0) begin
            output_img[m][n] = 0;
          end
        end
      end
    // end

    m = M - 1;
    n = 0;
    max_value = max (                    0, input_image[m-1][n  ], input_image[m-1][n+1],
                                         0,                        input_image[m  ][n+1],
                                         0,                     0,                     0);
    if (max_value > input_image[m][n]) begin
      output_img[m][n] = 0;
    end
    if (max_value == input_image[m][n]) begin
      if (max_value == input_image[m-1][n]) begin
        if (output_img[m-1][n] == 0) begin
          output_img[m][n] = 0;
        end
      end
      if (max_value == input_image[m-1][n+1]) begin
        if (output_img[m+1][n] == 0) begin
          output_img[m][n] = 0;
        end
      end
      if (max_value == input_image[m][n+1]) begin
        if (output_img[m][n+1] == 0) begin
          output_img[m][n] = 0;
        end
      end
    end


    m = M - 1;
    for (int n = 1; n < N-1; n++) begin 
      max_value = max (input_image[m-1][n-1], input_image[m-1][n  ], input_image[m-1][n+1],
                       input_image[m  ][n-1],                        input_image[m  ][n+1],
                                           0,                     0,                     0);

      if (max_value > input_image[m][n]) begin
        output_img[m][n] = 0;
      end
      if (max_value == input_image[m][n]) begin
        if (max_value == input_image[m-1][n-1]) begin
          if (output_img[m-1][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m-1][n]) begin
          if (output_img[m-1][n] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m-1][n+1]) begin
          if (output_img[m-1][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m][n-1]) begin
          if (output_img[m][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m][n+1]) begin
          if (output_img[m][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
      end
    end

    m = M - 1;
    n = N-1;
    max_value = max (input_image[m-1][n-1], input_image[m-1][n  ],                     0,
                     input_image[m  ][n-1],                                            0,
                                         0,                     0,                     0);
    if (max_value > input_image[m][n]) begin
      output_img[m][n] = 0;
    end
    if (max_value == input_image[m][n]) begin
      if (max_value == input_image[m-1][n-1]) begin
        if (output_img[m-1][n-1] == 0) begin
          output_img[m][n] = 0;
        end
      end
      if (max_value == input_image[m-1][n]) begin
        if (output_img[m-1][n] == 0) begin
          output_img[m][n] = 0;
        end
      end
      if (max_value == input_image[m][n-1]) begin
        if (output_img[m][n-1] == 0) begin
          output_img[m][n] = 0;
        end
      end
    end

    n = 0;
    for (int m = 1; m < M-1; m++) begin 
      max_value = max (                     0, input_image[m-1][n ],input_image[m-1][n+1],
                                            0,                      input_image[m  ][n+1],
                                            0, input_image[m+1][n ],input_image[m+1][n+1]);

      if (max_value > input_image[m][n]) begin
        output_img[m][n] = 0;
      end
      if (max_value == input_image[m][n]) begin
        if (max_value == input_image[m-1][n]) begin
          if (output_img[m-1][n] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m-1][n+1]) begin
          if (output_img[m-1][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m][n+1]) begin
          if (output_img[m][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n]) begin
          if (output_img[m+1][n] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n+1]) begin
          if (output_img[m+1][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
      end
    end

    n = N-1;
    for (int m = 1; m < M-1; m++) begin 
      max_value = max (input_image[m-1][n-1], input_image[m-1][n ],                     0,
                       input_image[m  ][n-1],                                           0,
                       input_image[m+1][n-1], input_image[m+1][n ],                     0);
      if (max_value > input_image[m][n]) begin
        output_img[m][n] = 0;
      end
      if (max_value == input_image[m][n]) begin
        if (max_value == input_image[m-1][n-1]) begin
          if (output_img[m-1][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m-1][n]) begin
          if (output_img[m-1][n] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m][n-1]) begin
          if (output_img[m+1][n+1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n-1]) begin
          if (output_img[m+1][n-1] == 0) begin
            output_img[m][n] = 0;
          end
        end
        if (max_value == input_image[m+1][n]) begin
          if (output_img[m+1][n] == 0) begin
            output_img[m][n] = 0;
          end
        end
      end
    end

  end: while_loop

  return output_img;

endfunction



function [PIXEL_WIDTH-1 : 0] max (logic [PIXEL_WIDTH - 1:0] upleft  , logic [PIXEL_WIDTH - 1:0] up  , logic [PIXEL_WIDTH - 1:0] upright   , 
                                  logic [PIXEL_WIDTH - 1:0]   left  ,                                 logic [PIXEL_WIDTH - 1:0] right     , 
                                  logic [PIXEL_WIDTH - 1:0] downleft, logic [PIXEL_WIDTH - 1:0] down, logic [PIXEL_WIDTH - 1:0] downright );
  logic [PIXEL_WIDTH - 1:0] max_value;
  max_value = upleft;
  if (up > max_value) begin
    max_value = up;
  end
  if (upright > max_value) begin
    max_value = upright;
  end
  if (left > max_value) begin
    max_value = left;
  end
  if (right > max_value) begin
    max_value = right;
  end
  if (downleft > max_value) begin
    max_value = downleft;
  end
  if (down > max_value) begin
    max_value = down;
  end
  if (downright > max_value) begin
    max_value = downright;
  end

  return max_value;
endfunction


endmodule