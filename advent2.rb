def move
    x = 0
    y = 0
    input = []
    direction_array = []

    File.open(ARGV[0]).each do |line|
        input << line
    end

    input.each do |item|
        # trim text so that direction and number are separated
        str = item.split(/\s/)
        direction_array << str
    end

    direction_array.each do |test|
      if test[0] == "forward"
        x = x + test[1].to_i
      elsif test[0] == "down"
        y = y + test[1].to_i
      elsif test[0] == "up"
        y = y - test[1].to_i 
      end       
    end

    puts x * y
end

def aim_move
    x = 0
    y = 0
    aim = 0
    input = []
    direction_array = []

    File.open(ARGV[0]).each do |line|
        input << line
    end

    input.each do |item|
        # trim text so that direction and number are separated
        str = item.split(/\s/)
        direction_array << str
    end

    direction_array.each do |test|
      if test[0] == "forward"
        x = x + test[1].to_i
        y = aim * test[1].to_i + y
      elsif test[0] == "down"
        aim = aim + test[1].to_i
      elsif test[0] == "up"
        aim = aim - test[1].to_i
      end    
    end

    puts x * y
end

aim_move