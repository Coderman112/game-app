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
        @platforms = []
        self.find_games.each do |game_card_medium|
            game = Game.new
            game.title = game_card_medium.css(".heading.heading_4").text
            platform_array = game_card_medium.css("div .platforms")[0].children
            platform_string = platform_array.to_s
            #binding.pry
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_pc")
                @platforms << "PC"
            end
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_playstation")
                @platforms << "Playstation"
            end
            if platform_string.include?("platforms__platform platforms__platform_medium platforms__platform_xbox")
                @platforms << "Xbox"
            end
            
        end
    end
    
    def print_games
        self.create_games
        Game.all.each do |game|
          if game.title && game.title != ""
            puts "Title: #{game.title}"
            puts "Platforms: #{@platforms.uniq}"
          end
        end
    end


end
Scraper.new.print_games