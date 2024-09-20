class DoublyLinked:
    class Node:
        def __init__(self, data, prev=None, next=None):
            self.data = data
            self.prev = prev
            self.next = next

    def __init__(self):
        self.head = None
        self.size = 0

    def append(self, data):
        if self.head is None:
            self.head = self.Node(data)
            self.head.next = self.head
            self.head.prev = self.head
        else:
            current = self.head
            while current.next != self.head:
                current = current.next
            new_node = self.Node(data, prev=current, next=self.head)
            current.next = new_node
            self.head.prev = new_node

    def findDirection(self, st, end, way=None):
        current = self.head
        while current.data != str(st):
            current = current.next
        st = current
        if way == 'F':
            result_f = self.findForward(st, end)
            return result_f[0]
        elif way == 'B':
            result_b = self.findBackward(st, end)
            return result_b[0]
        elif way is None:
            result_f = self.findForward(st, end)
            # print(result_f[0])
            result_b = self.findBackward(st, end)
            # print(result_b[0])
            if int(result_f[1]) > int(result_b[1]):
                return result_b[0]
            elif int(result_f[1]) == int(result_b[1]):
                return [result_f[0],result_b[0]]
            else:
                return result_f[0]

    def findForward(self, st, end):
        result = str(st.data)
        num = 0
        while st.data != str(end):
            st = st.next
            result += '->' + str(st.data)
            num += 1
        return f"Forward Route: {result},{num}", num

    def findBackward(self, st, end):
        result = str(st.data)
        num = 0
        while st.data != str(end):
            st = st.prev
            result += '->' + str(st.data)
            num += 1
        return f"Backward Route: {result},{num}", num

    def isEmpty(self):
        return self.head is None

    def printList(self):
        if self.head is None:
            print("Linklist is empty!")
            return

        curlst = []
        cur = self.head
        while True:
            curlst.append(cur.data)
            cur = cur.next
            if cur == self.head:
                break
        print(" -> ".join(map(str, curlst)))


dl = DoublyLinked()


def convert_inp_to_lst(lst):
    for data in lst:
        dl.append(data)


print("***Railway on route***")
inp = input(
    "Input Station name/Source, Destination, Direction(optional): ").split('/')
for i in inp[0].split(','):
    dl.append(i)
y = [i for i in inp[1].split(',')]
if len(y) > 2:
    print(dl.findDirection(y[0], y[1], y[2]))
    # print(f"st:{y[0]}, end:{y[1]}, way:{y[2]}")
else:
    r = dl.findDirection(y[0], y[1])
    if isinstance(r, list):
        for i in r:
            print(i)
    else : print(r)
