require "colorized_string"

class Piece
  attr_accessor :color, :symbol

  def initialize(color)
    @color = color
  end

  def to_s()
    ColorizedString.new(@symbol.encode('utf-8')).colorize(@color)
  end

  def empty?
    false
  end

  def is_valid_move?(pos, board)
    board[pos].color != @color
  end

end
