extends Node

var DATA_FILE = OS.get_executable_path().get_base_dir() + "/save"

var current_theme = "dark"
var dark_mode = preload("res://Resources/Themes/StandardTheme.tres")

var current_diary_view = "normal"

var current_language = "en"

var labels = []
var diary_entries = [{'id': 20230611, 'img':'IMAGE TOEVOEGEN', 'title': 'Dark owl', 'desc': 'dark owl chilling on a branch.', 'date': '11-06-2023', 'labels': ['owl', 'animal']} , {'id': 20230608, 'img':'IMAGE TOEVOEGEN', 'title': 'Filipé Frogé', 'desc': 'Filipé chilling with fireflies', 'date': '08-06-2023', 'labels': ['frog', 'animal']}]
var selected_entry = diary_entries[0]

func _ready():
	loadData()
#	saveData()
	TranslationServer.set_locale(current_language)

func saveData():
	var save ={
		"entries" : diary_entries,
		"labels" : labels,
		"settings" : [current_theme, current_diary_view, current_language]
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
	current_theme = json_file["settings"][0]
	current_diary_view = json_file["settings"][1]
	current_language = json_file["settings"][2]

func changeTheme(theme):
	current_theme = theme
	print("Change theme to " + current_theme + " mode...")
	saveData()

func addCustomLabel(label):
	labels.append(label)
	labels.sort()
	saveData()

func removeCustomLabel(label):
	if labels.find(label):
		labels.remove_at(labels.find(label))
		saveData()
