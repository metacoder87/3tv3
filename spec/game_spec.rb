            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects


require 'game'
require 'board'

describe "Game" do
  let(:game) { Game.new(3) }

    describe "#initialize" do
      it "should accept a number, n, as an arg" do
        game
      end

      it "should set @board to an instance of Board::new" do
        board = game.instance_variable_get(:@board)
        expect(board).to be_instance_of(Board)
      end

      it "should set @current_player to the first player" do
        player = game.instance_variable_get(:@current_player)
        expect(player).to be($player_1)
      end
    end

    # describe "get_marks" do
    #   it "should print 'Player 1 enter your mark : '" do
    #     input = double(:X, :chomp=>"X")
    #     allow(game).to receive(:gets).and_return(input)

    #     expect { game.get_marks }.to output(/Player 1 enter your mark : /).to_stdout
    #   end

    #   it "it should call gets.chomp to get input from the user" do
    #     input = double(:X, :chomp=>"X")
    #     allow(game).to receive(:gets).and_return(input)

    #     expect(input).to receive(:chomp)
    #     expect(game).to receive(:gets)
    #     game.get_marks
    #   end
    # end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects