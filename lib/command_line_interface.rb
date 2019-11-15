#helper functions vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

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

# displays basic menu that nearly every screen in the program will have
def return_menu
    puts "'9' Return to main menu"
    puts ""
    puts "'!' Exit the program"
    puts ""
end

# puts a variable screen title to the screen
def variable_screen_title(title)
        puts "------------------------------------------"
        puts "          #{title}          "
        puts "------------------------------------------"
        puts ""
end

#helper functions ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

class CoreProgramMethods

    def self.find_word_definition
       new_white_space

        variable_screen_title("FIND A WORD")
        10.times do
            puts ""
        end
        return_menu

        puts "please enter the word you would like to find"
        puts ""

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

            puts "That word does not currently exist in the dictionary"
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
            puts ""
            i += 1
        end
            puts "*********************"
            puts ""

       return_menu
       puts "'?' Find another word"
        puts ""
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
        new_white_space
        variable_screen_title("PROPOSE A NEW WORD")
        return_menu
        puts "Please give us a word to propose"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "9"
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif Word.exists?(name: input)
                new_white_space
                return_menu
                puts "That word already exists"
            else
                word_length = input.split(//).length
                @word_to_display = Word.create(name: input, word_length: word_length)
                if @current_user.number_of_propositions == nil
                @current_user.number_of_propositions = 1
                else
                    @current_user.number_of_propositions += 1
                end
                @current_user.save
                CoreProgramMethods.ask_for_definition
            end
        end
    end

    def self.ask_for_definition
        new_white_space
        return_menu
        puts "Please assign a definition to the word you have proposed"

        while true
            input = gets.chomp.downcase
            if input == "9"
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            else
                word_id = @word_to_display.id
                user_id = @current_user.id
                Definition.create(word_id: word_id, user_id: user_id, record1: input)
                @current_user.number_of_propositions += 1
                @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end
    

    def self.remove_account
        new_white_space
        variable_screen_title("REMOVE ACCOUNT?")
        10.times do
            puts ""
        end
        puts "'1' Delete account forever and exit program"
        puts ""
        puts "'2' Go back to main menu"

        while true
            input = gets.chomp.downcase
            if input == "1"
                a = @current_user.id
                User.destroy_all(a.to_s)
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
        10.times do
            puts ""
        end
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
        puts "'3' Remove your account"
        puts ""
        puts "'4' Account information"
        puts ""
        puts "'!' Exit the program"
        puts 
        
        while true do
        input = gets.chomp.downcase
            if input == "1"
                CoreProgramMethods.find_word_definition
            elsif input == "2"
                CoreProgramMethods.propose_word
            elsif input == "3"
                CoreProgramMethods.remove_account
            elsif input == "4"
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
