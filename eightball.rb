# Basic Objectives:

# ----- User inputs question
# Computer outputs random answer
# -----User inputs "QUIT"
# Computer outputs a goodbye message and exits
# -----Ability to add more answers:
# Via easter egg question ("add_answers")
# Do not let them add the same answer if the eight ball already has that answer
# -----Ability to reset answers back to the original bank (hint: think arr.clone)
# Via easter egg question ("reset_answers")
# -----Ability to have eight ball print all answers
# Via easter egg question ("print_answers")
 

# Bonus Objectives:

# Create a menu to handle all the functionality.
# Use classes to handle the Eight Ball Program and Answers.
# Use the colorize gem (from lecture) to add some color to your application.

require 'pry'
require 'colorize'

@original_answers = ["It is certain.", "It is decidedly so.",
    "Without a doubt.", "Yes - definitely.", "You may rely on it.",
    "As I see it, yes.", "Most likely.", "Outlook good.", "Yes.",
    "Signs point to yes.", "Reply hazy, try again.", "Ask again later.",
    "Better not tell you now.", "Cannot predict now.", "Concentrate and ask again.",
    "Don't count on it.", "My reply is no.", "My sources say no.",
    "Outlook not so good.", "Very doubtful"]

@answers_add = []
(@answers_add << @original_answers).flatten!

def questioning
    puts "What is your question?".colorize(:cyan)
    input = gets.strip
    case input
        when "QUIT"
            exit_menu
        else
            puts "Thinking...
            ".colorize(:cyan)
            sleep(2)
            output = @original_answers.sample
            puts "#{output}
            ".colorize(:magenta)
            sleep(1)
            main_menu
    end
end

def add_answer
    puts "What answer would you like to add?".colorize(:cyan)
    @input = gets.strip
    @bool = false
    @answers_add.each_with_index do |answer, i|
        if @answers_add[i].downcase == @input.downcase
            @bool = true
        end
    end
    case @input
        when "QUIT"
            exit_menu
        else
            if @bool == true
                puts "Answer already in bank.".colorize(:cyan)
                main_menu
            else
                @answers_add << @input
                puts "Answer added
                ".colorize(:cyan)
                sleep(1)
                main_menu
            end    
    end
end

def reset_answers
    @answers_add = []
    (@answers_add << @original_answers).flatten!
    puts "Answers reset!
    ".colorize(:cyan)
    main_menu
end

def print_answers
    print "#{@answers_add} 
    ".colorize(:magenta)
    #puts "#{@answers}".colorize(:magenta)
    main_menu
end

def exit_menu
    puts "Goodbye, have a great day!
    ".colorize(:cyan)
end

def main_menu
    puts "
------ Eightball ------
    1) Ask a Question
    2) Add to Answer Bank
    3) Reset Answer Bank
    4) Print Answer Bank
    5) Exit Program (or type QUIT at any moment)
    
Please choose an option 1 through 5".colorize(:cyan)
    input = gets.strip
    case input              
        when "1"           
            questioning
        when "2"            
            add_answer
        when "3"
            reset_answers
        when "4"
            print_answers
        when "5"           
            exit_menu
        when "QUIT"
            exit_menu
        else                
            puts "invalid input. try again".colorize(:red)
            main_menu         #keeps it running 
    end
end

def starter_menu
    puts "Welcome, ask a question or type menu".colorize(:cyan)
    @input = gets.strip.downcase
    case @input              
        when "menu"           
            main_menu
        when "quit"
            exit_menu
        else
            puts "Thinking...
            ".colorize(:cyan)
            sleep(2)
            output = @original_answers.sample
            puts "#{output}
            ".colorize(:magenta)
            sleep(1)
            main_menu
    end
end

starter_menu

# class answers 
#     attr_accessor :answer
#     def initialize(answer)
#         @answer = answer
#     end
# end