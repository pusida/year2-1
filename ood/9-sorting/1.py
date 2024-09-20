inp = [int(i) for i in input("Enter Input : ").split()]
swap = True
num_step = 0
last_step = False

while swap:
    swap = False
    i = 0
    move = "None"
    while i <= len(inp) - 2:
        if inp[i] > inp[i+1]:
            inp[i], inp[i+1] = inp[i+1], inp[i]
            swap = True
            move = inp[i+1]
        i += 1
    num_step += 1

    if num_step == len(inp) - 1:
        print(f"last step : {inp} move[{move}]")
        last_step = True
        
    elif swap == True:
        print(f"{num_step} step : {inp} move[{move}]")

if move == "None" and not last_step:
    print(f"last step : {inp} move[{move}]")
