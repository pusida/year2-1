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

inp = [i for i in input("input : ").split(",")]
q = Queue()
j = 0
j_1 = 0
e_de = 0
e_in = 0
for i in inp :
    if i[0] in 'D':
        print(f"Step : {i}")
        print("Dequeue : []")
        e_de+= int(i[1]) - q.size()
        if e_de > 0 :
            for p in range(q.size()):
                q.deQueue()   
            print(f"Error Dequeue : {e_de}")
        else : 
            for p in range(int(i[1])):
                q.deQueue()   
            e_de = 0
            print(f"Error Dequeue : {e_de}")
        print(f"Error input : {e_in}")
    if i[0] in 'E':
        print(f"Step : {i}")
        l = 0
        g =0
        # print(len(i))
        for r in reversed(range(1,len(i))) :
            l+= int(i[r])*(10**(g))
            g+=1
        k = j_1+l
        # print(l)
        if k > 0 :
            for i in range(j_1,k) :
                q.enQueue('*'+str(i))
        print(f"Enqueue : {q.items}")
        print(f"Error Dequeue : {e_de}")
        print(f"Error input : {e_in}")
        if not q.isEmpty() :
            j = q.items[-1][1]
            j_1 = int(j)+1
    elif i[0] not in 'DE' :
        print(f"Step : {i}")
        e_in += 1
        print(q.items)
        print(f"Error Dequeue : {e_de}")
        print(f"Error input : {e_in}")
    print("--------------------")


q = Queue()

