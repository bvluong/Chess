require_relative "piece"

class Pawn < Piece

  def initialize(color)
    super
    @symbol = "\u2659"
  end

  def moves pos, board
    # Decide color and direction
    vert_mov = @color == :white ? -1 : 1
    vert_vect = vert_vector(vert_mov, pos)
    moves_arr = []
    # Push possible moves and return
    moves_arr << vert_vect if board[vert_vect].empty? #TODO: Change
    moves_arr += capture_vect(vert_vect).select {|pos| is_enemy?(pos,board)}
    moves_arr << vert_vector(vert_mov,vert_vect) unless @moved
    moves_arr
  end

  def vert_vector(vertical_mov, pos)
    vert_vector = [pos[0] + vertical_mov, pos[1]]
  end


  def capture_vect(vert_vector)
    left = [vert_vector[0], vert_vector[1] - 1]
    right = [vert_vector[0], vert_vector[1] + 1]
    [left,right]
  end

end
