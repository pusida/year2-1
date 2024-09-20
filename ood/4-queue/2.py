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
inp = input("Enter people : ")
q = Queue()
q1 = Queue()
q2 = Queue()
for i in list(inp) :
    q.enQueue(i)
t = 1
t1 = 0
t2 = 0
while (q.size()>0) :
    m = q.deQueue()
    if t1 == 3 and q1.size()>0:
        q1.deQueue()
        t1 = 0
    if q1.size()>= 5 and q2.isEmpty():
        t2 = 0
    if t2 == 2 and q2.size()>0:
        q2.deQueue()
        t2 = 0
    if q1.size() <= 4 :
        q1.enQueue(m)
    elif q2.size() <= 4 :
        q2.enQueue(m)
    print(f"{t} {q.items} {q1.items} {q2.items}")
    t+=1
    t1+=1
    t2+=1


