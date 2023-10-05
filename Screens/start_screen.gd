extends Control

var level = "res://Screens/world.tscn"

func _on_play_button_pressed():
	# Reset the player score
	Global.playerPoints = 0
	var _level = get_tree().change_scene_to_file(level)
