import numpy as np
from numpy.lib.stride_tricks import as_strided

# thanks: https://stackoverflow.com/questions/10996769/pixel-neighbors-in-2d-array-image-using-python
def sliding_window(arr, window_size):
    """ Construct a sliding window view of the array"""
    arr = np.asarray(arr)
    window_size = int(window_size)
    if arr.ndim != 2:
        raise ValueError("need 2-D input")
    if not (window_size > 0):
        raise ValueError("need a positive window size")
    shape = (arr.shape[0] - window_size + 1,
             arr.shape[1] - window_size + 1,
             window_size, window_size)
    if shape[0] <= 0:
        shape = (1, shape[1], arr.shape[0], shape[3])
    if shape[1] <= 0:
        shape = (shape[0], 1, shape[2], arr.shape[1])
    strides = (arr.shape[1]*arr.itemsize, arr.itemsize,
               arr.shape[1]*arr.itemsize, arr.itemsize)
    return as_strided(arr, shape=shape, strides=strides)

def cell_neighbors(arr, i, j, d):
    """Return d-th neighbors of cell (i, j)"""
    w = sliding_window(arr, 2*d+1)

    ix = np.clip(i - d, 0, w.shape[0]-1)
    jx = np.clip(j - d, 0, w.shape[1]-1)
    
    i0 = max(0, i - d - ix)
    j0 = max(0, j - d - jx)
    i1 = w.shape[2] - max(0, d - i + ix)
    j1 = w.shape[3] - max(0, d - j + jx)
    # print("check: ", ix," ", jx," ", i0," ", j0," ",i1," ", j1," ")
    neight = w[ix, jx][i0:i1,j0:j1]
    max_value = np.max(neight)
    # print(neight, max_value)
    index = np.argwhere(neight == max_value) +  [ix, jx]
    # print(index)
    return [max_value, index]
# ####################################################################

# Input image
input_image = np.array([[0, 0, 0, 1, 2, 3],
                        [0, 1, 0, 2, 3, 3],
                        [0, 0, 0, 2, 5, 4],
                        [1, 3, 1, 5, 4, 5],
                        [0, 0, 0, 3, 2, 4],
                        [2, 1, 0, 1, 2, 3]])
# # output result
# output = np.ones(input_image.shape, dtype=int)

# # get unique values from input_image
# res = np.array(input_image) 
# unique_res = np.unique(res)

# for value in unique_res:
#     # print(value)
#     # get index equal value
#     index_list = np.argwhere(input_image == value)
#     # print(index_list)
#     for index in index_list:
#         # get Pixel neighbors of value
#         print(index)
#         neight_value = cell_neighbors(input_image, index[0], index[1], 1)
#         print(neight_value)
#         if(np.max(neight_value) > value):
#             for idx in index_list:
#                 # update ouput
#                 output[idx[0]][idx[1]] = 0
#             break
# print(input_image)
# print(output)

# print(cell_neighbors(input_image, 0, 0, 1)[1])