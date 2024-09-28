

def selection(inp):

    sort_largest_to_end(len(inp)-1)

def sort_largest_to_end(last):

    if last < 1:
        return

    biggest_i = 0

    biggest_i = find_biggest(inp, 1, last, biggest_i)

    inp[last], inp[biggest_i] = inp[biggest_i], inp[last]
    if inp[biggest_i] != inp[last] :
        print(f"swap {inp[biggest_i]} <-> {inp[last]} : {inp} ")

    sort_largest_to_end(last-1)


def find_biggest(inp, i, last, biggest_i):
    if i > last:
        return biggest_i

    if inp[i] > inp[biggest_i]:
        biggest_i = i
    return find_biggest(inp, i+1, last, biggest_i)


inp = [int(i) for i in input("Enter Input : ").split()]
selection(inp)
print(inp)
