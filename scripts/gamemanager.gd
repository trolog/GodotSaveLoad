extends Node

#Default values
var level = 1
var player_health = 4
var player_speed = 2
var player_strength = 3
var checkpoint = 0

var game_data : Dictionary

onready var lbldata : Label = $lblgamedata

func _ready():
	#update with default values, this will change when you save
	update_data()
	pass

func update_data():
	
	game_data = {"player_data" : 
		{
			"health" : player_health,
			"speed" : player_speed,
			"strength" : player_strength
		},
		
		"level_data" : 
		{
			"level" : level,
			"checkpoint" : checkpoint
		}
	}

func do_save():
	var file : File = File.new()
	file.open("res://saved_game/game.dat",File.WRITE)
	file.store_line(to_json(game_data))
	file.close()
	
func do_load():
	var file : File = File.new()
	
	file.open("res://saved_game/game.dat",File.READ)
	
	game_data = parse_json(file.get_as_text())
	
	file.close()
	
func _physics_process(delta):
	
	if(Input.is_action_just_pressed("save_key")):
		#DOSAVE
		if(get_tree().current_scene.name.begins_with("level")):
			print("can_save")
			do_save()
		else:
			print("cannot save")
		pass
		
	if(Input.is_action_just_pressed("print_key")):
		print("level : " + str(level))
		print("player health : " + str(player_health))
		print("player strength : " + str(player_strength))
		print("player speed : " + str(player_speed))
		print(" ----------------- ")
		
func show_data():
	lbldata.text = "level : " + str(level) + "\n \n"
	lbldata.text += "health : " + str(player_health) + "\n \n"
	lbldata.text += "speed : " + str(player_speed) + "\n \n"
	lbldata.text += "strength : " + str(player_strength)
	lbldata.show()
	
func hide_data():
	lbldata.hide()
