@contacts = ["sarah", "sally", "sandra", "steph", "stacey"]
# scope of variable all over including in all subsequent methods without having to pass it through each method 

def add_contact
    puts "What contact would you like to add?"
    input = gets.strip
    @contacts.push(input)
    # "Would you like to see the new contact list? yes/no"
    # yn = gets.strip
    # if yn == yes
    #     view_contacts
    # elsif yn == no
    main_menu
end

def view_contacts
    puts "> View your Contacts <"
    @contacts.each do |list|
        puts list
    end
    main_menu
end

def delete_contact
    puts "Which contact would you like to delete?"
    input = gets.strip
    @contacts.delete(input)
    main_menu
end

def modify_contact 
    puts "Which contact would you like to modify?"
    old_contact = gets.strip
    puts "What would you like to replace it with?"
    new_contact = gets.strip
    @contacts[@contacts.index(old_contact)] = new_contact
    main_menu
end

def exit_menu
    puts "Goodbye, have a great day!"
end


def main_menu
    puts "------ Ruby Contact List ------
        1) create contact
        2) view contact
        3) delete contact
        4) modify contact
        5) exit menu
        
        Please choose an option 1 through 5"
    input = gets.strip
    case input              
        when "1"           
            add_contact
        when "2"            
            view_contacts
        when "3"
            delete_contact
        when "4"
            modify_contact
        when "5"           
            exit_menu
        else                
            puts "invalid input. try again"
            main_menu         
    end
end

main_menu
