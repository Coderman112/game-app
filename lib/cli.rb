class Cli 

    def greeting
        puts "What's up gamer?"
        self.ask_for_name
    end

    def ask_for_name
        puts "Go ahead and put in a game title"
        input = gets.strip
    end

end