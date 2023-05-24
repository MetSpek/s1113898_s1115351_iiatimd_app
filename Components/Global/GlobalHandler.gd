extends Node

var DATA_FILE = OS.get_executable_path().get_base_dir() + "/save"

var current_theme = "dark"
var dark_mode = preload("res://Resources/Themes/StandardTheme.tres")

var current_diary_view = "normal"

var current_language = "en"

var labels = []
var diary_entries = []

func _ready():
	loadData()

func saveData():
	var save ={
		"entries" : diary_entries,
		"labels" : labels
	}
	var json_file = JSON.stringify(save)
	var file = FileAccess.open(DATA_FILE, FileAccess.WRITE)
	file.store_line(json_file)
	file.close()

func loadData():
	if not FileAccess.file_exists(DATA_FILE):
		return
	
	var file = FileAccess.open(DATA_FILE, FileAccess.READ)
	var data = file.get_line()
	var json_file = JSON.parse_string(data)
	labels = json_file["labels"]
	diary_entries = json_file["entries"]

func changeTheme(theme):
	current_theme = theme
	print("Change theme to " + current_theme + " mode...")

func addCustomLabel(label):
	labels.append(label)
	labels.sort()
	saveData()

func removeCustomLabel(label):
	if labels.find(label):
		labels.remove_at(labels.find(label))
		#Save the data
