require_relative 'space.rb'
require_relative 'user.rb'

class Game
    def initialize(user, spaces)
        @user = user
        @spaces = spaces 
        @playing = true    
    end

    def start
        @current_space = @spaces.sample
        print_current_space_info        
    end

    def print_current_space_info
        puts @current_space.description
        puts "Exits: #{@current_space.exits}"

    end    

    def enter_action
        action = gets.chomp 
        if action.size == 1
            check_movement(action)
        else
            check_objets(action)
        end     
    end  

    def check_movement(move)
        while !@current_space.exits.include?(move)
                puts "Wrong movement, try again"
                move = gets.chomp
        end
        @current_space = @current_space.related_rooms[move]  
        print_current_space_info 
    end   

    def check_objets(action)        
        if action[0,7] == "Pick up"
            pick_up_object(action)           
        elsif action[0,4] == "Drop"
            drop_object(action)
        elsif action == "Inventory"
            puts "Your items: #{@user.items}"

        end    
        print_current_space_info   
    end 

    def pick_up_object(action)
        item = action.split(" ")[2]
        if @current_space.items.include?(item)
            @user.add_item(item)
            @current_space.items.delete(item)                       
        end 

    end

    def drop_object(action) 
        item = action.split(" ")[1]
        if @user.items.include?(item)
            @current_space.add_item(item)
            @user.drop_item(item)                    
        end 
    end       

    def turn
        while @playing
            puts ">"
            enter_action             
        end 
    end

    def play
        start
        turn
    end

end