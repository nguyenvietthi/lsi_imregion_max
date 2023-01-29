import numpy as np
from numpy.lib.stride_tricks import as_strided

f = open("test_result/error_case_16x16.txt", "w")
f_r = open("test_result/correct_case_16x16.txt", "w")

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
    # print(neight)
    max_value = np.max(neight)
    # print(neight, max_value)
    index = np.argwhere(neight == arr[i][j]) +  [ix + i0, jx + j0]
    # print(index)
    return [max_value > arr[i][j], index]
# ####################################################################
def find_neigh_index(array, i, j):
    change_output = False
    neigh_list = []
    neigh_list.extend(cell_neighbors(array, i, j, 1)[1].tolist())
    if(cell_neighbors(array, i, j, 1)[0]): 
        change_output = True
    # print(neigh_list)
    for neigh in neigh_list:
        next_neighs = cell_neighbors(array, neigh[0], neigh[1], 1)[1]
        if(cell_neighbors(array, neigh[0], neigh[1], 1)[0]): 
            change_output = True
        for next_neigh in next_neighs:
            # print(next_neigh)
            if(np.any((np.array(neigh_list) == (next_neigh[0], next_neigh[1])).all(axis=1)) == False):
                neigh_list.append(next_neigh.tolist())

    return neigh_list, change_output        

for i in range(0,int(2000)):
    # Input image
    # input_image = np.array([[0, 0, 0, 1, 2, 3],
    #                         [0, 1, 0, 2, 3, 3],
    #                         [0, 0, 0, 2, 3, 4],
    #                         [1, 3, 1, 5, 4, 5],
    #                         [0, 0, 0, 3, 2, 4],
    #                         [2, 1, 0, 1, 2, 3]])
    input_image = np.random.randint(5, size=(16,16))

    # ORIGINAL
    size_input_x = input_image.shape[0]
    size_input_y = input_image.shape[1]
    output_image = np.ones((size_input_x,size_input_y), dtype=np.uint8)
    input_ = np.array(input_image)
    output = np.array(output_image)
    output_cp = np.zeros((size_input_x,size_input_y))
    nloop = 0
    while (sum(sum(output_cp != output)) != 0):
        output_cp = np.array(output)
        nloop = nloop + 1
        for m in range(1, size_input_y - 1):
            for n in range(1,size_input_x - 1):
                max_val = max(input_[m - 1,n - 1],input_[m - 1,n],input_[m - 1,n + 1],input_[m,n - 1],input_[m,n + 1],input_[m + 1,n - 1],input_[m + 1,n],input_[m + 1,n + 1])
                if max_val > input_[m,n]:
                    output[m,n] = 0
                if max_val == input_[m,n]:
                    if max_val == input_[m - 1,n - 1]:
                        if output[m - 1,n - 1] == 0:
                            output[m,n] = 0
                    if max_val == input_[m - 1,n]:
                        if output[m - 1,n] == 0:
                            output[m,n] = 0
                    if max_val == input_[m - 1,n + 1]:
                        if output[m - 1,n + 1] == 0:
                            output[m,n] = 0
                    if max_val == input_[m,n - 1]:
                        if output[m,n - 1] == 0:
                            output[m,n] = 0
                    if max_val == input_[m,n + 1]:
                        if output[m,n + 1] == 0:
                            output[m,n] = 0
                    if max_val == input_[m + 1,n - 1]:
                        if output[m + 1,n - 1] == 0:
                            output[m,n] = 0
                    if max_val == input_[m + 1,n]:
                        if output[m + 1,n] == 0:
                            output[m,n] = 0
                    if max_val == input_[m + 1,n + 1]:
                        if output[m + 1,n + 1] == 0:
                            output[m,n] = 0
        m = 0
        n = 0 
        max_val = np.amax(np.array([input_[m,n + 1],input_[m + 1,n],input_[m + 1,n + 1]]))
        if max_val > input_[m,n]:
            output[m,n] = 0
        if max_val == input_[m,n]:
            if max_val == input_[m,n + 1]:
                if output[m,n + 1] == 0:
                    output[m,n] = 0
            if max_val == input_[m + 1,n]:
                if output[m + 1,n] == 0:
                    output[m,n] = 0
            if max_val == input_[m + 1,n + 1]:
                if output[m + 1,n + 1] == 0:
                    output[m,n] = 0
        for n in range(1, size_input_x - 1):
            max_val = np.amax(np.array([input_[m,n - 1],input_[m,n + 1],input_[m + 1,n - 1],input_[m + 1,n],input_[m + 1,n + 1]]))
            if max_val > input_[m,n]:
                output[m,n] = 0
            if max_val == input_[m,n]:
                if max_val == input_[m,n - 1]:
                    if output[m,n - 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m,n + 1]:
                    if output[m,n + 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m + 1,n - 1]:
                    if output[m + 1,n - 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m + 1,n]:
                    if output[m + 1,n] == 0:
                        output[m,n] = 0
                if max_val == input_[m + 1,n + 1]:
                    if output[m + 1,n + 1] == 0:
                        output[m,n] = 0
        # for n in range(size_input_x - 1, size_input_x -1):
        n = size_input_x - 1
        max_val = np.amax(np.array([input_[m,n - 1],input_[m + 1,n - 1],input_[m + 1,n]]))
        if max_val > input_[m,n]:
            output[m,n] = 0
        if max_val == input_[m,n]:
            if max_val == input_[m,n - 1]:
                if output[m,n - 1] == 0:
                    output[m,n] = 0
            if max_val == input_[m + 1,n - 1]:
                if output[m + 1,n - 1] == 0:
                    output[m,n] = 0
            if max_val == input_[m + 1,n]:
                if output[m + 1,n] == 0:
                    output[m,n] = 0
        m = size_input_y - 1;
        # for n in range(0, 0):
        n = 0
        max_val = np.amax(np.array([input_[m - 1,n],input_[m - 1,n + 1],input_[m,n + 1]]))
        if max_val > input_[m,n]:
            output[m,n] = 0
        if max_val == input_[m,n]:
            if max_val == input_[m - 1,n]:
                if output[m - 1,n] == 0:
                    output[m,n] = 0
            if max_val == input_[m - 1,n + 1]:
                if output[m - 1,n + 1] == 0:
                    output[m,n] = 0
            if max_val == input_[m,n + 1]:
                if output[m,n + 1] == 0:
                    output[m,n] = 0
        for n in range(1, size_input_x - 1):
            max_val = np.amax(np.array([input_[m - 1,n - 1],input_[m - 1,n],input_[m - 1,n + 1],input_[m,n - 1],input_[m,n + 1]]))
            if max_val > input_[m,n]:
                output[m,n] = 0
            if max_val == input_[m,n]:
                if max_val == input_[m - 1,n - 1]:
                    if output[m - 1,n - 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m - 1,n]:
                    if output[m - 1,n] == 0:
                        output[m,n] = 0
                if max_val == input_[m - 1,n + 1]:
                    if output[m - 1,n + 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m,n - 1]:
                    if output[m,n - 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m,n + 1]:
                    if output[m,n + 1] == 0:
                        output[m,n] = 0
        # for n in range(size_input_x - 2, size_input_x - 2):
        n = size_input_x - 1
        max_val = np.amax(np.array([input_[m - 1,n - 1],input_[m - 1,n],input_[m,n - 1]]))
        if max_val > input_[m,n]:
            output[m,n] = 0
        if max_val == input_[m,n]:
            if max_val == input_[m - 1,n - 1]:
                if output[m - 1,n - 1] == 0:
                    output[m,n] = 0
            if max_val == input_[m - 1,n]:
                if output[m - 1,n] == 0:
                    output[m,n] = 0
            if max_val == input_[m,n - 1]:
                if output[m,n - 1] == 0:
                    output[m,n] = 0
        n = 0
        for m in range(1, size_input_y - 1):
            max_val = np.amax(np.array([input_[m - 1,n],input_[m - 1,n + 1],input_[m,n + 1],input_[m + 1,n],input_[m + 1,n + 1]]))
            if max_val > input_[m,n]:
                output[m,n] = 0
            if max_val == input_[m,n]:
                if max_val == input_[m - 1,n]:
                    if output[m - 1,n] == 0:
                        output[m,n] = 0
                if max_val == input_[m - 1,n + 1]:
                    if output[m - 1,n + 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m,n + 1]:
                    if output[m,n + 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m + 1,n]:
                    if output[m + 1,n] == 0:
                        output[m,n] = 0
                if max_val == input_[m + 1,n + 1]:
                    if output[m + 1,n + 1] == 0:
                        output[m,n] = 0
        n = size_input_x - 1
        for m in range(1, size_input_y - 1):
            max_val = np.amax(np.array([input_[m - 1,n - 1],input_[m - 1,n],input_[m,n - 1],input_[m + 1,n - 1],input_[m + 1,n]]))
            if max_val > input_[m,n]:
                output[m,n] = 0
            if max_val == input_[m,n]:
                if max_val == input_[m - 1,n - 1]:
                    if output[m - 1,n - 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m - 1,n]:
                    if output[m - 1,n] == 0:
                        output[m,n] = 0
                if max_val == input_[m,n - 1]:
                    if output[m,n - 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m + 1,n - 1]:
                    if output[m + 1,n - 1] == 0:
                        output[m,n] = 0
                if max_val == input_[m + 1,n]:
                    if output[m + 1,n] == 0:
                        output[m,n] = 0
        # print('Loop %d\n' % (nloop))
        # print(output)
        # print(output_cp)


    # output result
    new_output = np.ones(input_image.shape, dtype=int)

    # get unique values from input_image
    res = np.array(input_image) 
    unique_res = np.unique(res)

    for value in unique_res:
        # print(value)
        # get index equal value
        index_list = np.argwhere(input_image == value)
        for index in index_list:
            neigh_list = find_neigh_index(input_image, index[0], index[1])[0]
            max_check  = find_neigh_index(input_image, index[0], index[1])[1]
            
            if(max_check):
                for neigh in neigh_list:
                    new_output[neigh[0]][neigh[1]] = 0

                # remove index traded in indexlist
                np.delete(index_list, np.where((index_list == (neigh[0], neigh[1])).all(axis=1)))


    # print("Input image: \n", input_image)
    # print("\nOutput: \n",new_output)
    comparison = output == new_output
    equal_arrays = comparison.all()
    
    print(equal_arrays)
    
    if(~equal_arrays):
        f.write("Input: \n")
        f.write(np.array2string(input_image))
        f.write("\nOriginal algorithm output: \n")
        f.write(np.array2string(output))
        f.write("\nNew algorithm output: \n")
        f.write(np.array2string(new_output))
        f.write("\n================================================\n\n")
    else:
        f_r.write("Input: \n")
        f_r.write(np.array2string(input_image))
        f_r.write("\nOriginal algorithm output: \n")
        f_r.write(np.array2string(output))
        f_r.write("\nNew algorithm output: \n")
        f_r.write(np.array2string(new_output))
        f_r.write("\n================================================\n\n")

f.close()        

# np.savetxt("demofile3.txt",output)
