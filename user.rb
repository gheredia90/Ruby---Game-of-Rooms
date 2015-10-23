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
end