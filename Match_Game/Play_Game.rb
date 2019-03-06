require_relative "Game"

puts "Match all letters to win."

game = Game.new

game.play

puts "You win!" if game.over?
