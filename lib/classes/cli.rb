class IFF::CLI  

    def call
        list_classes 
        message 
        menu
        function 
    end


    def list_classes
        puts "Let's find your perfect workout!"
        arr = IFF::IFF_classes.scrape_class
        arr.each.with_index(1) do |c, index|
            puts "#{index}. #{c.name}"
       # @class = IFF::IFF_classes.all
    end  

    def message 
        puts "Type in the number of the class you'd like to learn more about."
    end 

    def function 
        loop do user_input == menu 
            if user_input == "exit" 
            return
            else 
                list_classes 
            end 
        end
    end 

    def menu
        index = gets.chomp.to_i - 1
        course = IFF::IFF_classes.scrape_all[index]
        if index.to_i >= 0 && index.to_i <= IFF::IFF_classes.scrape_all.length
            class_descriptions(course)
        elsif index == "list" 
            list_classes
        elsif index == "exit"
            puts "Enjoy your workout!"
            end 
        end 
    end 


    def class_descriptions(course) 
        puts course.description
    end 

end 