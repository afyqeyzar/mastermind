require 'colorize'
class ComputerMaker
    
    def random_four
        @computer_maker_array = []
        4.times do |i|
            i = rand(1..6)
            @computer_maker_array << i
        end
        @computer_maker_array
    end
end

class PlayerGuess
    def get_guess
        puts "Enter guess (4 digit number): "
        @player_guess = gets.chomp
        if @player_guess.length == 4
            @player_guess_array = @player_guess.split("") #note: number in array are strings
        else   
            p "Please try again"
            get_guess()
        end
    end
end

class Game
    attr_reader :computer_array, :player_guess
    
    def initialize
        @computer_array = ComputerMaker.new().random_four
        #p @computer_array
        @player_guess = PlayerGuess.new().get_guess
    end

    #there a weird bug where multiple same guesses messes up the output if answer has multiple same numbers
    def compare
        @temp_comp_ans = [1, 1, 2, 1]
        p @temp_comp_ans
        @colored_output = {:green => [], :yellow => [], :gray => []}

        @player_guess.each_with_index do |player_guess, player_index|
            if player_guess == @temp_comp_ans[player_index].to_s
                @colored_output[:green] << player_guess
                @temp_comp_ans[player_index] = nil
                p @temp_comp_ans
            end
        end
        p @temp_comp_ans

        @player_guess.each_with_index do |player_guess, player_index|     
            if @temp_comp_ans.include?(player_guess.to_i) && player_guess != @computer_array[player_index].to_s
                @colored_output[:yellow] << player_guess
            elsif @temp_comp_ans[player_index] == nil  
                next
            else
                @colored_output[:gray] << player_guess
            end
        end
        puts @colored_output
    end
end


newGame = Game.new()
newGame.compare

# newGame.player_guess
#player = PlayerGuess.new()
#p player.get_guess
# computer_choice = ComputerMaker.new()
# p computer_choice.random_four


#arr = [ "I am now red".yellow]

#p arr[0]
