def find_exponent(base, exponent):
    if exponent > 1:
        base * base
        exponent -= 1
        return base * find_exponent(base, exponent)
    if exponent <= 1:
        if exponent == 1:
            return base
        else:
            return 1

inp = input("Enter Input a b : ").split(" ")
print(find_exponent(int(inp[0]), int(inp[1])))
