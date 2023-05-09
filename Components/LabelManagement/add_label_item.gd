extends Control

@onready var label_label = $LabelContainer/LabelLabel
@onready var add_button = $LabelContainer/AddButton

var label = ""

func _ready():
	set_text()

#Sets the text to the given label
func set_text():
	label_label.text = label

func uncheckBox():
	add_button.button_pressed = false

func _on_add_button_toggled(button_pressed):
	if button_pressed:
		get_tree().call_group("ManageLabels", "addLabelToList", label_label.text)
