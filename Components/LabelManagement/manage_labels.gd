extends Control

var manage_label_item = preload("res://Components/LabelManagement/manage_label_item.tscn")
var add_label_item = preload("res://Components/LabelManagement/add_label_item.tscn")

@onready var title = $ManageLabelsContainer/Title

@onready var label_container = $ManageLabelsContainer/LabelScrollContainer/LabelContainer

@onready var add_label_text_edit = $ManageLabelsContainer/AddLabelContainer/AddLabelTextEdit
@onready var add_label_button = $ManageLabelsContainer/AddLabelContainer/AddLabelButton

@export var label_screen_type = "settings"
var label_item
var add_labels = []

func _ready():
	#Disables the add button automatically
	if add_label_text_edit.text == "":
		add_label_button.disabled = true

	#Check which label_screen_type is active
	match label_screen_type:
		"settings":
			title.text = "ManageLabel"
			label_item = manage_label_item
		"add":
			title.text = "AddLabel"
			label_item = add_label_item
			createLabels(label_item)

func _on_add_label_button_pressed():
	var text = add_label_text_edit.text.to_lower().capitalize()

	#Checks wheter or not the given promp is already in the list
	if GlobalHandler.labels.find(text) != -1:
		print("Label already exists!")
		return
	
	#Adds the label to the global custom labels list
	GlobalHandler.addCustomLabel(text)
	
	#Creates the labels
	createLabels(label_item)
	
	#Resets the text input to none
	add_label_text_edit.text = ""
	add_label_button.disabled = true

#Removes all current labels and adds the sorted list
func createLabels(label_type):
	var children = label_container.get_children()
	for child in children:
		label_container.remove_child(child)
	
	for label in GlobalHandler.labels:
		#Makes a new label item
		var item = label_type.instantiate()
		item.label = label
		label_container.add_child(item)

#Add label to the list when adding labels to an entry
func addLabelToList(label):
	add_labels.append(label)

#Disables/Enables the button when text is/isn't present
func _on_add_label_text_edit_text_changed(new_text):
	if new_text != "":
		add_label_button.disabled = false
	else:
		add_label_button.disabled = true

#Goes back to settings when in manage variant and goes back to add work when adding labels to an entry
func _on_done_button_button_up():
	match label_screen_type:
		"settings":
			get_tree().call_group("Settings", "closeLabelManagement")
		"add":
			get_tree().call_group("AddLabels", "uncheckBox")
			print("Add " + str(add_labels) + " labels to the entry")
			print("Go back to the add work screen")
