require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './game.rb'

class Scraper

    def get_page
        Nokogiri::HTML(URI.open("https://rawg.io"))

    end

    def find_games
        self.get_page.css("game-card-medium")
    end

    def create_games
        self.find_games.each do |game_card_medium|
            game = Game.new
            game.title = game_card_medium.css("heading heading 4").text
            game.platforms = game_card_medium.css("platforms platforms_medium game-card-medium_platforms")
            if game.platforms.include?("platforms__platform platforms__platform_medium platforms__platform_pc")
                game.platforms = []
                game.platforms << "PC"
            end
            if game.platforms.include?("platforms__platform platforms__platform_medium platforms__platform_playstation")
                game.platforms << "Playstation"
            end
            if game.platforms.include?("platforms__platform platforms__platform_medium platforms__platform_xbox")
                game.platforms << "Xbox"
            end
            
        end
    end
    binding.pry

end