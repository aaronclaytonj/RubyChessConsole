require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'
require_relative 'display.rb'

def play_game
    game = Game.new
    game.play
    repeat_game
end

def repeat_game
    puts "Would you like to play again? (y/n)"
    response = gets.chomp.downcase
    if response[0] == "y"
        play_game
    else
        puts "Thanks for playing"
    end
end

play_game