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
        puts "Enter guess (4 digit number)(1-6): "
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
    attr_reader :computer_array, :player_guess, :colored_output
    
    def initialize(answer)
        @computer_array = answer       
    end

    
    def compare
        @player_guess = PlayerGuess.new().get_guess
        @temp_comp_ans = @computer_array.clone
        @colored_output = ["gray", "gray", "gray", "gray",]
        
        #check for green numbers
        @player_guess.each_with_index do |player_guess, player_index|
            if player_guess == @temp_comp_ans[player_index].to_s
                @colored_output[player_index] = "green"
                @temp_comp_ans[player_index] = nil
            end
        end
       

        #check for yellow numbers
        @player_guess.each_with_index do |player_guess, player_index|     
            if @temp_comp_ans.include?(player_guess.to_i) && @colored_output[player_index] != "green"
                @colored_output[player_index] = "yellow"
                @temp_comp_ans[@temp_comp_ans.index(player_guess.to_i)] = nil
            end
        end
        @colored_output
        #p computer_array
        #@temp_comp_ans = @computer_array
    end

    def display
        @color_code = self.compare
        @player_guess.each_with_index do |player_guess, player_index|
            if @color_code[player_index] == "green"
                print player_guess.green
            elsif @color_code[player_index] == "yellow"
                print player_guess.yellow
            else
                print player_guess
            end
        end
        puts ""
    end
end


def play_game
    answer = ComputerMaker.new().random_four
    newGame = Game.new(answer)

    7.times do |i|
        newGame.display
        if newGame.colored_output == ["green", "green", "green", "green",]
            break
        end
    end
    if newGame.colored_output == ["green", "green", "green", "green",]
        puts "You won!"
    else
        print "You lost. Answer: "
        answer.each {|num| print num}
        puts ""
    end
end

#newGame.display
play_game()