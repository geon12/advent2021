file = File.open("adventday4.txt")
file_data = file.readlines.map(&:chomp)

def winner_check(card)
    winner = false
    sum = [0,0,0,0,0]
    i = 0
    while i < card.length
        if card[i].sum == 5
            winner = true
            return winner
        end
        
        sum = sum.zip(card[i]).map { |x, y| x + y }
        i += 1
    end
    return sum.include? 5
    
end

def num_look(bingo,num,check)
    i = 0
    
    while i < 5
        j = 0
        while j < 5
            
            if bingo[i][j] == num
                
                check[i][j] = 1
            end
            j += 1
        end
        i += 1
    end
    
    check
end

def card_sum(card,check_card)
    #sum of unmarked cards
    i = 0
    
    total = 0
    while i < 5
        j = 0
        while j < 5
            
            total += card[i][j].to_i * (check_card[i][j] - 1) * -1
            j += 1
        end
        i += 1
    end

    total
end


bingo_numbers = file_data[0]
bingo_numbers = bingo_numbers.split(",")


bingo_cards = []
 
check_cards = []
bingo_card = []
i = 2
while i < file_data.length
    if (file_data[i].length != 0)
        bingo_card.push(file_data[i].split)
    end

    if (bingo_card.length == 5)
        
        bingo_cards.push(bingo_card)
        check_cards.push(Array.new(5) { Array.new(5, 0) })
        bingo_card = []
    end
    i += 1
end
card_winner = 0
winner = false
final_num = 0
for num in bingo_numbers
    i = 0
    
    for card in bingo_cards
        
        check_cards[i] = num_look(card,num,check_cards[i])
        if winner_check(check_cards[i])
            winner = true
            break
        end
        i += 1
    end
    if winner
        card_winner = i
        final_num = num.to_i
        break
    end
    
end

puts card_sum(bingo_cards[card_winner],check_cards[card_winner]) * final_num

#part 2, find last board to win

card_winner = 0
winner = false
final_num = 0
winners = Array.new(bingo_cards.length,0)
for num in bingo_numbers
    i = 0
    winners_sum = 0
    for card in bingo_cards
        
        check_cards[i] = num_look(card,num,check_cards[i])
        if winner_check(check_cards[i])
            winners[i] = 1
            winners_sum = winners.sum
            if winners_sum == 100
                card_winner = i
                final_num = num.to_i
                break
            end
            
        end
        i += 1
    end
    if winners_sum == 100
        break
    end
end


puts card_sum(bingo_cards[card_winner],check_cards[card_winner]) * final_num




