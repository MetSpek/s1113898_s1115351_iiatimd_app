extends Control

var label_item = preload("res://Components/LabelManagement/manage_label_item.tscn")

@onready var label_container = $ManageLabelsContainer/LabelScrollContainer/LabelContainer

@onready var add_label_text_edit = $ManageLabelsContainer/AddLabelContainer/AddLabelTextEdit
@onready var add_label_button = $ManageLabelsContainer/AddLabelContainer/AddLabelButton

func _ready():
	#Disables the add button automatically
	if add_label_text_edit.text == "":
		add_label_button.disabled = true

func _on_add_label_button_pressed():
	var text = add_label_text_edit.text.to_lower().capitalize()

	#Checks wheter or not the given promp is already in the list
	if GlobalHandler.custom_labels.find(text) != -1:
		print("Label already exists!")
		return
	
	#Adds the label to the global custom labels list
	GlobalHandler.addCustomLabel(text)
	
	#Creates the labels
	createLabels()
	
	#Resets the text input to none
	add_label_text_edit.text = ""
	add_label_button.disabled = true

func createLabels():
	var children = label_container.get_children()
	for child in children:
		label_container.remove_child(child)
	
	for label in GlobalHandler.custom_labels:
		#Makes a new label item
		var item = label_item.instantiate()
		item.label = label
		label_container.add_child(item)

#Disables/Enables the button when text is/isn't present
func _on_add_label_text_edit_text_changed(new_text):
	if new_text != "":
		add_label_button.disabled = false
	else:
		add_label_button.disabled = true
