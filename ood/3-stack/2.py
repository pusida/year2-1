list_input = [[int(j) for j in i.split()]
              for i in input("Enter Input : ").split(",")]
c = []
a = 0
l = len(list_input)
for i in list_input:
    if a == 0:
        c.append(i)
    if a < l-1:
        if list_input[a+1][0] > i[0]:
            for i in reversed(c):
                if i[0] < list_input[a+1][0]:
                    c.pop()
                    print(i[1])

            c.append(list_input[a+1])
        elif list_input[a+1][0] <= i[0]:
            c.append(list_input[a+1])

    a += 1
