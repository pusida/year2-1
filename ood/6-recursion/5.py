def findstep(remain, blocked_step=None, max_tiredness=float('inf'), tiredness_values=None, current_tiredness=0):
    if remain == 0:
        if current_tiredness <= max_tiredness:
            return 1
        else:
            return 0
    if remain < 0 or remain in blocked_step or current_tiredness > max_tiredness:
        return 0
    
    one_step = findstep(
                        remain - 1, 
                        blocked_step, 
                        max_tiredness, 
                        tiredness_values, 
                        current_tiredness + tiredness_values[1]
                        )
    
    two_step = findstep(
                        remain - 2, 
                        blocked_step, 
                        max_tiredness, 
                        tiredness_values, 
                        current_tiredness + tiredness_values[2]
                        )
    
    three_step = findstep(
                        remain - 3, 
                        blocked_step, 
                        max_tiredness, 
                        tiredness_values, 
                        current_tiredness + tiredness_values[3]
                        )

    return one_step + two_step + three_step

def findway(height, blocked_step, max_tiredness, tiredness_values):
    return findstep(height, blocked_step, max_tiredness, tiredness_values)

inp = input("Creating a simulated hell scenario: ").split("/")
height = int(inp[0])
thorn = inp[1].split(",")
blocked_step = list(map(int, thorn)) if thorn[0] != '' else []
max_tiredness = float(inp[2])
tiredness = list(map(float, inp[3].split(",")))

case = len(tiredness)
if case == 3:
    tiredness_values = {1: tiredness[0], 2: tiredness[1], 3: tiredness[2]}
elif case == 2:
    tiredness_values = {1: tiredness[0], 2: tiredness[1], 3: 0}
elif case == 1:
    tiredness_values = {1: tiredness[0], 2: tiredness[0], 3: tiredness[0]}
else:
    tiredness_values = {1: 0, 2: 0, 3: 0}

print("Height:", height)
print("thorn At:", thorn)
print("Max Tiredness:", max_tiredness)
print("Tiredness Values:", tiredness_values)
print('-' * 50)

ways = findway(height, blocked_step, max_tiredness, tiredness_values)
print(f"The ways to escape is/are {ways} ways")