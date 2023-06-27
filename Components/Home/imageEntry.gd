extends Control

@onready var titleLabel = $Card/Information/Title
@onready var dateLabel = $Card/Information/DateContainer/Date

var art_detail = "res://Components/ArtDetails/art_detail.tscn"

var dict
var title
var date

var canClick = false

# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = title
	dateLabel.text = date

func _input(event):
	if event.button_mask == 1 and canClick:
		GlobalHandler.selected_entry = dict
		get_tree().change_scene_to_file(art_detail)

func _on_mouse_entered():
	canClick = true


func _on_mouse_exited():
	canClick = false
