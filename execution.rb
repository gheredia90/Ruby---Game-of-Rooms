require_relative 'game.rb'

pepe = User.new("Pepe")

space1 = Space.new("space 1", ["S"], "")
space2 = Space.new("space 2", ["N", "E"], ["sword"])
space3 = Space.new("space 3", ["W"],"")

space1.add_related_rooms({"S" => space2})
space2.add_related_rooms({"N" => space1, "E" => space3})
space3.add_related_rooms({"W" => space2})

spaces = [space1, space2, space3]
Game.new(pepe,spaces).play
