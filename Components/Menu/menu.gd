extends Control

var settings = "res://Components/Settings/settings.tscn"
var add_work = "res://Components/AddWork/add_work.tscn"

func changeScene(scene):
	if not get_tree().get_current_scene().name == load(scene).instantiate().name:
		get_tree().change_scene_to_file(scene)

func _on_settings_button_button_up():
	changeScene(settings)

func _on_add_button_button_up():
	changeScene(add_work)

func _on_home_button_button_up():
	print("GO TO HOME SCREEN...")

func _on_art_prompt_button_button_up():
	print("GO TO ART PROMPT SCREEN...")
