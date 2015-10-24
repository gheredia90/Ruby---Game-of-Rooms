class User
    attr_reader :name, :valid_directions, :items
    def initialize(name)
        @name = name
        @valid_directions = ["N", "S", "E", "W"]   
        @items = []     
    end  

    def add_item(item)
    	@items << item
    end  

    def drop_item(item)
    	@items.delete(item)
    end	


     def pick_up_object(action, space)
        item = action.split(" ")[2]
        if space.items.include?(item)
            add_item(item)
            space.items.delete(item)                       
        end 

    end

    def drop_object(action, space) 
        item = action.split(" ")[1]
        if @items.include?(item)
            space.add_item(item)
            drop_item(item)                    
        end 
    end       
end