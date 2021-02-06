class Cli 

    def greeting
        puts "What's up gamer?"
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
    end

    # def get_info
    #     if input == 
    #         puts 
    #     else
    #         puts "I'm sorry I can't find that game :("
    #     end

    # end

end