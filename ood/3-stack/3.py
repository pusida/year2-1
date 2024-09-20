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


inp = input('Enter Infix : ')
S = Stack()

def check(out,j):
        if out > d_oper[j] :
           return True
        elif out <= d_oper[j] :
            return False

print('Postfix : ', end='')
d_oper = {'-': 1, '+' : 1, '*' : 2, '/': 2, '^' : 3, '(': 0}
result = ""
for i in inp :
    t = 0
    if i.isalpha() :
        result += i
    elif i in "+-*/^(" :
        ch = d_oper[i]
        if d_oper[i] == 0:
            S.push(i) 
            t = 1
        while (t==0) :
            if not S.isEmpty():
                if check(ch,S.stack[-1]) :
                    S.push(i)
                    t = 1
                else :
                    result +=  S.pop()
            else :
                S.push(i) 
                t = 1
    elif i in ")" :
        while(t==0):
            if not S.isEmpty():
                if S.stack[-1] == '(' :
                    S.pop()
                    t=1
                else : result +=  S.pop()



        
print(result, end='')

while not S.isEmpty():

    print(S.pop(), end='')

print()