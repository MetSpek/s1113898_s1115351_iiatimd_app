extends Node

var current_theme = "dark"
var dark_mode = preload("res://Resources/StandardTheme.tres")

var current_diary_view = "normal"

var current_language = "en"

func changeTheme(theme):
	current_theme = theme
	print("Change theme to " + current_theme + " mode...")

