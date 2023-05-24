extends Control

@onready var add_button = $LabelContainer/AddButton

var label = ""


func _ready():
	set_text()

#Sets the text to the given label
func set_text():
	add_button.text = label

func uncheckBox(uncheck_label):
	if label == uncheck_label:
		add_button.button_pressed = false

func _on_add_button_toggled(button_pressed):
	if button_pressed:
		get_tree().call_group("ManageLabels", "addLabelToList", add_button.text)
