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
    puts "'9' Return to main menu"
    puts ""
    puts "'!' Exit the program"
    puts ""
end

def variable_screen_title(title)
        puts "------------------------------------------"
        puts "          #{title}          "
        puts "------------------------------------------"
        puts ""
end



class CoreProgramMethods

    def self.find_word_definition
       new_white_space

        variable_screen_title("FIND A WORD")

        return_menu

        puts "please enter the word you would like to find"

        while true
        input = gets.chomp.downcase
        if input == "9"
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

        new_white_space

        variable_screen_title(found_word)

        i = 0
        definitions_to_display.length.times do
            puts "*********************"
            puts "#{i + 1}: " + definitions_to_display[i]
            i += 1
        end
            puts "*********************"
            puts ""

       return_menu
       puts "'?' Find another word"

        while true
            input = gets.chomp.downcase
            if input == "9"
                CoreProgramMethods.main_menu
            elsif input == "?"
                CoreProgramMethods.find_word_definition
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
        new_white_space
        variable_screen_title("REMOVE ACCOUNT?")
        puts "'1' Delete account forever and exit program"
        puts ""
        puts "'2' Go back to main menu"

        while true
            input = gets.chomp.downcase
            if input == "1"
                a = @current_user.id
                User.destroy_all(a)
                CoreProgramMethods.terminate
            elsif input == "2"
                CoreProgramMethods.main_menu
            else
                puts "That is not a selection"
            end
        end

    end

    def self.account_information
        new_white_space
        variable_screen_title("ACCOUNT INFORMATION")
        puts ""
        puts "Username: " + @current_user.name.to_s
        puts ""
        puts "Age: " + @current_user.age.to_s
        puts ""
        puts "Number of contributions: " + @current_user.number_of_propositions.to_s
        puts ""
        puts "Bio: " + @current_user.bio.to_s
        puts ""
        puts "------------------------------------------"
        puts ""

        return_menu
        puts "'1' Update username"
        puts ""
        puts "'2' Update age"
        puts ""
        puts "'3' Update bio"

        while true
            input = gets.chomp.downcase
            if input == "9"
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == "1"
                CoreProgramMethods.update_username
            elsif input == "2"
                CoreProgramMethods.update_age
            elsif input == "3"
                CoreProgramMethods.update_bio
            else
                puts "That is not a selection"
            end
        end
        
    end

    def self.update_username
        new_white_space
        return_menu

        puts "please create a new username"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "9"
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif User.exists?(name: input)
                new_white_space
                return_menu
                puts "That username is already taken"
            elsif
                @current_user.name = input
                @current_user.save
                CoreProgramMethods.account_information
            end
        end
    end

    def self.update_age
        new_white_space
        return_menu
        puts "Please enter in a correct age"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "9"
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif 
                @current_user.age = input
                @current_user.save
                CoreProgramMethods.account_information
            end
        end
    end

    def self.update_bio
        new_white_space
        return_menu
        puts "Please fill out a new Bio"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "9"
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif 
                @current_user.bio = input
                @current_user.save
                CoreProgramMethods.account_information
            end
        end
    end

    def self.terminate
        new_white_space
        variable_screen_title("GOODBYE")
        abort
    end

     def self.main_menu
        new_white_space

        variable_screen_title("MAIN MENU")

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
        
        variable_screen_title("WIKTIONARY")
        
        10.times do
            puts ""
        end
        puts "Please begin by entering in a Username"


        input = gets.chomp.downcase
        if User.exists?(name: input)
            @current_user = User.find_by(name: input)
        else
            @current_user = User.create(name: input)
        end
        CoreProgramMethods.main_menu
    end





end
