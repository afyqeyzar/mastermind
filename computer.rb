class ComputerMaker
    
    def initialize
        @name = "name"
    end

    def random_four
        @computer_maker_array = []
        4.times do |i|
            i = rand(1..6)
            @computer_maker_array << i
        end
        @computer_maker_array
    end
end

computer_choice = ComputerMaker.new()

p computer_choice.random_four