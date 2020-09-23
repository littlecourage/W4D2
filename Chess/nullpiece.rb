require_relative 'pieces.rb'

class NullPiece < Piece
    include Singleton

    attr_reader :color, :symbol

    def initialize

    end

    def moves
        
    end
end