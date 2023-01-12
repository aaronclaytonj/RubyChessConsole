# require_relative 'player.rb'
# require_relative 'board.rb'
require_relative 'display.rb'
class Game

    include Display
    attr_reader :player_one, :player_two, :board, :current_player

    def initialize
        # puts "initalize game"
        @board = Board.new
        @player_one = nil
        @player_two = nil
        @current_player = nil
    end

    def play
        # puts "here"
        game_set_up
        board.show
        player_turns
        conclusion
    end

    def player_turns
        @current_player = player_one
        until board.full?
            turn(current_player)
            break if board.game_over?
            
            @current_player = switch_current_player
        end
    end

    def switch_current_player
        if current_player == player_one
            player_two
        else
            player_one
        end
    end

    def turn(player)
        cell = turn_input(player)
        board.update_board(cell - 1, player.symbol)
        board.show
    end

    def turn_input(player)
        puts display_player_turn(player.name, player.symbol)
        number = gets.chomp.to_i
        return number if board.valid_move?(number)
    end

    def game_set_up
        puts display_intro
        @player_one = create_player(1)
        @player_two = create_player(2, player_one.symbol)
    end

    def create_player(number, duplicate_symbol = nil)
        puts display_name_prompt(number)
        name = gets.chomp
        symbol = symbol_input(duplicate_symbol)
        Player.new(name, symbol)
    end

    def symbol_input(duplicate)
        player_symbol_prompts(duplicate)
        input = gets.chomp
        return input if input.match?(/^[^0-9]$/) && input != duplicate

        puts display_input_warning
        symbol_input(duplicate)
    end

    def player_symbol_prompts(duplicate)
        puts display_symbol_prompt
        puts display_first_symbol(duplicate) if duplicate
    end

    def conclusion
        if board.game_over?
            puts display_winner(current_player.name)
        else
            puts display_tie
        end
    end

end