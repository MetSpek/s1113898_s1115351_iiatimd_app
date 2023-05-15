extends Control

@onready var manage_labels = $ManageLabels
@onready var settings_container = $SettingsContainer


func _ready():
	pass

#Sets the language to the given language
func changeLanguage(language):
	GlobalHandler.current_language = language
	TranslationServer.set_locale(GlobalHandler.current_language)

#Checks what the status is of the Theme Button
func _on_check_button_toggled(button_pressed):
	if button_pressed:
		GlobalHandler.changeTheme("dark")
	else:
		GlobalHandler.changeTheme("light")

#Checks what the index is of the Diary View Button
func _on_diary_button_item_selected(index):
	match index:
		0: 
			GlobalHandler.current_diary_view = "normal"
		1:
			GlobalHandler.current_diary_view = "compact"
	print("Change Diary view to " + GlobalHandler.current_diary_view + "...")

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
