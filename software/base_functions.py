import numpy as np
import global_params

# Function: Compare current elements with their neighbors 
# iter: Order of current pixel in input_image_flatten (integer)
# input_image_flatten: Flatten input image (numpy array)
# strobe: Strobe (numpy array)
# last_extend_idx: Last extend_idx list (list)
# mark_iter: Mark iterated element: if mark_iter[i] == 0, this means input_image_flatten[i] has been iterated (numpy array)
# Return: 1. extend: If extend == True, this means we need to extend region (boolean)
#         2. extend_idx: If extend == True, extend_idx return the index where we need to extend region (list)
#         3. reg_max: If reg_max == True, this means this element is region maxima (boolean)
#         4. mark_iter_copy: New mark_iter
def compare(iter, input_image_flatten, strobe, last_extend_idx, mark_iter):
    extend = False
    extend_idx = last_extend_idx.copy()
    reg_max = True
    mark_iter_copy = np.copy(mark_iter)

    for i in range(0, strobe.shape[0]):
        if (strobe[i] == 1):
            if ((input_image_flatten[i] == input_image_flatten[iter]) & (i not in last_extend_idx) & (i != iter)):
                extend = True
                extend_idx.append(i)
                mark_iter_copy[i] = 1
            elif (input_image_flatten[i] > input_image_flatten[iter]):
                reg_max = False

    return extend, extend_idx, reg_max, mark_iter_copy


# Function: Update strobe for the next iteration when need to extend region
# strobe: Strobe (numpy array)
# extend_idx: If extend == True, extend_idx return the index where we need to extend region (list)
# Return: New strobe (numpy array)
def update_strobe_extend(strobe, extend_idx):
    strobe_copy = np.copy(strobe)

    for ex_idx in extend_idx:
        if ((ex_idx - 1 >= 0) & (ex_idx % global_params.size_input_y != 0)):
            strobe_copy[ex_idx - 1] = 1
        if ((ex_idx - global_params.size_input_y - 1 >= 0) & (ex_idx % global_params.size_input_y != 0)):
            strobe_copy[ex_idx - global_params.size_input_y - 1] = 1
        if (ex_idx - global_params.size_input_y >= 0):
            strobe_copy[ex_idx - global_params.size_input_y] = 1
        if ((ex_idx - global_params.size_input_y + 1 >= 0) & ((ex_idx + 1) % global_params.size_input_y != 0)):
            strobe_copy[ex_idx - global_params.size_input_y + 1] = 1
        if ((ex_idx + 1 <= global_params.max_size - 1) & ((ex_idx + 1) % global_params.size_input_y != 0)):
            strobe_copy[ex_idx + 1] = 1
        if ((ex_idx + global_params.size_input_y - 1 <= global_params.max_size - 1) & (ex_idx % global_params.size_input_y != 0)):
            strobe_copy[ex_idx + global_params.size_input_y - 1] = 1
        if (ex_idx + global_params.size_input_y <= global_params.max_size - 1):
            strobe_copy[ex_idx + global_params.size_input_y] = 1
        if ((ex_idx + global_params.size_input_y + 1 <= global_params.max_size - 1) & ((ex_idx + 1) % global_params.size_input_y != 0)):
            strobe_copy[ex_idx + global_params.size_input_y + 1] = 1

    return strobe_copy
    
# Function: Update strobe for the next iteration when don't need to extend region
# last_iter: The lastest iteration (integer)
# strobe: Strobe (numpy array)
# Return: New strobe (numpy array)
def update_strobe(last_iter, strobe):
    strobe_copy = np.zeros_like(strobe)

    new_iter = last_iter + 1
    if ((new_iter - 1 >= 0) & (new_iter % global_params.size_input_y != 0)):
        strobe_copy[new_iter - 1] = 1
    if ((new_iter - global_params.size_input_y - 1 >= 0) & (new_iter % global_params.size_input_y != 0)):
        strobe_copy[new_iter - global_params.size_input_y - 1] = 1
    if (new_iter - global_params.size_input_y >= 0):
        strobe_copy[new_iter - global_params.size_input_y] = 1
    if ((new_iter - global_params.size_input_y + 1 >= 0) & ((new_iter + 1) % global_params.size_input_y != 0)):
        strobe_copy[new_iter - global_params.size_input_y + 1] = 1
    if ((new_iter + 1 <= global_params.max_size - 1) & ((new_iter + 1) % global_params.size_input_y != 0)):
        strobe_copy[new_iter + 1] = 1
    if ((new_iter + global_params.size_input_y - 1 <= global_params.max_size - 1) & (new_iter % global_params.size_input_y != 0)):
        strobe_copy[new_iter + global_params.size_input_y - 1] = 1
    if (new_iter + global_params.size_input_y <= global_params.max_size - 1):
        strobe_copy[new_iter + global_params.size_input_y] = 1
    if ((new_iter + global_params.size_input_y + 1 <= global_params.max_size - 1) & ((new_iter + 1) % global_params.size_input_y != 0)):
        strobe_copy[new_iter + global_params.size_input_y + 1] = 1
    
    return strobe_copy