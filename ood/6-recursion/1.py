def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n-1)


inp = int(input("Enter Number : "))
print(f"{inp}! = {factorial(inp)}")
