extends Node

var current_theme = "dark"
var dark_mode = preload("res://Resources/StandardTheme.tres")

var current_diary_view = "normal"

var current_language = "en"

var labels = []

func changeTheme(theme):
	current_theme = theme
	print("Change theme to " + current_theme + " mode...")

func addCustomLabel(label):
	labels.append(label)
	labels.sort()
	#Save the data

func removeCustomLabel(label):
	if labels.find(label):
		labels.remove_at(labels.find(label))
		#Save the data
