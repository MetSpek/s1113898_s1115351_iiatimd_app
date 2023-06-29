extends Node

var DATA_FILE = "user://ArtJournal.save"

var current_theme = "res://Resources/Themes/StandardTheme.tres"
var theme_name = "dark"

var current_diary_view = "normal"

var current_language = "en"

var labels = []
var diary_entries = [{
"id": 20221012,
"img": "res://Resources/Textures/12Stuck.png",
"title": "Stuck",
"desc": "Inktober day 12, stuck, your typical pigeon having a problem with the bread its been given.",
"date": "12-10-2022",
"labels": ["Inktober", "Pigeon", "Animal"]},
{
"id": 20221015,
"img": "res://Resources/Textures/15Helmet.png",
"title": "Helmet",
"desc": "Inktober day 15, helmet, fantasy spartan helmet with flowers as decoration.",
"date": "15-10-2022",
"labels": ["Inktober", "Helmet", "Flowers"]},
{
"id": 20221009,
"img": "res://Resources/Textures/9Pressure.png",
"title": "Pressure",
"desc": "Inktober day 9, pressure, monsters of the deep sea.",
"date": "09-10-2022",
"labels": ["Inktober", "Pressure", "Animal"]}]
var selected_entry

func _ready():
	loadData()
#	saveData()
	TranslationServer.set_locale(current_language)

func saveData():
	var save ={
		"entries" : diary_entries,
		"labels" : labels,
		"settings" : [theme_name, current_diary_view, current_language]
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
	theme_name = json_file["settings"][0]
	changeTheme(theme_name)
	current_diary_view = json_file["settings"][1]
	current_language = json_file["settings"][2]

func changeTheme(theme):

	match theme:
		'dark':
			current_theme = "res://Resources/Themes/StandardTheme.tres"
			theme_name = "dark"
		'light':
			current_theme = "res://Resources/Themes/LightTheme.tres"
			theme_name = "light"
		
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
