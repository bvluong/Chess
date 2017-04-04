require_relative "piece"
require_relative "stepable"


class Knight < Piece
include Stepable

  def initialize(color)
    super
    @symbol = "\u2658"
  end

  def moves_diffs
    [[1,2],[2,1],[-1,2],[-2,1],[1,-2],[2,-1],[-1,-2],[-2,-1]]
  end

end
