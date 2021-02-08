class Cli < Game

    def initialize
        Scraper.new.create_games
    end

    def greeting
        puts "What's up gamer? Welcome to Platform Finder"
        self.ask_for_name
    end

    def ask_for_name
        puts "Go ahead and put in a game title and I'll find its platforms for you"
        input = gets.strip
        Game.find_by_title(input)
        self.search_again_or_quit
    end

    def search_again_or_quit
        puts "Would you like to search for another game? Please input Y for yes or N for no"
        input = gets.strip
        if input == "Y"
            self.ask_for_name
        end
        if input == "N"
            puts "Thank you for using Platform Finder"
            exit 
        end

    end

end