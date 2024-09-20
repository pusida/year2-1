class AVLTree:

    class AVLNode:

        def __init__(self, data, left=None, right=None):

            self.data = data

            self.left = None if left is None else left

            self.right = None if right is None else right

            self.height = self.setHeight()

        def __str__(self):

            return str(self.data)

        def setHeight(self):

            a = self.getHeight(self.left)

            b = self.getHeight(self.right)

            self.height = 1 + max(a, b)

            return self.height

        def getHeight(self, node):

            return -1 if node == None else node.setHeight()

        def balanceValue(self):

            return self.getHeight(self.right) - self.getHeight(self.left)

    def __init__(self, root=None):

        self.root = None if root is None else root

    def add(self, data):

        self.root = self._add(self.root, int(data))
        return self.root

    def _add(self, root, data):
        if root is None:
            return self.AVLNode(data)

        if data < root.data:
            root.left = self._add(root.left, data)
        else:
            root.right = self._add(root.right, data)

        root.setHeight()

        return self.rebalance(root)

    def rebalance(self, root):
        balance = root.balanceValue()
        if balance < -1:  # left
            print("Not Balance, Rebalance!")
            if root.left.balanceValue() > 0:
                root.left = self.rotateRightChild(root.left)
            return self.rotateLeftChild(root)
        elif balance > 1:  # right :
            print("Not Balance, Rebalance!")
            if root.right.balanceValue() < 0:
                root.right = self.rotateLeftChild(root.right)
            return self.rotateRightChild(root)
        return root

    def rotateLeftChild(self, root):
        h = root.left
        root.left = h.right
        h.right = root

        root.setHeight()
        h.setHeight()
        return h

    def rotateRightChild(self, root):
        h = root.right
        root.right = h.left
        h.left = root

        root.setHeight()
        h.setHeight()
        return h

    def postOrder(self):

        print("AVLTree post-order : ", end="")
        AVLTree._postOrder(self.root)
        print()

    def _postOrder(node):

        if node:
            AVLTree._postOrder(node.left)
            AVLTree._postOrder(node.right)
            print(node.data, end=" ")

    def printTree(self):
        AVLTree._printTree(self.root)

    def _printTree(node, level=0):

        if not node is None:

            AVLTree._printTree(node.right, level + 1)

            print('     ' * level, node.data)

            AVLTree._printTree(node.left, level + 1)


def printTree90(node, level=0):
    if node != None:
        printTree90(node.right, level + 1)
        print('     ' * level, node)
        printTree90(node.left, level + 1)


avl1 = AVLTree()
root = None

data = input("Enter Input : ").split()
for e in data:
    print("insert :", e)
    root = avl1.add(int(e))
    printTree90(root)
    print("===============")
