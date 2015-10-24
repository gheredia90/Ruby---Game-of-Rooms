require_relative 'game.rb'

pepe = User.new("Pepe")

hash1 = {"Win actions" => ["kill"], "Lose actions" => ["sing"]}
hash2 = {"Win actions" => ["sing"], "Lose actions" => ["cry"]}
hash3 = {"Win actions" => [""], "Lose actions" => ["kill"]}



space1 = Space.new("space 1", ["S"], ["lamp", "potion"], hash1, "sword") 
space2 = Space.new("space 2", ["N", "E"], ["sword"], hash2, "")
space3 = Space.new("space 3", ["W"],["shield"], hash3, "")

space1.add_related_rooms({"S" => space2})
space2.add_related_rooms({"N" => space1, "E" => space3})
space3.add_related_rooms({"W" => space2})

spaces = [space1, space2, space3]
Game.new(pepe,spaces).play
