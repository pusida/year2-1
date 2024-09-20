# ข้อมูลสัญลักษณ์และลำดับการ์ด
symbol_order = {'C': 0, 'D': 1, 'H': 2, 'S': 3}
num_order = {'2': 0, '3': 1, '4': 2, '5': 3, '6': 4, '7': 5, '8': 6, '9': 7, 'T': 8, 'J': 9, 'Q': 10, 'K': 11, 'A': 12}

def check_card(card):
    if len(card) == 2:
        symbol, num = card[0], card[1]
    elif len(card) == 3:  
        symbol, num = card[0], card[1:]
    else:
        return False
    return symbol in symbol_order and num in num_order

def num_key(card):
    num = card[1]
    symbol = card[0]
    return num_order[num], symbol_order[symbol]

def symbol_key(card):
    symbol = card[0]
    num = card[1]
    return symbol_order[symbol], num_order[num]

def sort_cards(inp):
    if '/' not in inp or not inp.strip('/'):
        print("No valid cards to sort.")
        return
    
    c_inp, sort_type = inp.split("/")
    card_inp = c_inp.split(',')
    valid_cards = []
    seen_cards = set()

    for card in card_inp:
        if not check_card(card):
            print(f"Error: {card} is an invalid card")
            
        elif card in seen_cards:
            print(f"Error: Duplicate card found - {card}")
            
        else:
            valid_cards.append(card)
            seen_cards.add(card)

    if len(valid_cards) == 0:
        print("No valid cards to sort.")
        return

    if sort_type == "num":
        sorted_cards = insertion_sort(valid_cards, num_key)
    elif sort_type == "symbol":
        sorted_cards = insertion_sort(valid_cards, symbol_key)
    print(f"Sorted cards : {' '.join(sorted_cards)}")

def insertion_sort(cards, key):
    for i in range(1, len(cards)):
        current_card = cards[i]
        j = i - 1
        while j >= 0 and key(cards[j]) > key(current_card): 
            cards[j + 1] = cards[j]
            j -= 1
        cards[j + 1] = current_card
    return cards

print("Have fun with sort card")
inp = input("Enter Input: ")
sort_cards(inp)