import numpy as np
input_image = np.array([[0,0,0,1,2,3],[0,1,0,2,3,3],[0,0,0,2,3,4],[1,3,1,5,4,5],[0,0,0,3,2,4],[2,1,0,1,2,3]])
size_input_x = 6
size_input_y = 6
output_image = np.ones((size_input_x,size_input_y))
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


print('Input\n' % ())
print(input_image)
print('Output\n' % ())
print(output)