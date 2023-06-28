extends Control

@onready var titleLabel = $Card/Information/Title
@onready var dateLabel = $Card/Information/DateContainer/Date
@onready var image = $Card/Image

var art_detail = "res://Components/ArtDetails/art_detail.tscn"

var dict
var title
var date

var canClick = false

# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = title
	dateLabel.text = date
	
	var img = Image.load_from_file(dict.img)
	if img:
		var texture = ImageTexture.create_from_image(img)
		image.texture = texture

# Link to the detailpage of specific art
func _input(event):
	if event.button_mask == 1 and canClick:
		GlobalHandler.selected_entry = dict
		get_tree().change_scene_to_file(art_detail)

# When mouse/finger is on the card, clicking is possible
func _on_mouse_entered():
	canClick = true

# When leaving the card, clicking is impossible
func _on_mouse_exited():
	canClick = false
