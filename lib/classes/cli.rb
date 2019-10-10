class IFF::CLI  

    def call
        greeting 
        loop do 
            input = input_menu 
            if input == "exit" || input.include?("n")
                goodbye 
                return 
            else 
                list_classes
                menu 
            end 
        end 
    end

    def greeting 
        puts "Let's find your perfect workout! Would you like to see a list of our classes?"
    end 
    
    def message 
        puts "Type in the number of the class you'd like to learn more about."
    end

    def list_classes
        arr = IFF::IFF_classes.scrape_class
        arr.each.with_index(1) do |c, index|
            puts "#{index}. #{c.name}"
        end 
    end  
    

     def input_menu 
        input = gets.strip
        return input 
     end 

    def menu
        message 
        index = gets.chomp.to_i - 1
        course = IFF::IFF_classes.scrape_all[index]
        if index >= 0 && index <= IFF::IFF_classes.scrape_all.length
            class_descriptions(course)
            puts "Enter anything to see the list again or type 'exit'."
        elsif index == ''
            list_classes 
        elsif index == 'exit'
            goodbye 
        else 
            puts "Please enter anything to review the list again."
        end 
    end 

    def class_descriptions(course) 
        puts course.description.upcase 
    end 

    def goodbye 
        puts "Enjoy feeling amazing!"
    end 

end 
