class Game 
    attr_accessor :title, :platforms

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end


end