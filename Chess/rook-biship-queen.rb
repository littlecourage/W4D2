require_relative 'pieces.rb'
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


module Slideable
    HORIZONTAL_DIRS = [[0,1], [0,-1], [1,0], [-1,0]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        steps = self.move_dirs
        legal_moves = []
        current_pos = self.position
        steps.each do |position|
            x,y = current_pos
            new_pos = [position[0] + x, position[1] + y]
            if self.board.valid_pos?(new_pos) && self.board.[new_pos].empty?
                legal_moves << new_pos
            end
        end
        
    end
end

class Rook < Piece
    include Slideable
    def initialize(symbol, board, position)
        super(board, position)
        @symbol = symbol
    end

    def move_dirs
        self.horizontal_dirs
    end
end

class Bishop < Piece
    include Slideable
    def initialize(symbol, board, position)
        super(board, position)
        @symbol = symbol
    end
    def move_dirs
        self.diagonal_dirs
    end
end

class Queen < Piece
    include Slideable
    def initialize(symbol, board, position)
        super(board, position)
        @symbol = symbol
    end
    def move_dirs
        self.horizontal_dirs + self.diagonal_dirs
    end
end