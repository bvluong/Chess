# Dir["./pieces/*.rb"].each {|file| p file; require file}
%w(bishop.rb king.rb knight.rb queen.rb rook.rb pawn.rb nullpiece.rb).each {|file|
  require_relative "./pieces/#{file}"
}

class Board
  attr_accessor :grid

  def initialize(grid = Array.new(8) { Array.new(8) { NullPiece.instance} })
    @grid = grid
    populate
  end

  def move_piece(start_pos, end_pos)
    begin
      raise "No piece at position" if self[start_pos] == nil
      raise "Cannot move to this position" unless self[start_pos].valid_move?(end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    rescue

    end
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,val)
    row,col = pos
    @grid[row][col] = val
  end



def in_bounds?(pos)
  x,y = pos
  x > 0 || y > 0 || x < @grid.length || y < @grid.length
end

def populate
  @grid[0] = populate_blacks
  @grid[1] = Array.new(8){ Pawn.new(:blacks) }
  @grid[7] = populate_whites
  @grid[6] = Array.new(8){ Pawn.new(:whites) }
end


def populate_blacks
  black_arr = [Rook.new(:black), Knight.new(:black), Bishop.new(:black), King.new(:black),
  Queen.new(:black), Bishop.new(:black), Knight.new(:black), Rook.new(:black)]
end

def populate_whites
  white_arr = [Rook.new(:white), Knight.new(:white), Bishop.new(:white), King.new(:white),
  Queen.new(:white), Bishop.new(:white), Knight.new(:white), Rook.new(:white)]
end

end
