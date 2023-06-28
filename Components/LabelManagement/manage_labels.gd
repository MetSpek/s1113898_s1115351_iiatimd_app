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
	theme = load(GlobalHandler.current_theme)
	
	#Disables the add button automatically
	if add_label_text_edit.text == "":
		add_label_button.disabled = true

	#Check which label_screen_type is active
	match label_screen_type:
		"settings":
			title.text = "ManageLabel"
			label_item = manage_label_item
			createLabels(label_item)
			label_container.add_theme_constant_override("separation", 10)
		"add":
			title.text = "AddLabel"
			label_item = add_label_item
			createLabels(label_item)
			label_container.add_theme_constant_override("separation", 30)

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
		if label_type == manage_label_item:
			item.is_global_deletable = true
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
			var label_list = []
			for label in label_container.get_children():
				if label.get_child(0).get_child(0).button_pressed:
					label_list.append(label.get_child(0).get_child(0).text)
			get_tree().call_group("AddWork", "closeLabelManagement", label_list)
			print("Add " + str(add_labels) + " labels to the entry")
			print("Go back to the add work screen")
