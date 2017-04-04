module Stepable

  def moves pos, board
    x,y = pos
    moves_diffs.map {|x_d,y_d| [x + x_d, y + y_d]}
    .select{|new_pos| is_valid_move?(new_pos, board)}
  end

  private
  # def moves_diffs
  # end

end
