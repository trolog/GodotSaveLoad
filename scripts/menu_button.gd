extends Button

export var reference_path = ""
export(bool) var start_focused = false
export(int) var game_level = 0

func _ready():
	if(start_focused):
		grab_focus()
		
	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_mouse_entered():
	grab_focus()

func _on_Button_Pressed():
	if(reference_path != ""):
		if(game_level > 0): # we're on a level
			Gamemanager.level = game_level
			Gamemanager.update_data()
			Gamemanager.show_data()
		else: # we're not on a level
			Gamemanager.hide_data()
			
		get_tree().change_scene(reference_path)
	else:
		get_tree().quit()
