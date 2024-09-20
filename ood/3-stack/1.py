def parentheses(input):
    b = []
    a = 0
    for i in input :
        if i in '([{':
            b.append(i)
        else :
            if i in ")]}" :
                if b :
                    if b[-1] == '(' and i == ')':
                        b.pop()
                    elif b[-1] == '[' and i == ']':
                        b.pop()
                    else : b.append(i)
                else: a+=1
                    
    return [b,a]
input = input("Enter Input : ")
result = parentheses(input)
if result[0] == [] and result[1] == 0:
    print("0")
    print("Perfect ! ! !")
elif result[0] == [] and result[1] > 0:
    print(result[1])
elif result[0] != [] and result[1] > 0:
     print(int(result[1])+len(result[0]))
else :
    print(len(result[0]))