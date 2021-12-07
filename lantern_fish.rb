# Create a hash using the input
def fish
    input = []
    lines_array = []
    number_input = []

    File.open(ARGV[0]).each do |line|
        input = line.split(",") 
        input.each do |item|
            number_input << item.to_i
        end   
    end

    # Create a hash using the given number_input
    # tally_hash includes the count for each digit
    tally_hash = number_input.group_by(&:itself).transform_values(&:count)
    # Initialising any missing numbers with a zero
    for i in 0..8
        if tally_hash.key?(i)
            # do nothing
        else
            tally_hash[i] = 0
        end
    end

    256.times do
        # First handling keys 6, 7, 8
        # Saving x so that it is not overwritten when tally_hash[5] is set
        x = tally_hash[6]
        # Summing values from key 0 and key 7
        tally_hash[6] = tally_hash[0] + tally_hash[7]
        tally_hash[7] = tally_hash[8]
        # New fish
        tally_hash[8] = tally_hash[0]            

        # Keys 0 - 5 get the values from previous rounds
        tally_hash[0] = tally_hash[1]
        tally_hash[1] = tally_hash[2]
        tally_hash[2] = tally_hash[3]
        tally_hash[3] = tally_hash[4]
        tally_hash[4] = tally_hash[5]
        tally_hash[5] = x
    end

    sum = 0
    tally_hash.each do |key, value|
        sum = sum + tally_hash[key]
    end

    puts sum
end

fish
