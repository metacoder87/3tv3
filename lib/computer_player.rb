            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3


    # computer_player

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