require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './game.rb'

class Scraper 

    def get_page
        Nokogiri::HTML(URI.open("https://rawg.io"))

    end

    def find_games
        self.get_page.css(".game-card-medium")
    end

    def create_games
        self.find_games.each do |game_card_medium|
            platform_array = game_card_medium.css("div .platforms")[0].children
            platform_string = platform_array.to_s
            game_hash = {title: game_card_medium.css(".heading.heading_4").text, platforms: []}
            
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_pc")
                game_hash[:platforms] << "PC"
                
            end
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_playstation")
                game_hash[:platforms] << "Playstation"
                
            end
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_xbox")
                game_hash[:platforms] << "Xbox"
            end
            Game.new(game_hash)
        end
    end


end