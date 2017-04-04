require_relative "piece"
require "colorized_string"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize(color = :yellow)
    @color = color
  end

  def to_s
    ColorizedString.new(" ").yellow
  end

  def empty?
    true
  end

  def moves
    []
  end
end
