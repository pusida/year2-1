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

inp = [i.split(" ") for i in input("Enter Input : ").split(",")]
q = Queue()
for i in inp:
    if i[0] == 'E' :
        q.enQueue(i[1])
        print(f"Add {(i[1])} index is {q.size()-1}")
    elif i[0] == 'D' and not q.isEmpty() :
        print(f"Pop {q.deQueue()} size in queue is {q.size()}")
    elif i[0] == 'D' and q.isEmpty() :
        print("-1")

if q.isEmpty() :
    print("Empty")
else :
    print(f"Number in Queue is :  {q.items}")


