require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './game.rb'

class Scraper 

    def initialize
        $game_data = Array.new(50) { Array.new(4) }
    end

    def get_page
        Nokogiri::HTML(URI.open("https://rawg.io"))

    end

    def find_games
        self.get_page.css(".game-card-medium")
    end

    def create_games
        counter = 0
        self.find_games.each do |game_card_medium|
            game = Game.new
            $game_data[counter][0] = game_card_medium.css(".heading.heading_4").text
            game.title = $game_data[counter][0]
            game.platforms = []
            platform_array = game_card_medium.css("div .platforms")[0].children
            platform_string = platform_array.to_s
            # #binding.pry
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_pc")
                $game_data[counter][1] = "PC"
                game.platforms << $game_data[counter][1]
            end
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_playstation")
                $game_data[counter][2] = "Playstation"
                game.platforms << $game_data[counter][2]
            end
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_xbox")
                $game_data[counter][3] = "Xbox"
                game.platforms << $game_data[counter][3]
            end
            counter += 1
        end
        $game_data.compact!
    end
   
    # def print_games
    #     #   self.create_games
    #      puts $game_data.length
    #      $game_data.inspect
    #      second_counter = 0
    #      while second_counter < $game_data.length do
    #         puts $game_data[second_counter][0]
    #         puts $game_data[second_counter][1]
    #         puts $game_data[second_counter][2]
    #         puts $game_data[second_counter][3]
    #         second_counter += 1
    #         puts "test #{second_counter}"
    #     end
    # end


end
#Scraper.new.create_games