class Queue:
    def __init__(self):
        self.items = []

    def enQueue(self, value):
        self.items.append(value)

    def deQueue(self):
        return self.items.pop(0)
    
    def pop(self):
        return self.items.pop()

    def size(self):
        return len(self.items)

    def isEmpty(self):
        return len(self.items) == 0
    
    def reverse(self):
         return self.items.reverse()
q_m = Queue()
q_n = Queue()
inp = input("Enter Input (Normal, Mirror) : ").split(" ")
n_inp = list(inp[0])
m_inp = list(inp[1])
m_p = []
num_b = 0
num_m = 0
f_num_b =0
while len(m_inp) > 0 :
    if len(m_inp) > 2 :
        if m_inp[0] == m_inp[1] == m_inp[2] :
            c = m_inp[0]
            num_m+=1
            for i in range(3) :
                m_inp.pop(0)
            if len(m_p) > 0 and len(m_inp) > 1:
                if m_p[-1] == m_inp[1] == m_inp[0] :
                    q_m.enQueue(m_inp[0])
                    q_m.enQueue(c)
                    num_m+=1
                    m_p.pop()
                    for i in range(2) :
                        m_inp.pop(0)
                else : q_m.enQueue(c)
            else : q_m.enQueue(c)
        elif m_inp[0] != m_inp[1] :
                m_p.append(m_inp.pop(0))
        else :
             for i in range(2) :
                m_p.append(m_inp.pop(0))
    else :
        for i in range(len(m_inp)) :
                m_p.append(m_inp.pop(0))

q_m.reverse()

while len(n_inp) > 0 :
    if len(n_inp) > 2 :
        if n_inp[0] == n_inp[1] == n_inp[2] :
            if q_m.size() > 0 :
                 if q_m.items[0] == n_inp[0] :
                    f_num_b+=1
                    q_m.deQueue()
                    q_n.enQueue(n_inp[0])
        elif q_n.size() > 0 and q_n.items[-1] == q_n.items[-2] == n_inp[0] :
            q_n.pop()
            q_n.pop()
            q_n.enQueue(n_inp[0])
            if  q_m.size() > 0 :
                if q_m.items[0] == n_inp[0] :
                    f_num_b+=1
                    q_m.deQueue()
                    q_n.enQueue(n_inp[0])     
                num_b+=1
        elif q_n.size() > 0 and q_n.items[-1] == n_inp[0] == n_inp[1] :
                q_n.pop()
                q_n.enQueue(n_inp[0])
                num_b+=1
                 else :
                    for i in range(4) :
                        if i == 2:
                            q_n.enQueue(q_m.deQueue())
                        else :  q_n.enQueue(n_inp[0])
        else  :
            num_b+=1

            for i in range(3) :
                n_inp.pop(0)
        elif n_inp[0] != n_inp[1] :
                q_n.enQueue(n_inp[0])
                n_inp.pop(0)
        else :
             for i in range(2) :
                q_n.enQueue(n_inp[0])
                n_inp.pop(0)
    else :
        for i in range(len(n_inp)) :
                q_n.enQueue(n_inp[0])
                n_inp.pop(0)
print("NORMAL :")
print(q_n.size())
if q_n.isEmpty() :
     print("Empty")
elif not q_n.isEmpty() :
    print(("").join(reversed(q_n.items)))
print(f"{num_b} Explosive(s) ! ! ! (NORMAL)")
if f_num_b > 0:
     print(f"Failed Interrupted {f_num_b} Bomb(s)")
print("------------MIRROR------------")
print(": RORRIM")
print(len(m_p))
if len(m_p) <1 :
     print("ytpmE")
elif len(m_p) >= 1:
     print(("").join(m_p))
print(f"(RORRIM) ! ! ! (s)evisolpxE {num_m}")



    
        
    
