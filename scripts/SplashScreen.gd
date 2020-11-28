extends Node2D

func _ready():
	yield(get_node("AnimationPlayer"),"animation_finished") # pause here until animation finished
	get_tree().change_scene("res://scenes/MainTileScreen.tscn") # anmationed finished so we resume the yield

func _input(event):
	if(event is InputEventKey):
		get_tree().change_scene("res://scenes/MainTileScreen.tscn") # anmationed finished so we resume the yield
