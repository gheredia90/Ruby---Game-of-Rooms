class Space
    attr_reader :description, :exits, :related_rooms, :items, :actions,  :necessary_item
   
    def initialize(description, exits, items, actions, necessary_item)
        @description = description
        @exits = exits
        @related_rooms = {}
        @items = items
        @actions = actions
        @necessary_item = necessary_item
    end

    def add_related_rooms(related_rooms)
         directions = related_rooms.keys
         directions.each do |direction|
            if @exits.include?(direction)
                @related_rooms[direction] = related_rooms[direction]
            end
         end    
    end

    def add_item(item)
        @items << item
    end  

end