class Game 

    attr_accessor :player_one, :player_two, :dictionary, :fragment, 
    :current_player

    # def self.populate_dictionary
       
    # end

    def initialize(player_one, player_two)
        @player_one = Player.new(player_one) 
        @player_two = Player.new(player_two)
        @dictionary = File.readlines("dictionary.txt")
        @fragment = "ab"
        @current_player = player_one
    end

    def check_fragment

    end

    def valid_play?(letter)
        alphabet = ("a".."z").to_a
        return false if !alphabet.include?(letter)
        return false if letter.length > 1

        @dictionary.each do |word|
            return true if word.index(fragment + letter) == 0
        end 
    
        false
    end

    def take_turn(player)
        if valid_play?(player.guess) == false 
            p "invalid entry"
            take_turn(player)
        else 
            @fragment += input
            next_player!
            take_turn(current_player)
        end
    end 

    def next_player!
        if @current_player == player_one
            @current_player = player_two
        else 
            @current_player = player_one
        end
    end 
end 



class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def guess
        p "#{current_player} enter a letter:  "
        input = gets.chomp
    end



end