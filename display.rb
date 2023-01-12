module Display
    def display_intro
        "Lets play a tic tac toe \n\n"
    end

    def display_name_prompt(number)
        "Whats the name of the player ##{number}?"
    end

    def display_input_warning
        "Im sorry, thats invalid please try again"
    end
    
    def display_symbol_prompt
        "What 1 letter or character would you like to be your game marker"
    end

    def display_first_symbol(duplicate)
        "It can not be '#{duplicate}'"
    end
    
    def display_player_turn(name, symbol)
        "#{name}, please enter a number (1-9) that is available to place an '#{symbol}'"
    end

    def display_winner(player)
        "Game over! #{player} is the winner!"
    end

    def display_tie
        "Its a draw!"
    end
end