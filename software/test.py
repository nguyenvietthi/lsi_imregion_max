import numpy as np
import global_params
import base_functions

f = open("error_case_6x6.txt", "w")
f_r = open("correct_case_6x6.txt", "w")
for i in range(0,int(10e100)):
    # Input image
    # input_image = np.array([[0, 0, 0, 1, 2, 3],
    #                         [0, 1, 0, 2, 3, 3],
    #                         [0, 0, 0, 2, 3, 4],
    #                         [1, 3, 1, 5, 4, 5],
    #                         [0, 0, 0, 3, 2, 4],
    #                         [2, 1, 0, 1, 2, 3]])
    input_image = np.random.randint(30000, size=(6,6))

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


    # print('Input\n' % ())
    # print(input_image)
    # print('Output\n' % ())
    # print(output)

    # new algorithm

    # size_input_x = input_image.shape[0] # Height of image
    # size_input_y = input_image.shape[1] # Width of image
    max_size     = size_input_x * size_input_y # Max size

    input_image_flatten = np.copy(input_image.flatten())
    mark_iter = np.zeros((max_size,), dtype=np.uint8)
    strobe = np.zeros((max_size,), dtype=np.uint8)

    strobe = base_functions.update_strobe(last_iter = -1, strobe = strobe)
    new_algorithm_output = np.ones_like(input_image_flatten)
    extend_idx = []
    # print("---------------------------------------------------------")
    # print("\t\t\t Initial Parameters")
    # print("---------------------------------------------------------")

    # print("\n1. input_image: \n", input_image)
    # print("\n2. input_image_flatten: \n", input_image_flatten)
    # print("\n3. mark_iter: \n", mark_iter)
    strobe_reshape = np.reshape(np.copy(strobe), (size_input_x, size_input_y))
    # print("\n4. strobe: \n", strobe_reshape)
    new_algorithm_output_reshape = np.copy(new_algorithm_output.reshape((size_input_x, size_input_y)))
    # print("\n5. new_algorithm_output: \n", new_algorithm_output_reshape)

    # print("\n===================================================================")

    for i in range(size_input_x * size_input_y):
        str = "-" if i < 10 else ""
        # print("\n\t---------------------------------------------------------")
        # print("\t-------------------|      STEP ",i,"   |------------------", str)
        # print("\t---------------------------------------------------------\n")
        # print ()
        if (mark_iter[i] == 0):
            extend, extend_idx, reg_max, mark_iter = base_functions.compare(iter = i, input_image_flatten = input_image_flatten, strobe = strobe, last_extend_idx = extend_idx, mark_iter = mark_iter)
            while (extend):
                strobe = base_functions.update_strobe_extend(strobe = strobe, extend_idx = extend_idx)
                strobe_reshape = np.reshape(np.copy(strobe), (size_input_x, size_input_y))
                # print("\n2 strobe: \n", strobe_reshape)
                extend, extend_idx, reg_max, mark_iter = base_functions.compare(iter = i, input_image_flatten = input_image_flatten, strobe = strobe, last_extend_idx = extend_idx, mark_iter = mark_iter)
            for j in range(len(extend_idx)):
                new_algorithm_output[extend_idx[j]] = int(reg_max)
            new_algorithm_output[i] = int(reg_max)
        
        extend_idx = []
        mark_iter[i] = 1
        
        strobe =  base_functions.update_strobe(last_iter = i     ,
                                            strobe    = strobe )
        # print("\n1. Input image: \n", input_image)
        strobe_reshape = np.reshape(np.copy(strobe), (size_input_x, size_input_y))
        # print("\n2. New strobe: \n", strobe_reshape)
        mark_iter_reshape = np.reshape(np.copy(mark_iter), (size_input_x, size_input_y))
        # print("\n3. mark_iter: \n", mark_iter_reshape)
        new_algorithm_output_reshape = np.reshape(np.copy(new_algorithm_output), (size_input_x, size_input_y))
        # print("\n4. New new_algorithm_output: \n", new_algorithm_output_reshape)  
        # 
        # 

    # print(new_algorithm_output_reshape)   
    # print(output)
    comparison = output == new_algorithm_output_reshape
    equal_arrays = comparison.all()
    
    print(equal_arrays)
    
    if(~equal_arrays):
        f.write("Input: \n")
        f.write(np.array2string(input_image))
        f.write("\nOriginal algorithm output: \n")
        f.write(np.array2string(output))
        f.write("\nNew algorithm output: \n")
        f.write(np.array2string(new_algorithm_output_reshape))
        f.write("\n================================================\n\n")
    else:
        f_r.write("Input: \n")
        f_r.write(np.array2string(input_image))
        f_r.write("\nOriginal algorithm output: \n")
        f_r.write(np.array2string(output))
        f_r.write("\nNew algorithm output: \n")
        f_r.write(np.array2string(new_algorithm_output_reshape))
        f_r.write("\n================================================\n\n")

f.close()        

# np.savetxt("demofile3.txt",output)
