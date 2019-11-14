#helper functions

# injects the string(s) from a database response into a nice array
def find_strings_from_response(hash)
    list_of_definitions = []
hash.attributes.each do |k,v|
    if v.class == String
        list_of_definitions << v
        end
    end
    list_of_definitions
end


# puts a bunch of white space to the screen to make a pretty new menu
def new_white_space
    30.times do
        puts ""
    end
end

# displays basic menu that every screen other than the title and main manu will have
def return_menu
    puts ""
    puts "'1' Return to main menu"
    puts ""
    puts "'!' Exit the program"
    puts ""
end




#turcoman



class CoreProgramMethods

    def self.find_word_definition
        15.times do
            puts ""
        end

        puts " ---------------------------"
        puts "|        FIND A WORD        |"
        puts " ---------------------------"

        return_menu

        puts "please enter the word you would like to find"

        while true
        input = gets.chomp.downcase
        if input == "1"
            CoreProgramMethods.main_menu
        elsif input == "!"
            CoreProgramMethods.terminate
        elsif Word.find_by(name: input)
            @word_to_display = Word.find_by(name: input)
            CoreProgramMethods.display_word
        else
            30.times do
                puts ""
            end

           return_menu

            puts "word does not currently exist in the dictionary"
            end
        end
    end

    def self.display_word

        # Displays the word that was inputted and finds the associated definition
        found_word = @word_to_display.name
        word_id = @word_to_display.id

        # assigns the response from the database into a variable
        definition_response = Definition.find_by(word_id: word_id)
        
        #injects the definitions into a nice array

        definitions_to_display = find_strings_from_response(definition_response)

        15.times do
            puts ""
        end
        puts " ---------------------------"
        puts "       #{found_word}        "
        puts " ---------------------------"
        i = 0
        definitions_to_display.length.times do
            puts "*********************"
            puts "#{i + 1}: " + definitions_to_display[i]
            i += 1
        end
            puts "*********************"

       return_menu

        while true
            input = gets.chomp.downcase
            if input == "1"
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            else
                puts "That is not a selection"
            end
        end
    end
    
    def self.propose_word
        15.times do
            puts ""
        end
    end

    def self.propose_definition
        15.times do
            puts ""
        end
    end

    def self.remove_account
        15.times do
            puts ""
        end
    end

    def self.account_information
        15.times do
            puts ""
        end
    end

    def self.terminate
        abort "Goodbye"
    end

     def self.main_menu
        15.times do
            puts ""
        end
        puts " ---------------------------"
        puts "|        MAIN MENU          |"
        puts " ---------------------------"
        puts ""
        puts "'1' Look up a word"
        puts ""
        puts "'2' Propose a new word"
        puts ""
        puts "'3' Propose a new definition for an existing word"
        puts ""
        puts "'4' Remove your account"
        puts ""
        puts "'5' Account information"
        puts ""
        puts "'!' Exit the program"
        
        while true do
        input = gets.chomp.downcase
            if input == "1"
                CoreProgramMethods.find_word_definition
            elsif input == "2"
                CoreProgramMethods.propose_word
            elsif input == "3"
                CoreProgramMethods.propose_definition
            elsif input == "4"
                CoreProgramMethods.remove_account
            elsif input == "5"
                CoreProgramMethods.account_information
            elsif input == "!"
                CoreProgramMethods.terminate
            else
                puts "That is not a selection"
            end
        end
    end
    
    def self.initiate
        new_white_space
        puts " ---------------------------"
        puts "|        WIKTIONARY         |"
        puts " ---------------------------"
        puts ""
        puts "Please begin by entering in your name"
        input = gets.chomp.downcase
        if User.exists?(name: input)
            @current_user = User.update(name: input)
        else
            @current_user = User.create(name: input)
        end
        CoreProgramMethods.main_menu
    end





end
