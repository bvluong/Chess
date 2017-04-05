class Node

  def initialize(board)
    @board = board
    @children = []
  end

  def add_child child
    @children << child
  end

end
