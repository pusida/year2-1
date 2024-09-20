class Node():
    def __init__(self, data, next=None):
        self.data = data
        self.next = next


def createLL(l=[]):
    head = Node(l[0])
    current = head
    for i in l[1:]:
        current.next = Node(i)
        current = current.next
    return head


def printLL(h):
    current = h.next
    result = str(h.data)
    while current is not None:
        result += " " + str(current.data)
        current = current.next
    return result


def SIZE(head):
    count = 0
    current = head
    while current:
        count += 1
        current = current.next
    return count


def splitLL(head, size):
    if size == 0 or head is None:
        return None, None
    current = head
    prev = None
    for _ in range(size):
        prev = current
        current = current.next
    if prev:
        prev.next = None
    return head, current


def bottom_up(head, percent, size):
    if head is None or size == 0:
        return head
    split_point = int(size * percent / 100)
    if split_point == 0 or split_point == size:
        return head
    first_part, last_part = splitLL(head, split_point)
    if not last_part:
        return first_part
    new_head = last_part
    current = last_part
    while current.next:
        current = current.next
    current.next = first_part
    return new_head


def riffle(head, percent, size):
    if head is None or size == 0:
        return head
    riffle_point = int(size * percent / 100)
    if riffle_point == 0 or riffle_point == size:
        return head
    first_part, last_part = splitLL(head, riffle_point)
    dummy = Node(0)
    current = dummy
    while first_part and last_part:
        current.next = first_part
        first_part = first_part.next
        current = current.next
        current.next = last_part
        last_part = last_part.next
        current = current.next
    current.next = first_part if first_part else last_part
    return dummy.next


def scramble(head, b, r, size):
    head1 = bottom_up(head, b, size)
    print(f"BottomUp {b:.3f} % : {printLL(head1)}")
    head2 = riffle(head1, r, size)
    print(f"Riffle {r:.3f} % : {printLL(head2)}")
    return head1, head2


inp1, inp2 = input("Enter Input : ").split("/")
print('-' * 50)
for i in inp2.split('|'):
    h = createLL(inp1.split())
    h1 = createLL(inp1.split())
    h2 = createLL(inp1.split())
    print("Start : {0}".format(printLL(h)))
    k = i.split(',')
    if k[0][0] == 'B' and k[1][0] == 'R':
        h_bottom, h_riffle = scramble(h, float(k[0][2:]), float(k[1][2:]), SIZE(h))
        print(f"Deriffle {float(k[1][2:]):.3f} % : {printLL(bottom_up(h2, float(k[0][2:]), SIZE(h2)))}")
        print(f"Debottomup {float(k[0][2:]):.3f} % : {printLL(h1)}")
    elif k[0][0] == 'R' and k[1][0] == 'B':
        h_bottom, h_riffle = scramble(h, float(k[1][2:]), float(k[0][2:]), SIZE(h))
        print(f"Deriffle {float(k[0][2:]):.3f} % : {printLL(bottom_up(h2, float(k[1][2:]), SIZE(h2)))}")
        print(f"Debottomup {float(k[1][2:]):.3f} % : {printLL(h1)}")
    print('-'*50)
