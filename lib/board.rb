            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3


class Board

# The Board class is responsible for adding a player's marks, checking for winners, 
# and printing the game board. A board instance must have an attribute to represent 
# the grid. For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.

# Board#initialize

# A Board instance must have an instance variable to represent the game grid. For 
# now, Board#initialize does not need to accept any arguments. Initialize the grid 
# so that all positions are empty; this means that every position should contain an 
# underscore ('_').

# Refactor this method to accept a number argument, n. The grid should be set to a 
# 2-dimensional array with size 'n x n', instead of '3 x 3'. It's worth noting that 
# the grid will always be a square (meaning its height is equal to its width). This 
# will somewhat simplify things as we refactor our other methods.

    attr_reader :grid 

    def initialize(n)
        @grid = Array.new(n) { Array.new(n).fill(:_) }
        @length = n
    end

# Board#empty?(position)

# This method should return a boolean indicating whether or not the specified position 
# does not contain a player's mark.

    def empty?(position)
        if @grid[position[0]][position[1]] == :_
            true
        else false
        end
    end

    def show_mark(position)
       @grid[position[0]][position[1]]
    end

# Board#legal_positions

# This method should return an array containing all positions of the board that are 
# legal to place a new mark on. That is, the returned positions should not already 
# contain a mark and also be "in-bounds" on the grid.

    def legal_positions
        arr = []
        @grid.each_with_index do |row, idx|
            row.each_with_index do |col, i|
                position = [idx, i]
                if empty?(position)
                    arr << position
                end
            end
        end
        arr
    end

# Board#place_mark(position, mark)

# This method should assign the given mark to the specified position of the grid. 
# It should raise an error when the position is not #valid? or not #empty?.

    def place_mark(position, mark)
      if empty?(position) 
            @grid[position[0]][position[1]] = mark
      end  
    end

# Board#print

# This method should simply print out the board and all of the marks that have been 
# placed on it. Feel free to style the printing as much as you'd like, but be sure 
# to print out each row of the board on a new line. This will help us visualize the 
# board better as we debug or even play the game!

    def print
        @grid.each { |row| puts row.join(' ') }
    end

# Board#win_row?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# completely filled up any row of the grid.

    def win_row?(mark)
        @grid.one? { |row| row.all? { |ele| ele == mark } }
    end

# Board#win_col?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# completely filled up any column of the grid.

    def win_col?(mark)
        @grid.transpose.one? { |col| col.all? { |ele| ele == mark } }
    end

# Board#win_diagonal?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# completely filled up either diagonal of the grid.

    def win_diagonal?(mark)
        if tl_br_win?(mark)
            true
        elsif bl_tr_win?(mark)
            true
        else false
        end
    end

    #tl_br_win?(mark) checks the Top Left to the Bottom Right for a diagonal win.

    def tl_br_win?(mark)
        (0...@length).all? do |n|
            @grid[n][n] == mark
        end
    end

    #bl_tr_win?(mark) checks the Bottom Left to the Top Right for a diagonal win.

    def bl_tr_win?(mark)
        arr = (0...@length).map { |nums| nums }
        r_l = [arr, arr.reverse].transpose
        r_l.all? do |cup|
            fir = cup[0]
            las = cup[1]
            @grid[fir][las] == mark
        end

    end

# Board#win?(mark)

# This method should return a boolean indicating whether or not the given mark has 
# filled any full row, column, or diagonal.

    def win?(mark)
        if win_row?(mark)
            true
        elsif win_col?(mark)
            true
        elsif win_diagonal?(mark)
            true
        else false
        end
    end

# Board#empty_positions?

# This method should return a boolean indicating whether or not there is at least 
# one empty position on the grid.

    def empty_positions?
        @grid.any? { |row| row.any? { |ele| ele == :_ } }
    end

end

            # meta_coder (Gary Miller) =)
            # gmiller052611@gmail.com
            # https://github.com/metacoder87/3tv3