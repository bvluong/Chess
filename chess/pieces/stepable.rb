module Stepable

  def moves pos, board
    x,y = pos
    moves_arr = moves_diffs.map {|x_d,y_d| [x + x_d, y + y_d]}
    .select{|pos| board.in_bounds?(pos) && !is_color?(pos, board) }
  end

  private
  # def moves_diffs
  # end

end
