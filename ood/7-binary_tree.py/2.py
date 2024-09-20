class Node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
    
    def __str__(self):
        return str(self.data)

class BST:
    def __init__(self):
        self.root = None

    def insert(self, data):
        self.root = self._insert(self.root, int(data))
        return self.root
    
    def _insert(self, root, data):
        if root is None :
            return Node(data)
        if data < root.data:
            root.left = self._insert(root.left, data)
        else :
            root.right = self._insert(root.right, data)
        return root
    def printTree(self, node, level = 0):
        if node != None :
            self.printTree(node.right, level+1)
            print("     " * level, node)
            self.printTree(node.left, level+1)
            
    def reverseTree(self, node):
        if node != None:
            node.left, node.right = node.right, node.left
            self.reverseTree(node.left)
            self.reverseTree(node.right)
   
        

T = BST()
inp = [int(i) for i in input('Enter Input : ').split()]
for i in inp:
    root = T.insert(i)
print("Before:")
T.printTree(root)
T.reverseTree(root)
print("After:")
T.printTree(root)