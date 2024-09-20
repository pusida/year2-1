def print_tower(i, A, B, C, inp):
    if i == 0:
        max_len = inp+1
        A = list(reversed((A + ['|'] * max_len)[:max_len]))
        B = list(reversed((B + ['|'] * max_len)[:max_len]))
        C = list(reversed((C + ['|'] * max_len)[:max_len]))
    if i < len(A):
        print(str(A[i]) + "  " + str(B[i])+"  " + str(C[i]))
        return print_tower(i+1, A, B, C, inp)
    return


def hanoi(n, source, target, auxiliary, A, B, C, num_disks):
    if n == 1:
        move_disk(n, source, target, A, B, C, num_disks)
    else:
        hanoi(n - 1, source, auxiliary, target, A, B, C, num_disks)
        move_disk(n, source, target, A, B, C, num_disks)
        hanoi(n - 1, auxiliary, target, source, A, B, C, num_disks)


def move_disk(n, source, target, A, B, C, num_disks):
    if source == 'A':
        disk = A.pop()
    elif source == 'B':
        disk = B.pop()
    elif source == 'C':
        disk = C.pop()

    if target == 'A':
        A.append(disk)
    elif target == 'B':
        B.append(disk)
    elif target == 'C':
        C.append(disk)

    print(f"move {n} from  {source} to {target}")
    print_tower(0, A, B, C, num_disks)


inp = int(input("Enter Input : "))

A = list(range(inp, 0, -1))
B = []
C = []

print_tower(0, A, B, C, inp)


hanoi(inp, 'A', 'C', 'B', A, B, C, inp)
