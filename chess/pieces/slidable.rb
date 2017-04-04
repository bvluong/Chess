module Slidable

  def moves pos, board
    x, y = pos
    move_dirs.map {|x_d, y_d|
      one_direction = []
      new_pos = [x + x_d, y + y_d]
      until(is_valid_move?(new_pos, board))
        one_direction << new_pos
        x += x_d
        y += y_d
        new_pos = [x,y]
      end
    }
  end

  private
  # def moves_dirs
  # end

  def horizontal_dirs
    [[0,1][1,0],[-1,0],[0,-1]]
  end

  def diagonol_dirs
    [[1,1],[-1,1],[1,-1],[-1,-1]]
  end

end
