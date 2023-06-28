extends Control

@onready var titleLabel = $Card/Information/Title
@onready var dateLabel = $Card/Information/DateContainer/Date
@onready var image = $Card/Image

var art_detail = "res://Components/ArtDetails/art_detail.tscn"

var dict
var title
var date


# Called when the node enters the scene tree for the first time.
func _ready():
	titleLabel.text = title
	dateLabel.text = date
	var img = Image.load_from_file(dict.img)
	if img:
		var texture = ImageTexture.create_from_image(img)
		image.texture = texture


func _on_button_button_up():
	GlobalHandler.selected_entry = dict
	get_tree().change_scene_to_file(art_detail)
