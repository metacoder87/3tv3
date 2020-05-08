            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects


require "board"


describe "Board" do
  let(:board) { Board.new(10) }

    describe "#initialize" do
      it "should accept a number, n, as an arg" do
        board
      end

      it "should set @grid to be a 2D array with n rows and n columns" do
        grid = board.instance_variable_get(:@grid)
        expect(grid.length).to eq(10)
        expect(grid[0].length).to eq(10)

        small_grid = Board.new(4).instance_variable_get(:@grid)
        expect(small_grid.length).to eq(4)
        expect(small_grid[0].length).to eq(4)
      end

      it "should set all elements of @grid to :_" do
        grid = board.instance_variable_get(:@grid)
        nil_grid = Array.new(10) { Array.new(10, :_) }
        expect(grid).to eq(nil_grid)
      end

      it "should make each subarray of @grid refer to a distinct array" do
        grid = board.instance_variable_get(:@grid)
        expect(grid[0]).to_not be(grid[1])
      end
    end

    describe "#valid?" do
      it "should accept an array of a pair of indices in the form [row, column] representing a position on the @board" do
        position = [0, 0]
        expect{board.valid?(position)}.to_not raise_error
      end

      it "should return true if the board contains the given position" do
        grid = board.instance_variable_get(:@grid)

        pos_1 = [1, 0]
        expect(board.valid?(pos_1)).to eq(true)
      end

      it "should return false if the given position is beyond the boundaries" do
        grid = board.instance_variable_get(:@grid)
        length = board.instance_variable_get(:@length)
        pos_2 = [length + 2, length + 4]
        expect(board.valid?(pos_2)).to be(false)
        
      end
    end

    describe "#empty?" do
      it "should accept an array of a pair of indices in the form [row, column] representing a position on the @board" do
        position = [0, 0]
        expect{board.empty?(position)}.to_not raise_error
      end

      it "should return true if no player mark is made on the given position" do

        pos_1 = [2, 1]
        expect(board.empty?(pos_1)).to eq(true)
      end

      it "should return false if a player mark is made on the given position" do
        grid = board.instance_variable_get(:@grid)
        grid[0][1] = :O

        pos_2 = [0, 1]
        expect(board.empty?(pos_2)).to be(false)
      end
    end

    describe "#place_mark" do
      it "should accept a position and mark as args" do
        grid = board.instance_variable_get(:@grid)
        pos = [0, 0]
        mark = :O  

        expect{board.place_mark(pos, mark)}.to_not raise_error
      end

      it "should set the given position of @grid to the given mark" do
        pos_1 = [1, 1]
        mark_1 = :X
        expect(board.place_mark(pos_1, mark_1)).to eq(:X)
      end

      it "should not set position if the given position of @grid has a mark" do
        pos_1 = [1, 1]
        mark_1 = :X
        mark_2 = :O
        board.place_mark(pos_1,mark_1)
        expect{board.place_mark(pos_1,mark_2)}.to output(/try again/).to_stdout
      end

      it "should call Board#valid? and Board#empty? to check the @grid" do
        pos_1 = [1, 1]
        mark_1 = :X
        expect(board).to receive(:valid?)
        expect(board).to receive(:empty?)
        board.place_mark(pos_1, mark_1)
      end
    end

    describe "#print" do
      it "should print each row of @grid so every element in a row is separated with a space" do
        board = Board.new(3)
        expect(board.print).to eq([[:_, :_, :_], [:_, :_, :_], [:_, :_, :_]])
      end
    end

    describe "#win_row?" do
      board = Board.new(3)
        it "should return true if all of the marks in a row are the same" do
            board.place_mark([0,0], :X)
            board.place_mark([0,1], :X)
            board.place_mark([0,2], :X)

            expect(board.win_row?(:X)).to be(true)
        end

        it "should return false if not all of the marks in a row are the same" do

            expect(board.win_row?(:O)).to be(false)
        end
    end 
    
    describe "#win_col?" do
      board = Board.new(4)
        it "should return true if all of the marks in a row are the same" do
            board.place_mark([0,1], :X)
            board.place_mark([1,1], :X)
            board.place_mark([2,1], :X)
            board.place_mark([3,1], :X)


            expect(board.win_col?(:X)).to be(true)
        end

        it "should return false if not all of the marks in a row are the same" do
            expect(board.win_col?(:O)).to be(false)
        end
    end  

    describe "#win_diagonal?" do
      board = Board.new(4)
        it "should return true if all of the marks in a row are the same" do
            board.place_mark([0,3], :X)
            board.place_mark([1,2], :X)
            board.place_mark([2,1], :X)
            board.place_mark([3,0], :X)

            expect(board.win_diagonal?(:X)).to be(true)
        end

        it "should return false if not all of the marks in a row are the same" do
          board.print
            expect(board.win_diagonal?(:O)).to be(false)
        end
    end 

    describe "#win?" do
      board = Board.new(3)
        it "should return true if any row, col, or diagonal has all the same mark" do
            board.place_mark([0,0], :X)
            board.place_mark([1,1], :X)
            board.place_mark([2,2], :X)

            expect(board.win?(:X)).to be(true)
        end

        it "should return false if no single row, col, or diagonal has all the same mark" do

            expect(board.win?(:O)).to be(false)
        end
    end

    describe "#empty_positions?" do
      board = Board.new(3)
        it "should return true if at least one position on the board remains empty" do
            board.place_mark([0,0], :X)
            board.place_mark([1,0], :X)
            board.place_mark([2,0], :X)
            board.place_mark([0,1], :O)
            board.place_mark([1,1], :O)
            board.place_mark([2,1], :O)
            board.place_mark([0,2], :X)
            board.place_mark([1,2], :X)

            expect(board.empty_positions?).to be(true)
        end

        it "should return false if all of the spaces of the board are filled with marks" do
            board.place_mark([2,2], :X)

            expect(board.empty_positions?).to be(false)
        end
    end

end
            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/App-Academy-Projects