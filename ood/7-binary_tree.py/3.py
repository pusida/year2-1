class Node:
    def __init__(self, data):
        self.data : int = data
        self.left : Node = None
        self.right : Node = None
    
    def __str__(self):
        return str(self.data)
    
class BST:
    def __init__(self):
        self.root = None

    def insert(self, data):
        if self.root is None:
            self.root = Node(data)
        elif self.root:
            current = self.root
            while current is not None:
                if data < current.data:
                    if current.left is None :
                        current.left = Node(data)
                        current = current.left
                    current = current.left

                elif data > current.data:
                    if current.right is None :
                        current.right = Node(data)
                        current = current.right
                    current = current.right
        return self.root

    def printTree(self, node, level = 0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)
    
    def multiply3(self, node, k):
        if node != None:
            if node.data > k :
                node.data = node.data*3
            self.multiply3(node.left, k)
            self.multiply3(node.right, k)

T = BST()
inp = [i.split(" ") for i in input("Enter Input : ").split("/")]
for i in inp[0]:
    root = T.insert(int(i))
T.printTree(root)
print("--------------------------------------------------")
T.multiply3(root, int(inp[1][0]))
T.printTree(root)