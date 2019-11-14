class CoreProgramMethods

    def self.find_word_definition
        10.times do
            puts ""
        end
    end
    
    def self.propose_word
        10.times do
            puts ""
        end
    end

    def self.propose_definition
        10.times do
            puts ""
        end
    end

    def self.remove_account
        10.times do
            puts ""
        end
    end

    def self.account_information
        10.times do
            puts ""
        end
    end

    def self.terminate
        abort "Goodbye"
    end

     def self.main_menu
        10.times do
            puts ""
        end
        puts " ---------------------------"
        puts "|        MAIN MENU          |"
        puts " ---------------------------"
        puts "'1' Find a word definition"
        puts ""
        puts "'2' Propose a new word."
        puts ""
        puts "'3' Propose a new definition for an existing word."
        puts ""
        puts "'4' Remove your account."
        puts ""
        puts "'5' Account information."
        puts ""
        puts "'exit'"
        
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
            elsif input == "exit"
                CoreProgramMethods.terminate
            else
                puts "That is not a selection"
            end
        end
    end
    
    
    def self.initiate
        puts "Welcome to Wiktionary"
        puts "Please begin by entering in your name"
        input = gets.chomp.downcase
        @current_user = User.create(name: input)
        CoreProgramMethods.main_menu
    end




end