require_relative "piece"

class Pawn < Piece

  def initialize(color)
    super
    @moved = false
    @symbol = "\u2659"
  end

  def moves pos, board
    # Decide color and direction
    vert_mov = @color == :white ? -1 : 1
    p vert_mov, @color
    vert_vector = vert_vector(vert_mov, pos)
    moves_arr = []
    # Push possible moves and return
    moves_arr << vert_vector if board[vert_vector].empty? #TODO: Change
    moves_arr += capture_vector(vert_vector).select {|pos| board[pos].color != @color }
    p moves_arr
  end

  def vert_vector(vertical_mov, pos)
    p vert_vector = [pos[0] + vertical_mov, pos[1]]
  end


  def capture_vector(vert_vector)
    left = [vert_vector[0], vert_vector[1] - 1]
    right = [vert_vector[0], vert_vector[1] + 1]
    [left,right]
  end

end
