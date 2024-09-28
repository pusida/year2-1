def findMedian(arr):
    bubble_sort(arr) 
    n = len(arr)

    if n % 2 == 1:  
        return float(arr[n // 2])
    else:  
        mid1 = arr[n // 2 - 1]
        mid2 = arr[n // 2]
        return (mid1 + mid2) / 2.0
    
def bubble_sort(inp):
    for i in range(len(inp)-1, 0, -1):
        swapped = False

        for j in range(i):
            if inp[j] > inp[j+1]:
                swapped = True
                inp[j], inp[j+1] = inp[j+1], inp[j]

        if not swapped:
            return
    
l = [e for e in input("Enter Input : ").split()]
if l[0] == 'EX':
    Ans = "quick sort"
    print("Extra Question : What is a suitable sort algorithm?")
    print("   Your Answer : "+Ans)
else:
    l=list(map(int, l))

l1 = []
l2 = []

for i in l :
    l1.append(i)
    l2.append(i)
    median = findMedian(l1)
    print(f"list = {l2} : median = {median}")