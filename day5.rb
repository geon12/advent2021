file = File.open("adventday5.txt")
file_data = file.readlines.map(&:chomp)

file_data = file_data.map {|line| 
    line[" -> "] = ","
    new_line = line.split(",")
    new_line.map{|num| num.to_i}
}

def check_horizontal_or_vertical(points)

    horizontal = ((points[1] - points[3]) == 0)
    vertical = ((points[0] - points[2]) == 0)
    {"horizontal": horizontal, "vertical": vertical}
end

points = {}

for line in file_data
    horizontal_or_vertical = check_horizontal_or_vertical(line)
    
    if horizontal_or_vertical[:horizontal] || horizontal_or_vertical[:vertical]
        
        if horizontal_or_vertical[:horizontal]
           
            x = line[0]
            y = line[1]

            if x < line[2] 
                condition = 1
            else
                condition = -1
            end
            while x != (line[2] + condition)
                
                
                if points[[x,y]]
                    
                    points[[x,y]] = points[[x,y]] + 1
                else
                    points[[x,y]] = 1
                end
                if x < (line[2] + condition)
                    x += 1
                else
                    x -= 1
                end
            end
        else
            x = line[0]
            y = line[1]

            if y < line[3] 
                condition = 1
            else
                condition = -1
            end
            while y != (line[3] + condition)
               
                
                if points[[x,y]]
                    
                    points[[x,y]] = points[[x,y]] + 1
                else
                    points[[x,y]] = 1
                end
                
                if (y < line[3] +condition)
                    y += 1
                else
                    y -= 1
                end
            end

        end
        
    end
end
total = 0
for point in points
    if point[1] > 1
        total += 1
    end
end

puts total


for line in file_data
    horizontal_or_vertical = check_horizontal_or_vertical(line)
    
    if !horizontal_or_vertical[:horizontal] && !horizontal_or_vertical[:vertical]
        slopex = line[2] - line[0]
        slopey = line[3] - line[1]
 
        x = line[0]
        y = line[1]

        loop do
            
            if points[[x,y]]
                    
                points[[x,y]] = points[[x,y]] + 1
            else
                points[[x,y]] = 1
            end
            
            if x == line[2] && y == line[3]
                break
            end
            if slopex > 0
                x += 1
            else
                x -= 1
            end
            if slopey > 0
                y += 1
            else
                y -= 1
            end
        end

    end
end

total = 0
for point in points
    if point[1] > 1
        total += 1
    end
end

puts total

