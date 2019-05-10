# require "pry"

### objectives ###
# the user chooses from a list of main dishes
# the user chooses 2 side dish items
# computer repeats users order
# computer totals lunch items and displays total
require 'pry'

@initial_menu = 
"----- Welcome to Our Lunch Menu ------

Main Dishes 
1 Burger....................($5.00)
2 Cheeseburger..............($5.50)
3 Hotdog....................($4.50)
4 Pulled Pork Sandwhich.....($8.00)
5 Veggie Burger.............($5.00)
6 Salad.....................($6.50)

Side Dishes (choose two)
1 Mac and Cheese............($2.50)
2 French Fries..............($2.00)
3 Onion Rings...............($2.00)
4 Side Salad................($2.50)
5 Bag of Chips..............($1.50)

When you are ready to continue please press ENTER"

@main_dishes = [
    {name: "Burger", item_num: 1, price: 5.00},
    {name: "Cheeseburger", item_num: 2, price: 5.50},
    {name: "Hotdog", item_num: 3, price: 4.50},
    {name: "Pulled Pork Sandwhich", item_num: 4, price: 8.00},
    {name: "Veggie Burger", item_num: 5, price: 5.00},
    {name: "Salad", item_num: 5, price: 6.50}
]

@side_dishes = [
    {name: "Mac and Cheese", item_num: 1, price: 2.50},
    {name: "French Fries", item_num: 2, price: 2.00},
    {name: "Onion Rings", item_num: 3, price: 2.00},
    {name: "Side Salad", item_num: 4, price: 2.50},
    {name: "Bag of Chips", item_num: 5, price: 1.50}
]

@order_arr = []

def main_order
    puts "Main Dishes 
    1 Burger....................($5.00)
    2 Cheeseburger..............($5.50)
    3 Hotdog....................($4.50)
    4 Pulled Pork Sandwhich.....($8.00)
    5 Veggie Burger.............($5.00)
    6 Salad.....................($6.50)
        
What number dish would you like?
"
    @answer = gets.strip
    @check_main = @answer.to_i
    case @check_main
    when 0
        puts "invalid input. try again"
        main_order
    else
        @i_main = 1 - @check_main
        @main_order_hash = @main_dishes[@i_main]
        @choice_main = @main_order_hash[:name]
        @price_main = @main_order_hash[:price]
        @price_main = @price_main.to_i
    end
    side1
end

def side1
    print "Side Dishes (choose first)
    1 Mac and Cheese............($2.50)
    2 French Fries..............($2.00)
    3 Onion Rings...............($2.00)
    4 Side Salad................($2.50)
    5 Bag of Chips..............($1.50)
        
What number dish would you like as your first side?
"

    @i_side1 = 1 - gets.to_i
    @side_order_hash1 = @side_dishes[@i_side1]
    @choice_side1 = @side_order_hash1[:name]
    @price_side1 = @side_order_hash1[:price]
    @price_side1 = @price_side1.to_i
    side2
end

def side2
    print " Side Dishes (choose second)
    1 Mac and Cheese............($2.50)
    2 French Fries..............($2.00)
    3 Onion Rings...............($2.00)
    4 Side Salad................($2.50)
    5 Bag of Chips..............($1.50)
        
What number dish would you like as your second side?
"
    @i_side2 = 1 - gets.to_i
    @side_order_hash2 = @side_dishes[@i_side2]
    @choice_side2 = @side_order_hash2[:name]
    @price_side2 = @side_order_hash2[:price]
    @price_side2 = @price_side2.to_i

    @price_order = @price_main + @price_side1 + @price_side2

    puts "You chose the #{@choice_main} with sides of #{@choice_side1} and #{@choice_side2}.
        > Price this order: #{@price_order}
        Would you like to modify your order? (y)"
    continue_choice = gets.strip
    case continue_choice
        when "y"
                overall_menu
        when "n"
            @order_arr << @choice_main << @choice_side1 << @choice_side2
            @price_total = []
            @price_total << @price_order
    end
    puts "Current Total: #{@price_total} 
    Would you like to continue with more orders? (y/n)"
    continue_choice == gets.strip
    case continue_choice
        when "y"
            overall_menu
        when "n"
            puts "Final Total: #{@price_total}
            Have a great day, Thank you!
            "
        exit!(0)
    end
end  

def overall_menu
    puts "#{@initial_menu}"
    choice = gets.strip
    main_order
    #side1
    #side2
end

overall_menu






# case choice_main
# when "1"
#     puts "Your current total is #{price_main}.
#     Are you happy with your choice of Burger and ready to continue? (y/n)"
#     continue_choice = gets.strip
#     if continue_choice == "y"
#         # continue to next dish order
#     else 
#         main_order
#     end
# when "2"
# when "3"
# when "4"
# when "5"
# end

# case choice_side1
#     when "1"
#         puts "Your current total is #{price_order}.
#         Are you happy with your choice of ____ and ready to continue? (y/n)"
#         continue_choice = gets.strip
#         if continue_choice == "y"
#             # continue to next dish order
#         else 
#             side1
#         end
#     when "2"
#     when "3"
#     when "4"
#     when "5"
# end
    



# def side2
#     puts "Side Dishes (choose two)
#         1 Mac and Cheese............($2.50)
#         2 French Fries..............($2.00)
#         3 Onion Rings...............($2.00)
#         4 Side Salad................($2.50)
#         5 Bag of Chips..............($1.50)
        
#         What number dish would you like as your second side?"
#         @choice_side2 = gets.strip
#         @price_side2 = #same
#         @price_order =   # 1)convert price_main and price_side1 and price_side2 to integet
#                 # 2)add the items together
#         "Are you happy with your choices of #{@choice_side1} and #{@choice_side2}.
#         Your new total is #{price_order}.
#         Would you like to modify your order? (y)"
#         continue_choice == gets.strip
#         if continue_choice == "y"
#             # continue to next dish order
#         else 
#             main_order
#     case choice_side2
#         when "1"
#             puts "Your current total is #{price_order}.
#             Are you happy with your choice of ____ and ready to continue? (y/n)"
#             continue_choice = gets.strip
#             if continue_choice == "y"
#                 # continue to next dish order
#             else 
#                 side_order
#             end
#         when "2"
#         when "3"
#         when "4"
#         when "5"
#     end
    

    
    
#end   

    

# mac = SideDish.new("Mac and Cheese", 1, 2.50)
# salad = SideDish.new("Side Salad", 2, 2.50)
# chips = SideDish.new("Bag of Chips", 3, 1.50)


# burger = MainDish.new("Burger", 1, 5.00)
# cheeseburger = MainDish.new("Cheeseburger", 2, 5.50)
# hotdog = MainDish.new("Hotdog",3, 4.50)
# pulled_pork_sandwhich = MainDIsh.new("Pulled Pork Sandwhich", 4, 8.00)
# salad = MainDish.new("Salad",5, 6.50)

#class MainDish
    #     attr_accessor :item, :item_number :price
        
    #     def initialize(item, item_number, price)
    #         @item = item
    #         @item_number = item_number
    #         @price = price
    #     end
    
    #     def Order
    #         case @item
    #         when "Burger"
    #             puts "Thank you for choosing the burger.
    #             Your new total is #{_____}. 
    #             Are you happy with your selection and ready to move on? (y/n)"
    #             ### loop to either go to side dishes or select again
    #         when "Cheeseburger"
    #         when "Hotdog"
    #         when "Pulled Pork Sanwhich"
    #         when "Salad"
    #         else 
    #             puts "Invalid input. Please make sure you choose an existing option from the menu"
                
    
    # end
    
