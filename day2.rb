file = File.open("adventday2.txt")
file_data = file.readlines.map(&:chomp)

directions = file_data.map do |direction| 
    direction = direction.split(" ")
    dir = {"direction": direction[0]}
    dir["distance"] =  direction[1].to_i
    dir
end

horizontal = 0
depth = 0
for i in directions do
    if (i[:direction] == "forward")
        horizontal += i["distance"]
    elsif (i[:direction] == "down")
        depth += i["distance"]
    else
        depth -= i["distance"]
    end
end

puts horizontal*depth

horizontal = 0
depth = 0
aim = 0
for i in directions do
    if (i[:direction] == "forward")
        horizontal += i["distance"]
        depth += aim * i["distance"]
    elsif (i[:direction] == "down")
        aim += i["distance"]
    else
        aim -= i["distance"]
    end
end

puts horizontal*depth


