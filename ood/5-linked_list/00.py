class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next: Node = next


class Linklist:
    def __init__(self):
        self.head: Node = None
        self.size = 0

    def append(self, data):
        if self.head is None:
            self.head = Node(data)
            self.size+=1
            return
        current = self.head
        while current.next is not None:
            current = current.next
        current.next = Node(data)
        self.size+=1
    def check_data_node(self):
        current = self.head
        st = self.head
        while st :
            while current.next:
                if int(current.next.data) == int(st.data):
                    if current.next.next :
                        current.next = current.next.next
                    else : current.next = None
                else :current = current.next
            st = st.next

    def __str__(self) -> str:
        if self.head is  None:
            return "List is empty"
        result = str(self.head.data)
        current = self.head.next
        while current is not None:
            result += '->' + str(current.data)
            current = current.next
        return f"link list : {result}"

    def isEmpty(self):
        return self.head is None

    def addhead(self, data):
        new_node = Node(data)
        new_node.next = self.head
        self.head = new_node

    def insert(self, index, data):
        if index == 0:
            self.addhead(data)
            print(f"index = {int(index)} and data = {data}")
            return
        if index < 0 or (self.head is None and index > 0):
            print("Data cannot be added")
            return 
        current = self.head
        for i in range(index-1):
            if current.next is None:
                print("Data cannot be added")
                return
            current = current.next
        new_node = Node(data)
        new_node.next = current.next
        current.next = new_node
        return print(f"index = {int(index)} and data = {data}")


l = Linklist()
inp = input("Enter Input : ").split(" ")
for i in inp :
    l.append(int(i))
print(l)
l.check_data_node()
print(l)
