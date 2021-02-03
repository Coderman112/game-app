class Scraper

    def get_page 

        Nokogiri::HTML(URI.open("https://rawg.io"))
    end

html = open("https://rawg.io")
doc = Nokogiri::HTML(html)

binding.pry
end