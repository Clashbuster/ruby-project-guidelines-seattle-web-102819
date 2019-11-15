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
    puts "'.' Return to main menu"
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
        if input == "."
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
            puts ""
            end
        end
    end

    def self.display_word

        # Displays the word that was inputted and finds the associated definition
        found_word = @word_to_display.name
        word_id = @word_to_display.id

        # assigns the response from the database into a several variables
        definition_response = Definition.find_by(word_id: word_id)
        @current_definition = Definition.find_by(word_id: word_id)
        
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
            puts "'1' Find another word"
            puts ""
            puts "'2' Edit or add a definition"
            puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "1"
                CoreProgramMethods.find_word_definition
            elsif input == "2"
                CoreProgramMethods.edit_definitions
            elsif input == "!"
                CoreProgramMethods.terminate
            else
                puts "That is not a selection"
                puts ""
            end
        end
    end
    
    def self.edit_definitions
        new_white_space
        variable_screen_title(@word_to_display.name)
        
        puts "Record1: " + @current_definition.record1.to_s
        puts ""
        puts "Record2: " + @current_definition.record2.to_s
        puts ""
        puts "Record3: " + @current_definition.record3.to_s
        puts ""
        puts "Record4: " + @current_definition.record4.to_s
        puts ""
        puts "Record5: " + @current_definition.record5.to_s
        puts ""
        puts "Record6: " + @current_definition.record6.to_s
        puts ""
        puts "Record7: " + @current_definition.record7.to_s
        puts ""
        puts "Record8: " + @current_definition.record8.to_s
        puts ""
        puts "Record9: " + @current_definition.record9.to_s
        puts ""
        puts "Record10: " + @current_definition.record10.to_s
        puts ""
        return_menu
        puts "Please select the definition you would like to edit '1...10'"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == "1"
                CoreProgramMethods.update_record1
            elsif input == "2"
                CoreProgramMethods.update_record2
            elsif input == "3"
                CoreProgramMethods.update_record3
            elsif input == "4"
                CoreProgramMethods.update_record4
            elsif input == "5"
                CoreProgramMethods.update_record5
            elsif input == "6"
                CoreProgramMethods.update_record6
            elsif input == "7"
                CoreProgramMethods.update_record7
            elsif input == "8"
                CoreProgramMethods.update_record8
            elsif input == "9"
                CoreProgramMethods.update_record9
            elsif input == "10"
                CoreProgramMethods.update_record10
            else
                puts "That is not a selection"
                puts ""
            end
        end
    end

    def self.update_record1
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record1: " + @current_definition.record1.to_s
        puts ""
        puts "Please propose a new entry for Record1"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record1
                puts "That definition already exists"
            else
                @current_definition.record1 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record2
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record2: " + @current_definition.record2.to_s
        puts ""
        puts "Please propose a new entry for Record2"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record2
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record2 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record3
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record3: " + @current_definition.record3.to_s
        puts ""
        puts "Please propose a new entry for Record3"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record3
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record3 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record4
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record4: " + @current_definition.record4.to_s
        puts ""
        puts "Please propose a new entry for Record4"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record4
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record4 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record5
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record5: " + @current_definition.record5.to_s
        puts ""
        puts "Please propose a new entry for Record5"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record5
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record5 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record6
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record6: " + @current_definition.record6.to_s
        puts ""
        puts "Please propose a new entry for Record6"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record6
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record6 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record7
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record7: " + @current_definition.record7.to_s
        puts ""
        puts "Please propose a new entry for Record7"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record7
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record7 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record8
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record8: " + @current_definition.record8.to_s
        puts ""
        puts "Please propose a new entry for Record8"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record8
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record8 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record9
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record9: " + @current_definition.record9.to_s
        puts ""
        puts "Please propose a new entry for Record9"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record9
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record9 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
            end
        end
    end

    def self.update_record10
        new_white_space
        variable_screen_title(@word_to_display.name)
        return_menu
        puts "Record10: " + @current_definition.record10.to_s
        puts ""
        puts "Please propose a new entry for Record10"
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif input == @current_definition.record10
                puts "That definition already exists"
                puts ""
            else
                @current_definition.record10 = input
                @current_definition.save
                    if @current_user.number_of_propositions == nil
                        @current_user.number_of_propositions = 1
                    else
                        @current_user.number_of_propositions += 1
                    end
                    @current_user.save
                CoreProgramMethods.display_word
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
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif Word.exists?(name: input)
                new_white_space
                return_menu
                puts "That word already exists"
                puts ""
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
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            else
                word_id = @word_to_display.id
                user_id = @current_user.id
                @current_definition = Definition.create(word_id: word_id, user_id: user_id, record1: input)
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
        puts ""

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
                puts ""
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
        puts ""

        while true
            input = gets.chomp.downcase
            if input == "."
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
                puts ""
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
            if input == "."
                CoreProgramMethods.main_menu
            elsif input == "!"
                CoreProgramMethods.terminate
            elsif User.exists?(name: input)
                new_white_space
                return_menu
                puts "That username is already taken"
                puts ""
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
            if input == "."
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
            if input == "."
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
        puts ""
        
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
                puts ""
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
        puts ""

        input = gets.chomp.downcase
        if User.exists?(name: input)
            @current_user = User.find_by(name: input)
        else
            @current_user = User.create(name: input)
        end
        CoreProgramMethods.main_menu
    end

end
