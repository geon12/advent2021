file = File.open("adventday1.txt")
file_data = file.readlines.map(&:chomp)

depths = file_data.map { |num| num.to_i}

total = 0
i = 1
while i < depths.length
    if (depths[i] > depths[i-1])
        total += 1

    end
    i += 1
end

puts total

total = 0
i = 3
window1 = depths[0] + depths[1] + depths[3]
while i < depths.length
    new_window = window1 + depths[i] - depths[i-3]
    if ( new_window > window1)
        total += 1
    end
    window1 = new_window
    i += 1
end
puts total