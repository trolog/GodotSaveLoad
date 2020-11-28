extends Button

var can_click = false

func _ready():
	connect_signals()
	
	#Look for a saved file, if we find one then this is enabled
	var file : File = File.new()
	if(file.file_exists("res://saved_game/game.dat")):
		can_click = true
		#set font color to white
		set_font_color(Color(1,1,1,1))
	else:
		#Set font color to gray
		set_font_color(Color(0.5,0.5,0.5,1))
	
func set_font_color(col : Color):
	set("custom_colors/font_color",col)
	set("custom_colors/font_color_hover",col)
	set("custom_colors/font_color_pressed",col)

func connect_signals():
	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_mouse_entered():
	grab_focus()
	

func _on_Button_Pressed():
	if(can_click):
		Gamemanager.do_load()
		var get_level_data = Gamemanager.game_data["level_data"]
		var get_player_data = Gamemanager.game_data["player_data"]
		
		Gamemanager.level = get_level_data["level"]
		Gamemanager.player_health = get_player_data["health"]
		Gamemanager.player_speed = get_player_data["speed"]
		Gamemanager.player_strength = get_player_data["strength"]
		
		Gamemanager.update_data()
		
		Gamemanager.show_data()
		
		get_tree().change_scene("res://scenes/level" + str(get_level_data["level"]) + ".tscn")
		
		pass
