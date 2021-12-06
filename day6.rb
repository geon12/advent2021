file = File.open("adventday6.txt")
file_data = file.readlines.map(&:chomp)

fish_state = file_data[0].split(",").map(&:to_i)
def lantern_fish(fish_state, days)
    i = 0
    while i < days
        new_fish = 0
        fish_state = fish_state.map { |fish|
            if (fish == 0)
                new_fish += 1
                fish = 6
            else
                fish -= 1
            end
        }
        j = 0 
        while j < new_fish
            fish_state.push(8)
            j += 1
        end
        i += 1
    end
    fish_state.length
end

puts lantern_fish(fish_state,80)


fish_totals = {}
i = 0 
while i <= 8
    fish_totals[i] = 0
    i += 1
end

for state in fish_state
    fish_totals[state] = fish_totals[state] + 1
end

i = 0
while i < 256
    new_fish_totals = {}
    for key in fish_totals.keys
        if key == 8
            new_fish_totals[key] = fish_totals[0]
        elsif key == 6
            new_fish_totals[key] = fish_totals[7] + fish_totals[0]
        else
            new_fish_totals[key] = fish_totals[key + 1]
        end
        
    end
    fish_totals = new_fish_totals
    i += 1
end
total = 0
for key in fish_totals.keys
    total += fish_totals[key]
end

puts total