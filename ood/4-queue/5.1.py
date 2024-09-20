s = input("Enter Input (Normal, Mirror) : ").split()
s[0] = list(s[0])
s[1] = list(s[1])
s[1].reverse()

stack = list()          #เก็บตัวที่พร้อมจะระเบิด(ตัวซ้ำ)
mirror_q = []           #เก็บไอเทมฝั่งกระจก
mirror_explosive = 0    #นับ ระเบิดรอปริ้น

i = 0                   
while i < len(s[1]):    
    if not stack or s[1][i] == stack[0]:    #stackว่างหรือ เป็นตัวเดียวกันกับstackใน
        stack.append(s[1][i])   
    elif s[1][i] != stack[0]:      #ถ้าไม่เหมือน ให้รีเซ็ต
        stack = [s[1][i]]          

    if len(stack) == 3:            #ครบ3ตัวให้ยัดใส่คิวแล้วป๊อปตัวที่ระเบิดออกจากs[1]  แล้วรีเเซ็ตให้เริ่มวนลูปใหม่
        mirror_q.append(stack.pop())
        stack = []
        s[1].pop(i-2)
        s[1].pop(i-2)
        s[1].pop(i-2)
        mirror_explosive += 1
        i = -1
    i += 1

i=0
stack = list()
normal_q = []
normal_explosive = 0
fail_explosive = 0
while i < len(s[0]):
    if not stack or s[0][i] == stack[0]:
        stack.append(s[0][i])
    elif s[0][i] != stack[0]:
        stack = [s[0][i]]

    if len(stack) == 3:
        if len(mirror_q) == 0 :
            stack = []
            s[0].pop(i-2)
            s[0].pop(i-2)
            s[0].pop(i-2)
            normal_explosive += 1
        else :
            temp = mirror_q.pop(0)
            if temp != s[0][i]:
                s[0].insert(i, temp)
            else :                      #ถ้าตัวในqเหมือนกับในstack ให้ระเบิดออกมา
                stack = []
                s[0].pop(i-2)
                s[0].pop(i-2)
                fail_explosive += 1
        i = -1
    i += 1




print("NORMAL :")
print(len(s[0])) 

if not s[0] :
    print("Empty")
else :
    print("".join(s[0][::-1]))
print(f"{normal_explosive} Explosive(s) ! ! ! (NORMAL)")
if fail_explosive:
    print(f"Failed Interrupted {fail_explosive} Bomb(s)")


print("------------MIRROR------------")


print(": RORRIM")
print(len(s[1]))
print("".join(s[1][::-1])) if s[1] else print("ytpmE")
print(f"(RORRIM) ! ! ! (s)evisolpxE {mirror_explosive}")