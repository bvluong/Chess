require_relative "cursor"
require_relative "board"
require "colorized_string"

class Display
  def initialize board
    @board = board
    @cursor = Cursor.new([0,0], board)
    @first_pos = nil
  end

  def get_input
    @cursor.get_input
  end

  def play_turn
    while true
      begin
        puts render
        pos = get_input
        handle_move(pos) if !pos.nil?
      # rescue
      #   @first_pos = nil
      #   retry
      end
    end
  end

  def handle_move pos
    if(@first_pos.nil?)
      @first_pos = pos
    else
      @board.move_piece(@first_pos, pos)
      @first_pos = nil
      p @board.in_check?(:white)
    end
  end

  def render
    # system("clear")
    @board.grid.map.with_index {|row,i|
      row.map.with_index{|cell,j|
        if(@cursor.cursor_pos == [i,j])
          ColorizedString.new(cell.to_s).colorize(:color => :red, :background => :black)
        else
          # cell.to_s
          color = is_tile_white?(i, j) ? :light_green : :light_yellow
          ColorizedString.new(cell.to_s).colorize(:color => :light_blue, :background => color)
        end
      }.join('')
    }.join("\n")
  end
end

def reset
  @first = nil
end

def is_tile_white?(i,j)
  if(i.even?)
    j.even?
  else
    j.odd?
  end
end

display = Display.new(Board.new)
display.play_turn
