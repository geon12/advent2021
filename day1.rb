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