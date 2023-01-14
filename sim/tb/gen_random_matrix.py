import numpy as np

m = 10
n = 10
pixel_width = 8
window_width = 9

file_num = 10000

# ===============================================================
#                      Gen parameter
# ===============================================================
f_param = open("../../inc/eda_global_define.svh", "w")

f_param.write("`define CFG_M                 " + str(m)             +      "\n")
f_param.write("`define CFG_N                 " + str(n)             +      "\n")
f_param.write("`define CFG_PIXEL_WIDTH       " + str(pixel_width)   +      "\n")
f_param.write("`define CFG_WINDOW_WIDTH      " + str(window_width)  +      "\n")
f_param.write("`define CFG_ADDR_WIDTH        $clog2(`CFG_M) + $clog2(`CFG_N)\n")
f_param.write("`define CFG_I_WIDTH           $clog2(`CFG_M)                 \n")
f_param.write("`define CFG_J_WIDTH           $clog2(`CFG_N)                 \n")
f_param.write("`define CFG_FIFO_DEPTH        2*(`CFG_M)                     \n")
f_param.write("`define CFG_DATA_WIDTH        `CFG_ADDR_WIDTH                \n")

f_param.close()

# ===============================================================
#                      Gen random matrix
# ===============================================================


for file_index in range(file_num):
  f_matrix = open("image_input_" + str(file_index), "w")
  array = np.random.randint(5 , size=(m, n))
  for i in range (m):
    for j in range (n):
      f_matrix.write(hex(array[i, j]).replace("0x", ""))
      f_matrix.write(" ")
    f_matrix.write("\n")

  f_matrix.close()


print("DONE")