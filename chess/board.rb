# Dir["./pieces/*.rb"].each {|file| p file; require file}
%w(bishop.rb king.rb knight.rb queen.rb rook.rb pawn.rb nullpiece.rb).each {|file|
  require_relative "./pieces/#{file}"
}

class Board
  attr_accessor :grid

  def self.build
      board = Board.new
      board.populate
      board
  end

  def initialize(grid = Array.new(8) { Array.new(8) { NullPiece.instance} })
    @grid = grid
  end

  def move_piece(start_pos, end_pos)
    begin
      raise "No piece at position" if self[start_pos] == nil
      raise "Cannot move to this position" unless self[start_pos].is_valid_move?(start_pos, end_pos, self)
      self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
      self[end_pos].moved = true
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
    x >= 0 && y >= 0 && x < @grid.length && y < @grid.length
  end

  def populate
    @grid[0] = populate_blacks
    @grid[1] = Array.new(8){ Pawn.new(:black) }
    @grid[7] = populate_whites
    @grid[6] = Array.new(8){ Pawn.new(:white) }
  end

  def populate_blacks
    black_arr = [Rook.new(:black), Knight.new(:black), Bishop.new(:black), King.new(:black),
    Queen.new(:black), Bishop.new(:black), Knight.new(:black), Rook.new(:black)]
  end

  def populate_whites
    white_arr = [Rook.new(:white), Knight.new(:white), Bishop.new(:white), King.new(:white),
    Queen.new(:white), Bishop.new(:white), Knight.new(:white), Rook.new(:white)]
  end

  def in_check? color
    king_pos = nil
    @grid.each.with_index{|row,i|
      row.each.with_index{|cell,j|
        king_pos = [i,j] if cell.is_a?(King) && cell.color == color
      }
    }
    possible_moves = []
    @grid.each.with_index{|row,i|
      row.each_with_index{|cell,j|
         possible_moves += cell.moves([i,j],self)
      }
    }
    possible_moves.include? king_pos
  end

  def in_check_mate? color
    # Get all pieces of color under check
    # Find all possible moves of all pieces
    # And play move on board.cloned
    # Check if still in check
    # Return true if any in check

    all_pieces = @grid.each_with_index.reduce([]){|all_pieces, (row ,i)|
      all_pieces += row.each_with_index.reduce([]){|pieces, (cell,j)|
        cell.color == color ? pieces + [[cell,[i,j]]] : pieces
      }
    }
    all_pieces.map {|piece,start_pos|
      piece.moves(start_pos,self).map {|move|
        duped_board = dup
        duped_board.move_piece(start_pos,move)
        duped_board
      }
    }
    .flatten
    .all? {|board| board.in_check?(color)}
  end

  def dup
    grid_clone = @grid.map{|row|
      row.map{|cell|
        cell.empty? ? NullPiece.instance : cell.clone
      }
    }
    Board.new(grid_clone)
  end

end
