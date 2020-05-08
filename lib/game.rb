            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects


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

    def initialize(n, *marks)
        @players = []
        @marks = marks.each do |mark| 
            @players << HumanPlayer.new(mark)
        end
        @current_player = @players[0]
        @current_mark = @marks[0]
        @board = Board.new(n)
    end

    # def get_marks
    #     puts 'Are you ready for a game of Tic-Tac-Toe'

    #     puts 'Player 1 enter your mark : '
    #         $player_1 = HumanPlayer.new($p_1_mark = gets.chomp.to_sym)

    #     puts 'Player 2 enter your mark : '
    #         $player_2 = HumanPlayer.new($p_2_mark = gets.chomp.to_sym)
               
    #     puts "Player 1 you are the #{$p_1_mark} and Player 2 you are the #{$p_2_mark}"
    # end

# Game#switch_turn

# This method should set the current player to the other player. Calling this 
# method repeatedly should switch the current player back and forth between the 
# two players.

# This method is critical for gameplay so be sure to test it in pry.

    def switch_turn
        @current_mark = @marks.rotate!.first
        @current_player = @players.rotate!.first
    end

    # def cp_mark
    #     if @current_player == $player_1
    #         @player_1_mark
    #     else @player_2_mark
    #     end
    # end

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

    def play
        while @board.empty_positions?
            @board.print
            $pot = @current_player.get_position
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
            # https://github.com/metacoder87/App-Academy-Projects