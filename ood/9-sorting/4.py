def quick_sort(l):
    if len(l) <= 1:
        return l
    else:
        pivot = l[len(l) // 2]  # เลือก pivot เป็นค่ากลาง
        left = [x for x in l if x < pivot]
        middle = [x for x in l if x == pivot]
        right = [x for x in l if x > pivot]
        return quick_sort(left) + middle + quick_sort(right) 
    
    
def findMedian(l):
    sort_l = quick_sort(l) 
    n = len(sort_l)
    if n % 2 == 1:  
        return float(sort_l[n // 2])
    else: 
        mid1 = sort_l[n // 2 - 1]
        mid2 = sort_l[n // 2]
        return (mid1 + mid2) / 2.0
       
inp = input("Enter Input : ").split(" ")
if inp[0] == 'EX':
    Ans = "quick sort"
    print("Extra Question : What is a suitable sort algorithm?")
    print("   Your Answer : "+Ans)
else:
    inp =list(map(int, inp))
    l = []
    for i in inp:
        l.append(i)
        m = findMedian(l)
        print(f"list = {l} : median = {m}")



