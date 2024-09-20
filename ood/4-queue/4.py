class Queue:
    def __init__(self):
        self.items = []

    def enQueue(self, value):
        self.items.append(value)

    def deQueue(self):
        return self.items.pop(0)

    def size(self):
        return len(self.items)

    def isEmpty(self):
        return len(self.items) == 0

q = Queue()
inp = [[i.split(":") for i in i.split(" ") ] for i in input("Enter Input : ").split(",")]
q.items = inp
score = 0
c = 0
my_q = []
my_qw = []
y_q = []
y_qw = []
d_activity = {'0':"Eat",'1':"Game",'2':"Learn",'3':"Movie"}
d_location = {'0':"Res.",'1':"ClassR.",'2':"SuperM.",'3':"Home"}
while(q.size() > 0):
    if not q.isEmpty() :
        check = q.deQueue()
        if check[0][0] == check[1][0] and check[0][1] == check[1][1] :
            score+=4
        elif check[0][0] == check[1][0] :
            score+=1
        elif check[0][1] == check[1][1] :
            score+=2
        else :
            score-=5
    my_q.append(str(check[0][0])+":"+str(check[0][1]))
    my_qw.append(d_activity[str(check[0][0])]+":"+d_location[str(check[0][1])])
    y_q.append(str(check[1][0])+":"+str(check[1][1]))
    y_qw.append(d_activity[str(check[1][0])]+":"+d_location[str(check[1][1])])

        
print(f'My   Queue = {", ".join(my_q)}')
print(f'Your Queue = {", ".join(y_q)}')
print(f'My   Activity:Location = {", ".join(my_qw)}')
print(f'Your Activity:Location = {", ".join(y_qw)}')
if score >= 7 :
    print(f"Yes! You're my love! : Score is {score}.")
elif score > 0:
    print(f"Umm.. It's complicated relationship! : Score is {score}.")
else :
    print(f"No! We're just friends. : Score is {score}.")



