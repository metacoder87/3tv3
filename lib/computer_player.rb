            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3


class ComputerPlayer

# ComputerPlayer#initialize

# An instance of ComputerPlayer should have the same interface as a HumanPlayer. 
# This means that both classes should have the same method names, but may implement 
# these methods using different logic. Having a consistent interface for all types 
# of players will allow us to use computers and humans interchangeably in a game 
# with no annoying side-effects. The #initialize for a computer should be identical 
# to that of a human.

        attr_reader :mark_value 

    def initialize(mark_value)
        @mark_value = mark_value
    end

# ComputerPlayer#get_position(legal_positions)

# Assume that this method takes in an array of positions as an argument. The method 
# should return a random position from the array. To make gameplay clear, print a 
# message saying the computer's mark along with the position they chose.

    def get_position(legal_positions)
        chosen = legal_positions.sample
        puts "#{@mark_value} chose #{chosen}."
        chosen
    end

end