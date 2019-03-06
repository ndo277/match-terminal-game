require_relative "Card"

class Board
  CARDS = [:A, :B, :C, :D, :E, :F, :G, :H]

  attr_reader :grid
  
  def initialize
    @grid = Array.new(4) {Array.new(4)}
  end

  def [](pos)
    row, col = *pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def populate
    2.times do
      CARDS.each do |card|
        row = rand(0..3)
        col = rand(0..3)
        until @grid[row][col] == nil
          row = rand(0..3)
          col = rand(0..3)
        end
        @grid[row][col] = Card.new(card)
      end
    end
  end

  def render
    puts "  0 1 2 3"
    (0...@grid.length).each do |row|
      arr = []
      (0...@grid.length).each do |col|
        arr << @grid[row][col].display_info
      end
      print "#{row.to_s} #{arr.join(" ")}\n"
    end
  end

  def reveal(pos)
    if !self[pos].face_up
      self[pos].flip
      return self[pos].value
    end
  end

  def won?
    @grid.flatten.all? { |card| card.face_up}
  end


end