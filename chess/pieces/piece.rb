require "colorized_string"

class Piece
  attr_accessor :color, :symbol, :moved

  def initialize(color)
    @color = color
    @moved = false
  end

  def to_s()
    ColorizedString.new(@symbol.encode('utf-8')).colorize(@color)
  end

  def empty?
    false
  end

  def is_enemy?(pos,board)

    return board[pos].color == :black if @color == :white
    return board[pos].color == :white if @color == :black
  end

  def is_valid_move?(start_pos, end_pos, board)
    !is_color?(end_pos,board) && moves(start_pos,board).include?(end_pos)
  end

  def is_color?(end_pos,board)
    board[end_pos].color == @color
  end

end
