class Stack:
    def __init__(self):
        self.stack = []

    def push(self, value):
        self.stack.append(value)

    def pop(self):
        return self.stack.pop()

    def size(self):
        return len(self.stack)

    def isEmpty(self):
        return len(self.stack) == 0
def check_up(k) :
     if k%2 == 0 : 
        if k-1 <= 1 :
             k = 1
        k-=1
     elif k%2 != 0 : k+=2
     return k
S = Stack()
inp = [i.split(" ") for i in input("Enter Input : ").split(",")]
for i in inp :
    if i[0] == 'A' :
        S.push(int(i[1]))
    elif i[0] == 'B' :
        stack_result = []
        for j in S.stack :
            if stack_result == [] :
                stack_result.append(j)
            elif j >= stack_result[-1] :
                for k in reversed(stack_result):
                    if k <= j :stack_result.pop()
                stack_result.append(j)
            else :stack_result.append(j) 
        print(len(stack_result))              

    elif i[0] == 'S' :
        stack = []
        for k in S.stack :
            k = check_up(k)
            stack.append(k)
        S.stack = stack



