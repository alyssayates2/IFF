class IFF::IFF_classes 
    attr_accessor :name, :url, :description

    @@classes = []

    def self.scrape_all 
        @@classes 
    end 

    def self.scrape_class
        doc = Nokogiri::HTML(open("http://infinitefitnessfrisco.com/"))
        class_info = doc.css(".postDetails")[7..11]
        class_info.collect do |element| 
        name = element.css("h1").text
        url = element.css("a").attr("href").value
        description = element.css("p").text
        IFF::IFF_classes.new(name, url, description)
        end  
    end 

    def initialize(name, url, description)
        @name = name 
        @url = url 
        @description = description
        @@classes << self 
    end 
 end   

 