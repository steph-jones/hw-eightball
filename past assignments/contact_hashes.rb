require 'pry'

Contacts_hash = [
    {name: "sarah", phone: "800-111-2222"},
    {name: "sally", phone: "800-222-3333"},
    {name: "sandra", phone: "800-333-4444"},
    {name: "steph", phone: "800-444-5555"},
    {name: "stacey", phone: "800-555-6666"}
]

def add_contact
    puts "What name would you like to add?"
    new_name = gets.strip
    puts "what is this person's number?
        xxx-xxx-xxxx"
    new_number = gets.strip
    new_pair = {name: new_name, phone: new_number}
    Contacts_hash << new_pair 
    puts "#{new_name}'s number has been added."
    main_menu
end


def view_contacts
    puts "> View your Contacts <"
    Contacts_hash.each_with_index do |c, index|
        puts "#{c[:name]}'s number: #{c[:phone]}"
    end
    main_menu
end


def delete_contact
    puts "Who's contact would you like to delete?"
    input = gets.strip
    bool = nil
    Contacts_hash.each do |element|
        if element[:name] == input
            bool = true
        end
    end
    if bool != true
        puts "invalid input. make sure you choose an existing name"
        Contacts_hash.each_with_index do |c, index|
            puts "#{c[:name]}'s number: #{c[:phone]}"
        end
        puts "Who's contact would you like to delete?"
        input = gets.strip
    end
    just_names = Contacts_hash.collect { |p| "#{p[:name]}" }
    i = just_names.index(input)
    Contacts_hash.each do |element|
        element.each do |key, value|
            if value == input
                Contacts_hash.delete_at(i)
                puts "#{input} has been deleted from your contact list"
            else 
                "invalid input. please try another name"
            end
        end
    end
    main_menu
end


def modify_contact 
    puts "Who's contact would you like to modify?"
    old_contact = gets.strip
    bool = nil
    Contacts_hash.each do |element|
        if element[:name] == old_contact
            bool = true
        end
    end
    if bool != true
        puts "invalid input. make sure you choose an existing contact"
        Contacts_hash.each_with_index do |c, index|
            puts "#{c[:name]}'s number: #{c[:phone]}"
        end
        puts "Who's contact would you like to modify?"
        old_contact = gets.strip
    end
    puts "Do you need to change: name, number, or both?"
    choice = gets.strip
    case choice
    when "name"
        puts "What name would you like to replace it with?"
        new_contact = gets.strip
        Contacts_hash.each do |element|
            element.each do |key, value|
                if value == old_contact
                    element[:name] = new_contact
                end
            end
        end
        puts "#{old_contact}'s name has been changed to #{new_contact}" 
    when "number"
        puts "What number would you like to replace it with?"
        new_number = gets.strip
        Contacts_hash.each do |element|
            element.each do |key, value|
                if value == old_contact
                    element[:phone] = new_number
                end
            end
        end
        puts "#{old_contact}'s number has been changed to #{new_number}"
    when "both"
        puts "What name would you like to replace it with?"
        new_contact = gets.strip
        puts "What number would you like to replace it with?"
        new_number = gets.strip
        Contacts_hash.each do |element|
            element.each do |key, value|
                if value == old_contact
                    element[:name] = new_contact
                    element[:phone] = new_number
                end
            end
        end
        puts "#{old_contact}'s contact has been changed to #{new_contact} and #{new_number}" 
    end
    main_menu
end


def exit_menu
    puts "Goodbye, have a great day!
    "
end


def main_menu
    puts "
    ------ Ruby Contact List ------
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
            main_menu         #keeps it running 
    end
end

main_menu

