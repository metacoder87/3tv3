            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3


require 'game'
require 'board'

describe "Game" do
  let(:game) { Game.new(4, X: false, Y: true, Z: false) }

    describe "#initialize" do
      it "should accept a number, n, as an arg and a hash" do
        game
      end

      it "should set @board to an instance of Board::new" do
        board = game.instance_variable_get(:@board)
        expect(board).to be_instance_of(Board)
      end

      it "should set @current_player to the first player" do
        player = game.instance_variable_get(:@current_player)
        first_player = game.instance_variable_get(:@players)
        expect(first_player[0]).to be(player)
      end

    end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3