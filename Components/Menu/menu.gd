extends Control

@onready var background = $Background
@onready var banner_top = $Top/Banner
@onready var banner_bottom = $Bot/Banner

var settings = "res://Components/Settings/settings.tscn"
var add_work = "res://Components/AddWork/add_work.tscn"
var home = "res://Components/Home/home.tscn"
var art_prompt_generator = "res://Components/ArtPromptGenerator/art_prompt_generator.tscn"

func _ready():
	changeTheme()

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
	
func changeTheme():
	match GlobalHandler.theme_name:
		'dark':
			background.color = Color('#131818')
			banner_top.color = Color('#003d24')
			banner_bottom.color = Color('#003d24')
		'light':
			background.color = Color('#83c398')
			banner_top.color = Color('#086a42')
			banner_bottom.color = Color('#086a42')
