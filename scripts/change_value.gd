extends Button

export(String) var value_name = ""
export(bool) var up

func _ready():
	connect("pressed",self,"button_pressed")
	pass # Replace with function body.
	
func button_pressed():
	if(up):
		if(value_name == "health"):
			Gamemanager.player_health += 1
		if(value_name == "speed"):
			Gamemanager.player_speed += 1
		if(value_name == "strength"):
			Gamemanager.player_strength += 1
	else:
		if(value_name == "health"):
			Gamemanager.player_health -= 1
		if(value_name == "speed"):
			Gamemanager.player_speed -= 1
		if(value_name == "strength"):
			Gamemanager.player_strength -= 1
			
	Gamemanager.update_data()
	Gamemanager.show_data()
