            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3


    require_relative 'board'
    require_relative 'human_player'

class Game

# The Game class will be the main class that houses the instances of Board and 
# HumanPlayer required for gameplay. It will be responsible for passing data 
# between the board and players. It will also serve to contain the main game loop.
# Be sure to require your board.rb and human_player.rb files into game.rb.

# Game#initialize(player_1_mark, player_2_mark)

# An instance of Game should have instance variables for player one, player two, 
# and the board. Design the #initialize method to accept the mark values to be 
# used for the players.
# You should also initialize an instance variable to contain the current player. 
# By default, player one should begin as the current player.

# Game#initialize (refactor)

# Refactor this method to accept an option hash instead of an arbitrary number of 
# marks (we previously implemented that in version 2). A hash is a great choice 
# here because we now need to communicate two details per player: their mark and 
# whether they are human or computer. We also have the upshot of hash keys necessarily 
# being unique. This is convenient because for proper gameplay we must have unique 
# marks among the players!

# Assume that the keys of the hash are the marks and the values are booleans. 
# Interpret false as a human and true as a computer. The order of players in the 
# hash should dictate the order that they take their turns.

    def initialize(n, hash = {})
        @players = []
        @marks = []
        @hash = hash.each_pair do |mark, boo|
            if boo == true
                @players << ComputerPlayer.new(mark)
            else
                @players << HumanPlayer.new(mark)
            end
            @marks << mark
        end
        @current_player = @players[0]
        @current_mark = @marks.first
        @board = Board.new(n)
    end

# Game#switch_turn

# This method should set the current player to the other player. Calling this 
# method repeatedly should switch the current player back and forth between the 
# two players.

# This method is critical for gameplay so be sure to test it in pry.

    def switch_turn
        @current_mark = @marks.rotate!.first
        @current_player = @players.rotate!.first
    end

# Game#play

# This method will contain the main game loop. Here is some psuedocode for the loop:
# while there exists empty positions on the board 
#     print the board
#     get a position from the current player
#     place their mark at that position of the board
#     check if that user has won
#     if they win, print out a 'victory' message saying who won 
#     and return to end the game
# otherwise they did not win, so switch turns
#     if we finish the while loop without returning, that means there are no more 
#         empty positions on the board and noone has won, so print a 'draw' message
#     Test your game in pry. Play a few games by creating an instance of Game and 
#     invoking #play on it. After a game is over, be sure to create a new instance 
#     of Game to play again, this is the only way to get a fresh board. Some 
#     scenarios to test are: player one winning, player two winning, and a draw.
# If any errors are raised during gameplay, your game loop and #play method will 
# end immediately, so you'll have to start a new game and retry!

# Game#play (refactor)

# Only one more refactor and we'll have our final product! Refactor this method 
# slightly to account for our new argument required for #get_position. That is, 
# be sure to pass in the board's legal positions for the player to choose from.

    def play
        while @board.empty_positions?
            @board.print
            $pot = @current_player.get_position(@board.legal_positions)
            @board.place_mark($pot, @current_mark)

            if @board.win?(@current_mark)
                @board.print
                return "Victory for #{@current_mark}"
            else switch_turn
            end
        end
            @board.print
        return "Draw Game, no winner."
    end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3