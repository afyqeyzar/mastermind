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
        @player_guess_array = @player_guess.split("") #note: number in array are strings
    end
end


player = PlayerGuess.new()
p player.get_guess

# computer_choice = ComputerMaker.new()

# p computer_choice.random_four