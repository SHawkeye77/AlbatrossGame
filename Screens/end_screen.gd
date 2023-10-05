extends Control

var startScreen = "res://Screens/start_screen.tscn"
@onready var lblPointsAmount = get_node("%lblPointsAmount")

func _ready():
	lblPointsAmount.text = str(Global.playerPoints) + " Points Acheived!"
	
func _on_main_menu_button_pressed():
	var _level = get_tree().change_scene_to_file(startScreen)
