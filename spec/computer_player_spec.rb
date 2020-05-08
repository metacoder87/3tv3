            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3



require "computer_player"

describe "ComputerPlayer" do
  let (:hal_9000) { ComputerPlayer.new(:X) }
    describe "#initialize" do
      it "should accept a mark_value, as an arg" do
        hal_9000
      end
    end

    describe "#get_position" do
      positions = [[1, 2], [3, 4], [4, 3]] 
      it "should choose from the available positions" do
        expect(positions).to include(hal_9000.get_position(positions))
        expect(positions).to include(hal_9000.get_position(positions))
      end
    end
end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3