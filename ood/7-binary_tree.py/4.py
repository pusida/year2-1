class Node:
    def __init__(self, data):
        self.data = data
        self.left: Node = None
        self.right: Node = None

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
                    if current.left is None:
                        current.left = Node(data)
                        current = current.left
                    current = current.left

                elif data > current.data:
                    if current.right is None:
                        current.right = Node(data)
                        current = current.right
                    current = current.right
        return self.root

    def printTree(self, node, level=0):
        if node != None:
            self.printTree(node.right, level + 1)
            print('     ' * level, node)
            self.printTree(node.left, level + 1)

    def printPreorder(self, node):
        if node != None:
            print(node, end=" ")
            self.printPreorder(node.left)
            self.printPreorder(node.right)
            
    def printInorder(self, node):
        if node != None:
            self.printInorder(node.left)
            print(node, end=" ")
            self.printInorder(node.right)
    
    def printPostorder(self, node):
        if node != None:
            self.printPostorder(node.left)
            self.printPostorder(node.right)
            print(node, end=" ")
    
    def printBreadth(self, node):
        if node != None:
            queue = [root]
            while queue:
                  node = queue.pop(0)
                  print(node, end=" ")
                  if node.left:
                      queue.append(node.left)
                  if node.right:
                      queue.append(node.right)


T = BST()
inp = [int(i) for i in input('Enter Input : ').split()]
for i in inp:
    root = T.insert(i)
print("Preorder :", end=" ")
T.printPreorder(root)
print()
print("Inorder :", end=" ")
T.printInorder(root)
print()
print("Postorder :", end=" ")
T.printPostorder(root)
print()
print("Breadth :", end=" ")
T.printBreadth(root)
