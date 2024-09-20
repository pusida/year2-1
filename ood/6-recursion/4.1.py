def print_tower(i, A, B, C):
    if i < len(A):
        print(str(A[i]) +"  "+ str(B[i])+"  " +str(C[i]))
        return print_tower(i+1,A,B,C)
    return

def set_tower(num_st, num_end):
    A = append_tower(num_end+1,[], num_st, num_end)
    B = append_block(num_end+1)
    C = append_block(num_end+1)
    return get_abc(A,B,C)

def append_tower(inp, N, num_st, num_end):
    if num_end>= num_st:
        N.append(num_end)
        return append_tower(inp, N, num_st,num_end-1)
    N.extend(append_block(inp-len(N)))
    return list(reversed(N))
def append_block(num_end):
    N = ['|'] *  num_end
    return N
def get_abc(a,b,c):
    v = []
    v.append(a)
    v.append(b)
    v.append(c)
    return v
    
inp = int(input("Enter Input : "))
v = set_tower(1,inp)
print_tower(0, v[0], v[1], v[2])
if inp == 3 :
    print("move 1 from  A to C")
    a = append_tower(inp+1,[],2,3)
    b = v[1]
    c = append_tower(inp+1,[],1,1)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 2 from  A to B")
    a = append_tower(inp+1,[],3,3)
    b = append_tower(inp+1,[],2,2)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 1 from  C to B")
    b = append_tower(inp+1,[],1,2)
    c = append_block(inp+1)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 3 from  A to C")
    a = append_block(inp+1)
    c = append_tower(inp+1,[],3,3)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 1 from  B to A")
    a = append_tower(inp+1,[],1,1)
    b = append_tower(inp+1,[],2,2)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 2 from  B to C")
    b = append_block(inp+1)
    c = append_tower(inp+1,[],2,3)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 1 from  A to C")
    a = append_block(inp+1)
    b = a
    c = append_tower(inp+1,[],1,3)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
elif inp == 4 :
    print("move 1 from  A to B")
    a = append_tower(inp+1,[],2,4)
    b = append_tower(inp+1,[],1,1)
    c = v[2]
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 2 from  A to C")
    a = append_tower(inp+1,[],3,4)
    c = append_tower(inp+1,[],2,2)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 1 from  B to C")
    b = append_block(inp+1)
    c = append_tower(inp+1,[],1,2)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 3 from  A to B")
    a = append_tower(inp+1,[],4,4)
    b = append_tower(inp+1,[],3,3)
    v = get_abc(a,b,c)
    print_tower(0, v[0], v[1], v[2])
    print("move 1 from  C to A")
