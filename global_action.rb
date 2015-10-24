class GlobalAction

	def intialize
	
	end	

	def check_global_actions(action, current_space, user)
		actions_in_space = current_space.actions
		necessary_item = current_space.necessary_item
		if actions_in_space["Win actions"].include?(action) && user.items.include?(necessary_item)
			puts "Congratulations, you scape!"
			playing = false
		elsif actions_in_space["Lose actions"].include?(action)
			puts "Game over"
			playing = false
		else
			puts "It doesn't make sense, please enter another action"
			playing = true
		end
		playing
	end	

end