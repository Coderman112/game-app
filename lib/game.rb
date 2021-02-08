require 'pry'
class Game 

    @@all = []

    def initialize(hash)
          hash.each do |key, value|
              self.class.attr_accessor(key)
              self.send("#{key}=", value) if self.respond_to?("#{key}=")
          end
          @@all << self
    end


    def self.all
        @@all
    end


    def self.find_by_title(title)
        self.all.find do |game|
        if game.title == title
          puts game.platforms
        end
        end
    end


end