require_relative 'pieces.rb'

class Pawn < Piece
    def initialize(symbol, board, position)
        super(board, position)
        @symbol = symbol
    end
end