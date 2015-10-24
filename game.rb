require_relative 'space.rb'
require_relative 'user.rb'
require_relative 'item.rb'
require_relative 'global_action.rb'

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
        puts "Available items: #{@current_space.items}"

    end    

    def enter_action
        action = gets.chomp 
        if action.size == 1
            check_movement(action)
        elsif action.split(" ").size == 1
            @playing = GlobalAction.new.check_global_actions(action, @current_space, @user)
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
        if action[0,7] == "pick up"
            @user.pick_up_object(action, @current_space)           
        elsif action[0,4] == "drop"
            @user.drop_object(action, @current_space)
        elsif action == "see inventory"
            puts "Your items: #{@user.items}"

        end    
        print_current_space_info   
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