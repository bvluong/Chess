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

  def is_valid_move?(start_pos, end_pos, board)
    board[end_pos].color != @color && moves(start_pos,board).include?(end_pos)
  end

end
