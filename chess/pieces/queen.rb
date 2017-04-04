require_relative "piece"

class Queen < Piece
  include Slidable

  def initialize(color)
    super
    @symbol = "\u265B"
  end

  def move_dirs
    horizontal_dirs + diagonol_dirs
  end
end
