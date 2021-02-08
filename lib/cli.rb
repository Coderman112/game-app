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
        # if game.title == input
        #     puts game.platforms
        # end

        # if game.title != input
        #     puts "Sorry I couldn't find that fuckin shit bitch"
        # end
        # # Game.construct_games
        #  second_counter = 0
        #  found_it = 0
        # while second_counter < $game_data.length do
        #     if $game_data[second_counter][0] == input
        #         if $game_data[second_counter][1] != nil
        #         puts "It's on #{$game_data[second_counter][1]}"
        #         end
        #         if $game_data[second_counter][2] != nil 
        #         puts "It's on #{$game_data[second_counter][2]}"
        #         end
        #         if $game_data[second_counter][3] != nil
        #         puts "It's on #{$game_data[second_counter][3]}"
        #         end
        #         found_it += 1
        #     end
        #      second_counter += 1
        # end
        # if found_it == 0
        #     puts "Sorry I couldn't find it"
        # end
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