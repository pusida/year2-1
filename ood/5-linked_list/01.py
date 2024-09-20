inp = [int(i) for i in input("enter : ").split(" ")]
print(inp)
swap = True
while swap :
    swap = False
    i = 0
    while i <= len(inp)-2:
        if inp[i] > inp[i+1]:
            inp[i], inp[i+1] = inp[i+1], inp[i]
            swap = True
        i+=1
print(inp)