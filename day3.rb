file = File.open("adventday3.txt")
file_data = file.readlines.map(&:chomp)

numZero = []

file_data[0].length.times do
    numZero.push(0)
end

for binary in file_data
    binary.each_char.with_index {|bit,index|
        if (bit == '0')
            numZero[index] += 1
        end
    }
end
gamma_bits = ""
epsilon_bits = ""
numZero.each {|bit_count| 
    if (bit_count >= (file_data.length / 2) )
        gamma_bits += "0"
        epsilon_bits += "1"
    else
        gamma_bits += "1"
        epsilon_bits += "0"
    end
}

def binary_to_integer(binary)
    i =  0
    j = binary.length - 1
    total = 0
    while i < binary.length
        total += binary[i].to_i * (2 ** j)
        i += 1
        j -= 1
    end

    total
end

gamma_rate = binary_to_integer(gamma_bits)
epsilon_rate = binary_to_integer(epsilon_bits)

puts gamma_rate * epsilon_rate


def rating(data,position, oxy_or_co2)
    
    if (data.length == 1) 
        return  data[0]
    end
    zero_total = 0
    for binary in data
       if (binary[position] == '0')
            zero_total += 1
       end
    end

    most_common = '0'
    if (zero_total > (data.length/2) && oxy_or_co2 == "oxygen")
        most_common = '0'
    elsif (zero_total <= (data.length/2) && oxy_or_co2 == "oxygen")
        most_common = '1'

    elsif (zero_total <= (data.length/2) && oxy_or_co2 == "co2")
        most_common = '0'
    else 
        most_common = '1'
    end
    
    filtered_data = data.filter {|binary| binary[position] == most_common }
    
    return rating(filtered_data,position+1,oxy_or_co2)
end

oxygen_generator_rating = rating(file_data,0,"oxygen")
co2_scrubber_rating = rating(file_data,0,"co2")

puts binary_to_integer(oxygen_generator_rating) * binary_to_integer(co2_scrubber_rating)