extends Control

@onready var manage_labels = $ManageLabels
@onready var settings_container = $SettingsContainer

@onready var theme_button = $SettingsContainer/ThemeContainer/ThemeButton
var themes = {"dark" : 0,"light" : 1}

@onready var diary_button = $SettingsContainer/DiaryContainer/DiaryButton
var diaries = {"normal" : 0, "compact" : 1}

@onready var language_button = $SettingsContainer/LanguageContainer/LanguageButton
var languages = {"en" : 0,"nl" : 1}


func _ready():
	setSavedValues()

func setSavedValues():
	theme_button.selected = themes[GlobalHandler.current_theme]
	diary_button.selected = diaries[GlobalHandler.current_diary_view]
	language_button.selected = languages[GlobalHandler.current_language]

#Sets the language to the given language
func changeLanguage(language):
	GlobalHandler.current_language = language
	TranslationServer.set_locale(GlobalHandler.current_language)
	GlobalHandler.saveData()

#Checks what the index is of the Diary View Button
func _on_diary_button_item_selected(index):
	match index:
		0: 
			GlobalHandler.current_diary_view = "normal"
		1:
			GlobalHandler.current_diary_view = "compact"
	print("Change Diary view to " + GlobalHandler.current_diary_view + "...")
	GlobalHandler.saveData()

#Checks what the index is of the Language Button
func _on_language_button_item_selected(index):
	match index:
		0: 
			changeLanguage("en")
		1:
			changeLanguage("nl")

#Checks what to do when the manage labels button is pressed
func _on_labels_button_pressed():
	manage_labels.visible = true
	settings_container.visible = false

func closeLabelManagement():
	manage_labels.visible = false
	settings_container.visible = true

	#Checks what the status is of the Theme Button
func _on_theme_button_item_selected(index):
	match index:
		0:
			GlobalHandler.changeTheme("dark")
		1:
			GlobalHandler.changeTheme("light")
