require_relative 'pieces.rb'

module Stepable
    def moves

    end

    private

    def move_diffs

    end
end

class Knight < Piece
    include Stepable
    def initialize(symbol, board, position)
        super(board, position)
        @symbol = symbol
    end
end

class King < Piece
    include Stepable
    def initialize(symbol, board, position)
        super(board, position)
        @symbol = symbol
    end
end