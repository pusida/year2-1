def generate_subsets(nums):
    subsets = [[]]

    for num in nums:
        new_subsets = [subset + [num] for subset in subsets]
        subsets.extend(new_subsets)

    return subsets

def check_sum(subset, target):
    return sum(subset) == target

def custom_sort(subsets):
    for i in range(len(subsets) - 1):

        for j in range(i + 1, len(subsets)):

            if len(subsets[i]) > len(subsets[j]) or (len(subsets[i]) == len(subsets[j]) and subsets[i] > subsets[j]):
                subsets[i], subsets[j] = subsets[j], subsets[i]
    
    return subsets

def find_subsets(nums, target):
    subsets = generate_subsets(nums)
    result = [subset for subset in subsets if check_sum(subset, target)]

    for subset in result:
        bubble_sort(subset)
        
    return custom_sort(result)


def bubble_sort(inp):
    for i in range(len(inp)-1, 0, -1):
        swapped = False

        for j in range(i):
            if inp[j] > inp[j+1]:
                swapped = True
                inp[j], inp[j+1] = inp[j+1], inp[j]

        if not swapped:
            return


target, num_str = input("Enter Input : ").split("/")
nums = list(map(int, num_str.split()))
target = int(target)#jj

result = find_subsets(nums, target)
if result:
    for subset in result:
        print(subset)
else:
    print("No Subset")