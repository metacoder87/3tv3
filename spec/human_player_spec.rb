            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects


require "human_player"

describe "Player" do
  let (:player) { HumanPlayer.new(:X) }
    describe "#initialize" do
      it "should accept a mark_value, as an arg" do
        player
      end
    end

    describe "#get_position" do
      it "should print '#{@mark_value}, enter a spot on the board with x & y coordinates of 0 - 2 seperated with a space like '1 0''" do
        input = double("1 1\n", :chomp=>"1 1")
        allow(player).to receive(:gets).and_return(input)

        expect { player.get_position }.to output(/enter a spot/).to_stdout
      end

      it "it should call gets.chomp to get input from the user" do
        input = double("1 1\n", :chomp=>"1 1")
        allow(player).to receive(:gets).and_return(input)

        expect(input).to receive(:chomp)
        expect(player).to receive(:gets)
        player.get_position
      end

      it "should return an array containing the player's two input numbers as integers" do
        input_1 = double("2 0\n", :chomp=>"2 0")
        allow(player).to receive(:gets).and_return(input_1)
        expect(player.get_position).to eq([2, 0])

        input_2 = double("1 0\n", :chomp=>"1 0")
        allow(player).to receive(:gets).and_return(input_2)
        expect(player.get_position).to eq([1, 0])
      end
    end
end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects