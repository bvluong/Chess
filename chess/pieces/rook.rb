require_relative "piece"

class Rook < Piece
  include Slidable

  def initialize(color)
    super
    @symbol = "\u265C"
  end

  def move_dirs
    horizontal_dirs
  end
end
