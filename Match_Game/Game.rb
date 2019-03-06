require_relative "Board"
require_relative "Card"

class Game

  def initialize
    @board = Board.new
    @previous_guess = []
  end

  def play
    @board.populate
    @board.render

    until self.over?
      pos = self.prompt
      self.make_guess(pos)
      system("clear")
      @board.render
    end
  end

  def over?
    @board.won?
  end

  def prompt
    puts "Enter coordinates to make a guess (e.g. '1 2'):"
    gets.chomp.split.map(&:to_i)
  end

  def make_guess(pos)
    if @previous_guess.empty?
      @board.reveal(pos)
      @previous_guess = pos
    else
      if @board[pos] == @board[@previous_guess]
        @board.reveal(pos)
        system("clear")
        @board.render
        puts "Nice match!"
        sleep(2)
      else
        @board.reveal(pos)
        system("clear")
        @board.render
        puts "Try again."
        sleep(2)
        @board[@previous_guess].flip
        @board[pos].flip
      end
      @previous_guess = []
    end

  end


end