extends Node

var current_theme = "dark"
var dark_mode = preload("res://Resources/StandardTheme.tres")

var current_diary_view = "normal"

var current_language = "en"

var custom_labels = []

func changeTheme(theme):
	current_theme = theme
	print("Change theme to " + current_theme + " mode...")

func addCustomLabel(label):
	custom_labels.append(label)
	#Save the data

func removeCustomLabel(label):
	if custom_labels.find(label):
		custom_labels.remove_at(custom_labels.find(label))
		#Save the data
