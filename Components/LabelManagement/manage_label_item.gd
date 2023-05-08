extends Control

@onready var label_label = $LabelContainer/LabelLabel
var label = ""

func _ready():
	set_text()

#Sets the text to the given label
func set_text():
	label_label.text = label

#Removes the label
func _on_remove_button_button_up():
	GlobalHandler.removeCustomLabel(label_label.text)
	queue_free()
