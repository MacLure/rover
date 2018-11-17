

class Rover

    def initialize
        @x_coordinate = 1
        @y_coordinate = 1
        @direction = "N"
    end

    def show_position
        return "#{@x_coordinate} #{@y_coordinate} #{@direction}"
    end

    def read_instruction(instruction)
        instruction_array = instruction.split('')
        instruction_array.each do |char|
            if char == "m"
                move
            elsif char == "l" || char == "r"
                turn(char)
            else
                "invalid"
            end
        end
    end

    def move
        if @direction == "N"
            @y_coordinate += 1
        elsif @direction == "S"
            @y_coordinate -= 1
        elsif @direction == "E"
            @x_coordinate += 1
        else
            @x_coordinate -= 1
        end
    end

    def turn(l_or_r)
        if @direction == "N"
            if l_or_r == "l" 
                @direction = "W"
            elsif  l_or_r == "r"
                @direction = "E"
            else
                puts "invalid direction.  Please input 'l or 'r'."
            end
        elsif @direction == "S"
            if l_or_r == "l" 
                @direction = "E"
            elsif  l_or_r == "r"
                @direction = "W"
            else
                puts "invalid direction.  Please input 'l or 'r'."
            end
        elsif @direction == "E"
            if l_or_r == "l" 
                @direction = "N"
            elsif  l_or_r == "r"
                @direction = "S"
            else
                puts "invalid direction.  Please input 'l or 'r'."
            end 
        else
            if l_or_r == "l" 
                @direction = "S"
            elsif  l_or_r == "r"
                @direction = "N"
            else
                puts "invalid direction.  Please input 'l or 'r'."
            end
        end
    end
end

my_rover = Rover.new
roving = true

while roving == true
    puts "Rover position: #{my_rover.show_position}"
    puts "-----------------------------------"
    puts "enter a series of instructions 'm' = move, 'l' = left, 'r' - right:"
    print "> "
    user_instructions = gets.chomp
    my_rover.read_instruction(user_instructions)
    puts "-----------------------------------"
end

# try to make a new interface class