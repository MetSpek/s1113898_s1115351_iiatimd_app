extends Control

var settings = "res://Components/Settings/settings.tscn"
var add_work = "res://Components/AddWork/add_work.tscn"
var home = "res://Components/Home/home.tscn"
var art_prompt_generator = "res://Components/ArtPromptGenerator/art_prompt_generator.tscn"

func changeScene(scene):
	if not get_tree().get_current_scene().name == load(scene).instantiate().name:
		get_tree().change_scene_to_file(scene)

func _on_settings_button_button_up():
	changeScene(settings)

func _on_add_button_button_up():
	changeScene(add_work)

func _on_home_button_button_up():
	changeScene(home)

func _on_art_prompt_button_button_up():
	changeScene(art_prompt_generator)
