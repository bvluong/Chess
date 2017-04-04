module Slidable

  def moves pos, board
    move_dirs.map {|x_d, y_d|
      x, y = pos
      one_direction = []
      new_pos = [x + x_d, y + y_d]
      while(board.in_bounds?(new_pos))
        if is_color?(new_pos, board)
          break
        elsif is_enemy?(new_pos, board)
          one_direction << new_pos
          break
        else
          one_direction << new_pos
          x += x_d
          y += y_d
          new_pos = [x,y]
        end
        # break if !board[new_pos].empty?
      end
      one_direction
    }.flatten(1)
  end

  private
  # def moves_dirs
  # end

  def horizontal_dirs
    [[0,1],[1,0],[-1,0],[0,-1]]
  end

  def diagonol_dirs
    [[1,1],[-1,1],[1,-1],[-1,-1]]
  end

end
