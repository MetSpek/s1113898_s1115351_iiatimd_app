extends Control

@onready var label_label = $LabelContainer/LabelLabel
var label = ""
var is_global_deletable = false

func _ready():
	set_text()

#Sets the text to the given label
func set_text():
	label_label.text = label

#Removes the label
func _on_remove_button_button_up():
	get_tree().call_group("AddLabels", "uncheckBox", label)
	if is_global_deletable:
		GlobalHandler.removeCustomLabel(label_label.text)
	queue_free()
