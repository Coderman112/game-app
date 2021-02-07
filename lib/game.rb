require 'pry'
class Game 
    attr_accessor :title, :platforms

    @@all = []

    def initialize
        @@all << self
    end

    def self.construct_games
        counter = 0
        Scraper.new.create_games
        game = self.new
        game.title = $game_data[counter][0]
        game.platforms = []
        game.platforms << $game_data[counter][1]
        game.platforms << $game_data[counter][2]
        game.platforms << $game_data[counter][3]
        @@all << game
    end

    def self.all
        @@all
    end


    def prints_all
        puts @@all
    end


end