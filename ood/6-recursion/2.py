def check_palindrome(inp):
    if len(inp) <= 1:
        return 'palindrome'
    if inp[0] == inp[-1]:
        inp.pop()
        inp.pop(0)
        return check_palindrome(inp)
    return "not palindrome"


inp = input("Enter Input : ")
list_inp = list(inp)
print(f"'{inp}' is {check_palindrome(list_inp)}")
