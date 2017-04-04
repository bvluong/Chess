require_relative "piece"
require_relative "stepable"


class King < Piece
include Stepable

  def initialize(color)
    super
    @symbol = "\u265A"
  end

  def moves_diffs
    [[0,1][1,0],[-1,0],[0,-1][1,1],[-1,1],[1,-1],[-1,-1]]
  end

end
