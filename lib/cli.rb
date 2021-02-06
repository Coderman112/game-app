class Cli 

    def greeting
        puts "What's up gamer? Welcome to Platform Finder"
        self.ask_for_name
    end

    def ask_for_name
        puts "Go ahead and put in a game title"
        input = gets.strip
        Scraper.new.create_games
        # puts $game_data.length
        #  $game_data.inspect
         second_counter = 0
         found_it = 0
        while second_counter < $game_data.length do
            if $game_data[second_counter][0] == input
                puts "It's on #{$game_data[second_counter][1]} and #{$game_data[second_counter][2]} and #{$game_data[second_counter][3]}"
                found_it += 1
            end
             second_counter += 1
            # puts "test #{second_counter}"
        end
        if found_it == 0
            puts "Sorry I couldn't find it"
        end
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