            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3



require "human_player"

describe "HumanPlayer" do
  let (:player) { HumanPlayer.new(:X) }
    describe "#initialize" do
      it "should accept a mark_value, as an arg" do
        player
      end
    end

    describe "#get_position" do
      positions = [[1, 2], [3, 4], [4, 3]]
      it "should print '#{@mark_value}, enter a spot on the board with x & y coordinates of 0 - 2 seperated with a space like '1 0''" do
        input = double("1 2\n", :chomp=>"1 2")
        allow(player).to receive(:gets).and_return(input)

        expect { player.get_position(positions) }.to output(/enter a spot/).to_stdout
      end

      it "it should call gets.chomp to get input from the user" do
        input = double("1 2\n", :chomp=>"1 2")
        allow(player).to receive(:gets).and_return(input)

        expect(input).to receive(:chomp)
        expect(player).to receive(:gets)
        player.get_position(positions)
      end

      it "should return an array containing the player's two input numbers as integers" do
        input_1 = double("3 4\n", :chomp=>"3 4")
        allow(player).to receive(:gets).and_return(input_1)
        expect(player.get_position(positions)).to eq([3, 4])

        input_2 = double("4 3\n", :chomp=>"4 3")
        allow(player).to receive(:gets).and_return(input_2)
        expect(player.get_position(positions)).to eq([4, 3])
      end
    end
end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3