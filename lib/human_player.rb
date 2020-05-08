            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects

class HumanPlayer

# The HumanPlayer class is responsible for holding information about the user and 
# prompting them to enter a position for gameplay.

# HumanPlayer#initialize(mark_value)

# We'll allow a player to use any mark they like, so an instance of HumanPlayer 
# should have a instance variable to store their mark. The value of this mark 
# should be provided as an argument when creating a new player. Consider adding 
# a getter method for the player's mark, this may be useful later!

    attr_reader :mark_value 

    def initialize(mark_value)
        @mark_value = mark_value
    end

# HumanPlayer#get_position

# This method should prompt and allow the user to enter a valid row col position. 
# We recommend that you ask the user to enter the position as two numbers with a 
# space between them. Your method should return their entered position as an array 
# of the form [row, col] so that it is compatible with the design of our previous 
# Board methods. For usability, raise an error when they fail to enter a position 
# in the specified format, such as if they only enter a single number, use letters, 
# or have too many spaces.

    def get_position
        puts "#{@mark_value}, enter a spot on the board with x & y coordinates seperated with a space like '1 0'"
        move = gets.chomp.split(" ")
        move.map! { |ele| ele.to_i }
    end

# No need to verify if the position they entered is a valid position in this class. 
# That validation requires knowledge of the board and we want to keep our concerns 
# separated. Besides, you previously implemented that logic in Board#valid? and 
# Board#empty?.

# It's also helpful if you state the player's mark when asking them to enter a move, 
# so we know whose turn it is.

# Checkpoint - Test often, we're only human after all
# This is a great time to test your work! Load your HumanPlayer class into pry and test it.

end


            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects