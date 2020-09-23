require_relative 'pieces.rb'

# [[R][KN][B][Q][K][B][KN][R]]
# [P] [P][P][P][P][P][P] [P]
# [][][][][][][][]
# [][][][][][][][]
# [][][][][][][][]
# [P][P] [P][P][P][P] [P][P]
# [R][KN][B][K][Q][B][KN][R]



class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        self.pieces
    end

    def [](pos)
        x,y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x,y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        if self.valid_pos?(start_pos) && self.valid_pos?(end_pos)
            piece = self[start_pos]
            self[start_pos] = nil
            self[end_pos] = piece
        end
    end

    def valid_pos?(pos)
        x, y = pos
        unless x.between?(0, 7) && y.between?(0, 7)
            raise 'invalid position'
            return false
        end
        true
    end

    def pieces
        (0...@rows.length).each do |row|
            (0...@rows.length).each do |col|
                if [0, 1, 6, 7].include?(row)
                    self[[row, col]] = Piece.new
                else
                    self[[row, col]] = nil
                end
            end
        end
    end
end

# horizontal dirs and diagonal_dirs are getter methods for class variables
# move dirs invoked inside of moves
# iterate over each direction in moves method, call grow_unblocked_moves for each direction in moves
# moves should output all possible moves for a given piece


    # def self.valid_moves(pos)
    #     moves = [ [-2, -1],[-2,  1],[-1, -2],[-1,  2],[ 1, -2],[ 1,  2],[ 2, -1],[ 2,  1] ]
    #     possible_moves = []
    #     moves.each do |ele|
    #         x, y = pos
    #         possible_moves << [ele[0] + x, ele[1]+y]
    #     end
    #     possible_moves.delete_if { |ele| ele[0] > 7 || ele[1] > 7 || ele[0] < 0 || ele[1] < 0 }
    #     return possible_moves
    # end