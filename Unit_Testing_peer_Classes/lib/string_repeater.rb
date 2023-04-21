class StringRepeater
    def initialize(io)
        @io = io 
    end

    def run 
        @io.puts "Hello. I will repeat a string many times."
        @io.puts "Please enter a string"
        text = @io.gets.chomp
        @io.puts "Please enter a number of repeats"
        number = @io.gets.chomp.to_i
        @io.puts "Here is your result:"
        @io.puts text * number
    end 
end



# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX