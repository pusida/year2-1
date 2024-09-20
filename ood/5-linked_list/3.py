class Node:
    def __init__(self, data=None, next=None):
        self.data = data
        self.next = next

    def __str__(self):
        return str(self.data)


def createList(l=[]):
    head = Node(l[0])
    current = head

    for i in l[1:]:
        current.next = Node(i)
        current = current.next

    return head


def printList(H):
    current = H
    result = current.data
    while current.next is not None :
        current = current.next
        result+= ' ' + current.data
    return result


def mergeOrderesList(p, q):
    current_p = p
    current_q = q
    list_check = [current_p.data]
    while current_p.next is not None :
        current_p = current_p.next
        list_check.append(current_p.data)
    list_check.append(current_q.data)
    while current_q.next is not None :
        current_q = current_q.next
        list_check.append(current_q.data)
    m_head = createList(list_check)
    swapped = True 
    while swapped :
        swapped = False
        current_b = m_head
        while current_b.next is not None:
            if int(current_b.data) > int(current_b.next.data):
                current_b.data, current_b.next.data = current_b.next.data, current_b.data
                swapped = True
            current_b = current_b.next
    return m_head






    

inp = [i.split(",") for i in input("Enter 2 Lists : ").split(" ")]
LL1 = createList(inp[0])
LL2 = createList(inp[1])
print('LL1 : ', end='')
print(printList(LL1))
print('LL2 : ', end='')
print(printList(LL2))
m = mergeOrderesList(LL1, LL2)
print('Merge Result : ', end='')
print(printList(m))
