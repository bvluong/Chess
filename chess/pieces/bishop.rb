require_relative "piece"
require_relative "slidable"

class Bishop < Piece
  include Slidable

  def initialize(color)
    super
    @symbol = "\u2657"
  end

  def move_dirs
    diagonol_dirs
  end
end
