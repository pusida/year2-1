class Node():
    def __init__(self, data, next=None):
        self.data = data
        self.next = next


class Linkedlist:
    def __init__(self):
        self.head = None
        self.size = 0

    def isEmpty(self):
        return self.head is None

    def append(self, data):
        if self.head is None:
            self.head = Node(data)
            return
        current = self.head
        while current.next is not None:
            current = current.next
        current.next = Node(data)

    def __str__(self) -> str:
        if self.head is None:
            return "Empty"
        result = str(self.head.data)
        current = self.head.next
        while current is not None:
            result += '->' + str(current.data)
            current = current.next
        return result

    def set_next(self, index1, index2):
        if self.head is None:
            return "Error! {list is empty}"
        current_index1 = self.check_index(index1)
        current_index2 = self.check_index(index2)
        if isinstance(current_index1, Node):
            if isinstance(current_index2, Node):
                current_index1.next = current_index2
                return f"Set node.next complete!, index:value = {index1}:{str(current_index1.data)} -> {index2}:{str(current_index2.data)}"
            self.append(index2)
            return f"index not in length, append : {index2}"
        return current_index1

    def check_index(self, index):
        current = self.head
        if index <= 0:
            return current
        for i in range(index):
            if current.next is None:
                s = "{index not in length}"
                return f"Error! {s}: {index}"
            current = current.next
        return current

    def check_loop(self):
        slow = self.head
        fast = self.head

        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

            if slow == fast:
                return "Found Loop"

        return "No Loop"

l = Linkedlist()
inp = [i.split(" ") for i in input("Enter input : ").split(",")]
for i in inp:
    if i[0] == 'A':
        l.append(i[1])
        print(l)
    elif i[0] == 'S':
        sp = i[1].split(":")
        print(l.set_next(int(sp[0]), int(sp[1])))
print(l.check_loop())
if l.check_loop() == "No Loop":
    print(l)
